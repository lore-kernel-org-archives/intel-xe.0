Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DAEC43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 09:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10AC10E7C3;
	Mon, 29 Jun 2026 09:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cejr7DNW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKqONkBW";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B821A10E7C3
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65T91QW62400938
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=; b=cejr7DNWhZEH0b4b
 znkSo96hIsO6dDYQWfJ8576Gf7MAwEr/pqbsotQIRB8AFrf4Mxh9BT8gkaAkdUD5
 dpvW+UEbT0ACo//EVQ3r6K1qH5JQZfEcEXBTHzPGKUMxO/12ItZmXxDEP2Vc1wM0
 vkdRhJlb3sbgETbu+C7irkyQehfu/fQgz9AzLdbU/rwcY0r8FnAuf+yWmzmMHXhT
 Fd1yVRYlEkw+OrGBVfRZXEg/DVE+38M4YVZ6Rp7k1FfsFqxwcxVHEtTwn3cffnyx
 PK6GfFuDR97gVlODkbnBdzMUTK0oudEiqK528VXPciKcOdMa5ndkl62VTdcv5iou
 gaKnsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq881tn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-91931144870so666783285a.1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782724425; x=1783329225;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=;
 b=LKqONkBWJaKeLjw3UOmKT4eGaLMU1PCj1Tq4pSFd0vzp/MTDBTJZ+TfebMGhBB4pDQ
 fu15MLrM32DJzV3d+r1EV5fN3yoWWWmaksB/wImtHsljNJboIy2YAbyOAJ458eKCtGD6
 p8LOiBIQxb/IUtBFXHeWKQXvoa2RcOmTuFZ1t2NUpQkV6DkT+XVW+xd2J3z2OE0Ao7oR
 Irq+tGxicAxP7mnyrZ01axQpUQNNb3t8pt8uIko0s9Jsrb0DbuN8XrxXOyyP0tx0GaOw
 PRqGE92gXzV7a5CzKYYG9KI/5lXI4OxZGpFkRZ1Xhq2Iwc+3zXCZM+NpqBnMaveILERC
 84eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782724425; x=1783329225;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=;
 b=g+ojLlGXbQopUHLnwsQ1LP0iMIN5Mly0Lfh5/hblxQoqq1qPExcDJfOAHinEcoQMbr
 rFg7tfXoIm3iqAyno55x+s9cQb138uWAIk0j6jN56om1X2+ZU9Cz1oIr0umPQLAE5bIB
 0blDqJAsZLMWR4p2xJ2Ls5xwRcPg7yBOnyW8lS2V7cl4cohLK1jiqcz5kIZJzuLuwBzi
 zlH60pmODp+t9MTD4nLyvnXTVSp+gfcNYU+5e9J+xlWypyLVQeVAQNXuHbQycD15FjSA
 EurkyG0CnmIkmbjD1l4xS4IpUiJwoGycelmdQRipLgGHhhxDsD6dYTpoQbrbddtojmk6
 yyYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9yNTxnE7vExCTMlzWxQIHoJZqSABu3J8fNyxocOfEHDJBjU4JexHJpKNtzn6jwdFvJZZBMld56eA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0S7R+++vDboeMBn9MW2aGiAlnxzULESCp6jCwfhNxgywKNzN9
 HSI1aWZTJ7ErlFHUR4nv3iTRv4e46wWlx6Stb3g/t1XThNkYS1+seJzXcjvhJk2ex1DIDv6GOry
 0QQS2B1UOilV4TSMx1oaeIhAViIKuQiHk2lFciXG20yvqGkdkg3k/NuKDzT0xxysVAoz+zw==
X-Gm-Gg: AfdE7ckXrG1VkoXjHHkKZiCCRyMC0e0R1kAuFRj+Kmgu+bDoYo22YVznSHYGJbVJz0G
 9hHwyu74I4DENV2SF2+4U8s09PvRvOXOK7GCRR5TCelGHwra6yAU3NZfcK3Cj0uC65SiByh7ryQ
 xuNk5cwJ6uO8DZb+gWMd6ysnf9ttcW1/1jesGtv/kAbQ4YqxJzqxHBQ9hfEi1OzVTbxEBwa9vt7
 xtJs5QcK/wn4KHkIjIqiib+uIQhXG+kgb7ZQuh02nM3kCYW9LTfajldCbKsubphqOtfenqoMbWE
 uM4PX4M1uSA3XIFacaf0uufzRpYKvnKIOhJKfPsQFHiEB/XhkiFDdAabn+yCisradt/lyp+Dquy
 oGzHZA/+4Dk4F7Zyr4bbEZN72WBuonD67Ur9FJIMj
X-Received: by 2002:a05:620a:4142:b0:92e:4927:2002 with SMTP id
 af79cd13be357-92e492736dbmr624558185a.39.1782724425167; 
 Mon, 29 Jun 2026 02:13:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:92e:4927:2002 with SMTP id
 af79cd13be357-92e492736dbmr624546485a.39.1782724424493; 
 Mon, 29 Jun 2026 02:13:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 02:13:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:38 +0200
Subject: [PATCH v2 15/19] platform/surface: gpe: use
 platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260629-pdev-fwnode-ref-v2-15-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@opensource.wolfsonmicro.com>,
 Thierry Reding <thierry.reding@avionic-design.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Peter Chen <peter.chen@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 driver-core@lists.linux.dev, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=y0PJDyn5BtOol8KVSo5zceqlnjltVLUQGrxeuNwB+wE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpCNxPIX7sO2Fb0OtIcCoatdP5jodxjCxsQU/1YqFPwbJedd
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqQjcTAAoJEAWdLsv/NoTDHfEP/10Z
 21j+qEaic68CLQuNBgdz4qIRaZIQyRi53HdUwXT8kM6isFULDu5pDNwbBcED/OoC7ALIIyXTpaF
 vEGkyDXAVbzZh5Fpx1BIslvGuXi2wklBdo6eTGN3vz78IUpeb4d6m4VLnRWlfT36IHUS6DT+1h3
 6FUzolZExDbTRa8eUKgTHsZueNoWqtMjRD/6q1ABfXaSpCv5DTIxIqYPnLe/GIZLGFRIV1ivNXX
 hHJYwFz+c9Mz6JzWVJMLuE+fp/iaLBprk8wKW6WLOydKvpF38shDpUBrmdiQsye38mT+aSlL1sE
 Wfr0pqU/u4DS00d6i696v5TbTwWv8mMfteA9JBoEWjLN43gkhGSiRMceHcM27gfGmh4eklHUhni
 BnpeGsmGkYrGhdToZhNobNNjt8LhsrwfY9GQJGpctK8hCY1Eq4RQcHJTuIBLCGFU9PB42Jw7x4K
 XUL4XeOH6TyhaaGfNIVyz/ECTSBWXCOd5Ar0s92Twtl6rjLacXc9B3VPQBabDnNvh9UKshVwjaZ
 kugbHG30Vv/wx4wJXw//jwQ+EdJsZqJkqBZjyrmFdB2yL/M/0/DXU4l9FGFfciBSZGNqtCHNKzc
 d3ts2rLnwq6iYVMApbO94BjIvXf7W4Rpp3GbYF3W/H5y8m4f20s7uAqcwXkMY2RAz16tHXgSG1L
 WCwgE
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vf9K0kFTpPZIt0uuev5lRFbjsHhVAN1w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXz3YVTvTCUDns
 Guc8T+obD/A1RsSabTvCGkfjBmTT0T5byGfl9GxaN7IvlL/UGPlTDGqFaRCwlG6xy7zEodT7eZe
 CV/hveHKA79WBpvIfR+/buS63SlYr2k=
X-Proofpoint-ORIG-GUID: vf9K0kFTpPZIt0uuev5lRFbjsHhVAN1w
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a42374a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=PjYnKYjuuXkzxcC25kYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX0Wmtl58NCUmC
 OJzWq9xoLcUYKo102Ia8u4ZdHYHJfTKXzjvDblow1XFwN+i0DWlizcO3WwWc5R3qqM8Plz1/EE2
 MkB23Nz8nYS/uUQvU19iYn3ipDn8yZVTBqEtUvu9Tnwg6rHxHtzna2aMXUZe/3/hLuluZ671h4B
 nWMfpchw1VusGy5GExcq/AqAqCfm9niWa7wA2eeyDo/vwFrRChCVD6uIXdGrGKlzG8hXRiD0uBa
 kgCoAtOVpit5kxnc87eCWkUIMrY+elT2q973p/MQh9g6bDop6ATFzmaMz/3yK/d+frQvv/iTa6r
 z0s7jNbB4g4yQalq1uXVQZd3GODpUsEX/YYMUP8MKtNoJBKHBweEq1AVcHyvaqwTnn5e5k+L2v7
 FmVyUELyjOyvU/AbF2guEs1vKaUWLNnjW/wLvrbRv+Tr/B2GrwVux+GWLGLiptI1bFxApEZiWko
 9kmECBYSBi0h0lRcWbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074
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

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..40896a8544b0a4da4261ea881b1eaed62d93b32b 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -317,7 +317,7 @@ static int __init surface_gpe_init(void)
 		goto err_alloc;
 	}
 
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 
 	status = platform_device_add(pdev);
 	if (status)

-- 
2.47.3

