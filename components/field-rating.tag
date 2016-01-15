<field-rating>

    <ul class="uk-subnav uk-subnav-nogap">
        <li class="uk-remove-rating" onclick={removeRating}><i class="uk-icon-trash-o"></i></li>
        <li class="{(!hoverValue && Math.ceil(value) >= n) || (hoverValue && Math.ceil(hoverValue) >= n) ? 'uk-active' : ''}" each={n,idx in ratingRange} onmousemove={hoverRating} onmouseleave={leaveHoverRating} onclick={setRating}><i class="uk-icon-{opts.icon ? opts.icon : 'star'}"></i></li>
        <li class="uk-disabled"><span>{!hoverValue && value || hoverValue}</span></li>
    </ul>

    <style scoped>
        .uk-subnav-nogap { margin-left: -25px }
        .uk-subnav-nogap > * { min-width: 15px; padding: 0 5px; text-align: center }
        .uk-subnav-nogap > li:not(:first-child) { margin-left: 0; padding: 0 5px }
        .uk-remove-rating { visibility: hidden }
        .uk-subnav:hover .uk-remove-rating { visibility: visible }
        .uk-subnav .uk-remove-rating:hover > * { color: #eb5424 }
    </style>

    <script>

        var mininmum  = opts.mininmum  || 0,
            maximum   = opts.maximum   || 5,
            precision = opts.precision || 0,
            j;

        if (precision < 0 || precision > 0.5) {
            precision = precision - Math.floor(precision);

            if (precision > 0.5) {
                precision = precision - 0.5;
            }
        }

        this.value = null;
        this.hoverValue = null;

        this.ratingRange = [];

        for (j = mininmum + 1; j <= maximum; j = j +1) {
            this.ratingRange.push(j);
        }

        setRating(e) {
            this.$setValue(this.getValue(e));
        }

        getValue(e) {
            var element = e.srcElement || e.target || e.toElement || null;

            if (!element) {
                return;
            }

            while (element.parentElement && element.nodeName.toLowerCase() !== 'li') {
                element = element.parentElement;
            }

            if (precision === 0) {
                return e.item.n;
            }

            return Math.floor(((e.item.n - 1) + (Math.floor(e.layerX/element.clientWidth / precision) + 1) * precision) * 1000) / 1000;
        }

        hoverRating(e) {
            this.hoverValue = this.getValue(e);
        }

        leaveHoverRating() {
            this.hoverValue = null;
        }

        removeRating() {
            this.$setValue(null);
        }

        this.$updateValue = function(value) {
            if (value === null && !opts.remove) {
                value = mininmum;
            }

            if (value !== null) {
                if (value < mininmum) {
                    value = mininmum;
                }

                if (value > maximum) {
                    value = maximum;
                }
            }

            if (this.value != value) {

                this.value = value;
                this.update();
            }

        }.bind(this);

    </script>

</field-rating>
