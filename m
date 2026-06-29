Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F8C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 09:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AFC10E7CD;
	Mon, 29 Jun 2026 09:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3a63/+I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlLQ3ys7";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E112510E7B6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65T91OUK2400921
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=; b=O3a63/+IxA+EjaKg
 JhczbaptnwlswGKlVyWvfV79oZ0KgKi0bTGFNJk/kxCyF7mjkMbxf+IRd+r55AZi
 GXomEMUi1DqoikHCTXPAjdrqb5Ame8D8+M1BTcrlnoGZNfrToyafFbjNRPQ2zwaO
 4KfhKoM+KaWUEcpS8ywRhbLGES/ncPAMK0oyJZDgf5lyYxGU7SSiPqxveHceEdKx
 yJ3pc9q4r02Gw8jMiTN2QMkH6NuZHGf+hk/uKmGbuIXR8ABH+pgRX/a19EIS9WLM
 6fVCVyrgt9sr3cUfuSRwMDTtyQbTS2qrFv72TDwNRNFbPtkn46a3Ggi4Go1D0EVz
 NGg4Ow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq881v2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8eeba1d9e47so30459836d6.2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782724434; x=1783329234;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=;
 b=FlLQ3ys7SKFfvJjNMaY/n4Wg+o3ePUIA4Y/Jy5pPIkVuCdDhvUN6gvvLYjEj1JTmuX
 a8j1uBNEX/0B8YLJTjvw/yCZMJG++OIHcTBhLqW8X2M5+Yd9e/fxYknli04TvBK+yieE
 3WtEUuo4aojp0OVNhlidOW64Ollbb/nt1lPtHeEGjG9AwMlx7pBSW1U7JYn7HharlzFg
 UQqABTv4H89qGjfMjS7G7OmO9jvgwfL5cGbGDQLYiqQpbM8dEXEolM7ISiRo2j5nACt5
 Lcazi7mXJf82A0XU6WZ1m77k2is9Jg/TCLBVnfZ9OJn4MHGEyETDZuVlN69iHdojfHIv
 UHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782724434; x=1783329234;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=;
 b=AFSmF4jYHHB0YcCQq8ai3ELCUyGnHEWRFN2BEVxbDqc7ZbP2F1TgrOORki0oICXh/R
 2UmXXGqtJSo9jhyUX59DW50y3ReiuiMG9l3tgbY6J8FqzFwUeMNzGLgn7zPUTZrXHF0m
 16gJs9fUJKzpN5Fq5248Kxfz6xgNtF+iA43twGl0+pmkQ/5Lx4e0BZVaETw6AQpE92EJ
 cXMMd790YIHLkc3ATnfOF50p4m/RoGUzxTJmC4+lRZTRDQROR4//4ZvSNVyyaLBEMjSq
 mC04jj4ql1nkVTs7sXQyebVekuGkx+kalr5cFfFgeusMG4DBUugHhtIhpahz1Bs4d/vC
 VVhw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lmzjp3/TEQYXsvF8WTU0sdUS1RtWozGXzwX4qYbLllPgLYaDecNFnY5bkMg58nnJKEVoXM4m09A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxATNhQxDQ3bVE/3jHz6lmIUqQ/jt2+ZwhD1ORl0wbK7gQTDYHv
 JdVgPbSxlgRZFnGbx11dSjrZquxroKyGW1YWSuXF2AzepCAhXrEDaOYPc27sZAORKn2xzPLdEjb
 EGoerh9FpBw3gQspJkOP0udJBepUyCSVsjCA8BM1a2kAX4lg3DQ2cb6myl8e63TRdo5N93Q==
X-Gm-Gg: AfdE7clzTvHZAeB8xcFmsOxqVgLfUmMIkBfjqyUyUlgfXmN/hRTCL3MeDMMImtRN14C
 kkofhMFB/dsOWZmncESWGJje8yLSkI7WjL1bX3tnrA34rIKPlUMTYKeNlGxwp7aAjbamLguv9sU
 wiFvsDZ/aGgu5IbhqkdJCLYqd/6Ny+Soom8EZQAn2+dRC0AWxCGqp+pKAwSGOj8blTYeIh+Rncp
 nE6guHQ7RL/6B+kQ2sb19a7+ukkFX/t9kLiwkwtGGNQmfv2xUK2z65OmDmXi0u8do23amEG8QYp
 8HuZmO6Vvex6pSDtZNmR1kdsUE64nz4IBoYEgqPXL+qr58xqRuWSbDKqkbS1NnxG04s/sAqBw/1
 Z97rLnTWMg/lXPr8kWcuGwj5hlyK9idtR3OW57NLD
X-Received: by 2002:a05:622a:a50e:b0:51c:868:899d with SMTP id
 d75a77b69052e-51c08688d46mr5705081cf.15.1782724434177; 
 Mon, 29 Jun 2026 02:13:54 -0700 (PDT)
X-Received: by 2002:a05:622a:a50e:b0:51c:868:899d with SMTP id
 d75a77b69052e-51c08688d46mr5704721cf.15.1782724433603; 
 Mon, 29 Jun 2026 02:13:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 02:13:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:41 +0200
Subject: [PATCH v2 18/19] reset: rzg2l: use
 platform_device_set_of_node_from_dev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-18-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uU1Fr9CywAvFxzuC6Bl5zMISX54D90vnS0rD7BYCHEo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcVVV4ntsBNkEfJYpWCbBlNwGjTzWXksVf6a
 B7aYJ8a6BWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FQAKCRAFnS7L/zaE
 w4lZD/9Z00RoirT9cBP1O1TRPSZsV/i898PwA1y+V390LSkU0nBecvgm7et96y3iAHLoAbhwMId
 fCniVeDmYthH6LI2ZiS9IIqGiBvDjXeEAhdyEvMhzBuiPGFdp8mFz108HQYBgy2lUI7+XDx7Af1
 rMkRf1MMt6X27j78EZPbKvJxROug2ur0kEKUiFIfs/I/zk7D2EvBDMygGK4m2zrcyre6SfLQxaK
 8I4dqrMScYY8SOluQf/60QUYHV/hnhOpo04JNaLAyIvaMYd2Qe7n9BJjsaHXDQbL4S6iWyJMT0w
 BqfC+KJWDZDMP4dmiJ4zbtlsbfN5GUKj8+ZiDylkn/8gD9sz81zDrsSjahp6yn5UQoBGWd42Ndm
 pt7oPQmw6Vk69Bw55koR2LRDdmote7WmzKfDN7d9l415NKsy5TKIx+djbJyZOmNCVzd0UgtIB82
 zeZHJ5d3OfaC/hM/UMDugPFDzimkz8aB3O73Y5VGjZhxNSsYmkmWn1HMPcgS9UEtb2YcsJk2gWk
 m6fAyae3Lps827xqLL5DFo/eAY61/9bJ2bKTNQyB9JP9FCqUoc1quDYM7MzqjaYJPn4AIr3mbvN
 SJ+j1qcgCh78X6wsSW5E7LlwrU8gDhIQbjdeGn1HzcP8Z7PDSraWAf2hXpcezPNeVEgjZ+BHkGk
 q8nixFMcHJHjozw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0W7aeiOMcTEpj3HKkP270Zl911mAABsp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5ERxS6eBfGYx
 l3xYQhnGhAg2vZtRdQyKvw/n1bnlNLpAPIgXtl49aZ4JaO6vBzv5PgVHfo7QgJVngxIyzMQ0pEX
 233Zbva+Xw9LS8Pz/fG5oJysHh9KUsU=
X-Proofpoint-ORIG-GUID: 0W7aeiOMcTEpj3HKkP270Zl911mAABsp
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a423753 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5ZOdx5ml0EwV
 K9xOa70WqODKvMWsftNg+fs6qt7ecvHqvOLMDtmh88kB6tcEaC3ZgPPl9a2wpyDNJl3PQxAsfCr
 VMbbdhYAgt8Ak0r3z/47iMlgDrgm4ZezG0IDgQJSl/c3RfCQ25Tfa1G7BJYMI94j+BcHH86+rl2
 nFKEtxwv332JrJ2fpwr+6neUTzLrXraBo6oCJhJdvjTFgtOZt0iv8ZmD20Wi7/q5nt6HKeDkKur
 rZZ9gsokakOTj6ZdlcBc9FxfleiU7ALoWiaS2mqfWlxP2SrOy4WNZIolHaRs35tvsYwC1RZTqzo
 Pj37ClCclFidtAEE4mnB8lh2EF58GSaySlez41gFdJD7Rk+DZqUWMVZfJUnju+xVfkEf3tsJgDX
 hF4xZuW2MV4cYoeCBz/W2C3UqSLv57BMspjt3qAO2aKTuyZz2661DnBVl//WRh3sMB3btXtsSMJ
 BqXFzfliIWopLQ/h+Mg==
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
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index fd75d9601a3bfde7b7e3f6db287ec8c5c45a20ab..f003b360629c90bb37ed0ade7a675b5b0f28fa7e 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -249,7 +249,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	vdev->dev.parent = dev;
 	priv->vdev = vdev;
 
-	device_set_of_node_from_dev(&vdev->dev, dev);
+	platform_device_set_of_node_from_dev(vdev, dev);
 	error = platform_device_add(vdev);
 	if (error)
 		goto err_device_put;

-- 
2.47.3

