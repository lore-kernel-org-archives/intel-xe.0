Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD8DC87FCA
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 12:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E313A10E473;
	Sat, 26 Jul 2025 12:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gm4zIuUg";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EFE10E472
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:20:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QBQ2xZ005794
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jyFlJTXGZOdVTGSfMXrobCcS
 yhUnV/FL4RuL0F60+DY=; b=gm4zIuUg78IcdvZwdBGqkPjp5iKaEy7zbtbOMoKy
 vluzT9XPNOnU0/GZ3CVOPt587FS0Cq2L1ZaNqHqyMKc1S22hneVRDdcUX0H1g94s
 1qEGP6TQVLQEFkzjUm7xHiHy7JlebXbd/Grep/rd1THSQlHnpbI4zSvxuwXXQAq4
 1pO41ZZr5ClGLhMUe6tPAon1vIQudhA14SY+lj7K4HMJjXSFdopjCf2CD7aQO9bv
 mZmiB4igS3qsd7zsY2/iPK4QFWoaSScyC28dEI+kXW21Vg5BOHmsEiQg+9rbpXSO
 UEqBxQmlAXiXHRykc9LBA7k5cki6XtYpmFrxNEMh5HLERw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qd9rjw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:20:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70707aed1eeso51121946d6.3
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 05:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753532411; x=1754137211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jyFlJTXGZOdVTGSfMXrobCcSyhUnV/FL4RuL0F60+DY=;
 b=O3SMr7f2UCgFRd3xy13lxumk1CSgsNUbQ2nreE/zJHFI1j5m04ELZWb3VsJj2D2UsH
 paJPJyhDhmPJP4GGzEO6myXv8MU6R0X+DfpYC9ivKghnl9dJxsnNdvw7eLYIBBdIZoOJ
 ImNeL+mXR17+VEQJP37C6k8/DqLmOh70H/ABbSZ36KXtPsTlpR9Ct0Dr1BFr2baOYWvN
 a2jv2YDkmfQBj08fbHmo3IlplHmo4+y2I8GWicytnChPZk36W7nzGhzielhShGnfBwmI
 XAWzxnV0e75cqjPm6TC9G3ojDORh4/dGiR19ULs0O7cCkIHaVS2asPQRVUJINKH6qF5Y
 fQWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUge5tto1jZG2TwE3AvjQ+fPGJcmOlcy33Yr/oTg5nTbs2Q3TQ7dCAP7+DIHqHJtcPMhQtFWySPCw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKckDNPF6wwzuB3iotcv/NsD7YsxGp6PDhRWRveOSRiFL8EeeC
 ZHMqBO5XZBnQyLBdx5ZWgXAvNDPVb8gzMOS6uZqOFuQ03zUi/T54Pkgff0GAecJ1HCo64/W29kO
 aRZndRCTCVf4y30WrAt3UBOedtHS1L8PEZ9SMppTHD798ZFcLvDyejxXQjAqqMdbvhhLbOw==
X-Gm-Gg: ASbGnctjKCIjxbfDEY290g3+10ky0vv9MK5zIfgnbC/0hBvavDO/ZJuUCCtK29t9qlA
 UYaH5h4Cvwl2Bx9/g65c5g/UvizRt0W2cWLpXCq+g4FCA5zP4P1biU3kg72FZPoHYSeTyytC5++
 mXl4DYS822XRaE+1Pw/OpNaKmEKExpd6ktLNWDOjtZ3aPFTY2uCh5LT5TPUBU6RoHFsHQ+ycisr
 fmQIuTvLKQk6XoG0xzgi0w+PUnkRN+N4qO6bBQAAVX8nQFgSDQFFu19o3hf0MsdV0NTBKRaxtYW
 TmimWX+35kACS/gfKRBt5lk0T+fYliVxfyjveX5xPEdRhq326mpdUFdfaYpzFlKFLdPlAnajCVT
 7uoWtFzMUAh5U9tlD1gq4+zm++n8qH0m7x8jR/+7VHQ/Q7gZKydRl
X-Received: by 2002:a05:6214:29c6:b0:704:a583:d98 with SMTP id
 6a1803df08f44-707205304f3mr80457106d6.18.1753532410486; 
 Sat, 26 Jul 2025 05:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1fcpnF6Z8m1YY/ZcQL8uL5sAhV7eQAqyu8w/exh6TTKcpvur+bLbAXScB0KMRzBqMpR6i4w==
X-Received: by 2002:a05:6214:29c6:b0:704:a583:d98 with SMTP id
 6a1803df08f44-707205304f3mr80456626d6.18.1753532409972; 
 Sat, 26 Jul 2025 05:20:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f426e396sm4219221fa.70.2025.07.26.05.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:20:07 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:20:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com
Subject: Re: [PATCH 02/28] drm/writeback: Add a helper function to get
 writeback connector
Message-ID: <wntb2pbszt3aavfuztv4wvr3dxwvpuk673d45xefmp6arb5qu3@s22k7yw5ykjm>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-3-suraj.kandpal@intel.com>
X-Proofpoint-ORIG-GUID: fFZnWU_iwxcAYVLHXTPNj5elVdR5WECJ
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6884c7fb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=uFHf-_iy_6cwRPmZKPEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: fFZnWU_iwxcAYVLHXTPNj5elVdR5WECJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfX13PvCMLhZHNN
 Nf6NsuA8jldgVaCaBSdE152byycPXJxg51cwVhWPKq14+4JZCxTWRtafjKU+3BrEzBM7EODsvaT
 yi4fSMbdAKq2DgqwJjTkPiTwhbSkpuRv7yidIOMoWs+yki4Ihf6okln1lJTjJdXUqklpB8G315U
 SFX7TTRTAEPcnCZZChc9jKv2RWGOpb48ywSp19TUi2a3JBHVzDixvvSiLf3ogccW5aTKw0vIGRC
 2IkH+zTmRuHA4RMZ00EFlE2AhR5G8o+QG/8qqBAp3SAFQUUc+8iR0IzNQOT/nL2B1RhTleUQuJP
 eJqq2FzvLCMWfTaYhFUYnpoSOLgbDbYyZhpXNo5kKSgkItBJfZU8LJ768SuUAI8v4SC/lBGyQgI
 BqVr2v7yfYqDVRMAHyfhK6g8I2bbl7NGBEkHbF/nrTbuZA1swCFRj/sW6+V53DJHGXR0rtiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260104
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

On Fri, Jul 25, 2025 at 10:33:43AM +0530, Suraj Kandpal wrote:
> Now that we can initialize a drm_writeback_connector without
> having to initialize the drm_connector within it and leaving the
> responsibility of initialising the drm_connector and maintaining
> the association with drm_writeback_connector to it. This helper
> hooks lets drivers return the drm_writeback_connector associated
> with the give drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c          | 14 ++++++
>  include/drm/drm_modeset_helper_vtables.h | 59 ++++++++++++++++++++++++
>  include/drm/drm_writeback.h              | 14 ++++--
>  3 files changed, 82 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index fa58eb0dc7bf..e9f7123270d6 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -107,6 +107,19 @@ static const struct dma_fence_ops drm_writeback_fence_ops = {
>  	.get_timeline_name = drm_writeback_fence_get_timeline_name,
>  };
>  
> +struct drm_writeback_connector *
> +drm_connector_to_writeback(struct drm_connector *connector)
> +{
> +	const struct drm_connector_helper_funcs *funcs =
> +		connector->helper_private;
> +
> +	if (funcs->get_writeback_connector)
> +		return funcs->get_writeback_connector(connector);
> +
> +	return container_of(connector, struct drm_writeback_connector, base);
> +}
> +EXPORT_SYMBOL(drm_connector_to_writeback);
> +
>  static int create_writeback_properties(struct drm_device *dev)
>  {
>  	struct drm_property *prop;
> @@ -443,6 +456,7 @@ drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connec
>  				       struct drm_writeback_connector *wb_connector,
>  				       struct drm_encoder *enc,
>  				       const struct drm_connector_funcs *con_funcs,
> +				       const struct drm_writeback_connector_helper_funcs *wb_funcs,
>  				       const u32 *formats, int n_formats)
>  {
>  	struct drm_property_blob *blob;
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index ce7c7aeac887..6b89b33d2304 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -31,6 +31,7 @@
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_writeback.h>
>  
>  /**
>   * DOC: overview
> @@ -1179,6 +1180,25 @@ struct drm_connector_helper_funcs {
>  	 *
>  	 */
>  	void (*disable_hpd)(struct drm_connector *connector);
> +
> +	/**
> +	 * @get_writeback_connector:
> +	 *
> +	 * This callback is used by drivers to get the writeback connector in
> +	 * case the init is done via drm_writeback_init_with_conn. Which means
> +	 * the drivers don't have drm_connector embedded in drm_writeback_connector
> +	 * so they need to send the associated writeback connector with this
> +	 * function.
> +	 *
> +	 * This operation is optional.
> +	 *
> +	 * This is mainly called from drm_writeback_set_gb.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * drm_writeback_connector assoiciated with the drm connector.
> +	 */
> +	struct drm_writeback_connector *(*get_writeback_connector)(struct drm_connector *connector);
>  };
>  
>  /**
> @@ -1192,6 +1212,45 @@ static inline void drm_connector_helper_add(struct drm_connector *connector,
>  	connector->helper_private = funcs;
>  }
>  
> +/**
> + * struct drm_writeback_connector_helper_funcs - helper operations for writeback
> + * connectors.
> + *
> + * These functions are used by the atomic and legacy modeset helpers and by the
> + * probe helpers.
> + */
> +struct drm_writeback_connector_helper_funcs {
> +	/**
> +	 * @get_connector_from_writeback:
> +	 *
> +	 * This callback is used by drivers to get the drm_connector in
> +	 * case the init is done via drm_writeback_init_with_conn. Which means
> +	 * the drivers don't have drm_connector embedded in drm_writeback_connector
> +	 * so they need to send the associated drm_connector with this
> +	 * function.
> +	 *
> +	 * This operation is optional.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * drm_connector assoiciated with the drm_writeback_connector.
> +	 */
> +	struct drm_connector
> +	*(*get_connector_from_writeback)(struct drm_writeback_connector *wbconnector);
> +};
> +
> +/**
> + * drm_writeback_connector_helper_add - sets the helper vtable for a connector
> + * @wb_connector: DRM writeback connector
> + * @funcs: helper vtable to set for @wb_connector
> + */
> +static inline void
> +drm_writeback_connector_helper_add(struct drm_writeback_connector *wb_connector,
> +				   const struct drm_writeback_connector_helper_funcs *funcs)
> +{
> +	wb_connector->helper_private = funcs;
> +}
> +
>  /**
>   * struct drm_plane_helper_funcs - helper operations for planes
>   *
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 149744dbeef0..77c3c64c132d 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -84,6 +84,13 @@ struct drm_writeback_connector {
>  	 * The name of the connector's fence timeline.
>  	 */
>  	char timeline_name[32];
> +
> +	/**
> +	 * @helper_private:
> +	 *
> +	 * helper private funcs for writeback_connector
> +	 */
> +	const struct drm_writeback_connector_helper_funcs *helper_private;
>  };

Unrelate to the commit? Also, where is this defined?

>  
>  /**
> @@ -142,11 +149,7 @@ struct drm_writeback_job {
>  	void *priv;
>  };
>  
> -static inline struct drm_writeback_connector *
> -drm_connector_to_writeback(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct drm_writeback_connector, base);
> -}
> +struct drm_writeback_connector *drm_connector_to_writeback(struct drm_connector *connector);
>  
>  int drm_writeback_connector_init(struct drm_device *dev,
>  				 struct drm_writeback_connector *wb_connector,
> @@ -172,6 +175,7 @@ drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connec
>  				       struct drm_writeback_connector *wb_connector,
>  				       struct drm_encoder *enc,
>  				       const struct drm_connector_funcs *con_funcs,
> +				       const struct drm_writeback_connector_helper_funcs *wb_funcs,
>  				       const u32 *formats, int n_formats);
>  
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
