Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24ACF8FA98
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 15:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B44510E8DA;
	Tue, 21 Apr 2026 15:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3JfPtk/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+5FFZEg";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0FC10ED09
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:50:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63LA3Rlc1085706
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Mo2f7WcLf3osCcteJk9O/SCd
 aTHE9e4ZotSTHgD8zF4=; b=T3JfPtk/F9qTRPbRfkl7o2BZSzyv+JBhAXxS6ttT
 MOSjxvRnI4i77iSapmiJCFDnVsEq0QW/Jtnw0oP+13HCbJQZsbIl4o0nBZ7BM/Ak
 dIm5WQtrFpcHBrWUTfX0DPJz2/3k1CpYkjeUEJsBotxlqW8cHl4C1IzB9EukfqBJ
 WziBCJ4gy7miFoopX+oh4xsVOQF0GNzaP2l4PhxJYGlrDMcyomR8Wgf+5BvOL2B9
 dB4LcWEqOCSN3Mkne/6U/Pgvif/ICIcmjzDdVgPKjCyZVEtz3mctUrd2bbmrhx6Z
 XFkpDlnDUmrRcpSLJdCXg+25TftEYna+RLl4BXLJNiiZyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp75a955c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:50:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50edf0245b0so46029741cf.1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776786610; x=1777391410;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=;
 b=N+5FFZEg+jnamrUp8K2GH9/oe7cOKmWNsn4sum6QWO4gdE612MN1i9a+gH3btjmfbt
 bCbg+fdEs/GX9p7kAJ2UOLyg3s6Wq2Ag4bC3NlziNqz8ZD7z1DyWdtTLclk8P4MHIS0E
 uOFuxZhxZb5qKy94dxVHYYUZI5YYdf3Pw8Z1sFQ6TjzZEd5h73T208BR1WeA2zTZTUV4
 C9MpRmpv4mvA8MHjyLp5GpnVht796zN4XS8ChPjGGY06VAVoMVg28tt72Sjz5IPYE9j5
 GAcAaNrdM+yyNmR9dHo/9LEQ0yZs/7O6fSGpzsEKVTd7ymwRzmJWJhPcOUBreao2KBwM
 p2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776786610; x=1777391410;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mo2f7WcLf3osCcteJk9O/SCdaTHE9e4ZotSTHgD8zF4=;
 b=A5DePBsFceyvOQFdoXxBofhXIvJWxntcnZMlJjX2K53uaqHgPbPi1YJJqRX9LJLGYh
 e/qUqEU/je0OvL1jtDjUdLLP2tqB93dcFGfFj8Whc9XL1s6e9Wm5n74a8ajcJr5qbtie
 E6uH8qrLGom8ZxQrn2KDS5PIw/y+Kt+kpU7bVPYRekSJmBhO8u5+3ko3YhkFlD9If2R8
 RNMphSlNLDQdHabvvEERKdHCYRu7te77+TOLLwESK1/uyw3EaoHCekWFmZuuE8dzCTYA
 +15cLXwy/6iD9KYQwkoasAqfK5DtEw27+biwJadv3TS0HMiDDyMyEGLGVNirJv3sUMRW
 Iylw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/LZHFsnQYjXhJbJDgvJK4rGqKoIArESn/JFr4oXTNM+pye/bUo0Fn07WhMVi1RyQ9jZC/hhvj0Ig==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpCA/vjz7bcfA0EYrUbyHE72ipzUIpXvTTM5GC+qM2uzYuSZJC
 17kpatRmd4xHyG3aiL8IP3s7/msjStEnXXYw3noQonjwGdRJsHzRQS6RfmEUuEVdQ/q/ikyx/Pt
 I2wuDxVzC+qCoNYly8CYxHg761ZEw1P6TC2gx5pK3o6q+IoRTsKZy/IqDIB/vx9XcBYUxug==
X-Gm-Gg: AeBDieuiuCSqjNXESotO2+CFMQUMjyoqM0lnolFluDmLaIfz5g5KwNR+yobuevz/iV6
 JbOAyu9DCq9HAVAqJYZvbbNVvlKMofg00hoiNNQ8ZUxk+UP9UCtg7tJcrgNxdXGDKNSxHwUkswZ
 7dqWM/fsM6AzjkzgGJNa57uYq+D3wHg4SJX1GcAqlvTVpG5bk9sdI7dIsdpGpNREmYIZqfm61TV
 Dru2lJ/bjTi+Gs53XdYeZZBxz0ko1k2o8RuCgGo8PojYm2XKCqFp3pkeMTvTh3EBkvFEmTHo8xD
 Z11wgaLQHCBWWOgeGi+bIgfEqTru1mpEoedk9fbfY1zRgkb7k4E8in7cf84hBBRgccQXGuT1bYa
 pe9HKjptRgm57dnyp77D+GhQY+n9WENqi/FkdMsj6QJIzeCcnXvFPD/EpztvSFIGjBvqiwMqm4M
 3ySQeqZENiBtpG558vJad+mI0m1YDP+cxsiinHpOj0EwH/ww==
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id
 d75a77b69052e-50fb73225a9mr33343571cf.19.1776786610373; 
 Tue, 21 Apr 2026 08:50:10 -0700 (PDT)
X-Received: by 2002:a05:622a:11d5:b0:50f:b732:202c with SMTP id
 d75a77b69052e-50fb73225a9mr33342531cf.19.1776786609679; 
 Tue, 21 Apr 2026 08:50:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185c8a33sm3824506e87.36.2026.04.21.08.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 08:50:08 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:50:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simon Ser <contact@emersion.fr>,
 Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Alex Hung <alex.hung@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 12/20] drm/hdmi: Rename
 __drm_atomic_helper_connector_hdmi_reset()
Message-ID: <5me7yklungth6sss5okogfwtr2ed47fwaq3rxnfbhjqgauefis@h2c4kbfk2sqe>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-12-c63f1134e76c@kernel.org>
X-Proofpoint-ORIG-GUID: LWaRzld2URdnkqJTWw8xVpnTuTWxzdH3
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=69e79cb3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P1BnusSwAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fOc9-Nj7kuNS0fQUIscA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: LWaRzld2URdnkqJTWw8xVpnTuTWxzdH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NiBTYWx0ZWRfX7Ia95SdBQY02
 DsIDZN9a+Fpx1Em2sD1X3jlPZ0DcZisGTHxF8nt9ePsLm+wiXqFUskTGp/5/08nhMtziFW78fxg
 OXUNnGFI9La9V/N67MuXYPd98ORZLDV5Rh6wlNJmmwdFKC/JuZ1hBk+4NKZ/wlryQjLSYNyDeAm
 kgIPHyUJub7WULJgIGjyDpBb8M0HgM0q5NZm57ry9YMx+INgKbDkZDRis0KbcqzzvFh3QvoZPGB
 GcvDbcyPl+RVnQ2cEq79IeFLRiFyrr0RlwgrFUxME3WOyz9uSkkFvLTivJXNjYwsQ96Nh1eBTAN
 ETfGnOwQhbLGKDLEZ7myUwSczQVzGHpPTCBi0iJlZdJHwwalkFdUGsepcwzQddBQ/u4bBNe+6d2
 d9dKPNkQjHPqrb7XdjgUM7jWMq8z6/mkjRrzplZIKyi7jQo4v74YUcLlgwW/a7kBQ7+Ki73Wa1L
 mc09M0eLSO81DHKZTHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210156
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

On Fri, Mar 20, 2026 at 05:27:19PM +0100, Maxime Ripard wrote:
> __drm_atomic_helper_connector_hdmi_reset() is typically used to
> initialize a newly allocated drm_connector_state when the connector is
> using the HDMI helpers, and is being called by the
> drm_connector_funcs.reset implementation.
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_connector_state instance, we will need to call
> __drm_atomic_helper_connector_hdmi_reset() from both the reset and
> atomic_create hooks.
> 
> To avoid any confusion, we can thus rename
> __drm_atomic_helper_connector_hdmi_reset() to
> __drm_atomic_helper_connector_hdmi_state_init().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  4 ++--
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 14 ++++++++------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 +-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
>  include/drm/display/drm_hdmi_state_helper.h        |  4 ++--
>  6 files changed, 15 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
