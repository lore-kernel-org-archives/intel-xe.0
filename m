Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF991C43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 12:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5610E949;
	Mon,  6 Jul 2026 12:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebOZdHAw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/o8xjAG";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBE310E947
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 12:45:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxTaV317147
 for <intel-xe@lists.freedesktop.org>; Mon, 6 Jul 2026 12:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0bXtMmPvMuVC61lphaB+WyfPoNQ88yrVKYbnm8jwg/Y=; b=ebOZdHAw+6pvz8U5
 guxfBlryTpeglXytQIMDf3qb70gs8OqD+lwFTn+TG66rcgy2RCviTEWtn/ydL5zH
 0LGJgBOBodFF1ycxr4uJ9xW/IQPIkl/yCJQb2iZGsHVpG8AmRZ81E+/eHhWqc1OV
 1HwR4fjhtQkotKRlcShLfUG9IqvbsF/ryqc1sesHzvoZx/JZL/x5Gn/9mRbf5+29
 hitgZGkTaIO/Fvo6JuKOHb89bpnOvrPgF9j7YL6C8VxFb9Id0iA9jcsSgdLMlxVo
 bcDiq1L7xnn3E/Z7cJ3JFI9rteqpICWlCsAbGItPxIo0ZrHZcqb3kqSxbDlCgqHf
 4ZP8xA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h92h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 12:45:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e55f0613cso231567385a.3
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783341915; x=1783946715;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0bXtMmPvMuVC61lphaB+WyfPoNQ88yrVKYbnm8jwg/Y=;
 b=d/o8xjAGcweApYc00cYEJKtzA5lmaBGWF5lTS3aAaITwetgzyTZiEE4IoY3J5449Nu
 vDuY6cg4PN+FnWSGDlLh9GpDPaLyVAwJF9hFTx1Gn5nQ8E2etESESRXn8nXUpYO7grRR
 p9k7kBQPY9Sf2lPzaxYcMw8PX0eWxO0qnZyHFUxtdiFSYTMxvDv4IjuOiPa3Xh2mmYfp
 XOXmmAfHLn8zszU6iAC4qaK513of0vTI4xwc3HaDw1mhFsuA5O0/u0O6Igr/8+ktuUrE
 jH78dyV35cuVpKX/HSqGrzIvRGJnUHUdPvV4rWNDMI7UE7uWbeFRHiYzRhNItL16redT
 eFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783341915; x=1783946715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0bXtMmPvMuVC61lphaB+WyfPoNQ88yrVKYbnm8jwg/Y=;
 b=dlv+9m0VmIJwVMEaI9GBUdLBfQRtYl9bmAOegXhSns3yj3jyJULwxORSqguM9oxTae
 EuH0TkpARkXRJgMGh8tDE30Du4GZ/3fTtBtaEQnpJyBaUB7/zMbkkQ2+jXfhTkZGbE1h
 wy/Gz8apr2TIoHa3weHBf5aTg3iwlXzyeFSXkckwUsojzaeifWaEJKqCkURqfOEJHcGh
 oWTU9FBrom/61yH1cVMlefzh8La7JDU1DUn0jEzUTAnhMKjRIVQVJHjC1yV1Tf7lQM3d
 Wg00m9IqP0rIuqCOFwPBuqGXU6JwETHyNK1sTcM760yx5B+DUcgws1FCxevOIeOKWu3H
 Q1EQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrfTabl0WvzkgasSNObYKlLagbeB7cBVtJpOeVtIMl8pv8CR5SW5ESMxtAD6RIFWcNxektHgC1geg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2S7jYU49b6HEpG4YNYrEaPduH7bHbZrFKj7vjOvHt8FY+O43b
 v+QMjt+NyobLuaB1N5/4Vs7IMdQdjU528oNbXQ5I3H6VqyDbrLe1ER2zzhNRxovZr+ppWIjxeyN
 0k4WC3YqmhfdP6mJh+PSpEHV3B0AEH1a5K5Otifc+ZmVaWIXXe49CE4u6nH3wNvT9+/LR2Q==
X-Gm-Gg: AfdE7ckhFlVOIQ/vMpYCwqmlU8tmd68KknZOwlMBs11urAIX8Dlg4OfJWw0IgvGWst8
 zgCs+5bMFB9/m4JktM21wEGd3UzpiEzFIEpMS4NkINuTuRgM1hR+nXwPqG5K+tqxt+j4vSWt37d
 pRSTvnQ1UBRj6KdrEMMdB/Hg2NQVS9TVVpCJ4Q9MXGEKsBBWJXiJ4smXVFlSqZREB2Z6wUmcm9r
 uQ2GTmqv6D8NateGAfM+G4m2lvDYQ7U8UZHnw9IYXNFwBzwXw4GMD1VCXmw9aAG99ihJ2d0ueev
 lZq1Qhy0dmZNM8hjkrGKkr5bv5/Sw5TdFJJlLuzJcagJZZev57rF2zFWuf0XCQ+mlQl9pWxDHJQ
 6+oyLCTucLivC8yrqTNp7XKTR0xWnnbhKIcRoBmeu
X-Received: by 2002:a05:620a:2911:b0:92e:61f1:6b72 with SMTP id
 af79cd13be357-92ebb49ac6fmr50864785a.13.1783341915010; 
 Mon, 06 Jul 2026 05:45:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2911:b0:92e:61f1:6b72 with SMTP id
 af79cd13be357-92ebb49ac6fmr50855685a.13.1783341914299; 
 Mon, 06 Jul 2026 05:45:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 05:45:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:20 +0200
Subject: [PATCH v3 08/20] i2c: pxa-pci: use platform_device_set_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-8-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
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
 mfd@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zNlCSBzaa8h9eLrFPJ4Rsk88by0DY6qHl2V8PSoqi0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M26fTgmFzEcwV6TgLmONhrXHSg1JSo5rARQ
 cIEm8brQ2iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujNgAKCRAFnS7L/zaE
 w4FQD/4xlrZKVrDsxMxMDylskkXcnlp/TO8AFqhtcIAfJPLix//8WtkgYU8BoNMp1g9Xn0gqxcf
 Mqf4MoSZUM/9N4F6rrhsUS/fyZ8JjetftBgldbi42hSBBzlfigoXf7c7XsBd9RGYeEc6bF6Tvuk
 BeJBj7nTA7F/4P00u7JX8G1/EeAtOw+bRQp/bw49wlB2BMUcu7ymW7ZraPoAKhBLVQ3rfni2ggd
 v7fQ91AkgPqnXxlC03UumTZYRoodacvcu3K2/OHWjJ0tNZDijDmUhbLuEo5YxD2+r6fe9V7u6S0
 1AIHBEWJKLNycrCiocP2fSza0iVf1XHu6s3E0WBNJBpHEngK+P+XhEETCzEVV5hM/s+NO28XuUL
 BwdgBkheFv01xR0OIIv2htjsf/BOvFDkVUAE4mRwAAeBbUIlO3d1Gc/xIBw3P5sIyC/K1IP6Mpa
 29UAXyfBBm/QY0Eka/LOQnWf1rHBt/qWrcr+P5wHlLfPBPVvN7hFRXyJSSRrT3ZERQqDvupO8Qj
 ptCFfm9nvHLamnlGUxzUrLNpAP0Oxg4KP9I1Ee5OxwE6+tf7mtUlBPB89eKW+UNWpBN9GIYK0ZA
 yeTbyImJwaYxdcjvOhmsd7QN3u8NfTNp2Q6n3JTwHbo5apELLjJoObnNQc0x01jWKh0+xRyswe/
 xFrtfFeb09kS2tg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXzXF1GhSCTLk+
 ieFLm4ENdETJm82YAFGljZJShC8Ifm0Dp9ZLQxR5LJbnKFzrooq5GeX1L4R2qKBKqta5SQol+3Y
 XwJF/9dPnmhy910meAuDtwxlez8OACc1vJOSteEnlxec52nUpj1MVjQolj77ZoXZdbDCVD3hlbJ
 NUOBKB5IoTKEkvNmodn0Ol357InwZazn7beUAKHLlf79kUgVi0djG4s6YDT2uyn+ZytOr2wZCU+
 puMPXruI1yYOyB60tpIFRGVK4Jqey54OXM+hjKOH/ri7PMCD3v6BVJaRxkqq94aDK5HwlnAAU/G
 yBLTW2rX7kz6e0JMSUgmWbyWDdvavJTOYJ0TAHjfwPKeI81eq83PIftc48Qgy6e+7FGZmswCHAi
 etchHO81ndKHYIF08zZ6l4EUG8I66iEiJvvqpQ+lTQD8xioIW9GwlXR8sTHkyNnm7Tn3t7HV84n
 RbUlFbiRu4YFzOrRnTQ==
X-Proofpoint-ORIG-GUID: ACnoWxYby2vY3m2Nx-uk-nOpaiENpNqn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX45ojC97NpxL5
 DPbNi8IVTdqIv3oqxAb72acUomKWspcQTnsjdVnL0FIFxWcnP6oN73GNUrC/a0IcwTIxCW32SAq
 +dxDldsq3qaDNIMdRiAdOFrM6f4NfYg=
X-Proofpoint-GUID: ACnoWxYby2vY3m2Nx-uk-nOpaiENpNqn
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba35c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=LDBv8-xUAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=OZ2e4d8rXakbCkRG61MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129
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
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-pxa-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa-pci.c b/drivers/i2c/busses/i2c-pxa-pci.c
index dbd542300f80043c6bc65a69fa27ca7b3d5fe787..92a0647f08c69f841ca99caca757c1728b3f6fce 100644
--- a/drivers/i2c/busses/i2c-pxa-pci.c
+++ b/drivers/i2c/busses/i2c-pxa-pci.c
@@ -76,7 +76,8 @@ static struct platform_device *add_i2c_device(struct pci_dev *dev, int bar)
 		goto out;
 	}
 	pdev->dev.parent = &dev->dev;
-	pdev->dev.of_node = child;
+
+	platform_device_set_of_node(pdev, child);
 
 	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
 	if (ret)

-- 
2.47.3

