Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68773CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 00:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252F110E06F;
	Tue,  5 May 2026 00:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DkluRK/U";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQhzmGXl";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EEB10E8FB
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 00:33:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 644J16N5636014
 for <intel-xe@lists.freedesktop.org>; Tue, 5 May 2026 00:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zQhAbMMChSVIrW8bHgvy56iM
 nhslWxiT0BF5DVUHFIg=; b=DkluRK/Ubp0ZK8IF2ffFM2rVoZXCoe4QlbtfBKj4
 I4mQ8YouSHrlCgs8V6c2bjj9IioQUWNp84YKdftfezbluUfML/1AWvKb4+iblgTw
 SgH+oUpBsluafKU5TSMRjaJvXymB2HH8VZGj59XtJvssLgr9ukw4B0LTUcFGZLrO
 O91Mbb52dTIl7si4P53r3ytydxYfSBpMEyADoMoO2F297a4PHU6Fn8JdkInIxs8o
 Gc9Snsqj4JAVmFIdsdiIkon633fwN/czvQxDsclUePA/tZtUrk3/dqHfBlTi05vF
 QmhiQ6w/QQOsKzjRgNthshMIzJnY9ji5c5/nNfLbNM0yPw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx4apsp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 05 May 2026 00:33:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-56f6c90b142so9338753e0c.0
 for <intel-xe@lists.freedesktop.org>; Mon, 04 May 2026 17:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777941186; x=1778545986;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zQhAbMMChSVIrW8bHgvy56iMnhslWxiT0BF5DVUHFIg=;
 b=BQhzmGXlWxEQB/OgCgyCwwEcjYTdSdyZ/Kz8D3DxPFuC1F6IIl18s4e31iaIqylxER
 LbDOGiHCKsac802H7Wem2D4wmMGr4GomFlTlazpuWUMtd5MVkZDqwBBiEfgQQhZD3hU2
 yROHw/tVoUFdKkLzpWXgBkG6l3lRCpEHaAbGi+TSl8jy++cS+TBL3BFx8M11lEnksbzJ
 1jbYwtg5+vSL4ne6aVU+DPrM16tqPouUdoiLBRBr02jvxZTNKaKafr0EIU7i72a1Nn7F
 mYX0QCLV/EWNYO6JKL9mQ+Hs6Y/SMriTIA3bt4YRm96+GlsGGgjzGWYE35hXTrz5Hhz5
 xmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777941186; x=1778545986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQhAbMMChSVIrW8bHgvy56iMnhslWxiT0BF5DVUHFIg=;
 b=gZMZrSFwqhAVwBamH0VApUFoLiT+sq/WS6X9fwiy5aJKYvk66RGCeqiHbK57GxAetj
 /3WevhVVSL6lwJq3yxKiN5cVinIVgOQwXwnDPq2rk/9mId13z8G3G3nDu5/Z+RV6ibw1
 jo9aLl3kpDrRqn37dHFG7zls2VMH+mZYh0x0GrgC5sAB6wZZlDWjr6OuV3e8S42srjxZ
 YsMxtuSfytpLTwamCBnbJpwXGkWKUgtmc5eaOmfm/vyegN7YgcyM/pP1G+xugVV5MQti
 DY12BOYCKqscUmu2rmO5D8gqBkcgllMb+zOSWDkbPO9Rs/PdvLOd7l7Ti8ZfGLtOOp2h
 y7sA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9E2yMUqC8SbUNxfaWPx+uwY5PiFh81F1SWjxBkVP/LKQzWMJahWOcCrf1u4SecXDW0VbmSHGpsew==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqabA5J8Fa5O+OPJW8HdXraWzId34jgL7caGh36qiebQGW+l09
 J3zFndRxWdGzpZ9aWGVLTZDB0GQKbJeTAkGr6w/+9moddgn4fAJ2IgiIITy5HWW1L0HCeNf9nsD
 N0/LGUWkVQLjgu/qe7R0jrCIutTIRnMVez+KRZsCl07QPv/zU8l5SYjT1/iWfuPvUJ17tdQ==
X-Gm-Gg: AeBDiesHbzNdICm8gzP/YHhOtumm4Cmm/57jQ/rPKhDZtiAUaRpnjhIfY0/qlhAh7GU
 5JcU0PGc1EXhENY9pfohrauIo5Locdv18CTlLyZxf+eobFII+VQUrHMNDn4oNQOrlTVlsxawFIy
 qLQwp+7x08eQiZIXbzm6gWUyd3SH2rTu7jZiH7Y3S4QoOQcfGZpllm8vWglbwyPoBUDziTkaOR4
 IX1T5EqX7dI5hh56Tv/FQSxmIEF1agQ22+1wMCwO8MH+QHrY3axruNYhlX3fn6eUn6/kpa6SKp0
 NNzKRfiWWWuqWPCosZ/Jv5esuscgjk9B/w+9rQoJJ5lo860pMLdiQtTF7+3i5W9krx62GvQsWYP
 EzwitV4rzzpY4ocd9jMlNBs7MwhMpB94+RA4ig/0WLYvcdDDMVsPh3SWJn1xiIvF2xEw3BIv22O
 quxa3VA41RGWByB9Kqxsp7Wx1PsaFYoR7DU8MHmR7Ef7CqmQ==
X-Received: by 2002:a05:6122:6090:b0:56f:a329:6859 with SMTP id
 71dfb90a1353d-575482d1800mr509475e0c.7.1777941186560; 
 Mon, 04 May 2026 17:33:06 -0700 (PDT)
X-Received: by 2002:a05:6122:6090:b0:56f:a329:6859 with SMTP id
 71dfb90a1353d-575482d1800mr509452e0c.7.1777941186127; 
 Mon, 04 May 2026 17:33:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3936db4ff8csm30303011fa.23.2026.05.04.17.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 17:33:03 -0700 (PDT)
Date: Tue, 5 May 2026 03:33:00 +0300
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
Subject: Re: [PATCH v3 4/7] drm: writeback: Modify
 drm_writeback_signal_completion param
Message-ID: <bmk67tbapjnfcsuz5bqivnzytnwrhk364c3i6oe4pnilwgisz5@25b6jebsxxq3>
References: <20260316083008.87466-1-suraj.kandpal@intel.com>
 <20260316083008.87466-5-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316083008.87466-5-suraj.kandpal@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMiBTYWx0ZWRfX6WQ5vX80Qcia
 aSM+RxUNlHDGue8TiqLs6p4NBbWUyDO7qnHx4AGCRO+rfh0ftsRg00N/p3K1dTGM2Cpir6VBUQ8
 CoQ6VxAHuJYLtzwnbZr3H/EagFXCzONvSRav0gG6W7aG0HRWWQZAAftkiPT7fe/jg6ZfWD9mmuy
 gd0EVGwT7KTk80CoGAdefpLP/IEXZ/FU4cEs+O4WOZsmKxDiPaeukcD4yH3AsitDlrr/nrfGVue
 C1tN528X+oKzy4Lq5mCOsCGlcEz8X8PoXfhCjqkC8iDo2RmGrfVjoH/Jm2z4RG6zhSppBMxLGJS
 FC1QzMJcIWNBxrMJuG4F2eKiwD43WyrzfSIGhefDfg6LFhO624zn1oRWEzxwrytVrmj+iM6MXBx
 ACspRVeBvIqXGzAC4vmVO5vS03qHrCOdwhmXrg8TOpsuzmk8qykaeS9JLP0HFC+8KHZQDz0KYZf
 nw2q8OzCq/GJJt+gkDw==
X-Proofpoint-ORIG-GUID: KroJAMbG_ag5n7w-X6XBBmEp8cuu6nZH
X-Proofpoint-GUID: KroJAMbG_ag5n7w-X6XBBmEp8cuu6nZH
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f93ac3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=w4tPeIWWwG8LP2YZpMkA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050002
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

On Mon, Mar 16, 2026 at 02:00:06PM +0530, Suraj Kandpal wrote:
> Move to using drm_connector instead of drm_writeback_connector since

"Make drm_writeback_signal_completion use drm_connector ...."

> it now resides within drm_connector. This will also help make sure
> drivers do not need to access drm_writeback_connector as much.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 2 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c    | 2 +-
>  drivers/gpu/drm/arm/malidp_hw.c                     | 6 +++---
>  drivers/gpu/drm/drm_writeback.c                     | 6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 2 +-
>  drivers/gpu/drm/vc4/vc4_txp.c                       | 2 +-
>  drivers/gpu/drm/vkms/vkms_composer.c                | 2 +-
>  include/drm/drm_writeback.h                         | 2 +-
>  9 files changed, 15 insertions(+), 13 deletions(-)
> 

With the commit message fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
