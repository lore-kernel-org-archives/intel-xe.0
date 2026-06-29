Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA78C43602
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 09:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E627F10E7B5;
	Mon, 29 Jun 2026 09:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYI/y+G9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O89Rna0f";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6981710E7B2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65T7Dxu82188882
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NMPTZOeccy6sNIaJUkTJ6IS2ml8UYa40KAi/6XzhKnI=; b=gYI/y+G95VumA8SD
 /R59cVJHGOIt5pSimIFypsAqavIeXQaZcfb3WjkwbUJYNFoo8aH/QBp7uGVD3eas
 Lr0atSwt6c7aq+ikROGmESkAzTzl0B1g4uTb77HhpcqieTQm0wPBXwPKilg4xTkY
 jKJbM3mLi+mkc48JWb30vOO10hxR9PhSkbP+KDz4UwMdvnwcUOEjVvKfwoAQYkgl
 gPMxOE/72VwvH8eXJKtTUPAapgu/txpGKnhD2UhCN+tCgnfm44W6g9Vf1hZWU5DW
 GhGs2PAeNFj88H/XEA9LXtyNYAR7ScpzMO05COuPAUZcc0NULXwA7b1clvWReCcn
 LCXaKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trg15-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e4f946461so142657385a.2
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782724388; x=1783329188;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NMPTZOeccy6sNIaJUkTJ6IS2ml8UYa40KAi/6XzhKnI=;
 b=O89Rna0fTmhmXxwDvtjrM7DA44RfC0xL7xfwH91kqU93ke3f+iLYBv2KkC0i1CzLXD
 y6+GEKcs4X2SBfQGyTaJyZ/WO02tKFmzVjABiwRoo/BzMy4ZHzpt0eKxknAZroaawOzt
 fkRdOU5FwzsuJzUtKs7ufC7S3wul1DkNoEUw5TosGYImZjvn9i8Rw+PIMG2Q8QbC6hvH
 0AYQm4+bYvf05tinMO8jaSgDE4bbk2mqP7zGJ8nNEUkT0CMXdH58cztz0m6oPDK3FW7F
 GwSQgzbAUKrNP9thYNOs654Ba2Ap+WDq6RNHGCX+7vrSUwl5c9WePS2k3uWipzz952FD
 mg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782724388; x=1783329188;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NMPTZOeccy6sNIaJUkTJ6IS2ml8UYa40KAi/6XzhKnI=;
 b=ZtEPEHhGiON33eb20bq31w6RqxqjXIlH25rpME8X94V4MhPyrERB0vmjArgxax/Vzg
 18No8T7dZX7Gg3G/uRGEt1gI3GGtlEmK8otwPeoq0khUkf/09bxtIlqMoU/OMsv/EfBt
 mdo2cRvDKvkqW4COkitjLZlL4Cs/d/n+YXDYgxBCLvVh6MzCTpUfkclii6BQ0itZ3xjH
 3wBxsBaASwcBR2sKDXoLQ0VmEjkZuvNUX0zkiN52uWXF6GZ47c0kQQdL4v/qSclsm0I+
 V4ULna5iV61gyM909Cfd2p2KtdBDaBtgP4Ahh/2FrtZk4c9S9gNVycw8HNg+lPRY0De6
 rbLg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+r4l9Y2xyOaKgbeNlVOlhnB1Nm1kJLU/JD3GNuKFw2MEd6eNhwrMyIPJ5W4r6gsy1CPhdRYlxnZQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPllfG0GUOW/J5nkCEYevH7bH4gMZN8npHf4FROpWut0TZaYlW
 b0YHAFNmnu/gIMv3ZdM+frfRfcZxXOyjBjb/7HujBd6KgWeK5C4oqqEWK/2pQtIN8w2Qkul00N9
 Rn6vq++RlvnWIYgwApWnJbdCu/SBXRexPBAz52r0Yxm9lD/nu8hkWFciw+E5cw6s71pdh5g==
X-Gm-Gg: AfdE7cl8YMvsa4oIBfZmpx+6JaA3GeUnJp1gAoOYvzZ5ZQ/OnMx0Oti4E4QMgODY76U
 tz+fHaigoJOIEGYiZwJAFcQCEMzua28EyhKb75Ip7uC9eq43ublL+PkV+rBtP+mqMrRAXrkkbUn
 oYRYOcDpo5KqeIzmwBEQFt7+B3Y5SzOxtAgyMiVz0snyN2slgI4czYYh6u0IWcKLMNXxx5FlpK7
 /lMBIOsce+z6vfZzuihUBaXcsgGZfHenA0QX+XuqMzRkdQP7yatLeuh2W/SWKu0wxdtke5AUzlR
 C7ErP09qEsqoZgroYuFrWKT/KJepltxaEJqgSsFQaoiqp72KeGPIDL0bDcn9gKYpyaIQIu3C+vZ
 gGnNQbpSUikQ5U+82hwTkG4+ArdnkoMJ1RWcFNHjq
X-Received: by 2002:a05:620a:17a0:b0:921:9d7a:ea38 with SMTP id
 af79cd13be357-92b3e46fe04mr1387186785a.45.1782724387514; 
 Mon, 29 Jun 2026 02:13:07 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:921:9d7a:ea38 with SMTP id
 af79cd13be357-92b3e46fe04mr1387179685a.45.1782724386772; 
 Mon, 29 Jun 2026 02:13:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 02:13:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:26 +0200
Subject: [PATCH v2 03/19] driver core: platform: provide
 platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-3-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rUG0oEwArOQI4stC68CYhz65UwovfxaACRw43q5Ey5U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcJjPh5mDVUknauSD999iEJoQhOldHh2+5sY
 Ww2SlGyFmmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3CQAKCRAFnS7L/zaE
 w+y1D/9MES2KbtS+PRc7JBKv67xJ1ZbKe/n9QDkmQW3Fo3GeBTca3T3dkyrF9AKSM24U+GvjZou
 /krTxMLjjLMEIK62SRmS1xLxWyc/DISbLyTE4c8AUYfVuqTPy48X8A8meGPg7hfWc/Ytl7U/+ZF
 4Bmcnc+qhSS0WdcwRcXJ5r+5q2BohvzW2Hg4yNk44DxQSqgd6xy7d4TlVAG3fUIp+2zCbPXx8ed
 G++O4czOLSbEsEPM2pI/bGPJJkM9C+gjbqN1NdLtds8PfL+Ltr3Mo5cyRY5wmITnuQKrzc2SB6Y
 eXCHjkdukHWRc47AD5Jtd4Bo5YH0p/lHVPY+Y4L6wu7fGGpE9s7k6g02v0N/ZSjgRV2Dwy/YFwv
 8ptXzAdQR1sRag8biXf8XwCe2qpjEt32eLjWBFS/NhEBaIexc2Vlko8t+s/nKh//af4WWWzIK6f
 hBhFvGPMc2xX6Hfhm8xtpnkklUakjwvXa/hHr2ZS2XT9JKTn/uggmbE5kAKCV737iom/G6SvIQ+
 mHSlz08g8XpkXmumGsmvIS5r1YW/yZ7Nr3Jjnz1TpKl/Xw9ZtYTjk8gnDfkRCTryOZiSqWELkGs
 h31XwoK+zijgOwVnaDmYXxrSzbtnAJQxBHMA+AwMll8KTyhe4jcz9NiWNumn+m6m1nP4HPGAhgo
 7evHEDzQbm0hLcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX3rE/d5W+jw9V
 dWSHVlBW5u+Ezo1BO8oU+SRr69rBXComXiLWZAxZxJC/Kefh7KcEhD0mZ79ZuGBIdaJmJxUcJbm
 xo/4iCFXkPd7DP0Sy2Ot/ti/zHAcnaPJDQu1TliV2AkmSaHcr17ZoYzFfHrkw5TexW0/yA1/OSm
 MDOULxnoplRxx5vnArkgiHcDebNv+grj7yM5dltEj1ShGbCU+B2rpbvIuJdP4slou9z3spH4PEn
 pzmkWZn4Sd+0pWdSqSGjc8DzO27TS8wrJFCM8WQ8crRBJxRWxFLKtyjtG6QiZImWcTBZOjJB4cy
 Pvs8HikEuWrMEgoJMxWs3XmMaYc8M9wWFhdoSQsPHtOfh1IatJ+ETaMP4k5yhquSXLnImn49elJ
 csqXZUnAg/Lt3HxIEiT7HcoVL090tK/OTJk6hq6YjYySOJFDG9adgUlOzfP9rOaExsPvJumLF9Z
 73lFh1i2kEvo/V/YgRg==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a423724 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7s1i5lxVbzGmBzMXG7QA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX1/G946BSe8ZK
 Z0zmyUDTDSJOZkEwQ/nwZeBlGAXrZPo9q+YSSQR24szTF3nl3mmWmIX1kRzsplY1rJ/O5kpNtmp
 XOdYzkqllwQvnN/sEVK5YAYazsrxQj4=
X-Proofpoint-ORIG-GUID: CE6ln5xOfqbW4yF_ktxa0Z1jHWfDIkwH
X-Proofpoint-GUID: CE6ln5xOfqbW4yF_ktxa0Z1jHWfDIkwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
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

Provide a helper function encapsulating the logic of assigning firmware
nodes to platform devices created with platform_device_alloc(). Make the
kerneldoc state that this is the proper interface for assigning firmware
nodes to dynamically allocated platform devices. This will allow us to
switch to counting the references of the device's firmware nodes in the
future, not only the OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 19 +++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 3188d5aba5f90622f821c695049cacda030204fb..6520b70cf3052d683a2ecb1a0dd7227575546ba0 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -711,6 +711,25 @@ void platform_device_set_of_node(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
+/**
+ * platform_device_set_fwnode - assign a firmware node to device
+ * @pdev: platform device to set the node for
+ * @fwnode: new firmware node
+ *
+ * Assign a firmware node to this platform device. Internally keep track of the
+ * reference count. Devices created with platform_device_alloc() must use this
+ * function instead of assigning the node manually.
+ */
+void platform_device_set_fwnode(struct platform_device *pdev,
+				struct fwnode_handle *fwnode)
+{
+	if (is_of_node(fwnode))
+		platform_device_set_of_node(pdev, to_of_node(fwnode));
+	else
+		pdev->dev.fwnode = fwnode;
+}
+EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 870d168aeff8558749eae71723e657ab150ce0be..c463d46b7b9ab6b891df1ca9f0c98608d2bb140f 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -20,6 +20,7 @@ struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
 struct device_node;
+struct fwnode_handle;
 
 struct platform_device {
 	const char	*name;
@@ -265,6 +266,8 @@ extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np);
+void platform_device_set_fwnode(struct platform_device *pdev,
+				struct fwnode_handle *fwnode);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3

