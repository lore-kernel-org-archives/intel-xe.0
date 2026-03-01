Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DB6FD0070
	for <intel-xe@archiver.kernel.org>; Sun,  1 Mar 2026 16:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D19A10E3E3;
	Sun,  1 Mar 2026 16:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBjnrffD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJEuhTvG";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0C610E3DF
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Mar 2026 16:56:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621BFVEX2248221
 for <intel-xe@lists.freedesktop.org>; Sun, 1 Mar 2026 16:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bK9Rayioe0UgWRcACzhZoK7I
 9TYxOeFDSz/Gu0Nylic=; b=mBjnrffDDHvSCmAVgxFFuKtFmYIuk6135iS7R1sa
 d62AmumryokGk1gEDgvyDte2rkIz16lW88SVM+gS11Q4Q969cpNiKFz/FanyPAFJ
 ygPSXB4j3xoNMHKwnKlwL58ywMYPOFYmC253/4AgwN277sOnSw+ZaUwf0As4P5q/
 6cuGmkwIJMWnEumD8+ERFq+iS9AoA8bKJlnnFgLWJx9AfCwdBQrJHRP914lCmpPj
 J+MJCp0F8rdxZwoISkLcapOSOcjA4PONIlMFUAwG8humnOhcl6ADnctIzHZLVE5C
 QNv4ikVgM1coU7Ge7vQ2V/bjPT597E+erkxI3g9XSzHvOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfytx3n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 16:56:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70ef98116so3603531285a.1
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 08:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772384172; x=1772988972;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bK9Rayioe0UgWRcACzhZoK7I9TYxOeFDSz/Gu0Nylic=;
 b=bJEuhTvG9AP4Dn6rCB1LFzhBhk4x488RmVg1ASp4N607FRO6Kyj7k4BeJPyanOccx/
 h3Y353Ee8bx9ohMYjwRd3u7CeWCfsquDAa5FfhWKcZxXy+N4QJpSwRmzT/2CyZhAA552
 ONHqEeUSPb4Uq2a1xeRTVHGo79nJI4atCUAV7F3toLl2KmW3WPKllFtj/6eMdbctkwAX
 8XwpupDLRfFb9C6+BWm0iApBKdz1FRzKKTmLuLihVxWpSEueJtzfxChQM2hZaNG3TUGx
 GlScbZlVKAkaHsYaOAV2DBiY6iPUrfJNgBqLJGSO9X+zzXq4PBHX7H2gPr7ot2q7WW7k
 NasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772384172; x=1772988972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bK9Rayioe0UgWRcACzhZoK7I9TYxOeFDSz/Gu0Nylic=;
 b=NwgbKFGy8PHCzw6kpWjL7RsaQsPVpIP4/HjGf98lHexYM4VjpeI0qX3oPuInJ0K1up
 VUWxew7w7xEl7cnZvWw5F+zXU2xEyEJ+LQYAJ6dv7x1p1FJ/nhxECWImDuOwK2ZOJd4p
 pnipQYgbw0g+kSBApuKjdEyZ5xCih51KUQrqO0XC3R8QPT/5RpwAQFAwUHYJAP3A0aim
 jYdyX4A1IcFUbMEFsm1tygvpTMV1WoCiCWxbvvYo4eWDgN/2e6bDo/j1p7pJGSlIjPQD
 P6X2VIpOLq4/wiQ+Vv5MBigdCCVpMM4tRIPtByckDZ0yUVI8AqYiS8wNC7rxLswbXD3k
 XKHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuTooEffDRwzBsdd2YDcuxZxuTrjx9GHJLLJpKsyBaJt6Yqqee8yhJ2JBNfUTLlRqGEfN63IYcXg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTe2ZsJ1I1FQ7w9VEHRXaA0sjyw8ff+Lb0QcDQ6hCLfoMpwtnA
 FCmYEECeN69+K9FCUfH3OLstNwgmb6tFP/E4v/iboivbopbWHvMyNIS5gFvwfTSdLnd/P3aENzk
 krIPSw72C4F0B6OT5fmHVmkb+sblVwqbif7X+QrBSpfTBcZHnvirNDEKOfWmMXOhTobD6sQ==
X-Gm-Gg: ATEYQzyjQ7mZD2RsCLJbqDULLdP/ueMMpGnCEiUTig+NcGBqIBaGBE0YFzUtfQujFfp
 XY+KzqfeLW/0+7oktpdXRyxyihCTMjyrd80ZhGZErMMeg+sN/5MqGhJ2HxuazL2qH/BjGCz6rRH
 ZmKTYmDjO7I3VQUZFrrj0L93s+HNQe3URaidzJSOivbmgv6fCmWTkvgl6SXuAyhrFpPW1dBICtk
 cpQyZw9VTN7lagSagOzfuDT/SIi0p/NOmritxJZs/pv2P+LP0QXX0psn2KGu474x0FjozloYZex
 SCvHS6Hb4iHcCwrakhrIpvq3/fFTFJl9FQjxrWGKHipEcNYiXfWr/Q89GaqxUx961qKbpCbmfFk
 i8gC/5dU40cy1qTvyMrXzRRBVFm1676OjliFVzHvDhOzCXlPqcfYlW4ZAvYaBWumdleMZvdu4Ob
 EvAkzJGUPhXqwzfqkyu0NKE3TMhPYEplDy6WM=
X-Received: by 2002:a05:620a:28c2:b0:8ca:3c67:890f with SMTP id
 af79cd13be357-8cbc8e1b535mr1288639485a.76.1772384172011; 
 Sun, 01 Mar 2026 08:56:12 -0800 (PST)
X-Received: by 2002:a05:620a:28c2:b0:8ca:3c67:890f with SMTP id
 af79cd13be357-8cbc8e1b535mr1288637485a.76.1772384171446; 
 Sun, 01 Mar 2026 08:56:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a116022215sm1093411e87.52.2026.03.01.08.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 08:56:10 -0800 (PST)
Date: Sun, 1 Mar 2026 18:56:08 +0200
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
Subject: Re: [PATCH v9 03/19] drm/bridge: Act on the DRM color format property
Message-ID: <unfsi4t4t4wl74zudkq3oeiryvm2xgyiplugcaxhyvjmtn7s2l@72xhl5vrtyt3>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-3-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-3-658c3b9db7ef@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfX9J6d0GR0+jcD
 XuyqZgEr5FgVCsjaKG/QjBo4VcXOH+7bV0aS2sdKVKuRzP66n2IFGmOfJDB4+zukdckCxVYx/Tk
 pWviAlMzZIqTGtTTCPGMHBNYjOUlnVxhdcyKz/ss+6bA8INt9VTZhDNwsoLvSRF9TwjPheu5leG
 FVqiRgQnVVhjEkteRsrbDWEHQ0g40oJyvtV80ZHa09btVdNvZq3di97RP2NrSHBjfqGyShK1uau
 GEUJogtoQbxuW+iahhboRZmani4F4gt++ArJf1bGNDURgz+xHVmNvGOGJ3ls4pjOYntOVeLlM1e
 XRj49XjIOYiU4cvISUL0llf8EFh3/B9w+L3tGwvbj9O/8GpKsU/n7vmO9QAMxuNgdCvOH6MCoVV
 jojwS9klwbtPy6ZLNA32uxgr/N8B3BANm8Vj1ycIPCO3CxdMwa9iaDRmltqSxisNYxVO+7Gzhal
 wW7rbNdc82i2sNkNB6A==
X-Authority-Analysis: v=2.4 cv=avS/yCZV c=1 sm=1 tr=0 ts=69a46fac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QX4gbG5DAAAA:8
 a=yKAVQKaA_AwziBLyn1oA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Kt81ENzAaoONwn0kiPRNH1fLCw-Ub1oJ
X-Proofpoint-ORIG-GUID: Kt81ENzAaoONwn0kiPRNH1fLCw-Ub1oJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010155
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

On Fri, Feb 27, 2026 at 08:20:08PM +0100, Nicolas Frattaroli wrote:
> The new DRM color format property allows userspace to request a specific
> color format on a connector. In turn, this fills the connector state's
> color_format member to switch color formats.
> 
> Make drm_bridges consider the color_format set in the connector state
> during the atomic bridge check. For bridges that represent HDMI bridges,
> rely on whatever format the HDMI logic set. Reject any output bus
> formats that do not correspond to the requested color format.
> 
> Non-HDMI last bridges with DRM_CONNECTOR_COLOR_FORMAT_AUTO set will end
> up choosing the first output format that functions to make a whole
> recursive bridge chain format selection succeed.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6d8947419940..5938fba0a983 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1117,6 +1117,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
>  	return ret;
>  }
>  
> +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_connector_color_format fmt)
> +{
> +	if (fmt == DRM_CONNECTOR_COLOR_FORMAT_AUTO)
> +		return true;
> +
> +	switch (bus_fmt) {
> +	case MEDIA_BUS_FMT_FIXED:
> +		return true;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +	case MEDIA_BUS_FMT_RGB121212_1X36:
> +	case MEDIA_BUS_FMT_RGB161616_1X48:
> +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +	case MEDIA_BUS_FMT_YUV12_1X36:
> +	case MEDIA_BUS_FMT_YUV16_1X48:
> +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +	case MEDIA_BUS_FMT_YUYV10_1X20:
> +	case MEDIA_BUS_FMT_VYUY10_1X20:
> +	case MEDIA_BUS_FMT_YVYU10_1X20:
> +	case MEDIA_BUS_FMT_UYVY12_1X24:
> +	case MEDIA_BUS_FMT_VYUY12_1X24:
> +	case MEDIA_BUS_FMT_YUYV12_1X24:
> +	case MEDIA_BUS_FMT_YVYU12_1X24:
> +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> +		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> +	default:
> +		return false;
> +	}
> +}
> +
>  /*
>   * This function is called by &drm_atomic_bridge_chain_check() just before
>   * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> @@ -1160,6 +1201,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>  	struct drm_encoder *encoder = bridge->encoder;
>  	struct drm_bridge_state *last_bridge_state;
>  	unsigned int i, num_out_bus_fmts = 0;
> +	enum drm_connector_color_format fmt;
>  	u32 *out_bus_fmts;
>  	int ret = 0;
>  
> @@ -1201,13 +1243,58 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>  			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
>  	}
>  
> +	/*
> +	 * On HDMI connectors, use the output format chosen by whatever does the
> +	 * HDMI logic. For everyone else, just trust that the bridge out_bus_fmts
> +	 * are sorted by preference for %DRM_CONNECTOR_COLOR_FORMAT_AUTO, as
> +	 * bus_format_is_color_fmt() always returns true for AUTO.
> +	 */
> +	if (last_bridge->ops & DRM_BRIDGE_OP_HDMI) {

This will break the logic if there is anything after the HDMI bridge.
For example, if the board has hdmi-connector (yep, it's a bridge without
DRM_BRIDGE_OP_HDMI, because HDMI connectors don't implement any of the
HDMI functionality), then the function will go to the second clause.

This probably needs to be moved to drm_bridge_connector. There is is
natural to check for bridge_connector->bridge_hdmi.

> +		drm_dbg_kms(last_bridge->dev,
> +			    "HDMI bridge requests format %s\n",
> +			    drm_hdmi_connector_get_output_format_name(
> +				    conn_state->hdmi.output_format));
> +		switch (conn_state->hdmi.output_format) {
> +		case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> +			fmt = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
> +			break;
> +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
> +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
> +			break;
> +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
> +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
> +			break;
> +		case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
> +			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			goto out_free_bus_fmts;
> +		}
> +	} else {
> +		fmt = conn_state->color_format;
> +		drm_dbg_kms(last_bridge->dev, "Non-HDMI bridge requests format %d\n", fmt);
> +	}
> +
>  	for (i = 0; i < num_out_bus_fmts; i++) {
> +		if (!bus_format_is_color_fmt(out_bus_fmts[i], fmt)) {
> +			drm_dbg_kms(last_bridge->dev,
> +				    "Skipping bus format 0x%04x as it doesn't match format %d\n",
> +				    out_bus_fmts[i], fmt);
> +			ret = -ENOTSUPP;
> +			continue;
> +		}
>  		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
>  					       conn_state, out_bus_fmts[i]);
> -		if (ret != -ENOTSUPP)
> +		if (ret != -ENOTSUPP) {
> +			drm_dbg_kms(last_bridge->dev,
> +				    "Found bridge chain ending with bus format 0x%04x\n",
> +				    out_bus_fmts[i]);
>  			break;
> +		}
>  	}
>  
> +out_free_bus_fmts:
>  	kfree(out_bus_fmts);
>  
>  	return ret;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
