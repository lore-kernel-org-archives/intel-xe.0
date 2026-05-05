Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ABDFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 00:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC9110E06F;
	Tue,  5 May 2026 00:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PX4xsM/z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8LPHlbI";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0FB10E06F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 00:31:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 644JxQV1331125
 for <intel-xe@lists.freedesktop.org>; Tue, 5 May 2026 00:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9bpCGbXjqCOIAvvOUlLB2mc5
 4kkmnK5Hi4mDPrlwbVg=; b=PX4xsM/zVOQ+BGoq3faD6CRBTEjk/8HQYr4tOenZ
 SvRGdwDJQkJNGw/Wr6FzZ5pqu3iTRSieHe5vU/CrPRyEMIc4I92RYacX0zMmQIYx
 6S3II89aQ3eYYJuiS+Qp4NLKy5sR5KANdxzvPyf0G0WI2tsXq/w1FQ4xrh1DRE13
 oXBl/YAN2ozv9Rt7rgKU8oOzEpugxBY3fLAYX515vlCYVcc7sQ2GsXQjqiU920yr
 OTkCGvkzA/j8Pf06G3SNiYhP/QI5AsqSA8ytKLRDa+PMtN1d1aouUheADp88ZN1B
 c4KJeNtsydEogxYU8rn9416vI/+nf9+NOfEwAksf2UmvHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1a5f4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 05 May 2026 00:31:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8b3fe2f190bso186202186d6.2
 for <intel-xe@lists.freedesktop.org>; Mon, 04 May 2026 17:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777941115; x=1778545915;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9bpCGbXjqCOIAvvOUlLB2mc54kkmnK5Hi4mDPrlwbVg=;
 b=Y8LPHlbIAGXxwN+78YEkMkj+OKrXbBh2BbkpHxUz2jlT8V2nsjCpwpwhEGOxWpItnZ
 iFqHY6AWEv8S5eTNoCJzObxuwFBeU00cj6/pPqOMTMZBlArRPEgA1vbOa0h2Bv4e/+d/
 IMV93q7KZb2Oh9kVJQ73zBVw2ECT8nkAVD7Ybof0rPfKEHrjcIFHL9UCISjqbFxE9XyI
 6n4zX0RoObHIQFhE8orVrnDZhOe19adXtH7To44ppgQXppbcJzM3cEm3H67EgT+g1N+j
 o6PAAbPyguQh7bGVgi5QqZCHYTiqpLjWkZ8MA6jAvzMTRjiz6grCfZb+omfJxNi7IPWQ
 ylzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777941115; x=1778545915;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bpCGbXjqCOIAvvOUlLB2mc54kkmnK5Hi4mDPrlwbVg=;
 b=RLbm/XmmOnkEKiotEw9u9455Hatv1QPCS9yfBd0VBvRdFqPcHWu1iUuSak+hRF9Ews
 TTRbVdmKio8bolCzMq3mLTR7eu8wl1+dWIo1p9KFSrKcbhR5BAHePpRXE+u5ni88ZyH5
 pSHRwT7lcGeFVZGM8WYxhQlCXNY9y2tY6vP1HleAc1DT95WSrOlCq5+Io4rkgoO6j+7D
 w7KCtKW3pTX2TWxoA3NxKIRhuZzKH7xQadDBT4bbmMqSUUC0Ed9uKwj1TutI4G0cSA78
 yfcU6fO6hBOnv2Z+i3US6nlzbxUptbvorzqQsMhsqP7cA/JeUN12IsmATC/qM7cO2u0a
 yiog==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0KAWAyktH+lA79CYffE8j7wACYN2m3BS59VO0ytCst0ViYblwQC8XDXBaraDW+WVeXnoXqTvvzw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvMhshE9cLPl3c6F3OEAi7sVLSM0NORLUQ20OWFiYKpZnOcGEw
 1hHOJxWSFjEt85xQPh6JUdSBj5rELuk8oK3SQHmfcjanHyDnUN7dKOnvo3waiHKf9mNazJC/ZQy
 9P+OUpdIwfxz1iHsGB9qDpBSyw7XiZ41bY2eUKUsCwswXonoQWoYmMMpzQP6CqVGLQQaG1A==
X-Gm-Gg: AeBDiesA1DrQKCWlBQNvXoTaVAFKp43WHUQb5xH3+i4xYiRMjeDpsolUH3ZTCDHsGiv
 q+i2ZQ79zXwDHXxeEWAGplvguczQiFpvtsUxC4n8KA8KfYHaLJ6ivbS/i/PiAbPVG9vT61uSu/q
 1itAOtZqKJT0WmYzQzoGFaj/h45WP+GoMFVvyZWV2ifOIWS71BedAjzpgsVBqQ7EVkYHQjVrhth
 11sY7QNQJJrK8ptHJ7nLFxZ6F3Pssr+5OKTx7LkhKcRR8svsjfFNE91EJjvkH1R4MQdoUNSsnWU
 GQwHmLuFTDJwjc9uG9zFgwU/O1epjoU+LRejrEbVf0IaeYyf13WM4Hq3Lfv7hNSThiQvYpPyUpr
 b1ipzQRdBf7iLfoCxH+0MU7zP5pmXpIfTJGuweWyCwsRIk3aZVSzKHr/rggjmlGb299BY01dVMw
 ep5/J8hBVbOschr96/HXH4lubhT+c/O1A6XMXg0JWyxEvwTw==
X-Received: by 2002:a05:622a:1495:b0:501:17a9:5ff5 with SMTP id
 d75a77b69052e-513069e6f34mr15970591cf.21.1777941115049; 
 Mon, 04 May 2026 17:31:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1495:b0:501:17a9:5ff5 with SMTP id
 d75a77b69052e-513069e6f34mr15970211cf.21.1777941114636; 
 Mon, 04 May 2026 17:31:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a85c346d1csm3387545e87.75.2026.05.04.17.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 17:31:53 -0700 (PDT)
Date: Tue, 5 May 2026 03:31:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 uma.shankar@intel.com, arun.r.murthy@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de, sean@poorly.ru,
 marijn.suijten@somainline.org, laurent.pinchart+renesas@ideasonboard.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 3/7] drm: writeback: Modify drm_writeback_queue_job
 params
Message-ID: <cccungluhdcfgdqdo24pgmqmugeohvqr76nuibp5m3tdfirj3a@yclibqr4ftr5>
References: <20260316083008.87466-1-suraj.kandpal@intel.com>
 <20260316083008.87466-4-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316083008.87466-4-suraj.kandpal@intel.com>
X-Proofpoint-ORIG-GUID: 1qjxGXwGdzK9OrZRz4patt0oEI2tJsKj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMiBTYWx0ZWRfX6EqBw7d/AjZL
 lmhBpdDYU64I7ZlzsY6vSOzGRxBOJIGcpMar94rSFswQU5LwECfZsMFLJg0yimr3pWLdKD4DEHe
 zo4Cbk+WMB6iMNdGQ727ixS41r/rbodehJHq/15kSya05zC91J0pBY14bf2MSRANHVaqUYOg7sp
 yRnIJuIIDB/W4DskE7w69ofT4DoUma8M6+NUzPlkCVcqaDVm58uHdSWvLbMw5MI9AfkxaeS/935
 UGLSW2A3l8okSq7Wl/C9wdhwaI62tFAUYlO7D/KX9J6h3a2GfiPc8UU+MV9O0kogz+Fu5QdkCx0
 VOmwOpbzGKDZnsR1lX4hrG2DnY9TIQjXn5ZeQ6l0blH5py2VGfSKtvs1cgzGGZwgGAAncWwZDB3
 Qy0JIQcP89U3fyWKP5jZNNz+xdItd8Kw04K2o8ri9qgFHUATHvD4ySIckZ/lYuEEdEhg0giLZ+k
 B6G8FmS7oGm2h6mEeJA==
X-Proofpoint-GUID: 1qjxGXwGdzK9OrZRz4patt0oEI2tJsKj
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f93a7c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=O7Z1nR-Lyzu68zncWUoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050002
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

On Mon, Mar 16, 2026 at 02:00:05PM +0530, Suraj Kandpal wrote:
> Move to using drm_connector structure instead of drm_writeback_connector
> since this now writeback resides within drm_connector.
> This helps make sure drivers change drm_writeback_connector
> using helpers provided by drm core.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 2 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c    | 2 +-
>  drivers/gpu/drm/arm/malidp_mw.c                     | 3 +--
>  drivers/gpu/drm/drm_writeback.c                     | 6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                       | 2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c               | 3 +--
>  include/drm/drm_writeback.h                         | 2 +-
>  9 files changed, 13 insertions(+), 13 deletions(-)

Except for the commit message (where John's note applies):

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
