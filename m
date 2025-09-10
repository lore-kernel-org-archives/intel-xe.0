Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0E0CAC58E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 19:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4037810E9D2;
	Wed, 10 Sep 2025 19:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="avc37zmE";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694CA10E0C6
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 19:44:40 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AGEoCW017247
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 19:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MRFwGcw4G0+ktZMni3vfLtmQ
 O/YRU2ZQtqpoFx/hjaA=; b=avc37zmEzVW7YjVsxItPhtWI22GJZQQOvskkWisI
 fAPD0eUnTWrwGwoiLO6/vxsGmyPbq3IOT3bDNSVNVJ9Cb2MPH1f/YAmv7QAcY8Lh
 yTzmcpRFSSiZfYNDmLTj7y+7A+m6xea7WQH0GmwOe5wmaLw5jv5tY2TEC0YocBab
 CzOvW1/dr2D6JZc7kOT9YGSwQkckprDcudn/1rdT9By0GObcCpBRtPZxTT2b7c1e
 QPuKJ5WTYEV9Uc7qEOByIVZQUFjqVgbtBlcdN/okWE5aChurpHzl8cLP8lDRQrBc
 PU9xSiqsSMWBtA8NUcn7IkT2woCXAPQ+JlIxcIPC+4K4PA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb0kyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 19:44:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-72023d1be83so16292026d6.3
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 12:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533478; x=1758138278;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRFwGcw4G0+ktZMni3vfLtmQO/YRU2ZQtqpoFx/hjaA=;
 b=sIsi9J/wBawRiqPHAAfnp/CNJbauEk97RMub6TCN0a8AWRex1o8jLClFuLPSj6zARX
 nAdqQhwyVU+o9zZNs73ZAfQEsGo6vNEn5AcjRvmdMQMqYMDTehtzEubb/bsqCogV3QB3
 oJQRXO9UAQOQaI3wxcfkjgFwKmEmJJm6wvyXHpimTJfAT6W7s38Rb7MFxOJ2EkAUehEg
 ZBD1UDAzMsmqpUFFfR+zTMU6tQoPiUkNRCnB9APLrdhd2UqSP1TMDD/Y//o0DgzisS5P
 iYO+t+08KSFMUZsS72vF9XHRYIMKjfCIIyrJM3Rp9b5A0afHWH9Wm5Ch3Unvckp+JZZA
 F7mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmg7JXtPcZxi2E19+kY+2kgUtnuPhU3sDnuiV5CHdDZb4QFirPM7eO+odRh1nZiM6sXK81LMZ1hw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF1SQHInKTOW906Phti21SWZmcHltLC+BRMOAX+ktuekraR+Ub
 7U2NW6wLt+G9iRsfuEVnkXWzscxh5aGFCjlIgZkJs9w+bKoAjo6b/LVdSQ+I3u1Cn4q8oHFm7AJ
 dNmTd0FOmxUf4CKUPIpOt5zCtzftEVkmYJE/u+cjvsyzN3RflDf7q75rdQAaWHIuneV/k2Q==
X-Gm-Gg: ASbGncsHQIEs4THjcg386eABf0IJ6q3eZRjdq8Yw7WPbIDYHn4H0PUZhLlEHBNk4SjL
 h3KNSpbcFsgOY1sgJXpnK+sAJHRO/PRtOZg8dKol+KeboSPkNeV708DoskpnHHWaC+38jh9Em3r
 bEFhnVut1BSiUMmr/QdawcicWHYnXSK4zSAMKiQiFJxzE0Fya5T+0DPsXxUDm6Pn2YyTviUw4EI
 hQecRgAlVbOpjOzU+eFAH1saRHlyNCFPg5yp3hzJouIkYr9N1Jt3XFCPlWw+WQdJAtKSYjkE5b+
 uFUKgq8Xv/yMsiDn49FTWt5rPshCU6TD8FGcNEFtq3ySZcp880+N4+57od0UOxQM7NpU9w86YUg
 TKQ0G0mI1pwvpYuKbNR0rzU26EmQgHyivpeEQ0lAkKLyP6lDxeSSP
X-Received: by 2002:a05:6214:d83:b0:722:4cf0:43ca with SMTP id
 6a1803df08f44-7393ec165cfmr207443176d6.36.1757533477916; 
 Wed, 10 Sep 2025 12:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLTybLfL00fFfCA42iPicU5GPH+S6SfBfiUJaoauFhGCNadtLOwQ0vunk0e3CAte+J5/R2vA==
X-Received: by 2002:a05:6214:d83:b0:722:4cf0:43ca with SMTP id
 6a1803df08f44-7393ec165cfmr207442566d6.36.1757533477313; 
 Wed, 10 Sep 2025 12:44:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c4ffd5sm43997081fa.14.2025.09.10.12.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:44:35 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:44:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org,
 laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH 2/7] drm: writeback: Modify writeback init helpers
Message-ID: <nw4ehd7a655rzyf6g5yxb3z25en45esja2i5uowzy4wpmb2el6@orycag5iccho>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
 <20250909100649.1509696-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909100649.1509696-3-suraj.kandpal@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfXxHsSPbdyiubs
 UF3ny6w2ENKsYvr40L8S8PjLwhvm1adOwwR0D7RBPzTL7/2b97sh35gTtl7bnGb5MOnQZ7RV8d+
 1S19UPMEdPGvYWjw0MkayCzc8xPjRbHRxWoNm3Dz06D7ugCo85Zeoh2zL5hVhFEdgwac9zKHCnD
 v3jUhztcEwXUFM5EYfk9tLGPk3aesGbaf1eIWFf7bxviqLoXoj/eu6yhZY2PUGn1clydrRB0Pqy
 AgJnW5T1jcygx0DcflGc/sWI+y4BQLPhbw6y8pvbq0wamSWmvYPiuezj1VwzOWIIX0MtLeVYVqJ
 yztKxnGIa78CVRROXOz7Xa67XrbNQjBpwTWMH2nap9bM0gUco2vkLhGLfMyVF6ZXPN2y12M1RMc
 E1eIuKu+
X-Proofpoint-ORIG-GUID: XfXSCgRBfYphUz2yOzDHbNKGjbetA2fs
X-Proofpoint-GUID: XfXSCgRBfYphUz2yOzDHbNKGjbetA2fs
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c1d527 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=T65gB5C1oy4ZwBZl7KYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150
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

On Tue, Sep 09, 2025 at 03:36:44PM +0530, Suraj Kandpal wrote:
> Now with drm_writeback_connector moved to drm_connector it makes
> more sense use drm_connector as an argument rather than drm_connector.

than drm_writeback_connector

> The writeback connector can easily be derived from drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c |  2 +-
>  .../drm/arm/display/komeda/komeda_wb_connector.c |  5 +----
>  drivers/gpu/drm/arm/malidp_mw.c                  |  2 +-
>  drivers/gpu/drm/drm_writeback.c                  | 16 ++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    |  2 +-
>  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c  |  3 +--
>  drivers/gpu/drm/vc4/vc4_txp.c                    |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c            |  4 ++--
>  include/drm/drm_writeback.h                      |  4 ++--
>  9 files changed, 18 insertions(+), 22 deletions(-)
> 
> @@ -338,13 +338,13 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
>   * Returns: 0 on success, or a negative error code
>   */
>  int drmm_writeback_connector_init(struct drm_device *dev,
> -				  struct drm_writeback_connector *wb_connector,
> +				  struct drm_connector *connector,
>  				  const struct drm_connector_funcs *con_funcs,
>  				  struct drm_encoder *enc,
>  				  const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector =
> -		drm_writeback_to_connector(wb_connector);
> +	struct drm_writeback_connector *wb_connector =
> +		drm_connector_to_writeback(connector);

You can use &connector->writeback without extra wrappers.

>  	int ret;
>  
>  	ret = drmm_connector_init(dev, connector, con_funcs,

-- 
With best wishes
Dmitry
