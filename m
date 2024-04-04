Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B841CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 14:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676C11131B2;
	Thu,  4 Apr 2024 14:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKlRbaOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C676D89D5C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712240241; x=1743776241;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=RfcTdYXNfRfuAF4Clidn9of0PLNNZlm/ntHx2qxrm7U=;
 b=nKlRbaOWkkTNpCTcRK8EP+9gnbibzJfjzA1WTq//OKwriKAKhev/g9H5
 rSdAZUySDr4/LTXLK6HaoWxU82q6REdD3zrLzQyNikmWyCO9rrmOB1Xts
 wNWUZEIJSmSVv3PjgKZNtwhBZkl9Xtgal6Vs0YtqHG8v5zaoM8zGjoWH2
 dHZJ3VH6v/cRapDiyAnYsCTFdYfdc8bciTOxmbvHiPggMR+E4zS1HhkzY
 uOsbzbdYGnaIPUpmZXK2PrBqp2Pdgrllg/eflJs9LLTpuH5jA0Zu7BkY6
 hPVucDFvo+7FV46wpGhSjxxSqiB1LM4fqJBWi6PuzNrGIhhLH0I3LMDef A==;
X-CSE-ConnectionGUID: xGiBRG/cTEGlGBhLvdHg7w==
X-CSE-MsgGUID: LeR7q10iSrufAizqv+M59g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="32921362"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="32921362"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 07:17:20 -0700
X-CSE-ConnectionGUID: 7TbDvRe9TF2wzMHFOewoOQ==
X-CSE-MsgGUID: g3Sw7ypAT8OLdfRAq9ViPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18657204"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 07:17:18 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 04 Apr 2024 16:18:29 +0200
Subject: [PATCH] drm/xe: fix multicast support for ADL-P platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-mcr_adlp-v1-1-d13aa64245d7@intel.com>
X-B4-Tracking: v=1; b=H4sIALS2DmYC/x2MUQrCQAwFr1LybbC2VYpXEZHdbGoDdl0SlYXSu
 xvl/byBYVYwVmGDc7OC8kdMntnhsGuA5pDvjJKcoWu7ofXhQnoL6VGQpuMwRhrjqe/B9aI8Sf2
 nLlfnGIwxasg0/wKV8V1sn3RBv5nrC7btC4QtS11/AAAA
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=RfcTdYXNfRfuAF4Clidn9of0PLNNZlm/ntHx2qxrm7U=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmDrbMPRqZh+HIMMq2i5sPMOBgntO7xqFWiYZru9Zm
 5q++1ZOJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZg62zAAKCRAjYrKT3hD91yX2C/
 9uHHqLeMjI4r95TxO9iomlh87rS/8BhTw1nygQA0+T5lp3LEb2exZyZP/OFHyUnvoevXcwgOV3NkeX
 XLveAW+pcCoWueocFQsUiv9uxO3aqHY9bMy7fudRgyPp0tnVBg69DokW/br1RmYnCbySwBB8rlbm6c
 Pt0I1SeUqw53t78ocAmyOGnOtLht6pOFMqTOdeyhiXz6Af6VdWheFL7mTVwgOMx5Uglix5JkODo/6x
 QFBF/bKKyX/dlWOw0I17U5AitemIGCL2fI7Uo9G1QZd3tzf/1VSUyguiBS6qHfOM/Bi1aRWA6DxxGS
 0umWaBXv08fjLxLk6EoMZWsy57A7qxRt9I8td/+N+2iNFqIq2emRWVhSL33hWLg+MyII82D0uF4/UX
 XFGVNTFQqKmV3NRXJUp0Qpq7hUeIKOKP9ppfxvK+lWVmvfqWdtOstfzWqUzoSzDV6uZ34/7y6M3bj3
 KLrCMG4DqIgKyxrxSBzAD2qx2cYUPNHOigoc/MG5N7tJU=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

ADL-P has six sublices per slice.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Fixes: bde5d76785bc ("drm/xe: Add helper macro to loop each DSS")
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 866bbd26ba3f..577bd7043740 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -297,7 +297,12 @@ static void init_steering_mslice(struct xe_gt *gt)
 
 static unsigned int dss_per_group(struct xe_gt *gt)
 {
-	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	if (gt_to_xe(gt)->info.platform == XE_PVC)
+		return 8;
+	else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
+		return 4;
+	else
+		return 6;
 }
 
 /**

---
base-commit: 34820967ae7b45411f8f4f737c2d63b0c608e0d7
change-id: 20240404-mcr_adlp-cf548bc8b633

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

