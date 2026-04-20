Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27627F588EA
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 15:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AED410E6D4;
	Mon, 20 Apr 2026 15:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dc56aiY0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QueeMEtW";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CE110E6D6
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63K9mdmv3925866
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=dc56aiY0njf5+Kcz
 oFQPOQ91h2MpZ8CmCMDVtHY8m9nILsnRIaA/Vx977nx91Wmc8Sdbby+vw1yXj+ZQ
 wHQWbax935GdSPuPHBXrU7rOGk5pDGViPAHaLifUl8/AjILEK4gEhxvQJmOE4LIX
 QClHAFk3ltJ169TzNbTg/NDqkcItxlv0F8BcrghValOaZ7evTLLUVERglK60GuEI
 zCiFsyLirNRvOpbp/ho78zveMutmMh0tUrft3roSURDYxz0vLR7pi8YwA1qDJmG+
 h1Nxyq08VVabWRbbumHVDd2G//ZFhDUBpkbFqfsZLNZx9PBNyqVqE5TfE8GMnPvk
 a9aecA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhu9s6us-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:51 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-46335278e7bso6527855b6e.0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776699111; x=1777303911;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
 b=QueeMEtWoo3GjbbpzEn4rJamnf4tc8qpTAFm+eMKNRDnwV683zQJCbsBB5gDM+QZwu
 p1tevq8F86LRo8NFnZSW9XnN7TO5cPAs7QRtGQ0nLg5Wk3mX2bge3qC1B8632UXCMC8m
 MyiijJ4xdOu7y7Oe/DI+p/sXAuc3dMFzZWDcL3uDk8ljEkCWl6XwzAUE5Rg9eUTCwfIM
 SPHuuY0H5ELXz9oNL/tWX+tHbNwc71G6MNPhhHPCGAo0bVabUfuhnyA0v0KRqGA+XP7Y
 odjrKqseBhUgWhKPvitlu81iBvn92rBcZEtr9m5sUQq1Bk10o0NMUSrRn4wSBd4ev6AH
 g0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776699111; x=1777303911;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
 b=AO0FsxH86+j3W7LEbMjHZHai306k8+sNZIJAao62wCygn4WSyyM3Jh1JA2NmLR10wx
 kqi1VArFBfRPmI6WwMQBpv9qaF16tB4gYIowKY5nbcU2Fel8/qEApVZCOa1+Dcf5+IfE
 vEeziMpArOvpOc0eLvXBL6W6Z1jFcE8pC4h4XgBXe9s+ZKXtQ92MJdjrbUWZOKa4uRU8
 /cNfj+b878fZMcPJLir5tO2LxUpqioz1uHoxw7o1mJBr+JuyKyR+enuz8vCBT4w2bSEj
 j6CpksM790DhZBBtXgQcB1d2PLj92hQ9aMa7bu/yzx93gBuMo18fkSAs6hIZRi6EUxlx
 6LXg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UvY5XBRUNVDBH79W7M8stPSjQ655gjQFapm6mHDJ0c527F7pE1NHZlhOPzE4qToM1LjGOXXR/7A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOuP4+bM/7en5b/pnnfsmabYlSlAWrMnuYg6oLops24sSwzlao
 IT49cA9KOGmtHd4MimL99VXALvsfc5r16i0SIpoQdbyYcr938lBES5OhAlnHMDKzPbQgtxXMoDI
 UzKLUCIBgRgbID+wr5CBPodfbua7/utzrPBBPQzSfIqpZrA8159tlprBauYNJRDHQ/iEtjQ==
X-Gm-Gg: AeBDieuBsxZbvf9z7N25VdkXPEvWHeoRegiWffImWyFmhAPcX9lCLWznzLwOzds6g3n
 cbdcgzlxOa44PjSUlZLPcmQNRx6OZVYstAqTUNQ1HOO9Uf/w++2mLn8h3pY3bRSEw1Di+/JXnQI
 wpYzqo0gdujAzFj6n1M/CZJE5cbv/6HpZFbHOLqzLdZvFq9KWKH8FHqV0Jype31S3JW5Pv1PYiO
 YNWP9VarOt+H83KnoXgxEniuwibAHJuLrsrJyrc12TTbbZId2YF5rNIQ6bk71x9aQy0s7KP8Ztu
 WSEz6F5pnO+bs9YVQ34Ua8/GdgJ++LOSUWalau+cbos4hrpNZNSRYUyx0njmdTVmJxi0bdftPzz
 e/4V7ejzs3PWlhDJ50dGMHQRVYYwvv2xdB5NLIbjluxEsPj094hk4wvUoK2hddrCZQlCsN7ljsO
 mqTJ912tKZ7kCdQjsUB2yNCxckbHsgs9jcJseKL51gRCNmjw==
X-Received: by 2002:a05:6808:1a19:b0:475:be2f:c56b with SMTP id
 5614622812f47-4799bc82da9mr6189590b6e.3.1776699110508; 
 Mon, 20 Apr 2026 08:31:50 -0700 (PDT)
X-Received: by 2002:a05:6808:1a19:b0:475:be2f:c56b with SMTP id
 5614622812f47-4799bc82da9mr6189564b6e.3.1776699109639; 
 Mon, 20 Apr 2026 08:31:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 08:31:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:42 +0300
Subject: [PATCH v2 4/6] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-4-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+Yztzu7z9UUln2K6NOXnBhWfvkJW3tKzoWyB3ecY64yK
 JZ9Obmtk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+aHLwdApKn4j4vk80fWZ
 Xe+zpj3i6mhbFtPpIdHZ5N7Y3qwa9r9B6Frgrrvy7z8e6hBpLvy1VO76FYfvd069TuoIK+W8Mi1
 C7imLUXYezym3QgPjmdMmCdrf2+1brvbBtF9aaosZ26HHZgkXriZoVZ3IFd4umhkVfU95gt3C/4
 X55x7+2t63sdfz2bQvyuvO1yRnOAV/W9bnzzAvxDgr+7Xuh7Jknnbh2lPb7tk8K83VDZrozMHGU
 vSmev/TY8u2ful4dbbeWppBOU63bDq3c/Lul4ndC6qLG1ammn3a/sPVYufDX/yWdl+/SvaV6R2b
 7tG0MJs3eMqbuEjW/yvDTjz41seRtS3t8yFdM+7VJosYAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX20k9FjjukPbi
 cruyQXe8pHyCFW5z7xh9JYCct4zkXkIa1QYOK0uwjZIjBD/j/vE2kiZD3sWjH8xWOemTBon/9gA
 CTmTWFnnGjc2NVJxJpQUXokmRVFGrtToVsfQPC50kNV347aN/KE77VAO0DlnDN91nAwiybuwlMf
 u/LilI1ORDz1TzlZWv8T3o3C0bsZq+u2SDcjelc09B3vdtD2XwEdqWi3rbNwv19gCItE7K+FotL
 Lwlnx49bmJz0eaELlEPK769JZX6TNHsAt3Y8fsgvhKbznsSwGx5Wyhwb6cLLGn/0WlZGbM9Ka56
 klqnXLZojiVMVzXxR2RoW1rQvlLmNSKf+O4p2b58Ryu8g591nAhXbhgRVoH9haf/3ohce0mk1fs
 QGX91OmEl6wyGHq6K28Co/epvWqc7yIQ9SGRx1FseOI3JVLZ0gsUHhiDHet/n2ka0f3jSJbyTDD
 rYKsP+/Vbiy+wts5BMQ==
X-Authority-Analysis: v=2.4 cv=IIoyzAvG c=1 sm=1 tr=0 ts=69e646e7 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: 13wm52hD8tAd4T9NJLcIABeqLI6OxIae
X-Proofpoint-ORIG-GUID: 13wm52hD8tAd4T9NJLcIABeqLI6OxIae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200151
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

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7a0623fdbd8e..8df579bb320a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3

