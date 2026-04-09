Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3954F364C8
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 22:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC9910E877;
	Thu,  9 Apr 2026 22:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuUUUvjC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyI5F/9l";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548CC10E874
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 22:09:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 639LMdeG1972607
 for <intel-xe@lists.freedesktop.org>; Thu, 9 Apr 2026 22:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YfJuQz9x8+CxrVM73ltVMfSV
 gvGLqNbpnCkk5PUIX9Y=; b=PuUUUvjCOM0tKgt7LJ1qBH0p9464Id/g2CTihUW6
 mnvl4XVrXpir4kmhZe6PEPhrY2LifZYgKW5Vs6EsQpcBSOYHXg1Qj1pNpTXcde6f
 kqC/0hxc1bmbaxZJk12lYAGyEepI0VUL17eWKI2HMN1YEO69Rxk/+NhpmD2mbKdC
 RAn+udXOl93lD6VCGjwj5gToRo3qW4hyn8RAS5ABwmpJZRNcsk+6BcKVIIqneCNv
 Fds3WuLPfhtdaaE+dZgGvxowXegESy2mTHichE0SN4+JbaDt2MaedRKV6E7N1F95
 e6bJUc+D8gDeAN0BRI9zadJ/LlMYm84sRag3GrQIXXQIcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1uaw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Apr 2026 22:09:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50d826ed6f9so32616961cf.1
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Apr 2026 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775772588; x=1776377388;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YfJuQz9x8+CxrVM73ltVMfSVgvGLqNbpnCkk5PUIX9Y=;
 b=TyI5F/9lRhG7EaSk/AlXbb06b4QB+nr+4gpUeIG7hFR/cENz+qPP7M2qLMSsgBwtor
 CtaBjalB5U2IcnqTR8eI9CdcoMxrQN3rZ4MB0gUec+s8Bf0QnDhudrw8/jVcFp8uv2r5
 FAF7L92w4vaX3t8wETmcDxMmlaZP5N7Ffe1FjVqA7BmgHvHfCbPEG+af5MfW+YtPjKTw
 Lo9w5OLQKjOYfwMf9e1KC4V07lb9+E/lqSLD4jOzNO9HpviVIYwmiL68ylPFeBJMns4E
 +3R+bWbwl4suwbXbsxEQXmnd72v0CUjCM+3eAWogochqn1L4lPCIUJujV0rU18Pn4FZr
 wVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775772588; x=1776377388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YfJuQz9x8+CxrVM73ltVMfSVgvGLqNbpnCkk5PUIX9Y=;
 b=XfamI9rmY2a1jzyFM3TBvPJDBlMNDWjkqkAKDV0X4d94cH1pieBi/CLjTQe+YGRDDA
 Jip0OZ3HYszz46YJ5XuYPmztULg8t+YM50NRYEDbUCGQlqdIghLSat0dh9oOB2T/GT2u
 Jx/6BywzB0XYfipUFzRA43heVmMpZZi8blTDC9jsPcgAZ5p4vuSbM2vjayFATLc6qzHx
 WDANXdpBBe4bri3tZzuypzml8MKM/f4ksqJuOkzfrotvM6GN0NanaEK6RG6TdxRf5pNV
 j6sm36oZqF8Uj4OnqpjRhH5ZLMtLjysJdUBQgyt6MuoAkBGtl2kfQ/UbGJ7ke1h4Ani7
 kU9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdFDAFNZx3+pZcTdoGC2obPyVvEzqFltH3s9zz5r4XNzrBvnFF5/Y/cDem370lPKZfxzITtl8oRA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYRmIQFq+JnmQOiCyiGGIXWb/WwS/ouij1d5a7SHjXyFb/+F43
 nG/W+TzEl2obdiNRAFBl6V0WgcTFX29p1j2zZfwhFps/T6Y81Kj5/ZCkS9beXeabkilwL1sBM5X
 W6gOMmAv7F458Tg19EL4Ho7T9a9FL5nBYppfvJAlUAwM2pASqIUn1tMiqcVgwpm0DsVU2zw==
X-Gm-Gg: AeBDiesNrCUoC+Hr/8QGbGqNaFtawwdK/vDwPKMMI2AdrdPKQSdT8bXTPhYA06WiQOM
 F5xwf0X/kR0uraOcOdWqROMiBGz6EcCRRJhler649kHw+daC9+6bl95uHuGNqqe0dy0N9SY4h64
 pp4OYIL1EzBTSKEBo6rTTVuaLq86ZcuBcZ9B9plzvq05zeeffjCW+cAdvX3q3CeQhwR9IhxwBbA
 hz3vrLT+D35lM+st7mrZwDYDRqJMLI0aw13JiY0VW+RUqID0/AtjcGCuTa6YBU3wrYJBFhI/vpN
 ldg0T2ALYinVJnW39WaDW7PzFMi+8JI0bHJvSHFah/ifGw4Swd1MrQWFLMbMPogccd4m33wDX2L
 roe0iE1cH+KpbzIBtXr2nMjNCz9WAYSqHQCeLZuZ1X6l5i38Z73zNMA5D+DNdhGzfXkPEadITzE
 MwsxZRfDSWiHAjnj7vl+XPtEFmNgg7IlInnoE=
X-Received: by 2002:a05:622a:1181:b0:509:1657:a19d with SMTP id
 d75a77b69052e-50dc1a1ae94mr71687271cf.15.1775772587619; 
 Thu, 09 Apr 2026 15:09:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:509:1657:a19d with SMTP id
 d75a77b69052e-50dc1a1ae94mr71686661cf.15.1775772587156; 
 Thu, 09 Apr 2026 15:09:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a3eeefbb10sm195693e87.67.2026.04.09.15.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 15:09:44 -0700 (PDT)
Date: Fri, 10 Apr 2026 01:09:41 +0300
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
Subject: Re: [PATCH v12 19/25] drm/connector: Register color format property
 on HDMI connectors
Message-ID: <kbbkbobybjismej7wiogvmpjdju5zyfkbbwyuafxeajmasuzzv@3ksrtmmvsa4d>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
 <20260409-color-format-v12-19-ce84e1817a27@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-color-format-v12-19-ce84e1817a27@collabora.com>
X-Proofpoint-ORIG-GUID: O9dUU8SihDKWLXxQBUXd6hJMEgobbJvC
X-Proofpoint-GUID: O9dUU8SihDKWLXxQBUXd6hJMEgobbJvC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIwNCBTYWx0ZWRfXwUeygkX/hlkV
 AHpKk9SLpbLSnrbIbsl/Vf0zXpdO3rIz4Pf+pV0PKoTlEVYw4j96fw3X/9+EfJS9bKfDyJh2Zm2
 nZLD3PkrZGZQS5NWy/AecndOzsljmOezcrZU4WWBUtppAB1ouoiWP8PlnnUH9gISQzX9GtjdFnF
 K+JkerH3/t2TB5WEdd8TONmr5qz6EgEg7QG19I9fgtj5pZadBGnqePJDHlDG/4nI+JS1J/vnD9C
 t8rHCaXgXxTDl4GKBxI+LhNkBpLgxijwQDGNMyGsX8TtdjRn9X5cfNt+zTnT+Y3NEGD3FEpJ1Fa
 I76Dcw0wQOB+kouzQiLORRiX+auB5Xv6fCj1978lyVoB0k3a4ZctIssge9Ho1dc1VLVB3PNKGSi
 A3u0pP4walAFJsYRyvJXPMc2EkZYwQ93allD9Ud4AZojDQaX+VYpt5KkPSg6endoywBQ8SmHEla
 Utz+DypRSQZJc9FRuBA==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d823ac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=ZrIce4Gfb_NoB2EXF1MA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090204
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

On Thu, Apr 09, 2026 at 05:45:09PM +0200, Nicolas Frattaroli wrote:
> The drmm_connector_hdmi_init function can figure out what DRM color
> formats are supported by a particular connector based on the supported
> HDMI format bitmask that's passed in.
> 
> Use it to register the drm color format property.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
