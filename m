Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC4AFD006D
	for <intel-xe@archiver.kernel.org>; Sun,  1 Mar 2026 16:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B386410E3DD;
	Sun,  1 Mar 2026 16:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7bYISNY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZlrROWA";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F97310E3DD
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Mar 2026 16:56:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6212Ppac578858
 for <intel-xe@lists.freedesktop.org>; Sun, 1 Mar 2026 16:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eOVsPPjRSHguluqilN+Kykf3
 N9M3bR0DVUL4ZH0XYBg=; b=g7bYISNYlH4zm8Xc8NmJw+M0K5jMvJ5cjPbQXgbm
 bGMeZQy7zp6MKJDjrHG1fpDIjml8NhjImDmfW+kEkNkuk8P3xFLHN90IqHo373cM
 RW5Ndm3pzApXW5silQHbujFxwqjOsi7o42PFypVLnjOlH32AAIGkMYcU1z4FAhXh
 n9bbyOltX81FKyM+Ec7S4fznCBe/RqQqafp0KNFl6kNigll5bQBsL0XwZxmm1AH7
 5OYkZGlfPKuqgshdIAdW+rO0jDOUncXt3YNu1bSO5WZY4Kl1DWo/wmKwpwLodB6R
 uuIKygv9NTamdvEIi7PH5LbqSED44L5RgmBIIQyUW0La4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd31pd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 16:56:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3b6b37d8so2842163885a.3
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772384204; x=1772989004;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=;
 b=ZZlrROWA3fWA9bDFigL+iBEPASefvCxzGCqq3o/sJgRBYrxIOrK52Nw16MFf2WOHIO
 mgYBQ49UDznVeBx7jyMR0SjwqnEPSKH4At+NKAaGNbIhGoowAzrvzAaA50cetycvHRSr
 cPPR8B7Mz/c8jJ+uCQgXQ/AqX+HwZvPFQom0eS9pkmH4xinRYxZuKIzBYnl9bmfy2KH7
 sYEtnFcmUOktR+6bWSi3RBC+sC9Ub1+FUOFMWrSI2PaJMvOwA3OQxhh6L/s3C0rnlrLh
 K5wIlAKmYtw6ariwu/uHe1C8VZ34VUkKFv9+TrTKBr0UoTkK6+6YAmPEes/htssPJqJE
 dT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772384204; x=1772989004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=;
 b=SdLYPT/bd7yHJ7knQYcrkeDquAbQCCnoYDqJyNYd11USy5/XjAPt4G/XvPBsZ5cMJ6
 JXObW/uZSASP/AvtgdU64uLu2G26dLawgU6DquYKtZjsPkGXwbM9aRvqFDRGkVgetz/t
 TtrZfMtq5eqR+RIWz9ywP0I3cuOqsfz+XFJ7dvjyOR+OIND4dzYj7ggeUed86kb+wNkz
 3GkWaoBxuOZsL1xy9u69TSE1j1WEqqr5+iEvhpxbHnwJPvcVaoNWXuRj1S7uebBByaep
 BZCSWZ4beNeCjKVAUsPIdohBvjrd+4enjtCz+WoHBATQ7JzGHvo+ENQb/RVgj6IpOg6v
 3ZzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZs4XW1ODi57/57t49CpJqTZBDqZMrVi/sVNOWz5ZvcrMAxCDkMBxH/kDaVB5SroP7sSI1wAmzTg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+dHobimZ0QISTFE61PqnRQAT2P2rohj+XSWMkAuEh7nPHGmcz
 WFoB23/HIk2iXgDPeLpxkyASGNI5plfeMMX/hF3F9VhBSZYZ6z8yUjkjyhjrLxildxeUsYyNJGw
 jmzlIoQ7gfaEqmopS0SGfXyNn0JC8nUfKVFSyI4+6BXdCZnhfIPgXXsoCGfm+j8QmKxx//A==
X-Gm-Gg: ATEYQzwuu+qzkybrd+l/mOLc7Rc6OR/KvuyPQiQEJ+Ry8s7yKATBB3gYY+HeAPBPAH/
 VaWWv80Ze33ebsVBe31l5QVCarR8MTz4CC8la8WSx7dSyGeX5Nj0HAMUG+4xqdyOENQXfAF+4EI
 2/isDCjzYLj2sJYQGsLlBOpOtQQ5j7p+7JBwzNPD7X9nRyxYtjJ13ALgxuV1KfKLZNxJaWcqPYR
 YECNLPlVy8hOkiETr15T3lMXf25S0P1xsEaN+WEeh62YysJmUnAzSRrw4R1dmcK2HQUNbisH8Lp
 BL2IBGvsnXxSsZhqI9WyTzmVHWF/pOtnD6HZNQT4gLgL+vPPpHBNyNUa8rl1wcW6Bffg3mDz/7J
 z13EqpUO7/sz+qLMHZK9GZcjaljItU43fSbN0xxh55b11d3kXYcNXdiMp9i3nTLj2iiMeAskWgv
 oaI6il8LkV0aZtcMDDk10RPXOM5UPZEnCDd/I=
X-Received: by 2002:a05:620a:40c5:b0:8cb:1c3a:90d6 with SMTP id
 af79cd13be357-8cbc8d6719cmr1207725485a.7.1772384203871; 
 Sun, 01 Mar 2026 08:56:43 -0800 (PST)
X-Received: by 2002:a05:620a:40c5:b0:8cb:1c3a:90d6 with SMTP id
 af79cd13be357-8cbc8d6719cmr1207721785a.7.1772384203394; 
 Sun, 01 Mar 2026 08:56:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bd9996sm1161185e87.2.2026.03.01.08.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 08:56:42 -0800 (PST)
Date: Sun, 1 Mar 2026 18:56:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <ylcczadyx5ovc7lbb57ehux62x6zbawf2k2pd23ymkp2meaqci@fvrf5gserw7j>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfXxXI7IrolAXtX
 ho0PEnLCaaRxoo+6sPF6Tp3slbXdNhaCl5ppQlVizrpNQ/b0sR5trWSdHapV0tj88KK3fVorCDG
 30cFNEZ8/o8tAXn+7t37xUR8yDH5wQ7IQGZtiZ83FsGqff/qQgY3XSyyKiVoPJDb+CQ1q5DSeFk
 HTgMpFuZNpRViJfm64UpGBTCez7fDVcWLZSVxlSxqto4eWLsxEDQGy3o72++C78vEVnbv4Z0Myy
 ECzdYCvOfjPdiml0XEKXj4RVPOnn9bWByPmONqZqCRGpH2xPOrfsxsMvnJ5LNjV/wILnID1bf5S
 6nuJqvK16YjZQN41BFIH+krSsQ6XCR1uuwU1kX5Q5pr8e76j7l4yo0NLh1ErJ4+75UW/rMZZygp
 Bz8RhJm4yKZXBWTvu+Nvm1fOA016rKW6WU34WX6gmP3MNB5sKue5zywliCtRVBats6275+zcPQK
 uPnEEICCvTfpX44HvWQ==
X-Proofpoint-ORIG-GUID: FvwTl0XQSSLKNtSmacqj7NSdQtIJlpgO
X-Proofpoint-GUID: FvwTl0XQSSLKNtSmacqj7NSdQtIJlpgO
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a46fcc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=RMrH-QTV4azj2PXgkmEA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010155
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

On Fri, Feb 27, 2026 at 08:20:09PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
> 
> Implement it by translating the requested drm_connector_color_format to
> a drm_output_color_format enum value as per the logic HDMI should use
> for this: Auto is translated to RGB, and a fallback to YUV420 is only
> performed if the original color format was auto.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
