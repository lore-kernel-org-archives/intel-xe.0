Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DECFF8862
	for <intel-xe@archiver.kernel.org>; Sat, 25 Apr 2026 11:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C290010E1A3;
	Sat, 25 Apr 2026 11:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="buxnuiWL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqpVRvFZ";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760DD10E156
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:03:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63P4e2kx1557162
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NGyE7KsIgE1iCIP7BFttRF0t
 KByHvA43U+zOtPNKwNs=; b=buxnuiWLQj2/Up9fdROOm92md/+ciO6Vm5XkOt00
 bBiFLPIEta5evStIw1TWwS3cQox2DW8qE1rvDaOJ3G5rbEO+CPyV9uW/NqCy3rq2
 NxW6VyEUFmaZntlnlgL3G2iCEkfn8ynKqlQrPc4ut8FZQy7JPr+mckAf/BtohmQK
 G2MUjUwP5Ob1v2vgrr0AdKirLo0DrUu+SZsN/DI0JU7GX7k+FCrTY4JilBMmT4eo
 Nq/Wwav4JPuYvldw418/mpwjLsTyVhP3HP9LnjuLnD4kLtAyGyCb0x+PYbZkpakR
 2jPJXqZnLBhAWmJiGZ9wcieiQKA/SNG/XbjdMeRT6MtCHA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgrmmx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:03:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50da31af14cso233620231cf.1
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777115027; x=1777719827;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NGyE7KsIgE1iCIP7BFttRF0tKByHvA43U+zOtPNKwNs=;
 b=SqpVRvFZeqPT/8e4uc8F0+ygZwwuVQ4Kr93LPJlZhXq7DQRGCoq9hDzGdGqZmpAxYE
 POxpMXzuCtTjkB/AARPuuqH80XtZ+lPLsoCLwjMqB5oqT+yZySxmQ1Cg9kyMrwPrzJCp
 Z8hEWLsriQX7pIFuIZYhBq8RmNUrcqrdt0kjcWdryJsQoBNc7Y5Zu4itlnQYL40ikt4m
 w8DpBspzObYKOJ/XGIGXXt6LYSW3kbOLRBBUhUX7dAKKJFz7RmZ3Oc6jyvOuTR13QLwA
 rl9ymHpGjxqkWDZqysX/ShXZaO7UNFxgoUxai5Ski2zobBBF+aWvEzCzjlDnUkuETtAL
 tUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777115027; x=1777719827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGyE7KsIgE1iCIP7BFttRF0tKByHvA43U+zOtPNKwNs=;
 b=GKdcCpA/eE8UFzQplJfMp/T7j0CwIynyGN3qPZ1FTlTX9wRZPCOji23yMTryBkZf7K
 C35LuI3I6+r5ZwKvNL5vqHVy1cK4iutlpp+5Hpf4T4P8SnRLHigvjxQsPe6oVwc0JHgT
 7t+VcxedGKuZSmqIrOXkKaCtO/CyjaVg2cfpw6Q9/SzaTnQVTjb6rhX49AJcb+NMVpaf
 crEqBniG9D6Ts3gNClohtKVQXipv4PnYqIEdVnaiJgjbulYjnnlwyrGOZOGW90DyZTSf
 Rlnm4R1+6Thdg9I069oIyB7Lv3rMNJm9+EWP8TCmk/BNqVqc/37RPQtL6TW+wxwwRLeT
 yPEw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/4QaGczMAn36/QbIlsD4lzyALuwjqngAmIbhn0QuiqfarNTHwa/WgjVFYghclaMEYpTabZg3IgIg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4LKa2VTK84gbKN1V5I3iO7OxNQZ84kyFIaHoJn4/PBgxyBbLq
 csYNzSH09f9Zyiccfem42mEPC+A2AQVoy9KMkvoeGcCHHi8SpQGMsjqbCHvkkzp/gOs8M1PMOk6
 3N1r6h5XxohUweiSeBnpHdY4+tTamJCahkymtxeBgsnKPCCzCMtbHDfOS7yI4d7srTWfu4A==
X-Gm-Gg: AeBDiesf+oI3byK3xE3bYyjXGbJhLM/jrYlDK4EGeOCQxcnmcIbtOZAo8yFMKW8dWOk
 XlOioMatS7u6dhIV5p/QemQTu0WkaE06y0W78TYa83DDR/3bIwEQHAA2S6cVKJEh5OJpbTDEYow
 S5GXX4+/eVsJCsQtkUWrI0DimJzMvhjWw0OszxsKESE4gyacue3voiYLz7rk9b+Ev/lgQ2PtSKV
 hFnU7RakEVuZHspaetomYXAsNqCyPYHzphvGdL/N0vf8y4gaTUZz/W6h+ANn66nsTlXOe7LV7aU
 Y6Skt7ru0zxO/254mgomNWbETxxWYxcEFLw/tg8KdZ3/haBQCPxEEjF5tgtOgI28JlBXmMMf8mA
 /6RMH2myjolBDRBkWHed7CCLe4Mc1V4u1Rrbrh4y3r2sqyYwByUzCaHPUQm5V8+n/h2lRggajN+
 XA7rFW7RcD5kAzAXVek/PQd2bpXoUSB7oUl9Pl8jOMEAfpwA==
X-Received: by 2002:ac8:5f4d:0:b0:50f:135e:d68 with SMTP id
 d75a77b69052e-50f135e1259mr360464851cf.58.1777115026572; 
 Sat, 25 Apr 2026 04:03:46 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:50f:135e:d68 with SMTP id
 d75a77b69052e-50f135e1259mr360464161cf.58.1777115026099; 
 Sat, 25 Apr 2026 04:03:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a6335ce587sm2078590e87.70.2026.04.25.04.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2026 04:03:45 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:03:43 +0300
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
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 06/28] drm/bridge: Act on the DRM color format property
Message-ID: <e3lpzsodpfemx62ye2rshiq7xnexiihzwxtj5ouqddxip5xnxo@q75ujeicb5p5>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-6-449a419ccbd4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-6-449a419ccbd4@collabora.com>
X-Proofpoint-GUID: KLJYsx2dE6kN1yKolmfUoCo8vA_RcTRy
X-Proofpoint-ORIG-GUID: KLJYsx2dE6kN1yKolmfUoCo8vA_RcTRy
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ec9f93 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=zO9H7474j3G4b47APuEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMCBTYWx0ZWRfX5fRhL9MQJMJG
 Bp5KUIEAC2Q8L8yLF8CrynaZDcJCP1ubyMve1AP+msmZcJ/TGVVzn7CFTcpfkBica6mcK9AJOe4
 vMcSeIEF86BeV7WlDlpZM/X5mFcXBQhr4EXw5tl1Tw9Cn8aCVyV3dGFWw1PRHy4iPRDubmjKnJa
 4HKa2Az1NJczDfFSpKb/opKC/px+nGwP2yjC7yRXecR/HLB4cDlo6YogzBUOS+LGnoRiaTt3W46
 NSSDka/kwqJcj+pbrsWTi1Z9MEXwo5TaLKjTpgnoG3eoC4SjSWAT5T17HzzMob6Qtvqi7j1/U6G
 BhMRGg7l9ppJaUtiHKDc+zmOTl197aMkwJXmOWL4933wRVfLr6FuXmaaAH7GFnPnTBZtBvDUTtr
 KAXbzKfKtY2SwNNjMMcs8UTpo4Tk9Kbe/Y9BM+z6UGHi5RH3VcBJ2marDQfKpCEPwGJnbw7soPO
 iQxgZZD416EeV91/jYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250110
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

On Thu, Apr 23, 2026 at 09:03:29PM +0200, Nicolas Frattaroli wrote:
> The new DRM color format property allows userspace to request a specific
> color format on a connector. In turn, this fills the connector state's
> color_format member to switch color formats.
> 
> Make drm_bridges consider the color_format set in the connector state
> during the atomic bridge check. Call into the connector function to get
> the connector state's connector color format. For bridge connectors
> including an HDMI bridge, this will make use of whatever the HDMI
> implementation set as output formats, and AUTO will never be part of the
> rejection logic.
> 
> Reject any output bus formats that do not correspond to the requested
> color format. DRM_CONNECTOR_COLOR_FORMAT_AUTO is always accepted as a
> matching color format for a bus format, meaning that non-HDMI bridge
> chains will end up picking the first bus format choice that works, as
> has already been the case previously.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 64 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 

Nice, generic and easily reusable for DP!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
