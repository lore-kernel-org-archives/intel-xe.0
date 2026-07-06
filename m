Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6042C44501
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 12:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782A510E952;
	Mon,  6 Jul 2026 12:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9nGmkj7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iol2u/kj";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CD510E957
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 12:45:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxIoD366850
 for <intel-xe@lists.freedesktop.org>; Mon, 6 Jul 2026 12:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=; b=a9nGmkj784flMoWo
 nlKDw8oMF+f2NfnRndN3+dZK88CW/gRhqy/CF50Haqk143r8bBMiDmKMu4SsVtTJ
 JqRxsX/BvCSiWsJvNyWg3st2ohyg760/41Uz1k0Srb2HbopSvNxu6pOv0OaB5K+I
 4uCMM1F9+Prtbl/F7/vwUeslmBjrfxxhAtTMWAxI2r7PSpQSvLEV8h+t1EAB5Wfw
 H6gZRSu6PVH1kQ+/H/1UgtqRMwirgBgGE3rTfctlD07zovPLGyBUEE6zjhNroxkL
 6krnr/WfWomJ3jWUjR6rnlZP8NRu1grRW5qBkb60Sr0uPQMVjU95lg3j9GL0etUi
 MTbyWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urwfb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 12:45:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e6a2f5995so500296085a.3
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783341909; x=1783946709;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=;
 b=Iol2u/kj87hy3z0oBTKv0d7vfK1/uGaU3V8mO/WvoW0dVN2lhSnVXEOBrVWI8GM3BC
 QplhprvXysfPay5BSDGcWkRZJOgM3cg3E+jFFJXbmWvSYcFryktyTGafJ/jf8UOlpRZU
 zbeRX2L01jk43ovgI7rdbRJffmrIOGL9qn4N5/X8Q9+Erjn4StJrDa6l16gGUmd/nt2l
 qOLQSszmtYsNA0UhP9ISNo3B8SxBVuV8oie+qeKqYHhMCmO3qKUObDDZf7bpqr/KOMGP
 xqcntrI8HjaF11MtUs+g3BaR+vnnWHRc3OgnQmeoHKUrL5wOVC2p/4GHjCbr6MbKbho/
 wtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783341909; x=1783946709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=;
 b=P2KWCNaWKOnQnLCYQeHOOOfEQ+jQAn0cx4uW+N8BVvGM4driVBXd2ZrkUwJ/7n6U3O
 la4BlSCRxwWtJA3aFfN3SIP7/AeVBI8YS13Hu631c76pg3TMkmyxr0hTLo3p3NvhFGxA
 nUAdiMrgNNwaMDYsjgTQQa03a36VnzVOAQjQEpqE+8ZH3z6t8tz/v0EgqIs2g1EVqyDO
 CVQBMOZeWS7SjbTndNkx7HhAgTZZKmqhNHn7wHK+W2QJG2UUnsFXgwzGMBVV1Ku7WkJ3
 nlnaPQBdUw0vBkn5KWdXP0ochZpTxIrsgefkMDODz/LZ0rEhmcr/Pup5OiqaSryZ530P
 nPvg==
X-Forwarded-Encrypted: i=1;
 AHgh+RokJbZsY3RxTyI9qQJH4+n/0rHhOgWPRaJuEZNbHy+EspM3teo5v7DmkYhmtsDDDDANVaZhAID5bg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj3HpBZbouThabwvZpPj4FfWvvXaQkfpLiQ5aNF7VN1G+B1f2g
 Vu0vqz2FAsRtsH/3CfG9k8xotAuTMyc6PQwaRhvXuv9awOAPHwYFAA7GCBfiCavlobOmj+Enib7
 A1iF4LF7mrmLEZ2lVeWq6WkAkpLtKpBIQmuEl1cyikEr8EP7oof/kYJahVsvZZJuzy8ESVQ==
X-Gm-Gg: AfdE7ckBXkg6JHspr6mcemAJpH0FLKtp0MVn9Yz2loJqy/643bx5ag+QmYoAohDPavQ
 m46x8JCP624AXOxOZW7JHVSGUcOfcvheRSLf0i5Del+Ttp3RXTuBxSDfIrKb+mEF9qr8i2bSUE1
 8ftA8QOsA12rmoWjp06Xa+Sn2MEw/L1g/Op3s0NsQHJRWvvMfkUZaxwJbqdWre7XMaokQnXjpyP
 OnoVQnrz2ROwOC3HMXPzy5Ee3EVqmT3b2Dbw5I/4LqNxGkbWlIGzxKRoFA/NrHkgo3gCpMgKUSF
 z55s0C3AI9qoegdcM6RouT2t2dUpV+OvVTei95NgJQ+VjYHYuRpHNKHP69BDPlZCVUJwKX6ndK6
 3ohJY0QrwnhmbdLhPhsjjO5SezGFN6IKJr8Y6Xwud
X-Received: by 2002:a05:620a:6888:b0:915:4211:baa1 with SMTP id
 af79cd13be357-92ebb514d03mr45490585a.33.1783341909010; 
 Mon, 06 Jul 2026 05:45:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:915:4211:baa1 with SMTP id
 af79cd13be357-92ebb514d03mr45480385a.33.1783341908161; 
 Mon, 06 Jul 2026 05:45:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 05:45:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:18 +0200
Subject: [PATCH v3 06/20] of: platform: use platform_device_set_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-6-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6rZCe/y2D+a9YrBo7o44HEaRO/K53E+00VjO92+29A8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MzbEKkoY7zHwdHh1nhL7+KUq6bmwPT/0qpN
 3KEErC5TPeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMwAKCRAFnS7L/zaE
 w60EEACTZsP51kWnjlnO2jdIFQ7rVOfzFGs6vreWn5WZ/mLyIg9up5SCC/v1gGODbvvSYMfrpPm
 Ad1NgJk61lE4Uat3YIah8N/690VRcsB8TdioMaFx8Y507jYHNEaWoY88xEeK0CJ4Mwike6XPjOR
 GEO5nxlIQw9xvALF8fVuc8iaZTOixQX/ObFGe7Cs2CT7+t8RLsF+Vxm0rGC8QVHfxBQTI8GfgLs
 WHKZ7rFwOFnGNa+BbflSlCxSvtd0M/BxMgc6OM70xU0/uHmP+w5qVUUYk1RNOONSyK+8Gqf/M8t
 +qNGS/XhygjkdGCarvI58e1YP2vFOezVdRt5CV9xA0gqIAKViiNYuOcbF7EdfSKGVzL+aM83HVn
 IB2+oUWPmEglBLJUHCHjCS5ZrCwk0j2/2SWTJhkvp9/5G9keP0q3kdVub06bMDW+1mOjw3j4CgI
 E1deH3qz7a10c7gmtthQqcIkdsGpqVgLKi8G/nsA9i/5VkNcLM9yCKpo1lQ+UWH1cYYetKLY8Mx
 961OZ+RmlwG9djjwf5eDpCQxOakUVoDX2RnGxJzOuTkKwEH8RxMxuwwM9l+Ml+7i/bsnScdRX9N
 Iqy3R+yve8htINya0Mxi38Q1JZfJ/lWL8CdNpHdWyO8KCAgK3PTqQlKGkyjmPLRj458OO2fr0ta
 Mo9Bsbw78owdeyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ONh7HLi-8a65HU6SLq0eXkggInMo1mfS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX3sP+mh6BeeKl
 1Hs7sYJCl/Y8gvHynchS8syVCdffeU4tcdFuX/A43bOybzWZUNkginXO2VujFICCFU5aKX7llVF
 FFMJc7DgrM5MliJxG+VCHSvuljH3Oqw=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba356 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXxtIWCVEJDQS+
 vzn7mL++zI3vm8jfEPCJE6LMvy4G7vwWd3+/SSd6eZ4g4manL/ebxQtokkH1HxQKeR9qWG/47ZD
 yugfRIx8SNsGYQ57/Qgd6RHYY6NrNmpoMkqUjPoTdHf0OkmEm31fW9TU64Vp1dnODVAkqBILtjV
 Wi9MtVWuUlAI0qfi2WAJfSGbYueFCh3wTePQTAe9D4RL/RiYtioijU9Wf/bK6PCQJcG+XtrvinU
 eTfzARl8oj+9D9H9UmsA1Fd6bLGfVQ0GCWisDCNiL47QFoWAcEvCAqkXhai4HwJndRYIbqEFZby
 XFYQSKOOUnDqrWp1lq1pOthDGD+Y8O0oAN7hatooZ+Dse3XCYSg311//jLYUXvPa0jDH6geZ7Hy
 Byc4xbRDr9fotOFZKXTTOi8HOlXnoJv+uL7rCHNg4OmoWX9Y33UVtZHGnJBMaEWXHn8JisdfnsU
 AfM66+hR7guircNkgfQ==
X-Proofpoint-ORIG-GUID: ONh7HLi-8a65HU6SLq0eXkggInMo1mfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 53bca8c6f7810ce2235b4d084a361626b1d2da33..8b1e7640778253492c080085b4015e1423389d83 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -126,7 +126,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	}
 
 	/* setup generic device info */
-	device_set_node(&dev->dev, of_fwnode_handle(of_node_get(np)));
+	platform_device_set_of_node(dev, np);
 	dev->dev.parent = parent ? : &platform_bus;
 
 	if (bus_id)

-- 
2.47.3

