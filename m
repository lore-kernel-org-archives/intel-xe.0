Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D609FCD5BB1
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 08:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E7A10F278;
	Thu, 21 May 2026 08:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/eaP3Me";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkVa4L8n";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF05B10F278
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L2TCwK3816873
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GQi/2Sa2Ao4Qw8qIIsWmCidg4bHYCZ9URvi5VDdy2s0=; b=L/eaP3MeOWaUpNy6
 L81FH4QqV7eTsVlLcALgYeu3AEzESKyGvBjdCNPdLjd1PyF2SZVs3J5kZTQA76LG
 QAa47beiYQc9Iaw6z68RT6nfHwSlw1VWGCNvodnNl5e5mx98F/WQXUOooyAvfe41
 b3H9PAmUsIdKxVaoqWwTX+LLGAOwmbUEcGTU99iXRSUjA6qlWiUdnfQgGXUXA0/H
 Vwt3MFFN9p8ZoaDcqYEwJO0s1wJqUyu79HJCUM/WGg2ypLhk/ox6shunIfuY3U7q
 oQa3n9rDYxnEdqImbmWMSdsWdtVcy9xeO8cS+TWKP0DDwYt/liF/85jDISbCqOhP
 bmenKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa19j0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5162ee45a77so153543161cf.1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779352636; x=1779957436;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GQi/2Sa2Ao4Qw8qIIsWmCidg4bHYCZ9URvi5VDdy2s0=;
 b=NkVa4L8nfo/q4TmCao7ve+Alswp881m++zCOZfKtRyh2cK61JrNWNb0bX3kwzKnf4M
 UEIH9EAmxFF1JC742ebJM2NZbcmo6597gWGOcBpyNMfWDgGvgK3Qy/r/8rum4Zf2kL0z
 ePIfKI75LW6oP/mcPjd88bkxI559nBuWaNvZNpYo5KIH+PqpnoA2t1LWZMbEPLRbyyE1
 S1b0iowLAMTGsZ7/JiS7pucB2Cr+VgMUPio5NeAYupD4QCaSRgheF/luElkbkF11sHob
 fup7k8XIKHOm9+rXIRUFhRMfdBlX4hacflmH2M2jsckUuW18cA7J8nSHEaE88R4Jp/Tq
 x56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779352636; x=1779957436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GQi/2Sa2Ao4Qw8qIIsWmCidg4bHYCZ9URvi5VDdy2s0=;
 b=V1XZbb1dMBMGWT75znE0Ghqj5wsTvGUdqiXLHwmwRYvyd86U4mt0Az6r+AQoI2sJZ7
 WGkn9o2yOOHgDMAz6x4L+AE7aQ/9lAMbiEhimhwaPzr1bV9RDnKilsVZHRHnBOftmRN5
 XsFbopC2nUO2En8LWk84h2wrKwS1y0CKBNRC6mo2Mmlg0yp6Z4RCLa0p4W0h4h+yRjp2
 BzFulCfLBbTJLxR4KtIxQ6bjQgwhgHxQJhYr5mNuEFumgSxUJQzT+RSGSJxBVmxfQ6rN
 ARzTmVY2kI7Fn9HSU+mFsNYyQ2/QI6UCsA8e/B3mdeG55AImGGNcwNYdhsKWdECThxcv
 Df9w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cb7kr5vMSXbNZGqnmyh33N9aoneXJ8KuO5af3NXLu9wtn2UUWtB/VQZqmklPGER4HyhMiszpetA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx57DLixjgXWbYnhgjlxJDaMNoFNozvRGrevugS+mwxOj1lRd40
 wAlzK5WEDe6JACD1T3Kt4fGzkm6+ePNPy2fZzSyIWPeoudWp1JNbiP+rihfqVl728AqxJ+SL58M
 tzCd4k9/VBWt7/NqWr4twQgf9N4icpunzAsBsE7E2NmkkQuIWan/C6pAJhR/NEmxPRkr/4Q==
X-Gm-Gg: Acq92OH9PBN0DgphMPiqeGLrS4Eq6N6bja9c5UKdH760P57xR4wu2nWaLcOIH+zfJFd
 CjvVBnei/iZQSMW4sUMb8y7s4xTdWC7wXZU7QRrH1q+kubNEsq6Mr8CSWZcqmwmNsF/uBSQFRKl
 J9HiYiLJGoJwHhr3yA2RXGxvEKn2zuhJ5mqYl/a5j3rEgEtBn2pl5oA/23Nh8x7nL9O3BjxZ8on
 0aZtEwjKShMAK30400GbfrSAXr0oiQpBdVzTCCqBoALqifWMJz21GiyYvfGNQhyIZ1mQrf/udEQ
 wjeqpaChsteUZ6vjclGVpBYPCZKRMxPXyxFCSk4vUTazu+vKn4ZzdGZ5cJRskvmG8k/br+XFf9a
 /jI0Pu9Sds28f6uhpyo9SdB2RyejyGlQjKHqn1WBRzE8P/jmqsFM=
X-Received: by 2002:a05:622a:130c:b0:50f:c109:b78 with SMTP id
 d75a77b69052e-516c56114c7mr25055881cf.60.1779352636320; 
 Thu, 21 May 2026 01:37:16 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:50f:c109:b78 with SMTP id
 d75a77b69052e-516c56114c7mr25055161cf.60.1779352635782; 
 Thu, 21 May 2026 01:37:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 01:37:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:26 +0200
Subject: [PATCH 03/23] slimbus: qcom-ngd-ctrl: fix OF node refcount
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-3-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kTQKbm6eRN9ag0Un2nZCXzTW7BV3akk7azahbn/UzJ4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQgIMxfR+Vbirqz0SdcKiFdhrIvHLFQpLiZ1
 CS8+oZRD2CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIAAKCRAFnS7L/zaE
 w+/+D/0bfM9BBNs3PkNDjV3H97Mjk+BxEtuO3ngB9aYBqCWAj5QNlt01IhjpA6JnwDFP8fqCIyv
 vjkgxJM6sX4hv38HQ37w3/3e9w9nT1pEO8Z+vJO4ioacKerKf2Q0pDqYaIvMKRt/6v7PZ5F/8Qk
 F0oK3T58PSr3/oja0fGdyamleQyFBi3nxqx0i5pFUhtKOPDLB2JFMiF/Bc8z1Ao7b5/iH3mCRqw
 t4xceOWbqkCGcjrQwrwQuaQSwOFDgpuuNyxmj1LqEJaU/nDLivdr0K2cDU/9sLO5YhX1oEhG2nW
 XOO37zyMEA5NZH4QY0XDY91U+LIW+AczElBXOp5HW0hZ93FukF2Jykzc3pqr+4YnbKGcomK+0Yf
 q9nt12I/oL8N6u17VckldD5ZK4oqD6w1sf2nwZHj8W0dw1+L7YHzf9FRkrLonMvjMF8CzU8u+sy
 Jy0nFN5sFXOEVUkaOM7w5NUOXxfk7efn4VYU+BlGan6tS+++PJdEI8/oFCt6Y92Le98zlLOeLaN
 4okZNZe0VbOfsGZ7C8aYV/L5BdKwVRPIyxpJ3u3CgaMyWDH4U+OfUQIYpUzUcMflrUDECYMZMEr
 P5YYEoi2xgk/wmO4H3kPlxxCpOwXpXqfE9cRHoxk6WbFV0NB/WCqRqm8xGakOeDDaQ4wKiLTEBG
 Ah+8HIb4q9OvlZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX3PVrb3JUzi3Q
 zRDS1aAclTMVyfZiRS2ITcVAmoXkM/1FXDb9Wl8BxaK13ljvDqPWkSvzd8WrrI6gQwwuJtFy0lH
 EqJE/qnaq9L5Dao07zUYJYurzRWQFw2XtwiSVFNabOmU+e8wvzEYPJblzG/gie5flKF2vDWEQ8y
 7tYMYR4rwCtdAdkNgheNIzz7D50FV7YhXl23ygwcI85zNr72bwO+MODkpkBdGMiexzbbByPIg3J
 jX9UydR41twinsb/IpwUDXtkZRKHAePT6S3shlbLoHNh09IINNcrTD9O7J2ZJWwCIFJoHoTcddU
 xh5ilQuEmDmz49do+fT+lFajTjERnbJgzpIwfH0engdIFTgl04HW8fj40M6Xt+TIamYVbHr/uJB
 jqnxvtcoZ8NZRrXSe9yDmzV4sjpK/rONWa/Vk0BCgMAmHrroWZEFUvzjOaLw9DqAZd4HGzKnqx8
 5rW1FEgc5hv3G7gmJJg==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec43d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lFaTzyIiLygvDfm8gxsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: h_shG1-PU6apAM8ObLiWx65IuquCuBZw
X-Proofpoint-GUID: h_shG1-PU6apAM8ObLiWx65IuquCuBZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083
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

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 1ed6be6e85d2cfc0a2b65a5ae24f666de922c89d..428266949fdd07ac13c5553bded891225c6e1a16 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1542,7 +1542,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		ngd->pdev->dev.of_node = node;
+		ngd->pdev->dev.of_node = of_node_get(node);
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3

