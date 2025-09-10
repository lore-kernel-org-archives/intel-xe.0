Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FABCAC58D
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 19:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D842210E9CD;
	Wed, 10 Sep 2025 19:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4C4B47D";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E390A10E9CD
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 19:42:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACh7Z9012683
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 19:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AshvdUVEa9FiNe5UYmEu3NEb
 RFgCfkbR3d/lUj1X4cc=; b=M4C4B47DFelWfTtHXBl58OlfAnb9kgVzh2KD5MDP
 u21jR0DMliki4JJ9sbq0tg/a+i93jCDeMlXDMvHLvtf7lP6zdaXEhxxR40DF68h+
 rU/qxdJlK0+ZmRfhw4E6cF67By/Tr+FieX8DVNFtWhOFAWxwvGr5eR1s72BMLocK
 /g2sryaJrEckcY4rJKMHckuG4bRdtmZmv+k7ig0la9HsVvpcCZ4RXA1kAkttl361
 6ckX43sYScEE63NUml41VV+UYRTAp8Z6clD8qHBQqabTgKjKw1MHHCSsIvDTZ3y4
 RhcJ4PBDMquA6XnTAn+tQ4uLj2dtQHl0xxkg7UDOFdLxag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0w1pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 19:42:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5d5cc0f25so4841cf.2
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 12:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533374; x=1758138174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AshvdUVEa9FiNe5UYmEu3NEbRFgCfkbR3d/lUj1X4cc=;
 b=UO5jbD219QOgsK3BTOmDRVqPilPn0g78Q0qWXfbeGA7xp5S1CIN+IXvCEm85dA1onU
 NTKbZQFp3FNGBz88nzY24ihTHZ4Ghb178wCHD9dxxzxpTFY24Lej5Wc7fK9pUMy7va1P
 MeYvzuXJ8mBMENtQVU4yvWYkUkU/VussWuvoLHJwtdXhqqI1cbdXODNcvixMJULC8Ter
 f8miHHHwEvpN8OYysMyTBXLXMHSHmFpK/sxA6NTZ5LJH1zIwvzh2jJgC/WD4+oVdF6fH
 0QI1l6yvSSW6WzwWaZk1jmJTX7onwk1OUSUf6R24nswJgEavy3P3yT4py6HSZghYCYba
 gv6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMXHKYe6c7HG4cfRi9or7A6/t2MzkLxDSEQ60GCTG3+bWFrjEauX9JKF1m9xKHXHydkE33u36rvQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4gAcIKXRvvoNoSHQstzy0M1LPd4NXKEFk16kwpnAZr5wvgItL
 Co/PJVksp4yMArBsYrHg72aOfeE7KKZe3sLa/wKwxJMYY5uT6y3Tjp0eM4LrdMvgVkjZjcTcb34
 UqQHtyrhB/1KfRjszAxLx6XOUA5hjLno7MuuRwkut5S7YUEcJLYPCQMuRV8A459kkWC9+Iw==
X-Gm-Gg: ASbGnctJqKNcBVtOBlgBFghg6n5xiGfo1P19rVweOi//Zg5SZQgfII5uqVgkbz2cCAG
 jFXQl3BGnHSGv0axk8KLoWJLLepZkxrSZj2TXLmalN1nyWe92/mEslEM4XPUm7WCVOaUTSZr52N
 nMwTc71GoDQeK0+0N16UbSVv8MkyUA6myw7iRx80yhlyr+AgHPPrB68479SIgCtu5EwOF2iGlh1
 KiL5iSuX2SSwH+6ZCTq9TEM+YNOsq5kf5VTcD07Bo4NU/MJsXkeBjbCfAJOMkf1iPXSF/SaBMti
 MfIoabY00fcz9SX/KE1UkyA7gn9/+Fk+RJOXtwLuZxVb89U/ZRsiC6mpcNVTvMG5CINfvGtFaUz
 DPhbVA6fm1PCl5NOvfeWGWqlk1fnhWyyR4THQB10brFNEqojg+Bny
X-Received: by 2002:a05:622a:1904:b0:4b2:8ac4:ef85 with SMTP id
 d75a77b69052e-4b5f84bdc04mr172828871cf.84.1757533373922; 
 Wed, 10 Sep 2025 12:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4LM5n6q3x7O/nMFCbv+KTdGAJSRvFARvfiNuJedE701eBLHhZVYWWeXkwyAfYeYOBgycy0w==
X-Received: by 2002:a05:622a:1904:b0:4b2:8ac4:ef85 with SMTP id
 d75a77b69052e-4b5f84bdc04mr172828411cf.84.1757533373376; 
 Wed, 10 Sep 2025 12:42:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56dbfb5d10fsm49073e87.108.2025.09.10.12.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:42:52 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:42:50 +0300
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
Subject: Re: [PATCH 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <curkiddhkz6k4rtbxxmmmm4oqyjzvda3xc2bc5c6dmq2c5qgkk@z6cwzap2hwgy>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
 <20250909100649.1509696-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909100649.1509696-2-suraj.kandpal@intel.com>
X-Proofpoint-ORIG-GUID: I_ixMZTM3rldL0G9ztgDj0QYTKh3SjcA
X-Proofpoint-GUID: I_ixMZTM3rldL0G9ztgDj0QYTKh3SjcA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXwdUd8TQtK+Nk
 F2Ihkdnl7J5hHVM22kKgvd1INO1KHYy58ImUV4V5KGwkJHa2ecc4uycOlxy2qHqkI3dfn2fi23k
 2BDQovr+yEhyhGhbCF4+hHQLnB0h/wfAWYkq6upWY5eZFTjOLXgoFSatIWtu8w4kIjcAIl2X5M9
 VPkxSYkwuWgKSgH6lW/Awss222onqB1C1YQV1BeTtvZfYOnKl/Mw8Ez6td67XAvbXc23Vm+2d7R
 hDhKOPxPOvABiOKxpxaGXX7dc9qHeTi4sL+9hRHJqGoN07l1ahDyRkx/06n5hLunXlV4fhCsWcp
 g3svQcwxSitwljh0ilju9zFk4LGAGjTNwZDhOlj72lbMYpxZYbxq5IFMe93+7AN0ffYVaGQ2I/6
 LZmjmf00
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c1d4bf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=ht3OSqXAj6RBLq6GiRYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Tue, Sep 09, 2025 at 03:36:43PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as Intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not,
> this is due to the limitation of inheritance in C.
> To solve this we move the drm_writeback_connector within the

Please take a look at Documentation/process/submitting-patches.rst:
s/we //g, etc.

> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We also make this drm_writeback_connector
> a union with hdmi connector to save memory and since a connector can
> never be both writeback and hdmi it should serve us well.
> We do all other requireda modifications that come with these changes
> along with addition of new function which returns the drm_connector
> when drm_writeback_connector is present.
> We also modify drivers using the drm_writeback_connector to
> allow them to use this connector without breaking them.
> The drivers modified here are amd, komeda, mali, vc4, vkms,
> rcar_du, msm
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
>  .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
>  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
>  drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
>  drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
>  drivers/gpu/drm/drm_writeback.c               | 33 ++++++---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 16 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
>  .../drm/renesas/rcar-du/rcar_du_writeback.c   | 19 ++---
>  drivers/gpu/drm/vc4/vc4_txp.c                 | 14 ++--
>  drivers/gpu/drm/vkms/vkms_composer.c          |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c         | 13 ++--
>  include/drm/drm_connector.h                   | 70 +++++++++++++++++--
>  include/drm/drm_writeback.h                   | 68 ++----------------
>  22 files changed, 163 insertions(+), 137 deletions(-)
> 
> @@ -2305,6 +2366,7 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +

Probably a refactoring leftover.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
With best wishes
Dmitry
