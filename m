Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B038FF885D
	for <intel-xe@archiver.kernel.org>; Sat, 25 Apr 2026 11:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACEC10E156;
	Sat, 25 Apr 2026 11:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQaWP/zU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTOLPRxl";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAD410E19C
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:02:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63P3kAIp1017130
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LuIbxZ4UGkr2MNHoHHNNbGJq
 U9tVlBHwrX/08rcaVp8=; b=HQaWP/zUUv16lKqJeof414zvjCEHqwtLTwHORYrc
 uuNXKoXfW5xGdbfm7Ul2EKQS01bgJCvGTn7tFrXPUj4NBCTi90rDrtl3v8QyNe50
 DtQQN7s1AB4G21yOz+YImxfApS9x3qvQrARYn096MMbdRHlaPG/xoinPcHGIKf1E
 tmgDhWBQPAxLVP1SypmeoVoGibGc1VCqey3Loy4wTxCvMMvPDs/U99gKAHIOz7Gr
 nZCj7rWqTMAhcuLCqlUsZzsm3E9TEDKRIyEkHrEZ51znwV/lYgZDnpM02rejVviM
 8MXPjmeovoPfg7Q6u7PSJEljEZglSRT34jMwkCOUNjnZEA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07gqx7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:02:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-6057a534ce8so14776841137.0
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777114949; x=1777719749;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LuIbxZ4UGkr2MNHoHHNNbGJqU9tVlBHwrX/08rcaVp8=;
 b=UTOLPRxlHyRHNPIp3cPRVlVBYf2cwANu6vGr7n9RE27rg0o7W3pTEKsnluyyuKC47x
 agr5WEfU0Sc3YTPM2khoRK7xLPORRRCByOQLy17xWOpwwMKn/kN8Ow2xCO5zMhzCW4zV
 Q4Iaz/aYv+2YdACmwT+d8ti5cLHajWfrjGiSI84EjgC5qJvDpelaIRsOTThL0OHTYFaH
 LM10vO1l9zydXWRJg7oJcFjxlij7Q33sOyRvnV1wGNBsdQW8zvTretFLplCFr0YLQul5
 sdMWmUumA8fH7DUx6DgsRtPLHJ3w0PzKUg/4NPK2D5IxDRkyByQEqpnmB0+N9+ggRGHl
 i2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777114949; x=1777719749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LuIbxZ4UGkr2MNHoHHNNbGJqU9tVlBHwrX/08rcaVp8=;
 b=eNRjLYb2E/OfMXVEGg3E3OcoMxOhZ/DcXZefaAF1KsMMDzilOEgYDveQPbE0CF+wE3
 LFh2nv7EXykQFsA0BGch7sL37EzzdGKPJ64zIPYBIbi3SfotGsj/7LgqCPjFAPaZdCy6
 LXYtD1f6VTYvVNRiGHqoO2s4OFGxc2tdu4vxZkQs5H9BO50HunuWRnn/AGCRH1GlfPRi
 y5BukWJi2mzgJ/ImB9HvLXfyWYFEmW3WVmlCPgM/I5vMu2MWlM8BHbfbIgJAF1eMu395
 0cF92jZa+4HdZ47Wjk55GxxBM6SLp01vS1yuyITZZ5OaFwYhGJ/zvGLBUkA7bBITxkzs
 Ygfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9aslPFq4fQXj3EwCzUbtrhdxAnDBqz2zGkjGNFhKLNQdPkbzwqHY+G/V9aFCbKnGMSCMetJvoc3A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBI0Uv7fpzfDP2AjDOtPUq93xdo1QrMpMPqopNEJ1tYQtmgoJ4
 Rm80uYmWk1wxvSC6FRsEe4KtDZRSZiIMys37zuhOQDOmP6mpZBmrTLv1/nGDdjVB3pziE6wMUZG
 LGHA6aV+UAVzzKLM3lu8O5THJviMZTWIh9oMFm3eeZsUzbAyySIOJ2T9qhHD3VpDgd0gT6w==
X-Gm-Gg: AeBDiesEOxxMt20EvhDhF4rWVFedIao1KIqxMyoMf/e4iBTIL5teG/kryTinBiyX/P3
 Hehim0SPloWDSFfnJLpHSq3BfsvYunUNjWdADMhyjhyB2WYEst0WsM54wxDB/Egb5R6/UciiUqv
 FrxZQJiippP9OuB8Y9PHbcCxJX+C/EVAt+oIfspMQwcgOyiXWIk3BS97e15sl3uD3FxGFHAZDb9
 6EsWXGkLW5mUL4hsbRCx4CvTqDn6NgDlvRn7fGQ4MOkE9Ez0sUZT3tkxiW4OwOU873Xjfc1N+wT
 /11/iPo2C1/TXlxOiTn9+6kM8Oj5fWCXFdGz7l5iSEYV+nHFQus6yuKsvarn1GJARGmxRUuiSFu
 fyHE3jYztVE+rzBB8CvWzIX9/pPhuM25wYYd+JO3ak3QZulNm0i1pY+SF/5xwhCjzuATyIsJxDM
 oG2AzeS1pSU0SNA7KhluS28FGMkR+MmeZRi6xAt7UjRmB4Nw==
X-Received: by 2002:a05:6102:6a85:b0:607:ccde:5c00 with SMTP id
 ada2fe7eead31-616feb7be9cmr12845710137.21.1777114949276; 
 Sat, 25 Apr 2026 04:02:29 -0700 (PDT)
X-Received: by 2002:a05:6102:6a85:b0:607:ccde:5c00 with SMTP id
 ada2fe7eead31-616feb7be9cmr12845654137.21.1777114948825; 
 Sat, 25 Apr 2026 04:02:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187ebfd6sm6609501e87.78.2026.04.25.04.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2026 04:02:26 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:02:24 +0300
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
Subject: Re: [PATCH v14 05/28] drm/display: bridge_connector: Use HDMI color
 format for HDMI conns
Message-ID: <uwmhvmgnhge2vez5yussn3swgkqb4scfir7ls7iy35v4ewifmp@br3ynryrptzb>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-5-449a419ccbd4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-5-449a419ccbd4@collabora.com>
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69ec9f45 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=gN0RDaQLg4mAccs6Ca8A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: SCJk7y37Nhr-i4B2K-EnhejHAVMhLf0b
X-Proofpoint-GUID: SCJk7y37Nhr-i4B2K-EnhejHAVMhLf0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMCBTYWx0ZWRfXwDkBxLnqC/B7
 /pnMHWCXiFgHKNhLLdrV+IAr0tsKe7NZEksC2S8nFZUHFos4i2+EBfEjdB34Wc6NHUu9TFbl4kt
 fiz9+0vCHK4rQVX4dyBumPvFe2tIg1NIZsXHW5PCigzwd/xOEpQgf2kPTBlyeDhR8zmWaQhPJ9O
 nW2nskwdzh4L6HKFsoHtkYbCC2BKT+cXm6c1pZWC8kEyJSqvsx8Sz2eIDz4BujYo2bLkO8vdHjT
 BOQrtKd/4ZcX+IWHX28wgwrs+cEqo3lMm7ECzfO5g6ITgM7NaQooH4FY8RLOWzG8p6GomXF4pu5
 Gn2r8TxMCbCopAKKS8mPd525xOPyW+QK7r8WJzbWKvAI+o8BoZ7hCwbTnESOkY4ZQZxay6N1L5r
 u0RTn/sqpDWwL9vKcqqgvjsNJUfG874o3g1MiNeL5cJR4sC16dgMp8JrwmeUOP3RFUGO7AdQcan
 MMsRPXYeBIxVcbNMsXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250110
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

On Thu, Apr 23, 2026 at 09:03:28PM +0200, Nicolas Frattaroli wrote:
> For bridge connectors which contain an HDMI bridge at some stage, the
> HDMI state helpers' format selection logic should be involved.
> 
> Add an implementation for the drm_bridge_funcs color_format function,
> which translates from the HDMI state's output format to a connector
> format for bridge connectors involving an HDMI bridge, but return the
> connector state's color_format member unchanged otherwise.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Thanks! I like how it ended up looking.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
