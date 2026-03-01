Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48F0FD006E
	for <intel-xe@archiver.kernel.org>; Sun,  1 Mar 2026 16:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BD510E118;
	Sun,  1 Mar 2026 16:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="He8pARc8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnYLq2eD";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4685410E0E0
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Mar 2026 16:42:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621Ge0D42970129
 for <intel-xe@lists.freedesktop.org>; Sun, 1 Mar 2026 16:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UUK6gQUiNTqa63dauhB4oNrf
 uTLkXg9Yv5hlRkbvUf4=; b=He8pARc8xKIWQNSUN5iKpE5loEd11TA19/vijzUy
 CYWHw9Xaap0rWw4bWeDfmBphXjBNU8zWqkLN0XTsTFglTLJRWiXYf7jqZnnW+NXb
 bE7DV5GnSj7UFtEJXNVoI/V8AkgNAOOfa8AS8aXm3UPmIjCkq1IvovuIL8iR56GT
 HRJ3BdNAUBEeqwYnPCAapQzOa8+GpTl7+m4P3BikpDnkGNGJzkOtqB0piXklqmXN
 BpoJDnESMWRskJpZaShiXRIapbYJ7FzjH3VJbf0wPkAje0oqUMrHemOdFsakXWe8
 VFIVqmFmDzPzK9WZ6poJpgk3/7NVdg6uXmSnFPyYJ7aewg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshck1xs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 16:42:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c70ab7f67fso4985277185a.3
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 08:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772383364; x=1772988164;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UUK6gQUiNTqa63dauhB4oNrfuTLkXg9Yv5hlRkbvUf4=;
 b=QnYLq2eD5AFMMiygpwkS6OHcOBkt9zJawC2vxAyOvKS7Hd13ZpEyGYuV1jIJpPkI6W
 AX5j51GcOIDUKKMV7ICRayxHhzgxw7lOgv+QbIwJfgnE+h33LomSJSejqSJReG55rjMV
 piS2gMHSbTm+63kcgQQaDFGK28sS3x8Bp820z4B5u7ctwnlE3yU8GAQuMHro6EjsMkzX
 H8d05DBTNC/BZQXgdjYiIu5I/nM5onglS/kGxZKJ3FXdV9TLxb/A8VgPHi5z9gFgn6pI
 ulkWlqdLh/UHFUCPU5XVhX5c1lKHBzSSffTTiS02QQUFOvnzltmpoDn+3iv1uGToqBLu
 RQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772383364; x=1772988164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUK6gQUiNTqa63dauhB4oNrfuTLkXg9Yv5hlRkbvUf4=;
 b=Bk/PXx+vapAbG/FSkfiyagVUKiea9zD9ldEf0qXRaWbxDy7NUCMxdE0o5pfHf2H7fN
 Y0OWZ+PLadiR3yZyE0riWxvA2edPqBAat0H50nFKd9YDbx5OV03+3AFj0uyyMl2mEsA/
 vfq/gNOBmxoOTCZJ/bfqgYotc0YNVPbjT3yYAKPlBUp+xkO8oHB93uoxg++qu9TKpSff
 14avnPLXmq/Sb4YykKVXtUGERaplVKxiNBWvLVepvsPJWbf89/zp0qRRgHq+mmNvwzTy
 6GeIWc9jK0z5LoDFS04ze5iE18ueIM9dBOWbBLCKPGB7iKLbrGevjtOVeK78ke4FUTyy
 A7gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK/afgNer2lJPNKb5T7zWpw1kX3kJqbFklQzWsmOd3H6gNCOyV1ZxQ3vOruDdH108ZwMuGSQBFFQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrVrQRfw1U+JoGyHTIkZsZUVEigHWk0QE70TuHZN9upsdPJ6Rv
 fIAyjN4N7R6Jx1IG8oR5lDYEwyyUsJZljY0t5/9s5YjjUHkvsFgE6cLDZkhk3IiGsYv7fJGtgLE
 Pkk/qPT5WpX5y/PKJnc6OTBxbkHGs+V2gFIsQYGuIIgTFXut8A40Z7Er/iA+SJJq6LvwokQ==
X-Gm-Gg: ATEYQzwa7hsBsUyQvE26tHE1Xei1leyl9h4a7j1uZ9/2D66+Idz3dPj5clqYc38k7C7
 eU430j7Z3kJN/99VImKd1DK0Cf9gLwXJeTBSTaAnhyJr/nzixJzFxdpAG0pNV7KUAogjd/2HhmU
 QnMzr96rX5c9D3qZ0veDjdYpylDGnAyybwFXPrBNftQ8RM87wLlHDKLhM3w1R+RuEsFMdq50+2w
 FoArCZHDo/gMmSegGHw2oe0qPqnz2nvnnbcAPdNAdXYTW/t0ZDJUkL//tVlkcXgqvFgzaPCzQjv
 7B7awrE686Xk9nhRB6uCmL5qfruYeY2LJohrc+4WtmerySoLNXyXwOGq0DTez7pWygh5CB+wwbN
 8fEbGZPQD3/RBACecxfnPT8v1aO0N1x3vuE9E2yMbE1OoWcydG9e/a/DRgmLGcKyItGioCU151F
 kv5wXBu2HXx7970n72DOlo6YgUMWMEDvrYy7E=
X-Received: by 2002:a05:620a:40c4:b0:8c5:32b7:210e with SMTP id
 af79cd13be357-8cbc8ead9f6mr1058571285a.82.1772383364326; 
 Sun, 01 Mar 2026 08:42:44 -0800 (PST)
X-Received: by 2002:a05:620a:40c4:b0:8c5:32b7:210e with SMTP id
 af79cd13be357-8cbc8ead9f6mr1058568585a.82.1772383363834; 
 Sun, 01 Mar 2026 08:42:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca1e5sm1139257e87.26.2026.03.01.08.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 08:42:43 -0800 (PST)
Date: Sun, 1 Mar 2026 18:42:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 12/19] drm/bridge: dw-hdmi-qp: Implement
 atomic_get_output_bus_fmts
Message-ID: <hocqjcusieyqmsai4bxtgjon446yae6m43dmvqzk34ul44pvfg@ithgwadiwx2j>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-12-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-12-658c3b9db7ef@collabora.com>
X-Proofpoint-ORIG-GUID: qXcZXxp6ufP_zXIdwwc7ZwjtRjvrSnWM
X-Proofpoint-GUID: qXcZXxp6ufP_zXIdwwc7ZwjtRjvrSnWM
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a46c85 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QX4gbG5DAAAA:8
 a=J_biHfMZ8pKUvqPgpkYA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MiBTYWx0ZWRfX82r3h+fudRn2
 j551963uzuRj4pX4jcEr/rMJQqOGsjMcZwfCxrwRmok8gdaDRgSoTLYjE8E6VpnrBwLAuUrN4af
 5Nn8aMjAfZM8OvC/ZYARTH7+u/1SGFJ46ZA40s7A3TPAImF+ULvWnRi7YpVE7RXPZ++lcGyFvgA
 lt1aypJhsVEyfnm6yJJNLCjIL7F9mADS1bKA3c3DLoDiUayotQlDRcm1S5DosSYfF5mfnjcupC6
 IFyAHba69Q1iOPJIpzwApWy3wsfL2dtqGt0HzaY9zOvXanTemTV4x0VZxWXLsV7voKPi92RdV7/
 nltrrLap4jF3X+h5UMweduJl4YsMTWJpy92CFmGU7v633x60K45QM7hk+6V3RNYAFs8K8baWEx1
 kFrx7S/Y8AxraIlZgWXt6suQjVIfFoG30u6aZHKYuYyxqNHWGp9VrnEnXHItu4fLTfsQ91pm70b
 I6cTPZZXsav3NfWuxnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010152
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 27, 2026 at 08:20:17PM +0100, Nicolas Frattaroli wrote:
> The atomic_get_output_bus_fmts callback is used by the DRM bridge layer
> to recursively select a suitable output format in a bridge chain.
> 
> As a bridge that outputs to HDMI, dw-hdmi-qp will have its output
> formats determined by which formats the platform-specific integration of
> the hardware supports, and the chosen HDMI output bit depth.
> 
> Implement this callback. The returned u32* buffer is supposed to be
> freed by the caller of this callback, as specified by the callback's
> documentation.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 64 ++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index d649a1cf07f5..4556494f9bb1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -11,6 +11,7 @@
>  #include <linux/export.h>
>  #include <linux/i2c.h>
>  #include <linux/irq.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -749,6 +750,68 @@ static struct i2c_adapter *dw_hdmi_qp_i2c_adapter(struct dw_hdmi_qp *hdmi)
>  	return adap;
>  }
>  
> +static u32*
> +dw_hdmi_qp_bridge_get_output_bus_fmts(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      unsigned int *num_output_fmts)
> +{
> +	unsigned int num_fmts = 0;
> +	u32 *out_fmts;
> +
> +	/*
> +	 * bridge->supported_formats is a bit field of the HDMI_COLORSPACE_* enums.
> +	 * These enums are defined by the HDMI standard, and currently top out at
> +	 * 7. Consequently, BIT(7) is the highest bit that will be set here, unless
> +	 * the standard runs out of reserved pixel formats. Therefore, hweight8()
> +	 * will give an accurate count of how many bus formats we'll output.
> +	 */
> +	out_fmts = kmalloc_array(hweight8(bridge->supported_formats), sizeof(u32),
> +				 GFP_KERNEL);
> +	if (!out_fmts) {
> +		*num_output_fmts = 0;
> +		return NULL;
> +	}
> +
> +	switch (conn_state->hdmi.output_bpc) {
> +	case 12:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV12_1X36;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;

This looks like very generic code. It uses bridge->supported_formats
only. Can we move this to the helpers library?

> +		break;
> +	case 10:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV10_1X30;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +		break;
> +	default:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +		break;
> +	}
> +
> +	*num_output_fmts = num_fmts;
> +
> +	return out_fmts;
> +}
> +
>  static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
>  					    struct drm_atomic_state *state)
>  {
> @@ -1192,6 +1255,7 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
>  #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
>  
>  static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
> +	.atomic_get_output_bus_fmts = dw_hdmi_qp_bridge_get_output_bus_fmts,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
