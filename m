Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4DFCD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 08:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8563B10E490;
	Thu, 21 May 2026 08:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHrTiXeE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aa8jnO0c";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D162310E490
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L6srhP1798322
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ukktCil6qFV5J1LkkLCVMIGTbGIgPkyHII6gX5uRxIU=; b=oHrTiXeEYw0WRHRT
 0JryuBJBVPGqSxjyOTxM5WpWR6iIX+t5Ehvvw7Ijy/GBhhIDg6CRp4j3QlEKLHrd
 +T96al+7FsYIjjP2jU6FOexSof2OZMQ8rNPgA0pbm1sVXGeUZU2LmQlLaiX36fx3
 MG+nBBELBSvdKBlncwtRnvz10SEQ3fEi44Jsy2GFv/ny2/9kv77+p55hQ3FGnrzQ
 IKaYfJHP4+j/gv2GVgK5+Euq6Esk471OF7JFruDCfx2cLtA7CQELRBGCRGfJBFlZ
 KngEWPif/BD7w3A+cd5xrKALQ79BP1Zurh4FsssoVkSxxz+bgCaXm7XUBHfW97zx
 +2sblA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu41tu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5156c85538cso161158091cf.3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 01:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779352630; x=1779957430;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ukktCil6qFV5J1LkkLCVMIGTbGIgPkyHII6gX5uRxIU=;
 b=aa8jnO0cG2yjZjtC7oeyuSDebh/b+BNrqRptREKOX6r/UN8iuD4bdhyEJNXi/9r6WI
 TnJkcWZ9QMgPhuzCQu/f06eTXDHok7VdUsBSGLUqL2Meb8mt6qV0jJAa5EPxotl3D8aE
 N8gnfYnb5poCSEgfwMeV5wq+GFy/nxSauCLNOf9fM9wf5ixc0zfs/c/E4FDe8txpXgJ3
 vrGyvwIuL34TMLSj9JuIJl+RjUa4WiWd1L+OgGGUZDrHbSJ1cVunjBwJSM/JN+10ZSc1
 XjWB2fTaJrif8MsMtuuMyjvAIOR56qXeBJHupg6RArxIRN2zcTctD0ZiUuxUC0nyudiv
 G/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779352630; x=1779957430;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ukktCil6qFV5J1LkkLCVMIGTbGIgPkyHII6gX5uRxIU=;
 b=gCxQm6YjiDeeUD90xi4vF71hKxkY0RgmhecB7g9rhGIo3HzdXXG5iEWErVmIlmAB59
 ENjNq/c988YEtl1OaFJ+v90TzEtvMU3NW6uD+7F50p+ZGE76Ws1dUrKEsDMydRUF4xF2
 DuLfyIxUEry38rCPcKF23m9cgZmUCs58LjoTojve7ZFzn1ErVmmQ5yPn3e46dsFnnR1I
 b05y45OENm5NEA5GiC71uHyrOWmVeXvwJgBkZsbSVvwe3xvM/XhmMUnHzwfkjZxfkqqw
 9CEWfq4sUMXpgPfN6iKkNndEvCUop1Ei93BAc6k+oSw4/9AZhCctkjly3xC8oBTlE+LC
 WEjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ93Dg3ctsEGS1SwJq1sV8Jm+PTGI2DKYP0QtrrC1QEWr8hxWaYEpQnflAmBYIPqEifawVwbIBoleg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymUuGO24KKxQKnoQF3gMeTh26m/7JCNjOuROBlZA3nSdJ5IeTE
 KYNfj49CPxCyYgtfGl+jY3s2JGEAQ5hP75VIebPFeQtSamRFg8Bju3p759cVqs0UfkcMYXouJ5G
 Srx3dWrIKiGA7iqHBSqfqJ6UmxqimOSVjECssUH+8LmaQSz6EIRhbwgygit+bXbaRdvzBXQ==
X-Gm-Gg: Acq92OHNK98GcMVM85seQSlz3a9w0R/gThJ6Vt0ZgAOAaKRLVr83FyengysJR+/q4FW
 CZtdY9kebAN7SZvmbhqhQEzdTkq3zGND1X899JcR08J1T4ns7KqhnodsqqV+lvSaGNdJHbJ/cfi
 /HtSPHvuYkL0xCy20vjqXVthdOCg1WcbmM/zAnjIBhq1+M1p3cP3ZBk0Ms34P2/FEXxUDvUdUeR
 CZi7tqr3MvuAjpKf1mB+1HqQAZg/JJGsQnYAEQjUI9TmBRcwqynHTYiVncB1r3wJkJBRorp9Nop
 QHEtvihpJ7vYLnpNeEuxlIM/3fmGAL+G9gFKoqwgh7W7qEnVDWWaeTDpK5YA4KSYU37Y5ZpcnWv
 +sQ42kn6gy+wge6iE9txkrD20XMHlxq6LGEFDphjI7PPug9pTlvk=
X-Received: by 2002:ac8:5f47:0:b0:50f:bcfe:e8e0 with SMTP id
 d75a77b69052e-516c5477e17mr25148081cf.13.1779352630337; 
 Thu, 21 May 2026 01:37:10 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:50f:bcfe:e8e0 with SMTP id
 d75a77b69052e-516c5477e17mr25147771cf.13.1779352629775; 
 Thu, 21 May 2026 01:37:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 01:37:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:24 +0200
Subject: [PATCH 01/23] mfd: tps6586x: fix OF node refcount
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-1-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/aRY/vb3/hIBTIMJYLxhoggrOSD5XZpzRvD5IEGaQ84=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQdlJ6Gw9yankDCBt9FSOgN2Xq2huOUHVWq2
 3Mrh55a7QuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EHQAKCRAFnS7L/zaE
 w8nQD/4loqIyi5npUB0pcQ0If2+y1OYKJ5I3fRWNoD+DI2qAw7RvRg8s8P8r3CAXndoCmybnGcM
 5m1IEHBWc6qOHq0mh/OkumNuSy1hZr2x107TEzMLDEBT9H1M+UZPMvVEe/aPC79WmowHUUF9TuQ
 GP5vrZ4LpMcgS4O084BJEASA5nzY7uelq72L6TarvzcMxyS5TjdWC6urxNMBWCi8R8jZzxGqvRA
 QLmH/AE/4+uNzpnvf0hKdeOVPd6gbvE0i6b80v+PHjuoXIi/p1jUehPLgdPjIZdjebdM2TlVbq/
 P+9OrZKLw4SE+WRjUcN+UTnJ9tUAy0e3et+WqqPo3jUL89kKacqheQ1e2WkNXwGyi4uVuDNHzDN
 EvguWALMcMSEtupOOdXvE7nDWlVjqiY+3PMQILeq7NqMN/sFl6eCYnlTfomjSu+m/Em7L8Wq1ZD
 tFuwrfOg2BDxS7mr/FYdjg8+gBUNSZIL7MNlfzoXNWRl0rfwXF4Z8tdBbpD/g0zNTdhf5OZgAls
 IYx3BCJ1rkEwyphre8P9P953xIKshhJ4v9FpWul23QHiCYgcx00qs38wMQFaQ+tcpndPkewXAjf
 F/6YGVrg7Nc4nlGb9xf9H82vk+Y3HR5kALW1hO/kymu1NlKKvAubzUwld/OTrCD9MzeUjTa2CC3
 KvJGbKuQmkv3QvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX6IbvXoccddqg
 gJDrUweE64akMytXgeKAxtNLYI3XgFYkSBohB+2JB9xacDgozwT/AVLQdPopXMZg8MwOstsul+d
 8SpaJjqKxDammqxNeQF+Ugd6c9ZSQPbDOHHovX9Fy7Iojm3teFIhXQeEC2+qTNdbUxpTbChOMaJ
 wIRrBEfmd+zrECLcjsFE22bGWWZPH9BCWrjPyD8crRmDkvX/jHEnH1IJwKw5soDxbbo5/iSMi+N
 QOZvb4+n4/pWvN0bwvqljnclNps1j7Qe2NSrS5810+du1Z8oT+dkLUZV7AYG6Gh/uSOT8r5/7G8
 B1fsEZ5ulTMw+bnkjy6vUG9/hSVr/lAuZUfNEWTIls3uJL8bQUvs0eQ7dwqFIjfd4WbStL51eTI
 F4bznzqjmAnOqEokHAp6WLdePEmoMGcyxI3xWFGciSISZ6EfRhyCgWZBZpO89e+0CUBgyGC/aIA
 7iKcbABjS5zlOwOcPUQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec437 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4gvjGX-radYMG0rQGxsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -_JmCl4tq2OqtpX5-mLulYh9fDIENcts
X-Proofpoint-ORIG-GUID: -_JmCl4tq2OqtpX5-mLulYh9fDIENcts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
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
Fixes: 62f6b0879304 ("tps6586x: Add device tree support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 8d5fe2b60bfa550d0aad30acd0820fac354028ac..f5f805446603315ba76ce1fc501c908f1cec0d16 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
-		pdev->dev.of_node = subdev->of_node;
+		pdev->dev.of_node = of_node_get(subdev->of_node);
 
 		ret = platform_device_add(pdev);
 		if (ret) {

-- 
2.47.3

