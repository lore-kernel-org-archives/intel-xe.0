Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB2FC44501
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 12:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CED010E93E;
	Mon,  6 Jul 2026 12:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx4jTolU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuQU5EGY";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8330D10E92A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 12:44:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxVcE219069
 for <intel-xe@lists.freedesktop.org>; Mon, 6 Jul 2026 12:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UAsGd5ApODao7ya5c+v4THHQP6gUJNMav6AFOuVH/oU=; b=dx4jTolUOG0UpNFm
 MhBn5F9xncEGRrD1T/WbYOIOs3i3znC4K9HgDJ61gDB6xdRp65m00l5wnZldKlsq
 UGKJyHYuRgj2rx1yWFj98+JVTvIWD8D1tW2a7NNrmZD+Omhoi2ZzFx+iTqY3BhlR
 bQmeEoKzIflfUDGPi2qT41yIeKOQOyGQ69C+JZVj7HLmBDYemJKOwPFP4nMySxMW
 pNU+tFMx9q2xdwoKZI//juImwOVohKqTD7WpP3Iz5UKAc32CYWiU4tF5Z6Zs3Ifh
 Us2AaUOVjlI4TsxDMCWcZKl7cPWFLrvNrmcTpAowAidmXbdRF8YY19EhLdn7H4iX
 z+F4rA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs939j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 12:44:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e820609d9so217797785a.2
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783341894; x=1783946694;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UAsGd5ApODao7ya5c+v4THHQP6gUJNMav6AFOuVH/oU=;
 b=MuQU5EGYafZwbkfUS4YFfMLgimcLqxdKVmix94alpSSbmgirDj8Og5D3TNxhu8VArg
 dk17nDHfjSqp8imL2pqTBKvdRCiOvvmdhPYy1IoEPpgoJwOUnVw9jZu/pgMiwhOUK0Wl
 CYrOuxLnyCP13ZlObfbgyTTJVXJ00lzP0xZ1UF45slrHfqXKzrufBt5mnKW+JZEr6kx1
 ZdgWNKSMCnxRi5VNCGPlrEbTm3cRf+OjQab0kUzett1YOwLdIH+TGZgSnlaW/1Le4wXg
 PBo1MgEhxwFhTVtQjm3nB54fsNV0q+Cb6morJIa7huXuxaZqDoKtM7gG36qPzP/ZJmmj
 01Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783341894; x=1783946694;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UAsGd5ApODao7ya5c+v4THHQP6gUJNMav6AFOuVH/oU=;
 b=YTy+RAZayv4cfryKiDVv5eQfEY8Uch7i616L8O+yoh38AGbd4AfVlYiJKKv6aDg81s
 15kvNaCJmdNvwlgPqmgv9AZFVjLt1kn53yVQbyvUXvs44BI6ubjdpcV8OrZKUiYQx7xG
 ru8433GkJLHieGhfpURFJocG4pGMR91xL1SoPXrH2Gezx8I9BoxscoGcBl8H+w16bITo
 7UPjsuM1S3jX2mlWB4tCNUk4TgmNmI0ZoWjnYGwVPjberqPDFa5f5wCmhtyFXOSW4TQR
 kKfoRjwFRVEAEpPrJXLvKbXr/X7M1yG2Anw//+/SDCBiGVU6z8aycyWwUBIiZvsnIM/q
 huSg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrAwECIUo3cQAT15Nr73ght2qZOFL9gQfYHsr8OApDSumGHRfGs8s0e4ZAEM/ntHGaR/50Ss3b45A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPAv73er1zdq2daLemEJ6xaDT+7cnwqMZITfFJF6Oeo7I/6iBl
 997Pn2+9I1ykLO3/sexT+Reak9K5qUTGSqWGJzWmIrNpQsQDS77JjTtXQMNHjEfBzHSU2Q1H8mB
 A9E13/M723ak+SjzlWUVPbgYQ6pooT3PpvWFTbIHLE8Xgr3d1c7AOcHmEhyHfYjdMbs7nog==
X-Gm-Gg: AfdE7ckVg0w2UwXVBTbgtkP4V7dH3011idbYphXKy96Co2jCTShfjInYcnnSOwiVyzx
 bURDMHihWWdCId3cKXcyWFrLqnFKQG6D8FhjSCsQEtdvBBYapj9mzqXcdAy9FIeWSt35ji4U7ix
 p7RtnaT4v0sEbILBrRfHgsdq60V5xQpd26/yEBr2xUtaQ11QXF5fyVIO8tBb67HGXXDQlQEiCEq
 g72j6atcrwLYyr1cdZ0z2HvWN/UQOhcq2L7yvNE8AKN7xPA/kKAqgFMc1V1wQhOqU4zY13KIeY9
 Ma0mGcf3ZM/lbjNQnwqBateKrjNi3xsAgY+rm2bwTxd1KvlJmqIB0hkFlioHW3AzkEqESKSFlqY
 kVOCaeaT4QAkoomr/BVyu2DJ9OJIgcJ0HcIa0AmnA
X-Received: by 2002:a05:620a:2b90:b0:92b:67e6:8ab5 with SMTP id
 af79cd13be357-92ebb5a355cmr48465385a.63.1783341893746; 
 Mon, 06 Jul 2026 05:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2b90:b0:92b:67e6:8ab5 with SMTP id
 af79cd13be357-92ebb5a355cmr48456285a.63.1783341892757; 
 Mon, 06 Jul 2026 05:44:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 05:44:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:13 +0200
Subject: [PATCH v3 01/20] powerpc/powermac: fix OF node refcount
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-1-1ff028e33779@oss.qualcomm.com>
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
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aDGbbnz+wzV3twb5feb+QvbOP0I73Nzbv6atplL3wzc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MtHvr7AjECn8mAtK9ST5QYxQLH8uISzpy7v
 3pFnQl8r+GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujLQAKCRAFnS7L/zaE
 ww39EACYQC5v8jyh4RLJSmX9+Q2699EIwQw+LmnX2JTHZ37xaKZXSio5WtzBHutNcZGaaogpFoW
 WKEriZZ/dcQFmhZ/Q14nI9ShukRdTjBSVb6URMZkC1nyYuTj0FK0Sz2ESh9uqDHtN1HEUUv43ap
 cFmOY2eE+QXR8J6C5ZBAhBLzsJ9Ho77iM0WbapO+IFoLyWbJF/U41qJeW3ZaDdaFuDjoJdCbnNX
 gMHxWiSQ2aBucXdIz6hl4TU2MG7RWtc9WdKn3gzGFtuJESiaQzDHNAWeBjPRgvXNbcClk4qW2Rs
 FeY8+K5ONOw43nUF4+Tafg7FLvTlNoIHcbDtV7PSYq3pCNj+Z+hruIi8sXud/6W9vYKvPexKYG9
 5kWYO1Gd0GLkI5D4vudHVM74Gzan4Z0qMnQqPsUY3w57ZVVptL+DJDoOPoFTu9yy3tngTcrLrPK
 ZYgBxuAbV9NLePon1E9TCA8u0rQNn5//N6zpmGXBMEBeOBAU5yqkaPPANddk1al+fGPFzWtNGyk
 OP8WpDK8KBzFhXFC+cIDyJWlPptoS7D9Tcv3k6AoN1yq3qRx8ZSAQ6elAkAJ7Oed1RGDyMUTECX
 3wb+Lar7gwItQ0ahNLdLu95tpxenqJRi+oF6ATIp1WJ3NzZhbRCqA4YKV7ztDBsgCxH6Dpk8aa8
 Y07Wc/MmeOsDD3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: uEVMQeRAxDDKNKoz7gp1Gla4CqTEp2rd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX9YM2kOp08fSd
 NeBjwnn+UFkVCEjqjRsc6r8h3cbWwSudU76lLU7OgEn81ajWz+vWtLMrjhXxxV4PIg9kwzlILg3
 wsQB5YEkkMXgmNBiWGR69rkf0VQkeXyBtx9f1z2X7EnEZzCz1RKqFzIZlJIgIIM35Wfe2NfR4zD
 EvsEflSKwZxkcz+VIqmyujlkwu6/VjgoeHE/Z1slehDVV8uGsyemoAYH3GcGX0HZbMbpSKoEOCJ
 +gvqPsfCMJB4qbNNc2c9dikYe3dYF0ZguWp8gjZJ26Gp3ZHHe3imYWk/fPxZLIcce808qEB10aU
 9GRdprYbqRAxct7NLv8USVyY0GO3/Y5+tIhSfKIhMEopziXZnfWD2ZWCQxrLir58UR9d2kOTHis
 DYJ5w3TxzaUxKibrsBuuJjqsdAqoMN2447Hy2tP6CVwweHpgX2igneZmC6DaeGdOADI8pW9wGYB
 IbnZnFMCxoRQzIKc7yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX26Be8L6zquii
 gIA5xagxR5PnaP0qvowteTfLf0B0w2cX4pngdtIFAWZxfFMytwN2cU0Q7oovndZJVcezahWTafq
 qgIZTBZE0ItnEUW1ppjveQrzAEMiYaM=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba346 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=lFaTzyIiLygvDfm8gxsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uEVMQeRAxDDKNKoz7gp1Gla4CqTEp2rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
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

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 81e5d8646ff6 ("i2c/powermac: Register i2c devices from device-tree")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index da72a30ab8657e6dc7e6f3437af612155783d8f9..973f58771d9636605ed5d3e91b45008543b584d3 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = bus->busnode;
+		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3

