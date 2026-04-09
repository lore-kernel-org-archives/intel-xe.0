Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9D1F364C2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 21:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4929010E08B;
	Thu,  9 Apr 2026 21:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmT673w0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ko835XX1";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16C310E08B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 21:53:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639IfAfH779503
 for <intel-xe@lists.freedesktop.org>; Thu, 9 Apr 2026 21:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hu81u8EXPjFrB34GvSJW9iQw
 sEy8qvlO31eh+EE0xPg=; b=GmT673w0E/j1Q74yC99wb3ajRMSsRLbCbIHUvSVP
 uamrDGeWDu5NNk7G6tKX8jeB37nxu/H/C06C/S4yCJruDmrKx+ZLLLzPg3mclIP6
 mSJmy3eZbHxVhMTwbP7fc/ATus+LU4btxJZkNij0IJGfTBasR8eTPtdAYkhavNPk
 uRKgkE5/rQgpoYqNzOSkZrgr4DDhAZjoJYhMnELo5gQPSmcJA20p5gYGBIOs/rjO
 DxahXh/NChmF8HdNyZIHzJDRHWzU05YKF8KSlIsWptwTNibxjz92qddG+8mnXzev
 ypT8gPTdbW/WfZSg6miimVwvQCD63qVuSXz0MZsGx0OBcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8ht0ss-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Apr 2026 21:53:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50d812c898cso39254661cf.1
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Apr 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775771594; x=1776376394;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hu81u8EXPjFrB34GvSJW9iQwsEy8qvlO31eh+EE0xPg=;
 b=Ko835XX1S2JI6/dCKWM225Wvj2Tep44IGJMgUkBS3FJqhzLS5YKOwWMbSyhWpvoJCv
 hddWrB4PUrTThCzK6chEQ2bf2evOZVq1hJpwbiTVMgHIKToNz46sLrQnkhKjqPjZT4LL
 7WGN1ZORuSTH3DfkpX1RKjfoDPVUOFuwZlo8yRQ/pTwI0eTTOC9bmGx0ab4hUNk7xL1I
 PlrcSphHGWkBDeSXQmIssQRO0myYg6lb+tfq3rJnVKS5xSaOExs5Nbec6U8F23Oe9V8O
 878aFGXK8n3Hy+48EKHTTgcNBh0wSi6CU9SX0juRSA9LLnyfWDC0jFD0OBjechQHZeOM
 Yaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775771594; x=1776376394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hu81u8EXPjFrB34GvSJW9iQwsEy8qvlO31eh+EE0xPg=;
 b=LfKVLtnch0/hJcSZTb+Ez8d2CSagGyTNIL8zQPh9kt0vkq8HylU44OnNQx0Sh5ElcO
 EhLbKHK+WKJaZFmSsctEyBrv4ey95nu298r3dIItQJk9vGdCK0EY2DzKGfga22IaX11w
 sPs6XqmiINZF5FgI6cTkIUk4sUW0NspY76moTtzcL/34f8nYzRZtf7Ppw4lI870nLpYF
 Q1LvJVf9Et6lChWN1Y4nuD57kXKqVdyZluI+9NPGDHijNAra+iJnMWKVpx4barwA/SXj
 Z7sfiTLAVyXxB51yQGu6gMccDEHwdOdAddyekWmB20E5R3hYstvo3NmCK7IN72Ve2aYf
 /RKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzPqWieV3InicLpBMMeQc9IxI3L+pDfDC1IxToqCTf/snGoLK+Ym+ZIzAcz4A7/i4+8QCRC2UT2w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbv2SWvzRtbmZnBtpOzoz1FObpzZu989Aa+coog+6TWdd2SOCs
 4kqQT2JAcOtei5igSQCpTwdI8pfN2PRH4gVBgmLlB2XNohA1OM7J+9KI4beaJRVCz1HjO7G4HS2
 cYD+8kxPUK6KQftjsk/Peo4i99J/VuB0XrdIfONMN7Py4bWbQktp/zWdQEn3iKD0hBwrEFg==
X-Gm-Gg: AeBDieuwuOSSyHSekfbGQu7YOUdXCqo/MDtODPKtbl4Z94PUy4Hx0pqYMbijIJYHoTo
 a88xtFnyF9LpML6lUPZUEDmWnkSjQHTyxnXcLdeoqgN1Lfze+aXBG813QyMqIfI7ElEO0QPZLM/
 Yl/vVr5EPweCJCWPaSgtOcIB7xcTJJC4jD13h6FKTsonxHYPGOKZApIG++p+44Zz0xnXfeHnNm9
 4d9w0XtL16zNusPBrhAyKd6p3iMutqow4ioeLnqLJnxQ2a4SbeeF8K8HTnP+YXlSjeOd1HCev1v
 gv+vD8OZGtPdJ83rosI921BBj4TCSLIepIfCA0JycHOurehz/pDNTu/Z33+rBV5/UssNNzB2AdI
 Elq+hhEOMhBrYz9MQxrM1Id7kAPCKmf0j6jJJ5xrsLz+1SviJIyjUQlllDEm7+2jWgCGIG/szc5
 3uiaHH6EZQBxM9UBMnws/DP7i3D2WiF7+WjfM=
X-Received: by 2002:a05:622a:9:b0:50d:7b0c:35de with SMTP id
 d75a77b69052e-50dd5c74756mr15755541cf.44.1775771593986; 
 Thu, 09 Apr 2026 14:53:13 -0700 (PDT)
X-Received: by 2002:a05:622a:9:b0:50d:7b0c:35de with SMTP id
 d75a77b69052e-50dd5c74756mr15755051cf.44.1775771593478; 
 Thu, 09 Apr 2026 14:53:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38e49298f1csm1971861fa.12.2026.04.09.14.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 14:53:11 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:53:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>,
 Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 09/12] drm: Introduce drmm_connector_dp_init() with
 link training state properties
Message-ID: <gmaxonri7y3k43pxsnxfnd23mydgrwsw2322v6m4yjoksqm7aj@4ehgvhzg2ubb>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d81fcb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P-IC7800AAAA:8
 a=E-m9dlAQy1ysB7IIWEIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: GK2-iXx3eu-560euoS85wFIUwh9ZTgEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIwMiBTYWx0ZWRfX+9nOeb2jPBPc
 BUcqpQr5sfSg7IFA3gImDKW7mk64HmVcq3a3K8PcbbnV4qkaR/Wyh0CNijibanCJ+qU+GYEQtV6
 bfH7h086Ux8IKH+jgY6VqjKMS+bjaxh5H73G3NDJEFV59uBYguKOEijva8PAyPmV+jziq/k+nVh
 /UAX8kxlM3NGQzgkpXNdgojjuduI2DWfiGvPgp/T+aY+otoRXsrcC3i2YUSis4rF6WvjR3pcbDq
 qlRfHkM2CNg2ZrzUgB4QXlQOxVIJbhHci1O2mqHIBAvzb/f+eZF7LPLm8Cwm+UZtE83ggJpCMFr
 KxEtLyS3j+cqujDK1pgI49ibgbSXeG/b1w8He1ePFgAz0UCuRSMuKQ5KBVYVT7xAksnC0eeFPXK
 sRtA3Aq4qvQSGUqVMhdoYd+vQsbr+GU5x4KoLKMmQ1qqfkuwspgjzHS2l1boA1DU6OXGO8MUsgp
 ICeaeyKUdoavkghXwbQ==
X-Proofpoint-GUID: GK2-iXx3eu-560euoS85wFIUwh9ZTgEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090202
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

On Thu, Apr 09, 2026 at 07:08:25PM +0200, Kory Maincent wrote:
> Add a managed DisplayPort connector initialization helper,
> drmm_connector_dp_init(), modeled after the existing HDMI counterpart
> drmm_connector_hdmi_init(). Cleanup is handled automatically via a
> DRM-managed action.
> 
> The helper creates the following immutable connector properties to expose
> DP link training capabilities and state to userspace:
> 
>   - num_lanes: bitmask of supported lane counts (1, 2, 4)
>   - link_rate: Array of supported link rates.
>   - dsc_en: Display Stream Compression supported
>   - voltage_swingN: per-lane voltage swing level bitmask
>   - pre-emphasisN: per-lane pre-emphasis level bitmask
> 
> Link rates are passed by the driver in deca-kbps, following the DRM
> convention, but exposed to userspace in kbps for clarity.
> 
> Two additional helpers are provided to update and reset those properties
> at runtime:
>   - drm_connector_dp_set_link_train_properties()
>   - drm_connector_dp_reset_link_train_properties()
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/Makefile           |   1 +
>  drivers/gpu/drm/drm_dp_connector.c | 344 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h        |  38 ++++
>  include/drm/drm_dp_connector.h     | 109 ++++++++++++
>  4 files changed, 492 insertions(+)
> 
> diff --git a/include/drm/drm_dp_connector.h b/include/drm/drm_dp_connector.h
> new file mode 100644
> index 0000000000000..77d2f4bb6df68
> --- /dev/null
> +++ b/include/drm/drm_dp_connector.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef DRM_DP_CONNECTOR_H_
> +#define DRM_DP_CONNECTOR_H_
> +
> +#include <drm/drm_connector.h>
> +
> +#define DRM_DP_1LANE	BIT(0)
> +#define DRM_DP_2LANE	BIT(1)
> +#define DRM_DP_4LANE	BIT(2)
> +#define DRM_NLANES_MASK (DRM_DP_1LANE | DRM_DP_2LANE | DRM_DP_4LANE)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_0 BIT(0)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_1 BIT(1)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_2 BIT(2)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_3 BIT(3)
> +#define DRM_DP_VOLTAGE_SWING_LEVEL_MASK (DRM_DP_VOLTAGE_SWING_LEVEL_0 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_1 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_2 | \
> +					 DRM_DP_VOLTAGE_SWING_LEVEL_3)
> +#define DRM_DP_PRE_EMPH_LEVEL_0 BIT(0)
> +#define DRM_DP_PRE_EMPH_LEVEL_1 BIT(1)
> +#define DRM_DP_PRE_EMPH_LEVEL_2 BIT(2)
> +#define DRM_DP_PRE_EMPH_LEVEL_3 BIT(3)
> +#define DRM_DP_PRE_EMPH_LEVEL_MASK (DRM_DP_PRE_EMPH_LEVEL_0 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_1 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_2 | \
> +				    DRM_DP_PRE_EMPH_LEVEL_3)
> +
> +/**
> + * struct drm_connector_dp_link_train_caps - DRM DisplayPort link training
> + * capabilities

Those are not just link training caps. It is more like DP link caps.
They make sense to be a part of the DP-related drm_connector part.

> + */
> +struct drm_connector_dp_link_train_caps {
> +	/**
> +	 * @nlanes: Bitmask of lanes number supported
> +	 */
> +	u8 nlanes;
> +
> +	/**
> +	 * @nrates: Number of link rates supported
> +	 */
> +	u32 nrates;
> +
> +	/**
> +	 * @rates: Array listing the supported link rates in deca-kbps
> +	 */
> +	const u32 *rates;
> +
> +	/**
> +	 * @dsc: Display Stream Compression supported
> +	 */
> +	bool dsc;
> +
> +	/**
> +	 * @v_swings: Bitmask of voltage swing level supported
> +	 */
> +	u8 v_swings;
> +
> +	/**
> +	 * @pre_emphs: Bitmask of pre-emphasis level supported
> +	 */
> +	u8 pre_emphs;
> +};
> +
> +/**
> + * struct drm_connector_dp_link_train - DRM DisplayPort link training
> + * information report
> + */
> +struct drm_connector_dp_link_train {

THese define the current DP state. As such, they definitely make sense
to be a part of the drm_connector.
> +	/**
> +	 * @nlanes: The number of lanes used
> +	 */
> +	u8 nlanes;
> +
> +	/**
> +	 * @rates: Link rate value selected in deca-kbps
> +	 */
> +	u32 rate;
> +
> +	/**
> +	 * @dsc: Display Stream Compression enabled
> +	 */
> +	bool dsc_en;
> +
> +	/**
> +	 * @v_swings: Array listing the bitmask voltage swing level per lanes
> +	 */
> +	u8 v_swing[4];
> +
> +	/**
> +	 * @pre_emph: Array listing the bitmask pre-emphasis level per lanes
> +	 */
> +	u8 pre_emph[4];

Please consider following struct phy_configure_opts_dp (or using it as
is). Overall, please refer the talk and (more important) the lightning
resumee at this XDC. I have some bits and pieces ready in spite of that
proposal, but I didn't have time to finish it.

> +};
> +

-- 
With best wishes
Dmitry
