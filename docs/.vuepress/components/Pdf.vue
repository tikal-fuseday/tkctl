<template>
	<div :id="previewId">
		<p>
			Loading preview...
		</p>
		<p>
			Fallback link: <a :href="url">{{ url }}</a>
		</p>
	</div>
</template>

<script>
import PDFObject from 'pdfobject'

export default {
	props: [ 'url', 'options' ],

	data() {
		return {
			previewId: 'pdf_' + this._uid,
		}
	},

	mounted() {
		PDFObject.embed(this.url, '#' + this.previewId, this.options)
	},
}
</script>

<style lang="stylus">
$pdf-width = 100%

#pdf-view
	width: $pdf-width
</style>
