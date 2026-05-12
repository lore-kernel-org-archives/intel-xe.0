Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83FDCD4F3F
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 15:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF6610EF2C;
	Wed, 13 May 2026 15:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbpRXmmu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6tRodTI";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB6210EA60
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 12:00:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64CB04oV2573888
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 12:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=; b=VbpRXmmuQqQ5qVCU
 RJJSwsi8YyzrKvLmTJW5z9ilS0EaWKFCIgIDSbAQLADWHSO+n2rJ6v1/vITsZijG
 j6inF/wJuYG5k+3ao3kOSb2gt55P7+GY4deEe4kzowQPVxgQ6ueZUdLHt9UOgZDY
 VZkt3kxDGbMA2GB5+TxAP64q0e6NghG8MrAXyLJW1HD8Ja9nzHWkqgu7KrBeYw40
 csCLSP+RZBJzaY9fyKeD8lAA8Vz78bHZtO/alvlEQgbIKF033vv4BZpe+O9ZuUxL
 aH37thCgBuoofqcZ5FT3uHpLfC12fgfDLynZRezXir5myO23d5wwqoESLlE4Dgqi
 PyUaXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2b5m7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 12:00:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50d84b5f73bso77153691cf.0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778587202; x=1779192002;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=;
 b=h6tRodTIcYOC2YJA6FrkKTg4/WlT5Xbs0F4CsBG/bOFWInX6lNNOw7Di4dqj384gut
 szOqcwsHLJ1qgYaI3MT1JP0HtbBeqdJAPGYU0lvcB7bcKEMttwy5gFdQMCmWa+lG4YOs
 08IAtKfHxaxXw1QTYdT9tO3AL+yJbqVHM95rqYCpQmZsiRdssolU03k6PuQRODQNwlv2
 JCzj5FKB6BVHB/8Xdf8BlGJEzAV6CKN3K/3IBFrMVdmo6odY6f8u9BZm2c7QiX4LmHCM
 jZwb3xGzzvzIC6k73iLRB5rkuGu+xVJgFitCiiJRCHp93BExZn4lxcAkXHdfycqiytn5
 +Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778587202; x=1779192002;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=;
 b=LtVkiFYD0JhPtCZPf6N/FmIgEubVMzDSXbvQq4dX2d7lNwsa+M8JAb0aGAhDzBLGVJ
 xA5vMH0+7XEjfrRmpfackTiVzU+m6v46pK8Ic07gu2qghzA9tAI7ry8LRbJ3JKNJdJ7s
 jkO/ry7aUyUR3w1gKDXXGeEshy9ecnAEf9Uca3TdOPneGA2HadVK52Yzg/cdfUvKvBQV
 +AWbNJVdXyE5F8osxj1Lp/UAIJrGq84yVXv+j+Qrr9z+XhzgEfOAdDnxYl354hctIQUo
 yDXl05lzgQ3WDvQpilJxH2A/qofta3S6vO++CeTbH+8F6lrXnXz2jTYpX5BD12AEecBe
 TF3g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/K/CAmQYeGssrQw3cLlxZNjGxnmU2VASU5lA5oAcfeB8ipMKqxBt2uduE1Yl63yy9tbDHIfa3D0A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMHPS7yiHB5mgn6G/yp6OO3GqBG5+uhXWuBdymtnMyUpW78nfq
 DnvTnF+G+c8daRUsK2uSRElHOmrNJ37WbHgGNAT/39dlREJVu5db8ylo9cZR7tP/cRo5UJoovoe
 Dbv1zZTuChutf3AyUsmEpjgLC46uIl339Hyav2vGMlQt87PQfEqC8Kb1cPUcD6hJKQ6Cdww==
X-Gm-Gg: Acq92OFRr+7AJKYO4VdZx25oLwNElvL5ko3lgFAa+zj+V0mwwtH6LEuvM2fzXinhUYB
 juLpjxUiN0jremVBDxO+Q9rwaYsN2/xtLzZkFRIwqpiRJ+NZyOMIn558kZjAJSPmkSDFH0345Lt
 yomYQ9Kg5At9bYg3b5Q7QcGvScxX5tUt27JLIcjuYi4dlhc89LwZUQvJOtm2aVWZaMm5UigB7xZ
 Wv+Lo2jyQBzDLWxEVLSLDL/mKTCSfOulcjw22SrcKBUeD4VrY3wt6b5snN15dAUas+exCGNPopm
 3FA1XvzmhAp/bvvY4b2k2WPAffBs/7GmUxJ7WS5ECFIo2juyGGzAkkXbeIjCzwlne9Ui+qJbuPf
 4NozkRF76wSNSukH/OZm0GSz3+FjYxGUQVI2zg0AH6onido+SF7g=
X-Received: by 2002:a05:622a:5149:b0:50e:5f71:62c3 with SMTP id
 d75a77b69052e-514d22362c3mr34391171cf.42.1778587202377; 
 Tue, 12 May 2026 05:00:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:50e:5f71:62c3 with SMTP id
 d75a77b69052e-514d22362c3mr34390521cf.42.1778587201887; 
 Tue, 12 May 2026 05:00:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.05.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 05:00:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:27 +0200
Subject: [PATCH v5 5/7] driver core: platform: remove software node on
 release()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-5-0035eff63812@oss.qualcomm.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o5qzvWWbh5DFQqh9VSRzCVHKMN16O5fAII+Drmf/uwQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYygPHpAD/qocFmp4XUtkTSI+UdhqkR026fU
 nuhG9wYasSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWMgAKCRAFnS7L/zaE
 w9JBEACdF9JAKwGbUN/7/vpGxkIxY4Z53T9iP0IB4Wsvrn2Z/RTWkzFYcsyta9gdVUsC30cUi1v
 Wtrud32nDPLsZjP9B+9n11nnxuVcDYM3YcmlcaFF6aFM7y2FK50ImRHVVGO3aIoaL1T7+0BA9qo
 zrX5i4uC0Y5exI93thWGPaSPt+ZTdUCUe8P8tHSfu73dvNEMa3jXxdDWxcaTqoINjtjBmDKnW5f
 MiufJMZyQk4CmPe0++KaQh7vAzdOBK9Dt1nuLk+1ARuJrQ1DFIl8wMMdJ+jFZIGt5DFaNkbMolq
 nOL0QhwG+1Uo1miuZTsiA77/sT95jq8haB4S/qZJ9uny/plHmX4N08K+/CW2LuzW6/VzEjBBaE9
 bL+tGPkLYUSDomKREI7AgNv+tmTHrPi2bvB4AScnlIJZDmS11OjPsQgriNO+6CcywhEifPUpS6A
 UQeGI18BnvvDEdqAOikuMKNyUnvnsHL22hJgKdzFwWwyjhZMrpAiTetH0p7hFPP8+uiMk9wKG3L
 Fiu4tA7yrEBfOWZaoU+ye17CQUnAVlbg6B9iChvLiBt4/Ptzh9sq0mWBbUCemFu1OLcrGTqDqAT
 vksr8UqkkJ/UKQmEwOkEMBc7ljIIYZ1SjdwxI7q6Kd5vwXNM0csDJpM8Rq47ezo1uKWv4Rj13vb
 IlMPFISGX85OT1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a031643 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=j4F7sB7NKAO1HzpnjMcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: C_dIgND9j1O5Or4ZzMEDgfzilb8G833A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX2MWh+W0eDStz
 jPbSjDxvnuPTYmoIpCpoSFpocKtM/906vkAIlvFoprV79nk/Gs8BqmeN7Ie0ahHMfhhWdtn84L9
 l1rGrqXgOwVlz88WzP66UZBYjQxyhCfXP+mxZtHUhq9YsakCjc6ssChH4DvlrH2KFaK4Z7cb6yX
 nTqlAGJEfKo3QuajwTqZS0yL8lLV8dnUwBkx4+ii5+lYDAr7QZD0DzBM0BrEbY8JBTNu9VWh1X2
 ERhwKFybGv9gECjD3MMvTr2HiKhY1CAOuLkSYE4DSefmFRCQFc1nI9Bf8k7hNKiG7bSrat+Y6vh
 dXS9aOdveBQA93bex4KA4iyl1gmrPAeLg/xQMCa/6x1ElDIl3g5moyxK34ZHpuxgR5s6wa0yHTO
 vr4QLfq5P97onx/5wtZraymkSHBuBFpu8bY7xguQgVltHHcdD6TYXeE/ki5jRxIII2jx6/RGjzn
 TbvbOrydUuUdbni0X0w==
X-Proofpoint-ORIG-GUID: C_dIgND9j1O5Or4ZzMEDgfzilb8G833A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124
X-Mailman-Approved-At: Wed, 13 May 2026 15:13:19 +0000
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

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fails with -EBUSY. Add the
missing call to device_remove_software_node() in release path.

In addition to the above change, make sure that we still function
correctly if a software node is used as the primary firmware node.

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f617e02b171f6e59a3c40504a71f8915a41e8514..d2f40b348f193db842aa7c17c9c41be59a03d35f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -895,6 +896,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
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

-- 
2.47.3

