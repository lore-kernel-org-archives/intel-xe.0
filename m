Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FAFCD5BAA
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 08:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF7D10F296;
	Thu, 21 May 2026 08:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWDhCsBL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABAfsUav";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79E410F29F
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L2T2Z43816667
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=; b=GWDhCsBLIGtPgv2W
 c9gVxkym+zZjL9O4PUuVE0sF3TxrrJ6W5P3YbWhFCYzbbTfeqiCKQ+7SjTWsibzn
 nNNxjDvPT7iIjQZ+n9MfKwkkhIzayMl54q//AsstKcgDfnUZQVuOxCMKVlGH9lw9
 PZiM2P2RNKg7Gu4ga5SI8yUCy2o1Alc/GuZ6YDxT7crfbaT4vwtm/i9bxzxEocvd
 fOD7lEaiVoCth1jh2crUqVtYTKIJ7opGwu8BeVmYBKATumsB560irFMWUIIgRWfl
 Qi2+v+b4ajc9hEwmmWkVKbwJcgRWW50ip1+KMSm14d7jLWoHZoTZz3V+xv7FD28u
 phe18A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa19v3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-516879bf1a7so158293501cf.1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779352695; x=1779957495;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=;
 b=ABAfsUavlRLUIfOLBmQYVNm+v7+82fLCWJ8xrWJ3bf6kedzyzhipq7MNrFDCVVO5m0
 kCLpL+t8PNWRv2PpzXYUSoS4rBW6gwoCV2Xcuoo8ycnAkOabBsulzFmQJlyLxhySKT/d
 r1dz4opX/b9lM1UwfyfgkTKiiBFn3AIJvaCFsAGSu39uPHqF9HpFgJQ5LNms/qZ2JpwH
 SslE7k63RLGHdWhG/aOEqKni6PG8IRNIRzNt/pbbde9qNdkFgOHHoYQaPOdgcTlASHoT
 5T/SpWEAsr0fUZsOWdoDEmOiNhR50YFcKQqto7AUvgsCFaAklYF7nOTfUEAGfsJIBbra
 Es4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779352695; x=1779957495;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZtxQlK7p/R1CF6Ljia73lN4Xy0wFZa6+gfpy47TBpjw=;
 b=DempV5tXFOxYxsCbM+SMBFAMZhMmE0ltPKKbCbnXFe1Mo3IT7HEPMUGXguiqo3sxaG
 ChbLSjk+QpdHMVeaA2AZ25URUVJVtooAjEqEki1rLVqsUkp9V7SItBRgiKMhp+lb/QqK
 akX62MptNMt//g/rA8mJPZfq7LsgDdE438Jd3Vc//5GLXk8zTgx0TK94muf5M9JSBHSl
 /M2Z6yVI7UahekJqEi1GeklEaIf3I7yM7feBdLbOj7nw1vfyRC3UOdjpPGeBsd4fOlJe
 xza5GgDZ8X6ojV0MFh7X/CWIp0Mtd+LKfn6OPp0F+3Pn8+/gfhdzRuf4mP0EppZmKvSk
 uIpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8U+F1fIxVnnAZHHhS6z4KSBDBiS8tnvxfV51sDCaAMmfgt6IXQoF8SY//hdwfH8Nv8cghzTOTS1A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOCiB5s477bJgHqP/fVVj74CIixX/350h83eFnW9/PXOgXBdNo
 +CYQWwTp4vQuh0l4OGq6pp4l5hCcBCTrFgal8lCiywVBMfcJSfwJ8jmaTrDWxrwvsBq6xPVa6rq
 iArt2Jg/sOi9f8PI4o6bJt2cRnNb/4e5QgJfJ8AQJvCIorpgyEJkQsBPZTOvXKGwqSSIDeg==
X-Gm-Gg: Acq92OF4e8xgA8eYZeqZMvKVEQuVv13jvpuE8D8Sjw9TtkcSPLZXZSOOjjLayUVplTP
 V2iuv7g/fYRkHhxbcluVf+/SUeX0wKtKfTkPZdkZIdCJoOaWMOrQlNdma6UVLpLPjaV6nLirHLX
 RtZFP4sSCBtA/CTqGOIKz4l7HPI5AtG/T199fRDEIG6hRlHmwN4G2RjkRNGRJeKwXhQwkdzt4rx
 SM2QCKreikjBLrSKzl2VC4L/R0Rt6O+nr+cVHjjymjCiKQJjhytU/USIrc66E+yjBJ/gJ4XROJp
 r7y4dhpJxS41ffQi2MtR+EZs5vkhrBDZCBD72UeF4K3konZ6Km4yz1MAzExj6yA0PXvx684twDS
 HN/sik8c7dd1raSdGS9JoyEhNy9JGWEM+2U7mMA68TmuWJ1nk5Sl1HabtRfvXqA==
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id
 d75a77b69052e-516c54cdacamr16055511cf.2.1779352695387; 
 Thu, 21 May 2026 01:38:15 -0700 (PDT)
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id
 d75a77b69052e-516c54cdacamr16055371cf.2.1779352694912; 
 Thu, 21 May 2026 01:38:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 01:38:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:46 +0200
Subject: [PATCH 23/23] driver core: platform: count references to all kinds
 of firmware nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-23-88c324a1b8d2@oss.qualcomm.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wJdZb8+vj1m+b+x+FZVXzS56tnroKpQQ8wlBgMpo8tk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQvywAOqGOhQtns88s4FBMXaMUo4jbwN9DyD
 kRRxvjg7imJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELwAKCRAFnS7L/zaE
 w4SGD/9+gwveQq+/mlMfCiUitFiJRq1flDEf0vJNh9aBWt149vNSL1T8VDY/lOW9NDE2gZ1k+MZ
 JdADhVpNlL4M9I8vqMk/LDuOM9lz0fB8NFhRkPH1xW4zmgtjdYwt+13FVlDs/IBQH/Hm7ckUoSG
 huJzETXgeWiXzfa1T7R2PdUfzVp+UKttU9KJ2EdakgnCyQt0lSOc+wM22TMQRMtX/mJW7CWw7QO
 sUVAv4Al0K4BK9tKQhdd1KUp4kJ4F5ZHrJeF91QGJdhdcRGQne3vkE+fkflalspO6rd+fnSCXaT
 dFaB7eD4PFEFbn7OiTETNfps8uMEF6sz7P/CYX2u7Fu/x9VHXGuLhHe05rMwNi4cND/uNbxsoyk
 kJb2aBlDNL+QlF0bKrv7s1K6Yqyr56o9gHv4tqjc5avOoTQbqhhJaEhONnXha8/kQUB5ye6tPel
 6AhL2jn2ZBKdNJRSbbS32aWWlLlMF6GnoUUBF3q4J7akrmXxbJNBoWUC/g4H/PM2b8QWJoSTDWx
 ObAX2bZ9TMgCFdvJDlPIZrQ/7RhHM4ySdHYIx34eebl0A8224pPJoOPzFkT5dvf7MTfHvmZsv5p
 Ayb19s0ChWVPXSppfxym2p/f8ro/874bWyD0S3JyVxkIeRz2d+Gpwqty4SNJ+8NJn95l8/hU4xg
 3BVRH8Q1h4ZSD4w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX/BDqtP96yy8l
 s84tBG/NfRhn2koss5edamk6ibCJBkjcib/M5G/YqP9laxzDfjp6clTTJoO1pkNibjYc69P35Dg
 2Vqj3EABTeXolMHy/AkEAejyetgIWLs6DhTv86Bkx5VYTYhPeYktOyG2w9Z8xOK9UqLeTKCc7Ng
 LmJjNHyMhOzS9rzJKt2fbnzISqOXk4Ju0EAJkKJoVhg49DUxjyaNGiHiRDrcVk+RBlCLh8z6MCh
 l8X3Mn1CZV91kE2npYdW5NC0NKeMywufkHHIrTh9dXzpsJd5ZUjJX7n9EF79Xa0pFvy+OkVpObO
 wCohAYGFfFkb51zoO624klu1HjTKe/TxjV8OjijvULnD7hhgxMqp1urfV2y/GkTPYpO/wHA9kvo
 DiL1oAwnfZ/TTvfK4Z8XsqWvcQ7EDyJcN1ADsOtfyeBDbjnKGj7Gy6BGiiyMsXUi+rIo/1BzK0F
 aY/Rhwh1953wS1ERsFQ==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec478 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: G5SziHR_JQ7irdQKhknI4KV_krTfrU8A
X-Proofpoint-GUID: G5SziHR_JQ7irdQKhknI4KV_krTfrU8A
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

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b14f707f077bcc535fff9484d1ec904616d0a1d1..2a99162263e95f026830a437047dbf9fd347a27e 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,7 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_node_put(pa->pdev.dev.of_node);
+	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
@@ -705,9 +705,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -723,10 +721,9 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	pdev->dev.fwnode = fwnode_handle_get(fwnode);
+	pdev->dev.of_node = to_of_node(fwnode);
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -921,8 +918,8 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	pdev->dev.fwnode = fwnode_handle_get(pdevinfo->fwnode);
+	pdev->dev.of_node = to_of_node(pdev->dev.fwnode);
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3

