Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8326C44514
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 12:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D52610F2E9;
	Thu, 16 Jul 2026 12:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXuj5Xjz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZseQINuu";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F2C10E33F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:16 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiPT72824059
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=; b=eXuj5XjzzunNm/PP
 yT0Me3iks0+irV4A1RWwsgN/fYytSkrNebwbB3QEFO3664d7gCm6E1ZZXeeFDeCv
 6E4t5fQQOsPOfor26lfKXGo3KwdykavAK48uKvV9hEdsmqakxjsWMrt+kYlktFJ8
 P1PkLv77JgWgLalKxdfAmOORicqGsc1EgOCZmK7odqU5NhSkJso0QHrL++bifx21
 ifeVN4pLi35teK6jKFz3ZiA7Us624AVPJAG4569iETxdg8CcgdvKc7CEds3LhZOF
 AVJXVkfdZOP2NIyelNHFosMddhcOVXHcdZkEa8h2vJ66FcdwD/hnjGcSRiHInLv+
 cW/1lQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1b5s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e632390d2so598588785a.3
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205135; x=1784809935;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=;
 b=ZseQINuuHT9tsXvVgZTlL48ATKcAHAwL6c+chxLvllSfG6y8L5aGS209JjfZdQLCV4
 FiKzgAkYopKRbNTt4YaTw5fL2tsNhBKEi3vdNG5XvFlDIPH2dvkoI027XRb0qiCE+iqS
 plLkCHYjmUgMZGemMHisIerR1x4ZG3hyn8Pzo0hszwpFW5STRoAIlYjsAyWLcFSRMtox
 7AQUlKAdeScamxGEtPq5abFzVA18prcHixmTQ5VMfHwZkcDR+2LCzLBpl4V6aDEwJD+S
 1NJS+/QSwwS8H1J/mD4E+Glf8AMXBNMYCa8k0MaYp4pwuEVpojjzvEEO8MqmWYJJzr4s
 jbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205135; x=1784809935;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=;
 b=pgnp41ZaDXnpgnpN4ZorpjClkg4N1Jv14ttFKqdKwBNPwPNzjmYR+A/Ryw2axFAC3e
 mjW6kBI+0nx+V7E22elg7pe93iiqXpHb1XysLaXNk/hmKi273w17MNaS3qWOlQ9wCM58
 PLaZ7Ex53OyvQt6IrXv66MuynNw1ti1R08BTsm/cfFDtlVONg40Pij/rTybwb9IvHP1H
 deycdbbmgeZb7IOWBsHQgV1Q1tBoq0Lvbsl7b3TqTMAWvOHnzvJqYf5r7cZPeS6QXnRe
 ZVlxu/hd2twYiUdkoumW1m0JZ0dr88gz8kMg1HKGLeAi0uJl8V3VxbL4m2ujbHRGRSvP
 Fxrg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ros81Rk6MjcyZ0eyG8wFFIUKohO3kpdi85IrAKCAvjNVh0CArbVkAslVlGI/UhDrfas2Btc8RzQkg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4zb831wrM6RyGpHH+EdbFAUHShsbv/DTTtBvLUBCkA2uOl5aM
 xpVm2X3D2CAaYbLXZnhdEj3Vq3kY6kaJZ4kq2B8uP2fDCyyseOlygYOCjbAnwf6K2cmGEj8pX26
 WbZj/iILvk3dkZ1HKSuAv8AOS4YR/ME3h5OTLWkE/bvzKdVMP1IT1fv4fJLg40b0lwk2Faw==
X-Gm-Gg: AfdE7cmhOrrdVLlQhanx7roFuUJQzxdMOUSE0JZCVGoXcOTxQS5iNozEeYXrwAwaztV
 HtRw1Y6yRkzWdw8Dl0pp9/q88W/Mwoj9fGLz7FEV3dbrc/nL1wptr6AyxIzsAz77FEO9eUand1j
 RnnKEFa9eCjLtkm1i+3JP+BbpANaT5lmLsA13FQ/A8eFz78/1Rwp0u/eiENiVJkN8LZyYnuOP+4
 X8mxzgfiEWkx6I8g1OkkWNkLLtV7gurK+5aQLyYSAUs/Qd7vfx5knOSRmJs0GXVlqB/fe1vdnTI
 kUhvTah6d5LGSstQyEmyECLtTqUzEDVCp4fxy7dNdeQQW48lOor1pAzhDnfPaurH9Duj8+47nN7
 fcrfn/PvgCxlq9YGa+P+P104HfQ8=
X-Received: by 2002:ac8:5747:0:b0:517:5e3e:526f with SMTP id
 d75a77b69052e-51cbf27a872mr223620221cf.52.1784205134994; 
 Thu, 16 Jul 2026 05:32:14 -0700 (PDT)
X-Received: by 2002:ac8:5747:0:b0:517:5e3e:526f with SMTP id
 d75a77b69052e-51cbf27a872mr223607781cf.52.1784205119845; 
 Thu, 16 Jul 2026 05:31:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:31:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:36 +0200
Subject: [PATCH v8 1/5] driver core: platform: amend the API contract for
 fwnode setters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-1-5c2b8cc38c28@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8hpM+TrGfI2rbJN2akFn0gkqMVl45ni0Bp0sA4vGJ68=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM828c87nWIkYkRuS35nkpsw+eafF3SQ/NOI5
 nZphlbwEjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPNgAKCRAFnS7L/zaE
 w1PYD/0ap/sMPuzCQnZ66mfD+nEmu5nhkrMsO+nv/OYqI/SxhOEAqeCdbYwNEDMFBtr3nmItPBo
 izcMwlPWbzo3M8RG25l8zyCyI4A1dX3gx87PlsQauyNvGK5+EhyDzOVmKl2l0miKpRPVg6d5ePQ
 n6x+1eThx4PH98F66txfVbot1AKaqdqN8gfpI8QF/tJd5nvxExDKUc+jhcvgsc3gIfVKtf2l+Ml
 e5qIbc1muPS4/+Ysn8rVZMhCKLMVyLQ4Q9CO+HrHCibK9guPfwNhUvfWzKEXOmOXSiTBH02PXOY
 rZyiFMCDEPKnTyGDsZ5AwcaALmSJ5FauJf4Sr5/0MAM96iaPTpDVMFotgm67DrIQw7QIaBXAYJK
 wjzJXlMa24vR2eIFaPD24p1vSJ+I7epc4XBuIt2rdTEWeA0EnjrWPtOt5146iRgmlWoko1t8AUl
 v0FRoBfcfzmSf6xyNXi6652asT0Rbz+zfkIoveYItuvk1OG1mHE4I0WNIh0c84v/pmFIEg3QO/N
 8CfVARbevx8CJnGoYN5SZkVPeHFRqrM6df/KRb3czazS02Fq2qMpHX277XkDU8BE6xBrOwLyiuH
 EwazYUjxAFzjcjYelFGMIggKKVRYZ4U62LX4kx3M5rno+x07Y2WwUUEbkVLd7XrO+TNeu5AU1nO
 vcwxjx4pFdq+45w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: wFYFk1XtMSh2wfZiZ0Gf5QIzZB3Mxg70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX+/Hal0C7Toab
 4Lz/gs3Opeiw+pFWY8BkAj2ls/XXNu7ZKL9U+FxtOOnYl0CCNeSrAFmcZ77HY2GV8vhHMiepJh+
 JaUX8qZuilPUaqjSrM2mDxulE6Kpz15PSMxbRYCPc/J6r6E8NvtbvYoCuP3NV8w/dw/BEDNV2Ds
 1D9xY1uv6JOIEPn+gxjnIdTHmshNRtk+X3WOFMaxjyjMjVycwmCFzfIQ4NB3ZtU60r2S3evgezC
 8vrVmQci6d/prOJdNMwtDTy8/khWv9W2CfXrmkK5W4EC5zdGBQOkU+muTCC3DqguuI6IhFRZKoT
 7qIJjIIw0LlJFhnWJTnZUzCJBkPTyiGIqji/FGyq6Fue3B+nF9uGDXXcLtX201CeAvHIj9wqFT1
 H7yz3JLTyyorqrsyXu/zYLrGIVE65yh0dPc1xR2abh+hNJKgPH/NlJauzr1P7DzAE+mXQ9goepk
 5gx/ez8UcBZrwVNRVfA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58cf4f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UJBV_kE8d4TeT66hubMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wFYFk1XtMSh2wfZiZ0Gf5QIzZB3Mxg70
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXwn11RI+iTfGQ
 sjR6MPaZcL5Ho9bUCd3ov/I2leM5KEhM7X7byraLQ9sUyIgsEKxGbPycBnunYIrLf3bJ4Ige2cM
 zlF2d3oU5+eE5+PqONWWCCef/mAyM3s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
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

Calling platform_device_set_fwnode() (and by extension:
platform_device_set_of_node()) of platform_device_set_of_node_from_dev()
for a dynamically allocated platform device whose primary firmware node
is already assigned and is a software node leads to a resource leak as we
never perform the corresponding call to software_node_notify_remove(). As
there are currently no users for this special case - just disallow it and
warn loudly if it ever happens.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index a71015f1d915340aa01ebfae67196d4d7ccecba8..fb57d487a6c2aba799b4ca5ccd089006cf2d8bf6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -707,7 +707,9 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
  *
  * Assign an OF node to this platform device. Internally keep track of the
  * reference count. Devices created with platform_device_alloc() must use this
- * function instead of assigning the node manually.
+ * function instead of assigning the node manually. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
@@ -723,11 +725,20 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
  *
  * Assign a firmware node to this platform device. Internally keep track of the
  * reference count. Devices created with platform_device_alloc() must use this
- * function instead of assigning the node manually.
+ * function instead of assigning the node manually. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
+	/*
+	 * If we call this function for a platform device whose primary
+	 * firmware node is a software node, we'll never end up calling the
+	 * symmetric software_node_notify_remove(). There are no users for this
+	 * right now in the tree so just disallow it.
+	 */
+	WARN_ON(is_software_node(dev_fwnode(&pdev->dev)));
 	fwnode_handle_put(pdev->dev.fwnode);
 	device_set_node(&pdev->dev, fwnode_handle_get(fwnode));
 }
@@ -739,11 +750,15 @@ EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
  * @dev2: device whose OF node to reuse
  *
  * Reuses the OF node of another device in this platform device while
- * internally keeping track of reference counting.
+ * internally keeping track of reference counting. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_of_node_from_dev(struct platform_device *pdev,
 					  const struct device *dev2)
 {
+	/* See platform_device_set_fwnode(). */
+	WARN_ON(is_software_node(dev_fwnode(&pdev->dev)));
 	device_set_of_node_from_dev(&pdev->dev, dev2);
 	pdev->dev.fwnode = of_fwnode_handle(pdev->dev.of_node);
 }

-- 
2.47.3

