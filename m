Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F1CCCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 13:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D33210EA4D;
	Thu,  9 Oct 2025 13:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSgjC7lf";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3648810EA46
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 13:32:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Eh7I005247
 for <intel-xe@lists.freedesktop.org>; Thu, 9 Oct 2025 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RRr9DsOTbQL+IhH2cQUogvPD
 iLS8DNEDEbNUEWkTRTg=; b=NSgjC7lfbBgTxi4WQX3tdtzkY/WqL0mozpo5s32Z
 E/wukCkntqZq08uD5vOClESI3KnKzb5bsudg3ABvfFY0HOpSRctfklIdnhQTUW45
 MhfWkYbbM102O/ipBVg9zILkwap0aipTxBcPTcPTUOFrRoQRBOKDJ1nSa1KvFcMj
 WyPpeV/dOst/tb/kSGtNjerKKCelofJuz+VsmLKB9JHUclgjriAnvsvR84HbdOPg
 Kfi6UDLynP12r9cZITunI4XKApAChyAmtES3Cy7iMbnL9h7+RSTii5eTrjj9CxWE
 94Xt4f6BGN37Z/Nu27kDJckZyr5bMurQdBo9ytUJNm5mDQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j2yh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Oct 2025 13:32:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-54aa347b2e1so1848089e0c.2
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Oct 2025 06:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760016774; x=1760621574;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRr9DsOTbQL+IhH2cQUogvPDiLS8DNEDEbNUEWkTRTg=;
 b=sxWZpMT0/srKccjCmHBQGGkCfVW9tf4VhOtQ38aim7euhyJgh9qeynWIjsLieuR1NF
 bTkbBt5tCIlpOBTflnKOdzSpoRXOn2M1GrLegf08/2hRyCiKQ6TiKxf+iESJAOElh8Za
 EPxlBsrUaK3qzhRlrWvMWJKzr/ZEwl6153Mp8Rxp11GjAeQKk21z0BGYF8mQXJk2U++o
 3xRuPkQDvCTtRY8jNy3Elpl0c8j78cEI1lizQnHVu+uKPrcW4ngMsw/qcUuSdlJv+oib
 CynycZd0tgm/h8ruUqyOTGjS08xm1Tw2pPpxygPmyqJC5ImBWd6RSREO1uEDCTMrJpcQ
 vMIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmoeTVcfzyh1or1dpBt/osq2EMMuMpG3VoGDfLbKvo14oo1LMq+evIN28Q368AscLiuXIDBv4f3w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7O9EdG/COUGPw926SVqhAeIZp0J6L3XOWx/JImLMfQF0Rlg6S
 5zZ1RBEaLpeBZbkCPkiaIOtI/WKcrNiUIWjuLH5OcgWy6GBzR18IHEax8GBePn8cL41fyuQdUNd
 559BrIdMJx3O6IGf2z1umE5LWvUjHtdC47xCH+IVcs4kMeCmU2QWmpKCaZ+Q0l+YNiJOfaQ==
X-Gm-Gg: ASbGncs1HXOEDR0XmD4c4zfG0ug8iu6XOatXwF+p5B0VRCcgJamdh/jdYO89yeoczJu
 ffGE0FwPSws0md6+L+FSvE/2guEUGnzU74ns+pydDaEYTo7Qww8Jorj+EVFtilujjnx0o3Vjq/Y
 lRjFOI+u3O0pHxfgBg2gVxDgH36zVOxrEBN6sZlPESmaWZPxxUlS1TJRnqRmn7mfsGAPz8yZlQA
 r+uvv9FJCiIf+V9u/SiaaSl6pZnwu1WpqJINN6OwW7jRlpYDkHrYLDRqyUDOTlNPQZJneelZbqI
 rMelY6wrgKZskG8s0Y29NTu9TxDyXMWX8sZUEHe+ZyJOWknfP6XH7THAlfn17pCKGzTx5bIywjM
 qdwOCBZ/C8923ss0lRLUYW5KbWgCbU46k8A3wu//Btrrspezj2WOqUTZqnA==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id
 71dfb90a1353d-554b8c23f89mr3464570e0c.15.1760016774204; 
 Thu, 09 Oct 2025 06:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF11oySDBoem7xTkH1oLPUQwPCox0qjhESMy2x1A0tSRyY/Tw898j/talcs/MTKAv8Q9vNTjA==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id
 71dfb90a1353d-554b8c23f89mr3464505e0c.15.1760016773679; 
 Thu, 09 Oct 2025 06:32:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907adb1268sm1047769e87.90.2025.10.09.06.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 06:32:52 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:32:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
Message-ID: <w23s7pc3diq742biiq6sah6lkps6irejtkvcwvyotbaty37hvj@j2nheyk3ir4e>
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
X-Proofpoint-GUID: tcJNTeSRD4OpI7auNwMminLjYNAiClm8
X-Proofpoint-ORIG-GUID: tcJNTeSRD4OpI7auNwMminLjYNAiClm8
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e7b987 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=463TWv_Jhf9JylTOhJ4A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/FdwXj4yuhju
 eQ46fxglAWST2f/hf1xzk5QmiMYZydAvGvZXFnq2vs2qkYEYQENGrDELAiwegfZ7IAJW2bhk3o+
 0TQnJDEsEEcq65Hj8WGFscHDJPJ5N/LTZFM93cGvRqEPWZHfNK8nvFBabHZ2oDzqV34UDIS8eiH
 H05Fz0YtJORm/pzT/gpgaXw6vpYLhz8ysYuf/jX7M3dxlv7lv1ra/EYcY56ShVVLRRsy87b/iHD
 t5NPWDByH2Nm6gKpnqXK34xCSJKquGoDjyjgI+SBJWdYBTqxmiLYcF23M3gbkf29JbFOym2pqtb
 LMb/K0uVXxPPj7Fl4D9HVDTkFU80CKCHfw5GKZumVmBJKH1Yl6LgTFQZFiY8b4ci3Ct0vzvpAf1
 JdjbZ+jdHNK0NywNTJbaargdJB4dyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Thu, Oct 09, 2025 at 03:16:28PM +0200, Thomas Zimmermann wrote:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
> 
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
> 
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # core, msm

>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 

-- 
With best wishes
Dmitry
