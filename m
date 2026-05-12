Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EC3CD4F41
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 15:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D4010EF29;
	Wed, 13 May 2026 15:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmRF+qkO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hC9EorXb";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B4410E5A0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:57 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64CBco1M075267
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AsIlzmh9tphlDY1UgVWouFfmn5szfdJ33CZ+C2oPx7E=; b=nmRF+qkO4mGQ0+Nj
 XiOUNC4GoKCSEBmbKGynKNgdlODGWZYMxmqGXvqXoBsKRaeWPJTBnRg2XrDqeT0z
 Ep2XUuJIQ5+uli6AJEgiVUfzZqzJzapiWo9BCo5LW9efKZJglz7MMm9E1cDLqrne
 UH2pSb0c163G1U6RUcWsfb77vHwCZ8MFL/U2UUhoeIBwEg7RmNFRiKLN55ZIlcHk
 sjxroEZszldR6ogPUFJ7pgbs+rTamRBngCZN4kmYqAGufDsqIyh3mh8vuBKEeOjj
 qxVhLeTPT4RRu5ASdw81uaVfUslDLE/b5CM8gcElkYUoNjoLGoSAjuHoCKgeC5rZ
 u8jleA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43gyg529-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50ea1a7a5d0so28729591cf.3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778587196; x=1779191996;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AsIlzmh9tphlDY1UgVWouFfmn5szfdJ33CZ+C2oPx7E=;
 b=hC9EorXbWLpT2EDk2sqInmz+P37ORlwSo7eZglhA8VJ+Mv7SHShBi//XFzc3ffIw+W
 LLkO/3K0y5/jK8wYnePPmreda4fWumARgwqVdnaT7+8xbMki0QpPMk8TGnAKm4LtUFsk
 /af5XKKFzHDd/wz2ndnCwhIETqtpCgK7rBio5Lt78O1HiBBhSiXFRF/H0cPrYh2vVN3e
 Cqodn/kjKoyOCpDUF9wINwUyk4mvSCu/sTkAhRzTBCNcTczAL/UXuzO57aGoRbm8WLFQ
 ET4TLLUxvvEGNDmi5Dre2urExifpBomfT+7IzcKc33cYrOMvavjZgmn/3U08jyxkgUxj
 G7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778587196; x=1779191996;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AsIlzmh9tphlDY1UgVWouFfmn5szfdJ33CZ+C2oPx7E=;
 b=ayNPx20s2UGgTy+wSIDSIOiF6yiE/JvjqIji3fOVQRrIQGAqXxg1CLT8VtfoDS1k/O
 hTuSWuH004YnBnVWXxXCGAtSBaFJj/2ysCVMiEuCykYPidARkZ2d+8uI0RJWqBSB9SbS
 OUPiWCRyuHXIEXo81tcjNgetoRvM6Tw4au2CGCgXK9kAeY+m9Gih1Sft9mKL3DjkVMIf
 UT46nTg0djXq3XtNPmxctq3vPuKSMY9KC4lch5Xx7+tXHRaCEmrMrL+lFK6BMVo3Txj0
 zcsuJngej5VOr2GMjOj6YbN5jd+PIp36T+Oslbyghowj7fqe/cgnegcDVJCVqlgbIZgY
 5oEQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9fZVoRKOpFJ7WBXWBz3vHlSuexhdfwtM0X2pfb+trZEWzjw/cxOWX/qIBq9ah56mTLrfA3UiqZ/Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIPVZrLW8D5a7lC6OeeVf1BWMzyiYNQLMcS6E0stm0Q5GOYY8V
 vo4eb0gfqHHTCK8V5adwfsvPtmpuokKIXTmuHIE+SZKtc13mvkvFBJAYIkRCjvgtcDzaglnozSo
 TO4cdi0DjlUMJ9KbmFL1fOk6OPvqZ3aEtcAxNjp+gB3EenL7TYZ4Hjl+0/IuIC+wyBm/9Yw==
X-Gm-Gg: Acq92OH9lEz5ni6qMt5syGnO74fI2U1B1z+89KXAAyB/YNRPf1Q1uE7Dce9i6K4qMXR
 44SH/037csJyMAZkS3OY28urAz7NGH1PiaBFaUxTS8FtadPBUzOnPWgkFSttEYL1YntLzK6Wihy
 hKWAO5i85FYECd8RAVipc9uhDuZ7wyNSF2jFqx35SZotllTrBJGHpENyr0CT3T5GMwyJNczgr6F
 ap1cyDm7YvnzmhsSCib35bd3prvSH1y+6YLYOVP7u4twTi+hyKWEzkp7D656TAsXbt7Z5be70+x
 aKLK1xFcVvSURKgKYu04PhlkzkYHMT79SngtXCMNp+4gNl3RitEMgAQPVtRnOTqwjvRo6DliX1G
 7dlAGKBy4DzkWJ04jY9b8v3u7bcfQOAp4BNwkuhVdylHcg2PjIm4=
X-Received: by 2002:ac8:5fc5:0:b0:50d:819f:e7bd with SMTP id
 d75a77b69052e-5148e7caa96mr244596001cf.4.1778587196130; 
 Tue, 12 May 2026 04:59:56 -0700 (PDT)
X-Received: by 2002:ac8:5fc5:0:b0:50d:819f:e7bd with SMTP id
 d75a77b69052e-5148e7caa96mr244595371cf.4.1778587195623; 
 Tue, 12 May 2026 04:59:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.04.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 04:59:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:24 +0200
Subject: [PATCH v5 2/7] driver core: platform: make the swnode check stricter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-2-0035eff63812@oss.qualcomm.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FnVwIXx6Ku4B5jDoy/RTsmZKiOzQrXf6yp9wvc3bzuw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYuSqeVpF+6Oi3kvW3NNEoHQCk6tpKW1Pyi7
 2WNxlR1TDOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWLgAKCRAFnS7L/zaE
 w9OvD/9TDVT4yBV+W9E73T/WZHkxETcn/5Zk5PW7qxDBDuCaLa4ncmLsd4i8n3W9vPP3YJlGFyD
 XewbZFaa3M/WHPF1KHDoYn6jJpB3qM42PWskLqakoaze3tZ4pcAVreLZyExLmbgrmNXB2mdAU3w
 f6oKrs5sh8GkgNtnPG+ck4C98lSqXvjFfllUJzMbrzlO6qCEG75mxRevG+DgCP5HLCxhx/R+lVl
 7QS0S4RKlNGZlPER3Vv6r+yl3EcpztihZtDO9qUeOvOahADyWw4YKVYH++iGn4jawAuqTRvJ/nM
 a8L+U/mv+V7fxOyab0Dmyp4UnOOM/TYiqiIlF5LaysyZRzV+qVwPchvoewhU8JiqQ0Vm2/qn7oQ
 x5MZkj79CENg7XMcb78yVc1cTsAtk2Yb1BG8fFejh7Xq1ODw7mTOSp9aX9aoIft76v40+g4ioSy
 zwlzhz8C0spx54GhTfCtCDCD6GWV35k8fm9iHd5FYuOlO0TXf3sEZVpW9X9b9DOzwnJHtZxWYEf
 rHMmbTrSz3LLLt0td8k9VygyecaznwyolREajGcE8uElhU90E7lJPlDoOxAL+cogg7ulDA5tAB9
 oycQ+wKAEJ6jX23cG+XhjCdqJ/BF0ayheRl1mivwmjiEkik83S3A810JinvBU50vzJV6THDwRwG
 bf1h9uELBVNrWuw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fMAJG5ae c=1 sm=1 tr=0 ts=6a03163c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mI8QAYneSzpRMWOT9SIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NKGD3Fz4SFECXxKIi5UzZ3pJOcsvbXgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX/bvF1ZjEC/ME
 wEEBqjGDBqnHtK8EDf9LZWCewPrOwVVInhmxS76ClhWL3jPmaNqeSpTPcxQizowOXtpeMR4QD9u
 02x+6lZa2QIpvDIJG6RfnINAg1/5mjX5TAQX6l0I7IwppKAF7Tp9hjA2RQdLph3Owia+PpHrJB7
 R5i31rY+OWTTAydpWO35PJMH0kocGF8MXRL8ATSOrT2qgaaTbtI0v70VeRlsQTNHR0GRHtS7dYQ
 8+ZV/bdtxwYYeS0tgFuVmjeTUCyUKol7pGVNZ8gDk/AvECoMqyaqvRdCQwZCQtNDwLNcrqfMdQ6
 r6RrNdQSxTxjF9ij6jebe25Y61u2sqH3CqKaDWU0hy3bB1zH4HLQKUk5huMUK4BUIZDGVEBL/CP
 7+moVFRzwuBJ0lHRpn6lpg1NMBRvQt5v6cQ1nLWvlginTJUqIgj+bewivcuoiVRk7EA0R+m5xbC
 ZmbLPDvPgQVZsVFsVYQ==
X-Proofpoint-GUID: NKGD3Fz4SFECXxKIi5UzZ3pJOcsvbXgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120124
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

Check all three possible situations in which two software nodes for a
single platform device can be created/assigned in
platform_device_register_full() and bail-out early.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e582e67adafa78c312d75c72fd654cf..18f33bec36726490255bc7ca3c4ab07d9b7606b0 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -848,7 +848,13 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 	int ret;
 	struct platform_device *pdev;
 
-	if (pdevinfo->swnode && pdevinfo->properties)
+	/*
+	 * Only one software node per device is allowed. Make sure we don't
+	 * accept or create two.
+	 */
+	if ((pdevinfo->swnode && pdevinfo->properties) ||
+	    (pdevinfo->swnode && is_software_node(pdevinfo->fwnode)) ||
+	    (pdevinfo->properties && is_software_node(pdevinfo->fwnode)))
 		return ERR_PTR(-EINVAL);
 
 	pdev = platform_device_alloc(pdevinfo->name, pdevinfo->id);

-- 
2.47.3

