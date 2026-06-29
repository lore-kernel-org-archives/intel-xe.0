Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B64AC43602
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 09:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B1710E7C5;
	Mon, 29 Jun 2026 09:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnbHwr2m";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brn9Bvcc";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF2410E7B9
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65T8O96R2348342
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=; b=bnbHwr2mSRvwhRpY
 T5Fs/qtEPzfnJLoght+lyWjGjZdvsT/Du0by+WEYqMVeHRDStN7RWrbgCO7nPrGl
 M4aulqBeZTNlOK5/1DeV1aK4ffO+kHFYu7AUE3fGhK1+vFuCQ0/sM/kwwaW2xqV+
 dWsjyBGlqaDnSMZWllZdExjlEdI0DJ4t27Zzl0aNRhQH/e6UCLRcq2r7o1F+fSf5
 Cw/VIWryBIdPMFR3FBA1V6fvHP1Fmt4SiKCh12fivPyC5XxkEec1HH71tp12j1J+
 e9YsdRmlxaAHZHhxnxkan14UOGA+daqp//l3w2pRTzBT4kUgmwyw903LhzSYcqG4
 Pi01cQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s07fg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92b2ccd7971so561822085a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782724422; x=1783329222;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=;
 b=brn9Bvcc2iL9ORljjdJcAoiM02E+vBtjiVLmwm31Fl2mDSYahf0/Kt7yl2WY9X+71u
 s5EVp5QGzjO1n0T90s9HnXaISWFGV4VhyPgLXqYJ+A7M+dA38qxiuyLixQkph+TbQ6o/
 OWfVHz6DoVlhd6mdmxeJouJDzOGLmkd8GuWXLSlxCPVU1a/udu82lMq8B8+cyZKbcy23
 JxgKN3VEfGl2L4jXgmA+Ig8Efa4Sky34pbzFf91WlZ31oxT/RczWCp/bkKZpRpQg/iK5
 etG+b0N32nG/pd41ll+vCiOJUzsRXGXvLDzL96Owu851j+tzrj+eTeDgazM4wwVu4W7b
 2fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782724422; x=1783329222;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=;
 b=KPpxLZcOlFup6DaGvs6XIAeQ5I6srpECXLmIPBDq2gJ5HoB184V5RBvP2V6uFN9YIe
 adFKxbeZkDEcBDFqrLkglVs1Gj9wTIlXKdZ0gUcFxoWk2gzaggERwzEAScBc6HgIOqoP
 Km7PP9AV+psvRTGyUKXJRKalTQ3EAERkQK0ZF5NE6gkpID8KDxCYIwWSmBM1uQEhuFxJ
 9F26KmKZHCspSodKJNtyhkvPnrS4KDPmHd1ShNmVvR23GD7RnDhUlbSyJo6TXdnfYjRo
 NQcMWH5B4KO/Wh2kQpaVC7wdZxsejKgXTNuS/YQlFnGILg8F3G0qdlRSraJNHbgLLBqO
 /wfA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ecSUp2Alk02QqU6wRrt2qq+WEBlVwv4tyDrOZ0yK1BKmLuEsYP14JaIJ2YLkzcextaM/sNRVAKQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyihglegDppkZ5NK5iHDjZ4mrW4Eo2mS+ZtF/j5pJbbwVoKtpJJ
 d/fIHkdQU8+PpYWBtqQkd6pJc8D2RY3FQm2M6RhFlb6YRJdWhG0U8vV6uahoTfHh1tRyU6sN7Fy
 0n4KeHOsrSG6zx39+pyrLWCVZ/zwiekslwttIol72tHDNKlReMDrgqGGkACXKfMDStJqkhw==
X-Gm-Gg: AfdE7cljHsYTN7g3GjTwfUMpcJrb9mLVMmJYP2oKieFs7A5brdazZAT4qNVtGVLpuF0
 daSqNJM+WmdZ72mSTwbZJNXAwhD/UhDfAofYu/SpBUb3jrdDhTvPjVkDF6X3Vswc0H022fPHpmR
 yM/OQ+/rgMNKcIZb8Etp7kiK2k7ST452k5U7ZhL8tuIWiSKI53IJkQr6l2QHOHmni7VFZ6obg3V
 z9RsD1LQgMC7+mz7NAETo5t1Nv3pkfPIPsjJ2Y35HBUIvpiEXqJ8B8wR++yopNYmsacQdiG6sD9
 +G+SsdoB3EVmr/V++L1f7hmCXDEH5N1y/G0YZH2faf3nKLSIwd8f2UppZ5MaVR89dQ4wJnhSUd8
 mqQm4r4GBAU1z6rf7DBK0SEWg8dmArE5QZn90nEqF
X-Received: by 2002:a05:620a:26a8:b0:914:c226:ece1 with SMTP id
 af79cd13be357-9293a8a9a21mr2392760385a.13.1782724422122; 
 Mon, 29 Jun 2026 02:13:42 -0700 (PDT)
X-Received: by 2002:a05:620a:26a8:b0:914:c226:ece1 with SMTP id
 af79cd13be357-9293a8a9a21mr2392754885a.13.1782724421604; 
 Mon, 29 Jun 2026 02:13:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 02:13:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:37 +0200
Subject: [PATCH v2 14/19] drm/xe/i2c: use platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-14-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AwfZgG77y5F6PYl9qwo0/ZCBmtiBmspJvlFnU9x6+ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcSMKdRKoFVH1MgLNJk3NI477IXVrggM2yrf
 qWMIi3XU0CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3EgAKCRAFnS7L/zaE
 w85gD/9rbl5AkgwjwdNiBcra1438gWnkZ4eAmKSEAAJXU7zcuofXfASHZOd6zPIW+DrV9r1TlxD
 KP0DeIAOqZ20FbPa4NyxJsz30Xni9oH087pgaDFHuDULWlH807p4z5IAByNWwQO401AUTRLZEDh
 pvULOi595BAoeJMAXJniO09FF8cacJPctOpdYnHd55I9oOmtmKFTxrnCVZIsIsYPqaZdiZADWPR
 MaMoJz6zjDB1IFO0JGZAdHalp2rAkmTTrhr0WgrQx1c2MoTAB9hTqKuVrkc89Jc5wP5ebIgPsuD
 qFljQKN6317Sh2FiMmSKEKGVCihn0H/EGe1vz7oCAE5DFhyZ8ofFKPx85kRbjBbmqg8gHi7KbrN
 lyej/lWRwzx48gMqGXqbW/DIlRjdBRiKolImRNHlpBCy79YAgtKvC2CuWTrZaRq9+1po/RT67Tf
 nqTjAXj4XXZKLtNGgDAu+Ifc36Grr7zKcD0+2sIZD8B+aUjQYuPfQxJOzYZqB2zfNsFGxhjQweL
 RBLurhlNBBwIH6X1Pyzwfheudxf8HN3m/QyOHbct5Z6O0IJ7n8oG7Ed4pHsw7m48/K4pPMB5ViE
 G5xtCnPpLGA+nNR7tqS+s3DrKKnkQo0eMI5JgGcUj+jVUodDfAKTd0dDBasosoFU72LcyzV/dVj
 ZVn6U4/QQLq78kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5hZhv1hG7h4C
 Hc8OpOJnYS2X/70h1fsC32EE8/7CnV0Qyw8OwClUmeNnaQK5SXFZi5rVZAhtPU3uwWDiw+Wlknk
 K7aMcjZhBrL85oTcRemnZ7/wLo6MM7A=
X-Proofpoint-ORIG-GUID: pEMECYjeyHL_SEmHdqJnytbLAxZvsQ4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX22XJPnAZxbQg
 eJdDj9weUoks6tgjF5HoFGp/mzAjCa33FUF0iF03zGE5aHE0mcxkH7+dPCKSBI0twZ8KkTNoUkU
 zjtgtcfyjv78pXuKxDcdcMBsfHvRnLkoWe5qGU8+mQ8fYZMQDLty5wWlYuPAi/u97deHvc7myJn
 qobdjXEGVbUQ1AEJytXtl9pEht71JPVMG86u4URrHZDWspLnWQ4e17ALhoNjS/F0FlZKMslmC4T
 ReHVjQLpCc8PphL+UDSL9sRu4GEhGvaLRp9HbassAn/JLhXLOSu8gNB9BwVyqZHFWKWBOqL6xp1
 9qDeNsOXUFxGt8QyjK2eESfriqo4VAO1zzM858WOd3j/W5EtLx2jWBgSk7u7tmC8hWfn227QseG
 LJbfRWH4pkbPm6194+707bJ0OCv72M9a326WQCqTVgLnNFKEf0Xo02d7fPgcrKRLNfZAWqgVh/H
 hgQ1JdoEnlYvgJVLBzA==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a423747 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: pEMECYjeyHL_SEmHdqJnytbLAxZvsQ4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07d66b4685005d6649b3cd143ecc3b..af4ebd93ad8e68c95a14cdf99de0959fbe080354 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -123,7 +123,7 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 

-- 
2.47.3

