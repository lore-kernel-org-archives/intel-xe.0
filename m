Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DE9CCFA13
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 17:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A20210E1DF;
	Sat,  8 Nov 2025 17:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8zryxwm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzTkGw5L";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E59810E1E9
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 17:00:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A88PKlg1467260
 for <intel-xe@lists.freedesktop.org>; Sat, 8 Nov 2025 17:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SymD3woxruHShZlmzgGQ9Ao5
 sdm1n6xaKEBnyNrZI5I=; b=W8zryxwmyyS0uVOxyZdcWyJS7fEeS3r+4YSWjwAH
 0XsaGqv6tzTMZ3Pco9DdQqZSl2SDWFk+/GcF1CEWld8UTkEY7RcdX9bKPUdaI2ik
 MSIKK6If78PXQokl1VbgYqrE5UvCY+1p9ZJBIaWBsgSb6OftqJwRpa9N+iuLz5vB
 avPoz9QgcFuCQL2t785LjXPrOr1AK8mCQqaSlh1MolBFH71HQZrkAHq1hHm+/gCU
 I0F8y/Nkh2WkGUffdAXDrjwTEUKkD8SFX3r0sqWdBpsRrZ9yPnS5lTYruEkH1hSU
 eYtSU1MHNq9GN6+HMgz5HbHRaH0yn9NpB+Hwr5A+7khPgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu2rvqu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 08 Nov 2025 17:00:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed5f5a2948so49264421cf.2
 for <intel-xe@lists.freedesktop.org>; Sat, 08 Nov 2025 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762621250; x=1763226050;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SymD3woxruHShZlmzgGQ9Ao5sdm1n6xaKEBnyNrZI5I=;
 b=NzTkGw5LqsizL6ssv3i86nmILDQ95960u1JZqF/rTg47inBLvXPjcpboWIOtuLcHAQ
 4XMgPyuugaafTwRcM+cHDKDrpQmjy+fHFxhtfCblvO4BS1T22Erm/73PeQRNXi/l6Kry
 tEYaJIK30IsoQMX1uKkaC3F/QDDUPmD9Mcv7+e9qboHznr2EdFLkEbQ/CX0Y4yspARDV
 O4jeM2Mc7TERQgLKl1dMJXmeIy21qtL97azKYkKAn/tlW5yNKFJFh4pzDslevT3+qaaP
 qIcjf6ffb/AndCRFKZRaM4JlxTviEVw3MekfuaV/7Bxw9IOvNULaFhqFR6d+nXJQMp9d
 YlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762621250; x=1763226050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SymD3woxruHShZlmzgGQ9Ao5sdm1n6xaKEBnyNrZI5I=;
 b=uIZLjxuPH1IpnAL0HZg4Jwi1w2fAWnlR8s0Rcmla85DEmeqvPxq7ZqBZBeZ8OPfah8
 1aG9efofm4VhPCnP9q02YnrVxJK7Ltlp3ZXDenDHAgtYzI37NhJAVggFeXU6rJgxEwFB
 KCvOYno7YcJPxLjSD05vbhY0pWfIXrpUjnrWco2ux6rSCct7ikA3uIATuM4bzsbOjfK/
 tZahx+pP6WCVPlIFlwtypK2evHB2F0yIW+LGxOeAvvjNzqr8pD/0YT2WzuQGCc3PVLA/
 4JGBPwf6is2z2yo0WyxlFYsS933nTI9+GNG+tVIICrbcMNgsc3t90dUr+hY/HAgpovaG
 a/pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Xt2Cs13Fumoex8StqUYsubkFWJMiB4pqqqOsb7yCyuC3AVl1S5TcX8rteIgSwMt2KhoNcaIs2A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSO5Ggl5kTX37PLuzxaX5zBQqimUA2gbnT09iG8857VAsgSG8b
 K6OboRReN0zjsixpxkARnzWPvAIOp0deFWwEW0WPUJj6tS0sjZPr/Pu6jUiIHUYD/F2CGKVuJBn
 HPRLVnwcNveCiAkYTQNB91IvqDQeTrC9flLYIVcamknnod2JJfKPfhkNWuGcjGgpvoV7qJw==
X-Gm-Gg: ASbGnctRpOpj0Yu5e3U8FQUz0OVcUBvhLeftgk+P9+FIRbG5ORRQ6ZWy3FcpS+0j/hW
 EAoo9RqHx0E2Va1dLsxzA8EcdV7EwepiYMpeQySFgv948m+w/SAw4VsxEVeYheS5acnglWxSSO0
 M26Qt3F2islk8cH9/3usHcN/CgNnaHHBSxQ9jRxgH8uBRQgP944D7/u0bDyFLCHNRNrkdWUOng3
 nG2nBTx+2Wyde+mjw+kpMr6dq0AeID4rNxgeZJHuGHdKiQetEj1i/yo1R6LRXst8H+whFx554sA
 zSMaXZdTVGubSqGW7XFW+vUMxrDlFQT4bnuEM8yokiIyVONKccQqRPpYOP+Iyhhwr1QCeUVoec9
 aY97Bq7hPYGAVoVrTxAUqcxqBzp+8A2XbB60G8aK3yNywy7Th5/AxpaJODPK7s39TnvO/YGHxl0
 3BXqDktX+u/xKR
X-Received: by 2002:ac8:5acd:0:b0:4ed:43c4:5e79 with SMTP id
 d75a77b69052e-4eda4e7bf1cmr44278771cf.12.1762621250288; 
 Sat, 08 Nov 2025 09:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1ot36r/5empkRXCspZfcIecbvIzABkFl724CS94Vw2gQkEMA6LYJRcTmCK9inn074sbu6tw==
X-Received: by 2002:ac8:5acd:0:b0:4ed:43c4:5e79 with SMTP id
 d75a77b69052e-4eda4e7bf1cmr44277961cf.12.1762621249762; 
 Sat, 08 Nov 2025 09:00:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a01a67asm2305233e87.38.2025.11.08.09.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 09:00:49 -0800 (PST)
Date: Sat, 8 Nov 2025 19:00:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/msm: use drm_crtc_vblank_waitqueue()
Message-ID: <hvbwatl37zseui27epzns5btxdzrjehamtua34ja6flenjxz3q@ac57pl6niv62>
References: <cover.1762513240.git.jani.nikula@intel.com>
 <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
X-Authority-Analysis: v=2.4 cv=dMWrWeZb c=1 sm=1 tr=0 ts=690f7743 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=32IxprGEISmnaGXNLfEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: IGOc36UkpWxMmr_3G4tzr8GKm_3Uvrkc
X-Proofpoint-ORIG-GUID: IGOc36UkpWxMmr_3G4tzr8GKm_3Uvrkc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDEzNiBTYWx0ZWRfX56X003uxiUtP
 mvXjowiVjqSsB6y4cCxSRUuB121OvSL6TF5hAEfT5TDXLtPYWZF+AxAaUqdmQcvXzAjDobYvkoa
 aNIjsk0gXscnqD61DAZSWrDpOwusgXfDdxZmUGiWpITV6Ht/DFX2Khot6XN6Hrq7brU4WEuaTuv
 rkjW+eIujBmLsVjt6KrXwFOK348H8ulyyE0PPcNK6yodZc0jUy1lgYCGq6/xxvWPk9z0PVVkLtw
 XjIc9CxGoQgRgqEHLdPsyCJb+pfXCsCaMk+XO0+xmkmLHtSggy8ZMYPN/cMxmcuPfly4q5m9U1B
 uv3tmI1x+LULe87kAZFfLGLD2oIzFjfMpdVsOMpye2umXN4NveFwIUlkKe6I+UCUbK5hsHdFUJI
 xNRmb2hPo99rtt4zMKTNzxQJ297gSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080136
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

On Fri, Nov 07, 2025 at 01:04:57PM +0200, Jani Nikula wrote:
> We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
> for a vblank. Use it instead of poking at dev->vblank[] directly.
> 
> Due to the macro maze of wait_event_timeout() that uses the address-of
> operator on the argument, we have to pass it in with the indirection
> operator.
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 3 ++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
