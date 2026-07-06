Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AC7C44500
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 12:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FAC10E958;
	Mon,  6 Jul 2026 12:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="egnQ2Z5J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q59JICJ4";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69A010E958
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 12:45:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxH0F174785
 for <intel-xe@lists.freedesktop.org>; Mon, 6 Jul 2026 12:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yWy7bcZQwuuzEGhH6M9TUt1rOdo2WvLdyjbDuBMlhdA=; b=egnQ2Z5JIsW8dx+C
 u8ZNxCzHX4SWRQVEeSTnCHtfHzI5Za8qAqUcnBs0+107yrfXKqqJaDIB2u0a4qdw
 3zvy6xZX56ger6pSWmDNx0if3RgxUWVCuPQOG2+g/F9nEtFuGRsOmnRbKVr88MkS
 QSvdU3dPEIYIlYTXhyVQuNRHqB5ujD6vqW+QbMsBpzX3WcLcnYIbSjQvoktVZbD8
 Pi0uIkls8WltwBDbJpRvrcC4O8WtLNRfHnt9R+cYIaXaiaMzJ607KZFb7di2KNpu
 tNlEGchhAMcCdeMNTtF9JIqQJtABet4hsX+i4NX9vmypJl2Tmh87vfFUDwvwWGum
 tjodUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs97c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 12:45:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e8004d60eso478172285a.1
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 05:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783341912; x=1783946712;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yWy7bcZQwuuzEGhH6M9TUt1rOdo2WvLdyjbDuBMlhdA=;
 b=Q59JICJ4Ph1xo81S7yEgGye3EazHxW1v+AqgbwDgNGKQbydHg2Aw9pNzaJyyrmYBpO
 9bySJd3+oWz/ARD/tMHIiDtDfVKvYVVDQGLpzEVxQHeFVppm5Y1aFK8mutGUNfZyN/is
 pG+94ayBJqnJvtqituP+L1BLv81DaUiY7qgxu+Jux81rsvdgyPfxdpp/D+2KXr3D4uJ+
 FRu2osPW0P/1Pn4Bk4rtjUeRji6tnDWRvMZYkeWj1hSYe4RS6wRkgvmAa+STd7OpyKUu
 CvaxqsZ2YMbilguT+g3QLQQE48fIRK/KhOAnM9oU7S0ZdECafZrz03js1tv1qU4mexQz
 vNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783341912; x=1783946712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yWy7bcZQwuuzEGhH6M9TUt1rOdo2WvLdyjbDuBMlhdA=;
 b=AewStSiPbFCsRjtwj/aCQBsHfyjodvSvEVHneLses60wDn8rUt1068Gbh7LClvSTgy
 xfzDLD5BRvIE9SUKdC/floM2cBl0koAfvhErNrDnujHpJUulahvqOLr6ECRNBD4LNpab
 lQSAZBJ338RR10Y9CcSF+ClG9/yIn54ph5yCroDcCaODFSomKBfWZIM1Bx1cQqCujiNh
 3gn0K0ga4Q2zonGMVNaI8W7SbVIpCd8Mi0YWhDZ/DjF12rT6kjSfRuRde6Q4S8YQDO6O
 pppOyypk6ND/3dTHt4tV4Kth7I1mVfERoRXLv8beVIZsXDfFRPnkDufs3+lSHKHt6Eo9
 j9bw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro45zq4pgacPbI5MxOtocsxBsjfZq5a5HiBNP0pz5k+Q3y0cJl9wAfIQD7MsfxuwJlDMk3vZ2DwAw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVtWgDk2BTbaHjbFfq4cCwH+ZaoM82dcjmDo1Ph+T3HerddMSZ
 aqvz0I8AIEIwCJLDrZbqMH37HT48lYQ0VCyHi9LxDkoia4Hgg/C/fDwjbn2fgzC58ByTRO4F/dy
 viSK7iUEqO/ADEFQVI4hTGTXEYsb5aVFrxxdXDlZxzDQRVmuC88+C5YU972YeCJpln0SnkA==
X-Gm-Gg: AfdE7cni3vd6ctWiOLy+YJuWahFtM68bRhB3xcn6YK95ahCuyXwvEumjBVDfW3WGJWI
 VpeITG8urnFcngqZkt90yZ/4lJDu/iZz4bqUsWkdHkLMraRC9HzY1w/mv2BatFwdJhdO277dkLP
 bCrzkTwJTHEYk1R5IzJsctX1ggNECe54CKidUhcwDbOP8HqAej4QYvXXV4rJmt23U8WLlRkQIRV
 ZpwT0QJdhjHQC8v6v7o/dTojvO9pd1R61jT46Lo96zJKk1L2K1b2cnvboRDZhtda6xi7+P374bH
 zuXb9rHEL0Op4OjRP/Zc1rOZDM3NBmW0Py/sc8wo3bxl22kKAelw8BXWwxaNMR1ItpjrWNyM2dj
 6+LvsI1sj/lCN2Ev4Tu4153ptdsswr4H+bSUE6psU
X-Received: by 2002:a05:620a:43a8:b0:92b:6805:917e with SMTP id
 af79cd13be357-92ebb72bf7emr41504185a.70.1783341911469; 
 Mon, 06 Jul 2026 05:45:11 -0700 (PDT)
X-Received: by 2002:a05:620a:43a8:b0:92b:6805:917e with SMTP id
 af79cd13be357-92ebb72bf7emr41498585a.70.1783341911066; 
 Mon, 06 Jul 2026 05:45:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 05:45:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:19 +0200
Subject: [PATCH v3 07/20] powerpc/powermac: use platform_device_set_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-7-1ff028e33779@oss.qualcomm.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+1w/ZPBEKC35lIaC+2VlK0kcwhdpXj4b1de+Kko1D9g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M0U6BWsLnbNRlpQxwDdS83jcJMNhZ/7eCG3
 cBpgbJrCuOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujNAAKCRAFnS7L/zaE
 w0wcD/9CEDRN/JtI/f1e/XC0nTt6drS5plkhZNCFHV5EZKxpgDTo06KnuPFGExy9v7E5rUTrZSd
 K/RONRwRA8d86X+ZL6U04BJU8VydBvO31cpLKQ7gRAfVYJD8MI8qYoyhV8tSTFdr3MFnuiVWS16
 pxw9ameDANBtKmCmhztyXe47aHDEdi2zHnyugwrFNK4tnqbvzbpFWtZ6YMbolsTe0FhEMZkl/5J
 SlB4vdmD9tlCmDWLoojLW8uyavDrafJdotxvQPFEB1CAWVRUhHIbiWa87lvPrbmr3N4HnPiuEWS
 0jo88f1RRjKnf/ACMLY0bQDKyXMMI50bdSuf6AghGyhRbrgRByN1waRkNW8IxiXsx48wXV8nXRk
 OlvTfMrQR0rKTTc5stHBEJWjR/fVz2s6r6FxRQ6HJ8zbXbHJAPN1DnPLRNF7AmNGG4tzQXHazSc
 yrKtXi8cE8BipFRwuXuZEeUxLEixu7ewIGIJos93NzNRnwxizNpfEReVReEUaaZnubo2cBtEglw
 FF7f3QsGJyjtfTTtc1oqYEi0sK+dx4JQdqknNzcF2DVrQ28taO90Ta2l4zSabwMV+1CiOm8wwpE
 EXhc0GB7kYUkAT2sJt5KM2eqKKsmBm4FeIgeO26w+V/+g0Sp7NVuoHW1Za7xkWCgbeqCH7VoWSu
 bX6IXrHrjAbXvrA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: hEb4LZynIB73U6a1d4oNIR9s9z9gUAfW
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4ba359 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX4laJ5o6y55f4
 39MHHAJ2Cav9z3exm55Iv+pdAUwi9NGOUYwE6MnZ/1e5hN8PHFUjgHsI55QOD2RMiOlk+jzTvFr
 on/2p6/XwhQYBuek8dcAmsguecPku1c=
X-Proofpoint-GUID: hEb4LZynIB73U6a1d4oNIR9s9z9gUAfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX/lXmTTnyfpI8
 gnR2eIht+l9g+11/u1hXKWcNpSKU0qrA5hbaKTr//81xyvRiUUCl1IYntx9MCMa//JPo81sozxd
 uNkJ258OE7a1IRc9lPKFxufpRIE/4L7n3oN4Lw5+H7ZqE+ObuDIIEvvSPAxyBwDh5H1F60jelDb
 1jehRVrwx7Za7CXKhypiumMwQVjgwwoP+i68Q02Xs9mKIYyfbZncwEJ9MufUqHoBbglX/hCQ4UW
 dagpYLBK8rk4Cp+omIcjT1O42rBdKdTDX2OdRYjdQDCyWay8QlRKl/zyg9ioR0+XprhWNA5cmRG
 tVY4HEZwxctoMXeI+5NLyud2uLRHrxWNaFwKgQcC0HU4GxzADFZMa9ACfHjWYANfUmQOxqPOvJj
 vpuAkBTbkpNxu4nlpul1HBFsJoVbKdBnVb4nkmLn53raR1JVxnR7VvPBQOkPMtBdQw0cArWuO9N
 tsb7y1d52ZzG4nlivJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 973f58771d9636605ed5d3e91b45008543b584d3..a175a32a222bab4cc7400f6ab6071f5630db2cb8 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
+		platform_device_set_of_node(bus->platform_dev, bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3

