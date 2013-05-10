module StaticHelper
	def color_percent(val)
		if (val.nan? || val == 0)
			color = ""
		elsif val > 0
			color = 'green'
		else
			color = 'red'
		end
		val = round val
		return content_tag(:span, "#{val}%", class: color)
	end

	def color_dollar(val)
		if (val.nan? || val == 0)
			color = ""
		elsif val > 0
			color = 'green'
		else
			color = 'red'
		end
		val = round val
		return content_tag(:span, "$#{val}", class: color)
	end

	def round(val, places = 2)
		if(val.nan?)
			return val
		end
		(val * 10**places).round / 10.0**places
	end

	def three_month_chart_url(symbol)
		"http://chart.finance.yahoo.com/z?s=#{ symbol }&t=3m&q=l&l=on&z=s&p=m50,v"
	end
	def six_month_chart_url(symbol)
		"http://chart.finance.yahoo.com/z?s=#{ symbol }&t=6m&q=l&l=on&z=s&p=m50,v"
	end
	def news_url(symbol)
		"http://finance.yahoo.com/q/h?s=#{symbol}+Headlines"
	end
end
