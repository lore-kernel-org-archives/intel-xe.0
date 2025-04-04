Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67222C369A2
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 22:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DD210E33E;
	Fri,  4 Apr 2025 22:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/0M08wq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC0610E33E
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Apr 2025 22:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743804062; x=1775340062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMgmhkxby6LeSjKjYBTKMHWPTtb/V8hqEfnxO+Ff3XA=;
 b=V/0M08wqwDZsMXs/UYzpYKQcPO1kaFURyHqbt9b+JxZvPW2VWFF7xZ9N
 lJitbnXF1P1F67d2Yis9PXDYJ9at71OmDrfNV/HrIH3DgUczoftoNmanA
 cuOUjRCoCDKzxnwSgLivSeuIuV+Ebiv61XiD7mQdwirxaMKOjGMkQ1m9E
 Bz8qIFBkG1+mMPGrDifXAGNThXp+WCMR9VuoNLzLrgTAoM2GrDBa1vTll
 X2hks4JYg+pWZpCYsoF4m0vRGA/ptljjN8M1sYh6kG8YDv/446nB5/VuD
 mPclC785cr5pJMfhb/94yxtJIzPed0RfZPypZ5Vi6fveJ0BGtJmXLHq/M Q==;
X-CSE-ConnectionGUID: pwCCvRtcRIK/nXa6+4PiMQ==
X-CSE-MsgGUID: ZKWkAec5QcyDjv0/sxEwFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55887505"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; d="scan'208";a="55887505"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 15:01:01 -0700
X-CSE-ConnectionGUID: qwbwrWm0QnW+EjvvCwzn6g==
X-CSE-MsgGUID: S/VW9WHlRZ+8ugKbN1ZoZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; d="scan'208";a="150635042"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 15:01:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique value
Date: Fri,  4 Apr 2025 15:00:54 -0700
Message-ID: <20250404220053.1758356-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When XE_BO_FLAG_PINNED_NORESTORE and XE_BO_FLAG_PINNED_LATE_RESTORE were
added, they were assigned BO flag values in the middle of the flag
range, requiring renumbering of the higher flags.  In both cases,
XE_BO_FLAG_CPU_ADDR_MIRROR was overlooked during renumbering because it
was defined below XE_BO_FLAG_GGTT_ALL and thus was not immediately
visible in code diffs changing this area of the code; this resulted in
XE_BO_FLAG_CPU_ADDR_MIRROR clashing with another flag.

Assign XE_BO_FLAG_CPU_ADDR_MIRROR a unique value, and also move the
definition of XE_BO_FLAG_GGTT_ALL down below all of the individual flags
so that this kind of mistake is less likely in the future.  Also, while
we're at it, fix up some space vs tab whitespace inconsistency in these
flag definitions.

Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
Fixes: 045448da87bf ("drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index f7e716f59948..0a19b50045b2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -40,21 +40,22 @@
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
 #define XE_BO_FLAG_PINNED_NORESTORE	BIT(18)
-#define XE_BO_FLAG_PINNED_LATE_RESTORE BIT(19)
-#define XE_BO_FLAG_GGTT0                BIT(20)
-#define XE_BO_FLAG_GGTT1                BIT(21)
-#define XE_BO_FLAG_GGTT2                BIT(22)
-#define XE_BO_FLAG_GGTT3                BIT(23)
-#define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
-					 XE_BO_FLAG_GGTT1 | \
-					 XE_BO_FLAG_GGTT2 | \
-					 XE_BO_FLAG_GGTT3)
-#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
+#define XE_BO_FLAG_PINNED_LATE_RESTORE	BIT(19)
+#define XE_BO_FLAG_GGTT0		BIT(20)
+#define XE_BO_FLAG_GGTT1		BIT(21)
+#define XE_BO_FLAG_GGTT2		BIT(22)
+#define XE_BO_FLAG_GGTT3		BIT(23)
+#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
 
+#define XE_BO_FLAG_GGTT_ALL		(XE_BO_FLAG_GGTT0 | \
+					 XE_BO_FLAG_GGTT1 | \
+					 XE_BO_FLAG_GGTT2 | \
+					 XE_BO_FLAG_GGTT3)
+
 #define XE_BO_FLAG_GGTTx(tile) \
 	(XE_BO_FLAG_GGTT0 << (tile)->id)
 
-- 
2.48.1

