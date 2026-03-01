Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7146CFD0058
	for <intel-xe@archiver.kernel.org>; Sun,  1 Mar 2026 16:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320FE10E3D7;
	Sun,  1 Mar 2026 16:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4WFzvr7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/kiVMmr";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889B210E32B
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Mar 2026 16:49:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621BHjPL911398
 for <intel-xe@lists.freedesktop.org>; Sun, 1 Mar 2026 16:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dSllOkKEfDtkPszOpUxSs26w
 5scwH7eQoWJUjkkZk+0=; b=S4WFzvr74n+UOsusIQV8vroIg+2n/ZWGqD6P5I8I
 2QnM8/qHBqWY7ILgw/yiAvzWx2qubCHOnQ0vsX5ZwC28cc3zn5dc/5KewkUHerbV
 QZZW+NBsVHblGZuFL0vr0vV4FBjPUbU65Zeg+xCL7ugVV5oZZpgnU0KHM+4rP4T7
 RzUxQUk59lKRg+E0hMuAkjfRNqBYMlWRSO1Es3UCGXt0OChZJrGKGFssr4tyDNqg
 OzXVptZm/MnRSTytiWYP9Xpe4HPms2u9CWCNhehNOtxetcz8Ixh1CZGH/mcLael2
 5065GNEayH87h4/uFtcHDWZcrDtLuJdAzC8C101bS6eCaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd2xjf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 16:49:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8ca3ef536ddso3909299685a.0
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772383751; x=1772988551;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dSllOkKEfDtkPszOpUxSs26w5scwH7eQoWJUjkkZk+0=;
 b=N/kiVMmrXuU6Yj38mqMcQlw5/JjJyucmTi9NzXsRsCbrWQ38kuJatEJUjIPQiUtM+B
 YY1wEUTBTr3dFzlzF281SLZKIcqNBJaE55sinN2m3z1rQih3RvclCOKcmx7i0uVBqkc2
 Ff31hDtYm0qHt3hfhCnxkXN2cLdxlzIsidESrMT16yAmeq2j6anCO2N0fZgQROq1WK6s
 6nrbyZ3Dlo0492ziku876kogagP38GerOJirp7RhNVbQszaEOeTvRlxdfGgTwIC+2EZn
 8lWd2fEw42UD70W35/fAlU4oxRztGqeo7Zq+2btAJMEjNxSoJpRU2yKMFJDz/r9wGj/i
 Q3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772383751; x=1772988551;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dSllOkKEfDtkPszOpUxSs26w5scwH7eQoWJUjkkZk+0=;
 b=rfSWACgE5Dy+zEYxrn+YHPxhWJH3LWA6aLjcHTyAVRhsUHHpWbISq0GHdaRc37lVnH
 JvfLxH546wLNGvP04Dqeq47YJFKDQF871LDXsD60O1p1E63ujy/5iGyLYlsMO0UVWvuI
 7wMwOg/fA573PZ9EK0JnHKMeFWpBgsPO3pNQFqAAIJ1pqyLpNLD7C/IoE7Tge+r+7kF+
 o+CWObunKHcXwiJKSYXyqg2xGqb0tsFzQgIgCmaU3TeOF8h0QjrQi5ikbcsUjuJ9QInn
 ypMAIJFXiI4XnH/jZnH6CigiZLuLXB/TgbXIWRd8z4tl0/k8bAO4ql8qMBggix+0F/wt
 HZFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa3zX9dX0Np/shEhiqAn0gBvjfYqjEHzQsEWhSMQlZNu0hwUIZ63aJGBCaR68OlzyeCigTriaNFQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtEHwRW7EzMRShi2EBnpMh3wvy+oZ3rzJt5G2voL7MQ5pMw4B/
 /WSYL1mF5hxiLxZBaQQzm4MgTGOCCqi3ad0akwt3YfYUuMlmEpQ9Ck05+wZ46O4yrn2rg7B8B6C
 PgjP3+SFZTSZ3d4LAg2SHG3T53ddAaES14ctteExQI8BaGIwVrocesLh123rTyrDfyPEnLQ==
X-Gm-Gg: ATEYQzyO7S3MtQzsnHaNzlk2b4ZiDuWEX/snsfIc/qj3qGUoJDqKv/nVVTDqF+WwxK2
 sCDZWOQuA8WYQ5MP0u8MIOEpoKAqi8ZVdc0p0Br43SBLQwYjE5gyyFeMpH16bGwLTz/QKAKqD3X
 9NPgapV3vprz8YETDF4x7FbRD0ZSVT39VcDzb7QHRdC0K7yIcX4OsjBwqA9iyc9DxnLkz6s/ghr
 cAg1P4ft1lFzxF8vUuc5jUBLIHWUM45BCtS/XrqRY4It1kYylbzY32WAUqF9uryDUkIOC0NZkKD
 Als3suFH8pU3OUPJpUlogWOnfiDV5v4tx/lrCLGdVPCXmPrbnSW+RZXRxghdVu8EGXEs3pNQonU
 TtamxH7yRgXnfitBSvonn5AizmJ9UKNrk6NBWuj0mW5e87eFl5NuulcWOAlMONrWSDW+eyNqZus
 g9tREt/d4Y7SIaxAlzxkatKrYPkgScuHrIrgY=
X-Received: by 2002:a05:620a:2901:b0:8b2:598d:6e66 with SMTP id
 af79cd13be357-8cbc8da8ecemr1218259785a.22.1772383750677; 
 Sun, 01 Mar 2026 08:49:10 -0800 (PST)
X-Received: by 2002:a05:620a:2901:b0:8b2:598d:6e66 with SMTP id
 af79cd13be357-8cbc8da8ecemr1218255985a.22.1772383750077; 
 Sun, 01 Mar 2026 08:49:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f301788dsm21899311fa.35.2026.03.01.08.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 08:49:08 -0800 (PST)
Date: Sun, 1 Mar 2026 18:49:06 +0200
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
Subject: Re: [PATCH v9 05/19] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
Message-ID: <lw2tdcwu7yathstby4a5tx3ys6rruzeg3odvnsjsgc75sqycun@geoqspu2sfpv>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-5-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-5-658c3b9db7ef@collabora.com>
X-Proofpoint-ORIG-GUID: d92qQcZt4TyZ5NUFS7679W9WPJPEy7_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MyBTYWx0ZWRfX04p/VjV3uJgx
 gXcsc1Pa2LG3f9CNsWGKONUxkl82U7+MEKnV/dlOsg8UccC8Gd8Y5pKSSNMLQwqc6VWEae9r1+8
 VInZWgBC8Ow42A1PRHNqTfOdn269FwQ6e7Q3aeEPGtGGwqqcrok5E67UigavZF6ikc+4yziN8+X
 a/43PRonhOe6EeNF8pnQS5jqmo2XwWp997TbgNXnrwuPvWBxExKkC2n2SDzbFs3v5z5huoPBDkd
 QTrUf8aNvjrCxhyrul5+7fgzKgQj+Th/alldDQp6I/fGPwN3Iv/Ee/wY/u+0naTsc2Rg1I/j5Dn
 ecEbWpFMR4O49e74cRYq1hmvf5iHsWsE5O1L9beVr3QOkOBfyJGgtF1PBcUGX6R1arjGfBdnUoX
 7DP2n5kYTfjgDGXUq2h7YulM49lhtBC15kUahr+c2UqpfPJoNLos4tG8ixurMBsYCsQsD7wdruO
 BMZ5qz/QVWgYx+WZXEw==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a46e07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=CpXNCzN6O6rfykjMCtIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: d92qQcZt4TyZ5NUFS7679W9WPJPEy7_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010153
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

On Fri, Feb 27, 2026 at 08:20:10PM +0100, Nicolas Frattaroli wrote:
> drm_hdmi_connector_mode_valid assumes modes are only valid if they work
> with RGB. The reality is more complex however: YCbCr 4:2:0
> chroma-subsampled modes only require half the pixel clock that the same
> mode would require in RGB.
> 
> This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
> 420-only or 420-also modes.
> 
> Fix this by checking whether the mode is 420-capable first. If so, then
> proceed by checking it with DRM_OUTPUT_COLOR_FORMAT_YCBCR420 so long as
> the connector has legalized 420, otherwise error out. If the mode is not
> 420-capable, check with RGB as was previously always the case.
> 
> Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
