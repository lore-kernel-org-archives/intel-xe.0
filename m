Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD636C44508
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 15:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF8610EA2F;
	Mon, 13 Jul 2026 15:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fk86STtQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPvTthMk";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2477910EA2A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DF85Qc1701335
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tVr5dRf8jqbsYQUjS230GnPY/TS/CzublqdJwnQejdE=; b=Fk86STtQkF1LD7T2
 ihKoY74MW02xYdI+Hk3AArC5I0aBw72cFqVeGI6Qn8XQQhNBU0PXYHompsgzaeFO
 2f5Shemhn0w7N8qTh73P3HxuvpxIPIc7IO7P3fGWCLhJtxk3hTbbF5Hi4yXOidRJ
 TDHh7GdjVbHV8TClwkoNhrFuT85q33+B4g2JcX+jWsZKVK1YEntkXo3tWFJfoj/c
 VmavKg0PZKQyc6jo+rv+aROR5Jq9ZoWmwWPXP0uSYzKAUw6h/XL0TfbxPJHtGeDb
 p0wsm7xkr1uKryrOjfPYsdr74QXrkPGe9+jAr4yDumT/5JVLL8eCd21QyhARa5jt
 gzpijA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3ha15-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f1e4e0eac1so47658006d6.1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783955544; x=1784560344;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tVr5dRf8jqbsYQUjS230GnPY/TS/CzublqdJwnQejdE=;
 b=FPvTthMkHkmHgGebpgBSW15mDo8V7ZVLHmy1yx6ln4y68fYSASr2g4JjG4VptbLVUA
 m/fFh+kNix8PeUl5iv7GCpnHYZ6t/l0wdfFFEzZe0EMFl0Dv2vQmV1v+dOkXTwvU0FVG
 QdPSuyf7o8rTRCFnfwWcMazrBw2E28Cnt57pMdshz6k00gkChaMoS6pq1Qhbs95wsXG7
 y8HoHBpDZPowKsS+EYDqI4w3Lfk4mBxxmtg0Mg2hOoqoaYfuFM++OE0DOBoJrE2p1aYu
 tEtqXORDaLPwM6XH5h8KkqTp54dbGOCJfYMoyparnpVHSdmnbp+yDxLl8sSbrZeUysXl
 ieTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783955544; x=1784560344;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tVr5dRf8jqbsYQUjS230GnPY/TS/CzublqdJwnQejdE=;
 b=ST2Nctu1YhL4/7kDUKIz/rAXbeyDJ7DBT8osNduSXEc1ABnn8n/EPkCoHgTnFerCGa
 EKUlumkeSJbfUXyuM6XucWzakP+ctnDPPE0Wtn83A4T8P/uG9iVxcO8drKBC91hKrwtT
 TKfODAqjyErENliWV8ynlG6LvJ2Ed8Gn/nC/j4t/JYWmS7ey1O8lX3o4U6OTLriEhGAT
 kUCF96RC2IDPJKngIe9kbS0k70RsJ5LttEFUa4+xXj5FE0kbkKuTIBjUuDLF7zu/YbCS
 YULdeeNOI+bcNAhDtG2wdBQQRP83YDEaFb+5txUSWHSRgWeXjvvKOMV67KDLQ4dnlNNG
 SH0g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqX+Xn5xmVIomlCFjDSly9xK7pYpyji+ua0VpswaHULYZUxWHT1tmYJkfwd3AfVvtMe0FU1v4ROhA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWl+7BbrjkKVOiylMJW1+OYkyKEXnryBxChdqzaYd/VkFmQFxd
 5n7KiM5meFazNu4Ysx+IlRSs2RLh9eYaIVpcwaTL1dx8QBr4NvJw2NFDIGi5a16M3p1a14x6+Br
 R+Cn7RFg6AkDGgP6YO8lP9w9cqiDapPKG5QhHnGD8lmGKOoK6/DzHREaaXzQ3rx3PP0tRXw==
X-Gm-Gg: AfdE7cldmYZO2rVttUm+1+jCSvuz12TBE1ScMSjhsgF9Se44cfWBqWORpap/p0j379p
 Trgx+aiUyfTKKt1tP/9LwwkHd+V3vpvGOXntoH6nlz8FGMcKg3kDHvpCiMBsERglkPGCj8Ssq8w
 +VWKLYnZCSzp/zuFrnpnkjZcSlTJvue55huF+G8jktclgOhSCQIno78yfzgsR0Mb/xQTgLJUD2R
 feM4It1M/TkBzgohuFa+cHFG1m0SBstROs078faSL2b44heLS/P1hzDr8KUe1QdoGU9Mg3XnF1J
 m0X2temTlOFkpqmGV00SxxyTsVX/gqHvVIiwAFZH7o9c1JFshTH7JztNqLH7khwCPJaSDLgZqQd
 5Vm5wrCMfzYgMR/6WydlGOYQhrLdaKO4/Y+KWPhWQ
X-Received: by 2002:a05:622a:38b:b0:51c:11aa:1cd with SMTP id
 d75a77b69052e-51cbf20254cmr92718731cf.50.1783955544111; 
 Mon, 13 Jul 2026 08:12:24 -0700 (PDT)
X-Received: by 2002:a05:622a:38b:b0:51c:11aa:1cd with SMTP id
 d75a77b69052e-51cbf20254cmr92718121cf.50.1783955543604; 
 Mon, 13 Jul 2026 08:12:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 08:12:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:11:59 +0200
Subject: [PATCH v7 3/4] driver core: platform: unify release path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-3-6d6bc448427a@oss.qualcomm.com>
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sfNhb2R8s/6yKt4BPY7jMkwV/kl2zg5+s7lGbts3IxA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBMkeWmMCvmewYOj8J1fRY0qezWMr55m63rs
 XwMM+Ug+rKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUATAAKCRAFnS7L/zaE
 wzJ3EACVzej+VwkeVnB5DJG57mn9yd2KIxtjlxZdjJi6jk9SdHkz51frdxdmaZB0HOwIMjI2qT5
 QHx9D0OiS7SLaC0Soqt7lOgyXIiFNJ3dHECznM2oladKUsTzLOOJZv3dDPkWajJOZ/5Dpdn3W2+
 8Yj7woq3cc+2xy7F68zqec9f6piDO61ZOCiRoKoOwN5F/fzmA5roxFCGMXG0kTnJC3qLYli9Rtq
 ksRRiLQ4xSLXtBNTFrmlGbUefn3GxekVpbQDhTko0LXCi4100tXUrJRrcLGsDIvy3ZyCk323Dtn
 s+uAezDzW5w4aZumcwTOigoEKb1PMuohjhcQuaz5WbNEk3QMi3GyrDCsHfZZeIavvh44UABOQjZ
 MVcgMuX12ZhA5O6Ipz1E1oXcMBq125MGO6jYWFgjg/kkZoGTtIJUYNReui87wI44rZJP9/+MiSr
 BPu3kKxS+ZOt3xODnlzmZJMUKsh29Zn7Q7RArB1VZ1hGE967gtxGtZjfmx8BwTc49nePXooofYl
 szN2ZI1weWNzzvJMWq5UruQuQyOg/7aNXQibTBbv4NrRgpUDEp+KaJx95KZQldPB1iD2FReuLwM
 VpVjW/B3/McT3NZ+PTzJ0V4eOXZqA+6ki+rt473xmMUbEctWt5M+/uorPc2rBL7DoioEyTqR3w2
 Zio/n6wszuIIiwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IfDUIXcPJ5CUuo2BL15QQ_yFm18a2fXz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfXzVqkBwlE05TO
 LAnUInmYa14JY3+fxg7UyXy0qVzZ2k3m3/EafIF/M173HUPQJzhW3WRpdPqz0RWeWXVAR2a0KN0
 ykcSVPQlmBWIFhbPHFjEfT9VB02veoc=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a550059 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hkyMZWt8Xm0hL-3MNhcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX/FRZ+4/L6V8B
 L5ynTg0hoJJIpndHwvbDr6aXNxwkEtA6LCjjkTTU9IcYCMqzhf+YpZk6RVyV6e/nJVTRX+DY8Qi
 tFBVVQZ3O3UILqxO85h9e5GdC7tEnuTd8kBcwF2WCZ8Lr5C78QwlGQO7WiKlJIyghb8aXHSF3O0
 WiPcOetWRFokKacmBAJqCNl3zSCwCWof2SsfN+1chhG78JJsDNty/epU04ewMk+ysLqsOrLTtJs
 XzNyldmie4N/UU6/DihNeZmNVM1CfEbf3NPLjj8mPq+sA+RNhrzuh9UajvsDk7F/vw95JdHOlP1
 ymrYarwavC/xpwPcJzGxGRqEcxXhQryG2yzE02koRl/Gdkn+cD2rmA0j1BLPk5DndpaA5E6wRIA
 ogxzEA1bXncYyS6Iog+YkCSqaekEF1dbvrY8Q8ORMzFjEIvZoOO3VEWmnZnheFDNBBPOvdk0y8c
 dc043yCi2KCc5poQDxA==
X-Proofpoint-GUID: IfDUIXcPJ5CUuo2BL15QQ_yFm18a2fXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130158
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
 drivers/base/platform.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index a71015f1d915340aa01ebfae67196d4d7ccecba8..1df1a9ebd59ca6e0efdcd4038b100bebe224ee82 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -606,12 +607,6 @@ static void platform_device_release(struct device *dev)
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
@@ -933,6 +928,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
 	}
 
+	/*
+	 * If the primary firmware node is a software node and there's no
+	 * secondary firmware node, the primary will be affected by the call
+	 * to device_remove_software_node() in platform_device_release() and
+	 * its reference count will be dropped by one. Take another reference
+	 * here to make it have no effect.
+	 */
+	if (is_software_node(pdevinfo->fwnode))
+		fwnode_handle_get(pdevinfo->fwnode);
+
 	ret = platform_device_add_resources(pdev, pdevinfo->res, pdevinfo->num_res);
 	if (ret)
 		goto err;
@@ -945,8 +950,6 @@ struct platform_device *platform_device_register_full(const struct platform_devi
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

