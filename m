Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DFFFD006D
	for <intel-xe@archiver.kernel.org>; Sun,  1 Mar 2026 16:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E0C10E32B;
	Sun,  1 Mar 2026 16:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9k43y29";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0J88eFO";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEB410E3D3
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Mar 2026 16:47:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621Fpp9K3615452
 for <intel-xe@lists.freedesktop.org>; Sun, 1 Mar 2026 16:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=23yFjRakNDMv9z7eHrnsMfwG
 zCe1oBIgBUxRG3B4w9c=; b=j9k43y29AY/jcOBaZs4hjILMyf4NJhXj35Ds8fPf
 WOCMUgc83CYIceqbax3lqKhzX79Ko+iYQC1kKbPZDfsyqOkPtQI1g5VEsX7Lu/qL
 AxtlMsFmktCzVSbsiJI69w0rNrE7ejK0npefurmC+7ixrdHK1PUZe8EUs5aAClT2
 0dCCX8KR5It6Pr5VJ5vpuJH+eFms1e653wLTIIoz6kdz/S1wGb/5T+JN6GgqOTHL
 S+SDKd8+NufyC2a2lQuyvzgeT7eO/Frd6HF6ueEq71KVMYEsRIOilY3LgMv7z3FW
 WkVeV3lPmX4qJcZAkupTCrsicOZk0I+o6inqX9bWQ9NUlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8k16y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 16:47:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cbb8040f48so3483202785a.0
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Mar 2026 08:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772383671; x=1772988471;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=23yFjRakNDMv9z7eHrnsMfwGzCe1oBIgBUxRG3B4w9c=;
 b=U0J88eFOqs2NSSV/+ivaYNcqJkyO8OLP99X4QrpTQ28pbgb1EYGL45q7vpZyNIxZsv
 RvwA4ZrLlPFJ5/ks6oywSts6FfdROKT5W810Dn9hM41pko1Zq+0Il6j45PmqSNKzsN4B
 NvOlirmgbtJGcNzl7zWDd7MMbYnJjE0T5NSCAjhQKoZRsbeXpJWLbjsksQYBntNsXUH6
 AgWJ0cVBBb+Txu3A84C+s+LZPUz4zHy3tx2aiw3YSBULMQiZbuP5Pz+cxQwPR75KgLdj
 XIDsWISNTJ/zbHT6g3+2N0VXkcVaHLyq0/L8Hr0P4D5eobAKgfyx9lpwDf6u5wPqx+Jv
 14nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772383671; x=1772988471;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23yFjRakNDMv9z7eHrnsMfwGzCe1oBIgBUxRG3B4w9c=;
 b=WHFbGM5MOn7OGzD+BOYfBjubN8Oms0KW0+KOnl/1jvHd5jrB4x0cXFSndf3l9NJ7AP
 E0MyMz49rX10VSK6oK5CFbem4k2zN6KHOCyi8N0MHcwvx0EDZmsb3NeTs1a5TdYrWRA1
 vLkD13e/mqo/VmkGYxIh7w9JU91MbMTyFYSXTMHYtJ5+CXhQ2qPAB0gLll1Fapx/qs89
 wCpQnWbHCQ/5ejFRN7aV8pgvuIdfodicgLTs83j0byckQKf/smfX+dFR0dfBnnGU3pVK
 ACXyxzas8wR06qB85Ot9EKBWtLf6cBO7YPsl5Byuqr17+tEP9CPa8yXCcnpeC30x3YE2
 /f5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU94ysQ39zryzhYRXQdaBidlH11u39xmOLNVTvezH2fkcSoins8I/syOHJ6sQze10GDzseoQG89Bw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfWBcCDJpg3UiEV8ju6v4BeG0sWQGA+QFaVuHDHCUGaOE0xYuk
 jaQPX9lqsmWSX7W73gM5KsO4FgAX1kEiQ/+0UO5heWaH7Qm4NZzLYRp62RaGmz8cbbfT5h//bcj
 GnPI4Jubk1+Be5nIpTd0f/1m6TEfO1OzGFweCqcEXiP0SQNIEE9RDnO35TjmKUKk/XUaenw==
X-Gm-Gg: ATEYQzxuiA1dkS7ga4rocuzKWLNnWDMEo6ERnugfRaM7Ah3e7i9ILT7L/UO3a0/hWtn
 s6eyka33j/7ibudyOl7INRWCyvMMOnmjxJDYKzkV2HnyMHXAYBFbsCZZ4X9mMN73NValjYmPgYF
 Pu7b8MI4n5YqLeMlHZpuL4qXWnI+6j64LS1uhNAlQSj9poK9JGUJhSzSTFP/wNCtcXo3bM1a0sM
 86meXWOLavgzYIKT8AmAiq4mHEnVCf1+6TW8p8++wlsRqhUISHSSts/JQRQbNOI1/jSuird+s1a
 LL5j7GjvJzRHSJLnZiMvF8CvaHm6NmE/mYvVxyJpSxLA5t59CIxK1c9Sus2easIQMkdwI5lDSg9
 Fc4yXxSjEx+C6RWZKk27AOSiZBtJ+shWCNvrho+MtVSGh53ggpzO5WyxHheBZi2FVjUVa/twUrT
 bkArRHyDNJ/dAniP3XbqiSeRpSvvxoo41kI28=
X-Received: by 2002:a05:620a:4801:b0:8cb:4066:7acc with SMTP id
 af79cd13be357-8cbc8e4b74fmr1215342285a.50.1772383671053; 
 Sun, 01 Mar 2026 08:47:51 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:8cb:4066:7acc with SMTP id
 af79cd13be357-8cbc8e4b74fmr1215338985a.50.1772383670575; 
 Sun, 01 Mar 2026 08:47:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca083sm1146993e87.31.2026.03.01.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 08:47:49 -0800 (PST)
Date: Sun, 1 Mar 2026 18:47:48 +0200
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
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Andri Yngvason <andri@yngvason.is>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
Message-ID: <y5ybjitphwydvtcjdtrmpcx7t7hwevjszpktcnmyvjqkgzinmu@hoitkl7lghxh>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MyBTYWx0ZWRfX+5Ku3r9armIs
 wpqdwABzdUUULhNRoVHtH9NZN1t+bGwNj4WuCGQSNBAGErMU6pYkqfjdLZ2578CfZSP0osRagdN
 0aBnD/uSCbnVUmODycSjIBz3ViuhUD0FZ+LOQXFJ9YB8jQaZmJ9HwiAdCXX5+zbPH4fIzaTbT1g
 74m8D5YALM67HzxLoJGbiSEH2SJTYYXCiowZAvFBqRK5la9Lt0v2omrR96m2m6knGmNJnrL7G1i
 KryqcN1fJEoazjA/rUy8OO9SoKZopDrzdXbQOWJe2JeuZ5RpRroYOy+Ra8ASEdi6Z03SmRqpjhh
 5L4ZRPqIBp7S4HZywa/13bwhBADEAIHkbeU9DEOVQGA5U0ZrPAvJtCo0XISIAR9yEE5H7y1So6/
 9M7/cX3EdvGWTQ5Igi3bCv9pT92+cwivT3N1Zmqil4iZdRru12x2YzfFvzPGwo9vdSW+JiE1Ot6
 r9Zw0MI6wTSrMUbbpHQ==
X-Proofpoint-ORIG-GUID: JLyPtX9YMg4J2f68UmW1UGkoPsEKIhvl
X-Proofpoint-GUID: JLyPtX9YMg4J2f68UmW1UGkoPsEKIhvl
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a46db8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yDUiu3_GAAAA:8
 a=QX4gbG5DAAAA:8 a=bDwM_fcg3tGIVG_HqXcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=gafEeHOdjwYkg5oUpzAY:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
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

On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> From: Andri Yngvason <andri@yngvason.is>
> 
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
> 
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)
>     - rgb
>     - ycbcr444
>     - ycbcr422
>     - ycbcr420
> 
> Drivers should advertise from this list which formats they support.
> Together with this list and EDID data from the sink we should be able
> to relay a list of usable color formats to users to pick from.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
>  drivers/gpu/drm/drm_connector.c     | 124 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 103 ++++++++++++++++++++++++++++++
>  4 files changed, 243 insertions(+)

It seems and feels that the common code to be used (almost?) everywhere
would be:

if (!drm_mode_create_color_format_property(connector, supported_formats))
	drm_connector_attach_color_format_property(connector);


Please mention somewhere the reason to split that into two functions.


-- 
With best wishes
Dmitry
