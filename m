Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F79C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDC910F0C9;
	Thu, 18 Apr 2024 14:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7aEKZzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC72510F0C9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713449027; x=1744985027;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=EmNc87/ieZ41udV10GEpBlQFK0Sk2ls5Lqy1ZAVta+c=;
 b=E7aEKZzOMHii9LVil5C/7BxfEwsWNs1Ee7sq+UzGYYW8iBbh7CNo2jcR
 DV1iy9pFNJSFB0rtJnl06Lbe982yZoizdE7pP5MCqjb/NI6rv1MYqav+5
 109+GHclBrn1tx26R0WacoGG0cr0r0/0VgVR/WnPlPdjZxskRD99TvWg1
 AV3jUtlSpqpgHKBUyENrNwvktShrSLeGVTbKiRiAINI4ngGcERyDfoy1v
 pH89g0I1XEISFifY0cMJdAYj7VrVWqe+UnS2Y10+sk7fSw1C+7hz3lSSn
 gE8DBPekvL5hgt7UUEzx3LtcQuM3FK/KLxKQaxuiQ2nqtFfddAxA/9TtH w==;
X-CSE-ConnectionGUID: 1qs06zw4TZaHXXsfIMspnw==
X-CSE-MsgGUID: UIxr8kw5R1aMS8fFpUFaKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8870493"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8870493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:03:47 -0700
X-CSE-ConnectionGUID: 4ecG/8W0TsGCTmNyabcnUQ==
X-CSE-MsgGUID: CZJCOfLVSlWiYi84PKUfnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="46283137"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:03:45 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 18 Apr 2024 16:03:37 +0200
Subject: [PATCH] drm/xe: allow unaligned start and size xe_res_cursor
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
X-B4-Tracking: v=1; b=H4sIADgoIWYC/x3MTQrCQAxA4auUrA204yDFq4iU+YltQDOSqAyU3
 r1Tl9/ivRWMlMng2q2g9GPjIg3DqYO0BJkJOTeD653v/TBipUnJpvRVK4pSMDx5FgznmN3Fj85
 5Dy1+Kz24/se3e3MMRhg1SFqOXdZXO6FQ/cC27XfZiqmGAAAA
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=969;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=EmNc87/ieZ41udV10GEpBlQFK0Sk2ls5Lqy1ZAVta+c=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmIShAt8mGsi56KFvwKF2P+//76iK+hg7J6JOkCFNz
 PWv1q9CJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZiEoQAAKCRAjYrKT3hD91zJmC/
 4kIRNGOHxcWygR2nDs5oIadhH2d+mu96AXVh/0+uRyRAh1gc63wfJhtD0IZbSLKywVhbsLpZB8QUhq
 EzjsoH++Z7M0q8UVEKe73/iF40hGC6fvKDJi85gSk8r8M1R1MnyNsgw16JYT0JPmKw2E9YWExx+ZNt
 sgE4BFT0hp8sCLOntNBGCWO5RRxnWN1Tk43fpomUO0fDf3CeAvBVgXrtboaZc1NWj6pER4E/ijPrYT
 HbMmoi7I8GSRkReUFOlHYdmW5bpBYX+fQ30CQGmTKKKRHe/13oaWMzmvVufkAl2TGLj19Qcgaj2eXp
 Q6E9aL/dYduNaOjFbXeJx5bW0/wQ9UYiCDNZ8/mnplHuxcbSJEP6Hzx2x/uXu5xQMTPf0wfRnhMt6s
 CMwsROjq5XJw/0eMWhoGnLY2orXehP3yOIi0moyx9F+9inETiSBzcxVNc53wLKTcH2CCYWtOYk3UWS
 GUx3z3frwu/1QJ2tIumBUsZw1KgdtWT958BJ4I9bxhGbQ=
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

xe_res_cursor code does not depend on the alignment. On the other side
unaligned accesses are useful from pread/pwrite point of view.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 0a306963aa8e..655af89b31a9 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -157,8 +157,6 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 				   struct xe_res_cursor *cur)
 {
 	XE_WARN_ON(!sg);
-	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
-		   !IS_ALIGNED(size, PAGE_SIZE));
 	cur->node = NULL;
 	cur->start = start;
 	cur->remaining = size;

---
base-commit: f9116f658a6217b101e3b4e89f845775b6fb05d9
change-id: 20240418-xe_res_cursor-no-align-a3bd26482244

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

