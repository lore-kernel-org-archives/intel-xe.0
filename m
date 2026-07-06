Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD5EC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 12:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D0B10E94B;
	Mon,  6 Jul 2026 12:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndHVMfvR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfAK3/n2";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07BE10E95B
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 12:45:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxOEK218528
 for <intel-xe@lists.freedesktop.org>; Mon, 6 Jul 2026 12:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=; b=ndHVMfvRot9OESgz
 bmqfKntKEZvo//+p8zWxhoH09IW/KzihNN3W4EvwovRAKx1bms+1LnqsTZKGR9ga
 gxIHIN3cx8h4MQdN2yKrLJPsiaPAMpV3XcjA3009zEVj1O80C4Kpxi6Ev6ZAqFgK
 WpWeOc/IDpLzYVoOrnbVqRR3xxFSbp3nnmRUy9QyWMfPm6BSJJHEgTya9+9MQ0kD
 +0B+LXZQB+tvGXWFJ2qkPNHYK9JfPsnp4S7pdz1MD8SoEPz5KthgBBn/wdLOO9iE
 ufwTG6EeAqd0idJEi9ktHB6kUsfjGyJgdXApDL4Uf4fDDYpNgQdN8u0ezx3x0XO6
 d8QALw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs93ax-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 12:45:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c110a3b6aso42305731cf.1
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783341903; x=1783946703;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=;
 b=ZfAK3/n2oH0/1dPiWpLugY0ABujTLLSu0Ctnu/Tpk9e4rVpdugzA7PAPm87zRd+unl
 jVGVl0Uhv7nUoPN9jPEq8XMljy/jsst5TppEMWszZxW+N+PkK0GcyWzyU2+8YnolUvR3
 fxkHmwbiN4qiTSb6AHaOiR9P/PptoXS7HVUYAQs2BLGBPrKLYS2XLzt4Q9NkzKjbhu9x
 Udj0VUmw58FRtHjAcMK1HMRavi18VhPDTBg9DrPx0qe3Q9JF0Din8HjIR074YVfwebnR
 3hdkOMOHTs074rtqJJeYPdjiEmCAzc7OYpuop5gRa57ZtBrHJK7k1oes3T91zV5XF16B
 8jAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783341903; x=1783946703;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=;
 b=qCc+W6K/IpjmrtPn6fZoPCSghx9PhOTnxOXE2RDtoqFs4ieHYThE2Gjz4iCM0mUs8M
 HRsDWUwod8KBy9D7f46D3onwvnmpVPnFgej3FJshylmDOUM5cHxRAFdqKVyTaoIGb5tf
 qZmqilaNjZJEw40fPt+uQRh6S/AvW4doQbTezp3jS0TfYXYg3sg3t6VrYDhRt7gDL9xq
 tX/Ode3MrxRYjw+zp/z13LvhGbsd2+NN0iJ99T/rbo/zIdxOsqxnYuVugJjV9b9zWtN+
 opsb/USP/5yE0iUciGfmOg70emw25Eiv8K2Tc+x9wbdv+wFkzAwghV/GFVJJ2UQE2PUR
 27Eg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZ+TXWcP6V7fvXohShUvR8UAcIjq40uvSjJTb2IMi/zoalMlJaqbi9AlG3DJePiMb1Y7rBjLZx9w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLVe6XvxnW12n6REAtF/UmQzeZIpw0YgwGODUbQoxxnT68Tphf
 BPUecgIa063PcSHDsil2XAG0gQLa1dVmnU+oi8XrgVAu49dNRmi5GOuIYQhZwM6Tv7GhTkfhVHN
 x9OlUGkieWML4dZzK6G5fVpuPIAa8C6Oi9LbfD1tellm26HFxPJi4SsIJwitlttNwNG7dvA==
X-Gm-Gg: AfdE7cmcj2bjEL54jYTKfKb1BSSXjJM32SdYnNr/Ac8rFjIXrbaTwX8e0XNpNK3qXPe
 KdnEB5sSRUu1QatU2lT0yywEmkEhCipkXG1abAGMiT6J8btSSuQ5AH+Ji0h5QPZJkAZsT2Jxy9L
 vxM9vBNREY17I0fRUbROionAO0LoxDI63+F5mPc1EsX8e3KrIhhCxqtuQfUfmzoAvif0b6bah0p
 rA53/zf1JIeOjCDe+ihb3hDuy1qn5sMJoF4H3mWi3UoOJz/3PH6/06FJYoI3gotAgxPVvHHspra
 GmZvr9cD2/iyrXDpsVRgW40MBSMt0KLTXiuSDlfW+LQApNJF/Et7VvCXxT2wayRkbsI1tQeogTN
 JNZGC870rntMz5oanFt9xgIDeG5pAXG92d46WqVs3
X-Received: by 2002:a05:620a:4486:b0:92e:6637:db3 with SMTP id
 af79cd13be357-92ebb5db477mr46125085a.38.1783341902707; 
 Mon, 06 Jul 2026 05:45:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4486:b0:92e:6637:db3 with SMTP id
 af79cd13be357-92ebb5db477mr46116685a.38.1783341902117; 
 Mon, 06 Jul 2026 05:45:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 05:45:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:16 +0200
Subject: [PATCH v3 04/20] driver core: platform: provide
 platform_device_set_of_node_from_dev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-4-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+WcdvgZW/GV7zpd63JB9LAlXwRPQgiphP/JVsTCsf9Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MxkIvUW5KljT6xFge875O9WuwRepvZ/uG/s
 6o6vN4IqrCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMQAKCRAFnS7L/zaE
 wygzD/9GDta/x8WmSP7QOy6l0yvV7/uc7SVNI8SZk0/6EqQYppSZGt+f/ZQn7n2bhy1cxHgZ34s
 3vBKO/fX5ijfkM4Ov3o2x6YGnwXiwoO2TPjfM/6YHBlrfW1y+A8TwoPXIHgyDFPJxJ6PVQ+4gVJ
 /TK9YFAMFJLfxwURMyg2CpxiTR66hwOXPv9nxFXomOFD++/xJHV9pdzxgnfS2IWVtvBgDSWt466
 0bpd7XvxcC6qsIrSuP0H8ZqkCmAY9J+J1XuK93A4UHaQvVF1eC7dwMqhhEHqlpwTymNUbNJQD7/
 bT5qpqvGh8NmBUR9lXPWDtvejPorQDPOhPLJBFNBHCWCSZS29+1Ez5r9ZG5YryWI4cjaq14KBDN
 8k3TbdQDMjMDrsPoQhhTXZQzo6KaLjLdyc8lY+1G523oChbOOF7jgmkhpwdED6yulf0i7zZoSQU
 ygm/QABfr4ibjk8s5uHfaCo5bRazsd138pJesg0BKxivJxckX93Y7Z+fF7sMHKR11BeCpCb4VPy
 FkDkijjNDyiopNnw4UmM1KfleytMiaPMisGpJSoywFh75Z5yMp5kWMt5Odqgne/VT9Dr4rLQi/e
 bFVf8caUa5gPzaoiiuOdbyLor5PcG8kXRX0CzDVWnMKjA7CDypbfEzPWVn7dC+UO5KqKYMZAXiY
 FINuDuEMaN8BS7Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: VVWH7G46a3dGQ6dMluI2gUzhrwiF5YXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX0Crq7a9OotZh
 I7w1Q6HBf5qFzUTCbaU8yTzu7Ch69WZ8oQLq/ybNq16ae1EwVF85q+ypej/uSA8NJa2phEDHwUx
 vvM3vUExyU67UHmt53OHZASwbW1qTHeMIV01ycZakzIJXgdJjIV3QuAS15h4NoR20W3izjMOr+H
 tor2MRXZNlwMh0w/g2B4xGByY08G3uiJAlIKR9aD9DnAkJ5D6Ptactcjq61aAtdf/eXoQg+fAiq
 +H8U4mQ1RNAN0cQaXNOM8xbHCR3SG44JL4QG3Vv8kD9q3o8XSBvUnyyXm5dnpDM3b+N4P0oWVG/
 QqAuMUWHnSDSqew3i1kQOol7yK6tOFZIjtUVL66vKtuU6oUy/LuSOfiZ0fOfSKs5SuyGDFIodto
 KZ7NRVg4rvsAgxqgYqdMQ+ym1C4jufRuYbCpNAZ+gu3oXmQZnvRjL0b56jVp3Vgwp9KhAyTtGhE
 yJHDyFb0Cz+S99dHDVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXwj4eryqqPzZ5
 wcNcWWW5Q+Fs06yese8+5ah0EwQ7+uovPo9NHtrOkrQxfCtJ2Npb0UzQXq/fWT388qB/zd8Zzaf
 Jwx4Bhz1a6/x1a97YQqlEvVsLkhXd88=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba34f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=nFtAjRmdzOROD1nQPfEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: VVWH7G46a3dGQ6dMluI2gUzhrwiF5YXM
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

Provide a platform-specific variant of device_set_of_node_from_dev(). In
addition to bumping the reference count of the OF node being assigned,
it also assigns the fwnode of the platform device.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 16 ++++++++++++++++
 include/linux/platform_device.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 6520b70cf3052d683a2ecb1a0dd7227575546ba0..f24a5f406746b53ca9eaab9472f6dd1345e04ad6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -730,6 +730,22 @@ void platform_device_set_fwnode(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
+/**
+ * platform_device_set_of_node_from_dev - reuse OF node of another device
+ * @pdev: platform device to set the node for
+ * @dev2: device whose OF node to reuse
+ *
+ * Reuses the OF node of another device in this platform device while
+ * internally keeping track of reference counting.
+ */
+void platform_device_set_of_node_from_dev(struct platform_device *pdev,
+					  const struct device *dev2)
+{
+	device_set_of_node_from_dev(&pdev->dev, dev2);
+	pdev->dev.fwnode = of_fwnode_handle(pdev->dev.of_node);
+}
+EXPORT_SYMBOL_GPL(platform_device_set_of_node_from_dev);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index f037e4101c41dfdbf628d013348d7149ac519721..5333237ec58f30aecb05a3e160c7704fa07a0490 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -269,6 +269,8 @@ void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode);
+void platform_device_set_of_node_from_dev(struct platform_device *pdev,
+					  const struct device *dev2);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3

