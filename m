Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA0DC44515
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 12:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D2110F2E8;
	Thu, 16 Jul 2026 12:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRgQrzqk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfismTXP";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9739C10F2E2
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBir8n2730776
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=; b=CRgQrzqkesW4oIVV
 7F5rRIcYbXHguAE155t4EsEGyed4PIJd7wvNTKx3WyzV42NKUI+fjrqNFoz2hi8s
 DeoZ0QWzERUbfaSebfpdqIVUcP64kxGyhlM2qYur2YTaPPC+zuBh/FFWi5pdp5uw
 f/S8jHKypi+wYU8alsaEQabyyZOK68kOd6csdaJYkY6PAT8Ll0yovJDve+kojGHZ
 GBRNGxfNto/c6Wy9Zz8SzbCi45LG4qcf/vUKUlx4RJSoBcWeBgrZSVBHx2Fh2Eaq
 b/CsYkB1nNhg9LPoe+jXg+OM7uPL/av1dl1g3dmn7zBMX8VpbjiayLBD5RbDS51i
 5uhETA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4waddy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso61047171cf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205129; x=1784809929;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=;
 b=jfismTXPkqB/+wa1tkMVs4D1tSgTK8+M4UKjhKw1ciXmyhcSZBzlX9+I19odtrmkZ6
 9qMQgzuxaJihEY8PO5Zs9x2HdiFw0zyXUvkHM6gsT9J+kgRqXYtqiV+5ZFAirAPCVnAR
 4mzZni0PO84jYrJfCpPLXBxIUuHsoXoOdlnRPgSz45kbK6o+rWtP35lhFcgzbtcyLkfU
 COETuKLNhvD81jRsjxSkZDUFlo4ULHhedjMYltFGQb15AU9T52jV21Xt4xTYTpWsjXan
 DxitixW9Xg/74SG1ut0HEODF+EsHBOBSWMvIFUUUU2TwWw10C1fhrN6ipgeRNuQFL30C
 rudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205129; x=1784809929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=;
 b=CBknXuPwKluj4Sg3tYBIeyEpnAHAkXYJPl4/dKqUZwntWxEfAkRkPybfzSdGn7dcLM
 Dnf0NFSzpvf1Xc6FOmYpVmuSyJKWcNb4mIJxWT/zLckc14uFvYFZU7SoYtsKpiBJe2SK
 TqkFKtiu6Nx9msLcWucc8nnpttjL4dIy+vsdCxTknGor8B2p19YhR81Kt9K+ngogmJoq
 mvaFagyS+sBbfYuRCEymIH8rdbejLyMmEeli0O6pHOE4/RO66TlNfvmqhIzJNHgI07lc
 QVHjrEi+Wd6Y0tH8nAvuSqxwv3tF6M5+GYCnyVOBDHvkuesnfdfMTj8vhHFqzZgrOeci
 1DZg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrVgOjj1Fe0giPWoIIVwcsGojbBd74eXGeXeaAe9eGueQUAu96odzsGgZy4il9pG4CRjleKxzri2w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPkRgq3JRxOSNEj6MA9xM6TtSM6alu4CqWTRYHu+6CursVElQf
 Iz/j9kornNOLwl9uIgzsOxpCPY85CgttiPTJSufs+MuSrDIHNtfqVM3vHCkHyx2fBAUAcGrCEbP
 KtcOuplN67pCNxhO1MbG1sG44Al4ykOr2TG5KvXzsKznTnY+lopjF1U31uiKOys1YUnacuA==
X-Gm-Gg: AfdE7cnwvgPXk7JNnr1HmUvuSJpOjkD8KkE6DygardOMwl4EpfddPU40XHVi/ItPlbD
 uAA3N6hGhMC1TeVxWyspalmyf2L1F+LtGmrLFETLRW5L0jWu2hN5v5IvVgl6ZxoZAMJZcsyk2zf
 tvWWltUFG3wK9QMTnL8BvDccz/x/Yp5nFRmmIOr7OZlouAeP1GfmHI6GCLQB/gudSkWGBbm/5vC
 xNG5Fbn2J+xKjK6dxhK6J+2Bl6eBVUH31rV6bqSNwHwSQC4Anl6ZOlI3vG3J6kFdzZUW002J1zU
 dUGz9Il1rPlW/TyVvNbsvNSo/NufGW260QUdDv4hAaH9jaYdr/Ig6669pfarlf+/+QRE8hVZioi
 BI/7McmzlylMyRISDMcm2nHdkulI=
X-Received: by 2002:a05:622a:3c6:b0:51c:7b12:1211 with SMTP id
 d75a77b69052e-51cbf34e7d3mr216000271cf.79.1784205128918; 
 Thu, 16 Jul 2026 05:32:08 -0700 (PDT)
X-Received: by 2002:a05:622a:3c6:b0:51c:7b12:1211 with SMTP id
 d75a77b69052e-51cbf34e7d3mr215997071cf.79.1784205125413; 
 Thu, 16 Jul 2026 05:32:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:32:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:39 +0200
Subject: [PATCH v8 4/5] driver core: platform: unify release path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-4-5c2b8cc38c28@oss.qualcomm.com>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: brgl@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6y0x3dVDg6MbsMReImz9V4/sAZmwhZnLqrvpq5yaKmA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM855KGpNaO9QL7bwoMnsMLTBpi+7XZHEziTV
 So+EpZSkbWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPOQAKCRAFnS7L/zaE
 w2swD/4+XMquiqrTLlEE5V+DkOFKbQJCB6v3BWln231RiWMUELuGlSJRmxQilk6NjMIEn5Tfi+T
 6M5dx4/ydhrlr7funY+g6Mezl9vYxe5vGVcd9Yk7xCQUufFcK/sWmNhX316m51czITDSwp/Paiw
 WowWE0ebhKwNwQyI5FvAXUn7k5atTt7TBqqhQnXZzlXW5AVW8tGEAsTvaHxaKRKeWCwW4r2Z4Qa
 HZ6eOlJJJkw9DCkrhZKH1vGK6thNPPJp+xKVOCmWL8kD6UEP1zlZrxr4qQXJMkZQ+fUvxDezaTG
 4DyHdpUpOnntHks9d7tM6Tdm3dDc5J6nh4jzJ7Ww5CeKORy9gykBuR6vY7kegnMyqXdMyLic18T
 59NoLcv+7VjkaaQ4kQTSojULBGu5XiGKwpf2tIbWTWfUd4BlSmR1lErbq1FcsbgmiCcC31mSWN0
 wU6/shhVs6OHOr33p9XcPSu5e1C19taokpKDjoxftJcewYCA/7t9BEeF0eOwvEXgGWwSUMDIs07
 YgMJyPe7z5uP5Ckdak9ydbrCvn3A6rwhDThcLp8MA3mezzW3IuH7boUILU+GylTrOZTVpgKdSDG
 g3RL2zMQyWvV2xQJ++dNNd6I4mhYzWYqfgLYJ5fV/Q0aBcT2TJ30ytxbx3rWMzrj0N95kQbcthb
 S5QmZDNmeMuwchA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58cf4a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=djyy7gggcHwf4V7r8BUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: l8J2P5TtwBVm3iUud9Q4X8A_2bZ8S5Ga
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX+OBqBgEvi0aQ
 JUFRxHdtLanRRSCJy43G/nxz02/BVLJlAhBU9FdbViFaJ9Pg12N3ixg5vY4cBQh1IrZ/UqSLHEH
 tCUMpdQX8YEqaGqdzBN7BKZlIi14nos=
X-Proofpoint-ORIG-GUID: l8J2P5TtwBVm3iUud9Q4X8A_2bZ8S5Ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX65ADRUp7BQ53
 4F01P6WvDCD9b3Tzk/0Wq30T7JLNo4CquK+CcEgFMD/Ld4wAkwkTsk6TJn+BPQTVXWVAUdhZ9yf
 ILFwf00ljKRsupLNre8d6LEEvYc8X39p2tdtBMV2dWp90hV3XwbTWp5siqkKNpZ/qDm9FRDwLcr
 pKcTeQEzMFL0/Nf3kd3hf/L7YkKMwyQe9kODFQxxLPzDgqC9iQfkA8taHYqX/S9oOcGETETLZbW
 tsuu7vH9/nO6Oql03B6FcEOVEAVQcSF1+nM7Y/UwbQ1ym9U9JpNjQSfPOVU614zfFCdS/aMWshn
 N4PJSDv/eZjppCgiquvuOX+UXJdE02aMPs93nHiy/D/xgLftCrZeVP5apqhef0tSuPm6bozJUhG
 ZVaCHeF2kX0bIA9Yz6bVuWUDPm6vDgswAGXo6BlN5WmER2rIgfiqf8vBgaZjteQ20UcOZZpKvwU
 JL9kJx08EjYKtKUG8zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
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

With no drivers that manually assign software nodes to platform devices
created with platform_device_alloc(), we can now unify the release path
and remove platform_device_release_full().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index fb57d487a6c2aba799b4ca5ccd089006cf2d8bf6..66f9ec73d47e90cecac9217ff6e0f051fea5b057 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,19 +599,19 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	fwnode_handle_put(pa->pdev.dev.fwnode);
+	device_remove_software_node(dev);
+	/*
+	 * If the primary firmware node is a software node, its reference count
+	 * was already decreased by the call to device_remove_software_node().
+	 */
+	if (!is_software_node(dev_fwnode(dev)))
+		fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
 	kfree(pa);
 }
 
-static void platform_device_release_full(struct device *dev)
-{
-	device_remove_software_node(dev);
-	platform_device_release(dev);
-}
-
 /**
  * platform_device_alloc - create a platform device
  * @name: base name of the device we're adding
@@ -960,8 +960,6 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		ret = device_add_software_node(&pdev->dev, pdevinfo->swnode);
 		if (ret)
 			goto err;
-
-		pdev->dev.release = platform_device_release_full;
 	} else if (pdevinfo->properties) {
 		ret = device_create_managed_software_node(&pdev->dev,
 							  pdevinfo->properties, NULL);

-- 
2.47.3

