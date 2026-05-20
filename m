Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797ABCD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 12:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375D710E210;
	Wed, 20 May 2026 12:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEL3c5Pj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Licu8vcB";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A0710E210
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 12:26:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64K8umcC4115406
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 12:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=R2TeQqks38QIoyDMGjnlHZik
 TcCtv1Rua8ztzIrSGMs=; b=IEL3c5PjqWlF+XsnVNBCelp1TMrAsAl6meLx5Fpo
 Qr75sMcTLEqvMdOoHpU+OYtP9rhIOv8nIPX2wfHkYe4nimwsj6eonlhLInzGyoGl
 oVbmLIkw1KIBlyCCv2dRGadc3GEqceUukay8kCYuJCqZoEdQWqv7JKh3rokRh08w
 Uw9B+rDuloBd2LhhoKtrHOmBshYeaAUnYl5ZUQrOOdDMV4niA2Ik+YRqg/JSVkE3
 E569Mg7PhhYWhMWuS8uuPG91zGmYPDzSEjVVfHeVMZ/bqIpFWEmQfMJzWK0Y5oxS
 Hh9rAA455ZRtUUTKQxNd6bvmZcDtMzG4mGTNObVxK1Q1SQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0gs2n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 12:26:54 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-95fd0a49df1so7171399241.0
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 05:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779280013; x=1779884813;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=;
 b=Licu8vcBFuE2+M+nh4PznlmAYB9chsDTOj0EvCXCIc4vnVnzsHua+9YucNGdpsFtZR
 n37Gj6qtpovpgUIOVhc/ik4efcI7Gon3u0nXgDx+qliWnDkQvj6t1yC7j2rJXA5KZz2/
 86krft4LdjLsDm+0PV8Ae9+tupHLLOuZXLrcySTxwKNb2EJZ+U4zowIsqZsvQlAVjRbN
 IJV768275ufFsW4T4/LpzTGhubBsaejdzfyPdgNX9esnr0J/5aiSdLZ2iMpMvWWkfr6N
 Pzs/nGNvYETn+fQJBM75KhnSKaBkhrl38JLzOYl4BPrJIYmNwi0CgSv52G3rUtCx15sR
 SxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779280013; x=1779884813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=;
 b=MfsKKr1AqW11X01VcKMq7dXe4zJBjjXGkpGPvgJScJHxWKajwV8KLFf3tp485bufa4
 g1GYUuD/6R/A+Scj7j9NQ4DmwXd0XV3TKTXy4zKUEvYI28mggLtO3n0EHirnaCcqJxyY
 brJI3fVvmv3birq9m+MQGg9fh/eUPRMiemci8aJMzbkyF887gupVoDYksBNOMtD3JFIF
 GAjd/shDJmDRadewjtbacnSwdb4DQMY/6jm0wvo/cNpsyA0Ux6EUStWf23uCwVx6lPcl
 zDNBGpaLv/WwQNChXiKcDUVwecNPtMwSZ7C2iVZ4aYl608osCrViOHhA2lk8oDdRdF/a
 4EPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+TyhppA73MOU0LTuPv9C0hSpkj19mbDZZkfdzUCURfMd27OhARVRK/PyOMpi3/f+R1ygy/8IIFBw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjgruXX5cB1RVV2udbzjs4BFXoOSl8lBYwfhaubQpRCelqniCM
 LtIAKYyvI1Dkgn6E0YKnhMZBSlMjEIJYvvuDZeqbigD3hEJiL9FDGTEF2NHI8Fc30rk+JqcUzA3
 JftIAFHRKbsdzeRJ8xNyWyYzVEOT38iuDlPZJKZzprtqAVulFaqpgjg+EFToH4xVQoyFycA==
X-Gm-Gg: Acq92OFwEeSu1fB/vu5qXUnUg/NZy6tP61+eHufBzigShFyPp2Q1ye98L0dybOcui43
 rOTq9lB14SAGKsmdNLwSx0LaYv8ud/9VCzaKwb3QiGtf+mcDniiqJHsW1QbYDlM10EOMM0/aCff
 6FYudgswbhvRHu5eF71ErMKBKaD3wThu6AAA3wcptei/pwJX3tgAP51yTuc41vpJyu6sGMGTF6c
 sfLVtFTAuH991FzQTKshZkzzQUd53lG2i1O7TxdEmcRJ+NW7w1NFXF4LJ7zTFuuiS9Pnx7Meyq0
 lwF08qMG8pKCGsJFmu5oFB6qPUrDs6J2B5LZMN8zLHztWwl0QJVhZXPDcANp0eTFl1GM4ub0ygm
 /79ftu3bRqU054oNgsRX1f96ppl42lc93bzLgf1h1UKdrB1gspw9n80QnoNB3OdTzA+oKpwwu9f
 pB9lUy5Q68jFDNIIAYJsKzftfRr0sgomZfVAA=
X-Received: by 2002:a05:6102:5e86:b0:633:d7ec:153c with SMTP id
 ada2fe7eead31-63a3c801ffemr13878886137.3.1779280013357; 
 Wed, 20 May 2026 05:26:53 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:633:d7ec:153c with SMTP id
 ada2fe7eead31-63a3c801ffemr13878848137.3.1779280012801; 
 Wed, 20 May 2026 05:26:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a90f11a7a0sm4868217e87.24.2026.05.20.05.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 05:26:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <vvlw4f6xo7krq3xoyxuoaa3tecrgduw5qlujp3qf3zzibzjesv@demhqzadavql>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sicIUH7crHYH_sOTLlmz_PMfVaoYhG1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMCBTYWx0ZWRfX3p55GB+xMwZV
 dSxCAakwOwWwoMvg9clYgL9eJKRhoXZxcWcQo4lVOM3dsMVh+kfd1GOAaqn0IXV1clUbyehDBF8
 dcObOpkhdw02UxLQEz4anHqZI06OzvUSw12JD9yvdTmPbCWbq0680WrpV+K34YDf3MRBAFAh4gO
 +H52FCePcdsRkfSM5S7uhI/RfYBy8griIfQut2GvFVbv1ncYSLzYl6CPu3fKNMmczz6XwK97Usq
 zm2V4vk0/Lv1aot/WpJ8JryezxHFTjX5sb0+bIKMbQZuOFYyuoE0ruxx0zj2CvRuNSGNUc7Io6L
 gkIwmET+NjXj/Y1WvPj/IO+TpFa5Wi/hrpXkCRszqP0V/CrALpyQspentl3l+rRdoYZUmnVYeM9
 86+qXCTMBbbs0gsZP5Ed7t4lmc7nzrRVoZMwSalCS5K7yvfnjtzdrYj0pgc6NYpnW+G59WlxuDT
 iwqlgPo0eOIkEH9nYbA==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0da88e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6jUhzznPuw0D9V4-6sIA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: sicIUH7crHYH_sOTLlmz_PMfVaoYhG1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200120
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

On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
> 
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are ported through the bits in the AltMode VDOs.
> 
> Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> events to the DisplayPort Sink drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c          |  5 ++++-
>  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
>  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
>  3 files changed, 33 insertions(+), 6 deletions(-)

Greg, Heikki, would you please ack merging this through the drm tree?

> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 47dc53c4a738..edee9daccd51 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>   * @connector_fwnode: fwnode_handle to report the event on
>   * @status: hot plug detect logical state
> + * @extra_status: additional information provided by the sink without changing
> + * the HPD state (or in addition to such a change).
>   *
>   * On some hardware a hotplug event notification may come from outside the display
>   * driver / device. An example of this is some USB Type-C setups where the hardware
> @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * a drm_connector reference through calling drm_connector_find_by_fwnode().
>   */
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> -				     enum drm_connector_status status)
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status)
>  {
>  	struct drm_connector *connector;
>  
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 35d9c3086990..7182a8e2e710 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  	} else {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						hpd ? connector_status_connected :
> -						      connector_status_disconnected);
> +						      connector_status_disconnected,
> +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
>  		dp->hpd = hpd;
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		if (hpd && irq_hpd) {
> @@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>  	 */
>  	if (dp->pending_hpd) {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -						connector_status_connected);
> +						connector_status_connected,
> +						dp->pending_irq_hpd ?
> +						DRM_CONNECTOR_DP_IRQ_HPD :
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		dp->pending_hpd = false;
>  		if (dp->pending_irq_hpd) {
> @@ -397,7 +402,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			dp->data.conf = 0;
>  			if (dp->hpd) {
>  				drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -								connector_status_disconnected);
> +								connector_status_disconnected,
> +								DRM_CONNECTOR_NO_EXTRA_STATUS);
>  				dp->hpd = false;
>  				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  			}
> @@ -827,7 +833,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  
>  	if (dp->connector_fwnode) {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -						connector_status_disconnected);
> +						connector_status_disconnected,
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  
>  		fwnode_handle_put(dp->connector_fwnode);
>  	}
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f83f28cae207..e05197e970d3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -91,6 +91,22 @@ enum drm_connector_status {
>  	connector_status_unknown = 3,
>  };
>  
> +/**
> + * enum drm_connector_status_extra - additional events sent by the sink /
> + * display together or in replacement of the HPD status changes.
> + */
> +enum drm_connector_status_extra {
> +	/**
> +	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
> +	 */
> +	DRM_CONNECTOR_NO_EXTRA_STATUS,
> +	/**
> +	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
> +	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
> +	 */
> +	DRM_CONNECTOR_DP_IRQ_HPD,
> +};
> +
>  /**
>   * enum drm_connector_registration_state - userspace registration status for
>   * a &drm_connector
> @@ -2521,7 +2537,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
>  }
>  
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> -				     enum drm_connector_status status);
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status);
>  const char *drm_get_connector_type_name(unsigned int connector_type);
>  const char *drm_get_connector_status_name(enum drm_connector_status status);
>  const char *drm_get_subpixel_order_name(enum subpixel_order order);
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
