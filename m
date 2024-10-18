Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1D7D3C53F
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 03:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6163810E354;
	Fri, 18 Oct 2024 03:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7jdaQC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8FA10E354
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729220416; x=1760756416;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x3588U3liNnUkYJvKrpwlVitz5NFMGNw6nWTxVxeIVs=;
 b=T7jdaQC4BJCeVDUfgUa0oLVQ8zd8ipS7MnAzgGpOIRo/QTVnIwT8eB3O
 ltQBQR15r8Ut5oboUjn0vypOnrdj5tyZRsLyfV/sOjAVKQGjbRPam5+Wn
 qlSX2N1RdEXyW3T3z255Ia5GZ/w6a4NT9TWerivHbqkerZ3OPBKJ/Sieb
 IYzBoJxNvyARK8KcGG3rQDWNuThQUTVH4tbJv5gT5eEfj5w343Ktwxhs/
 enSebza+ugSkSuuxoQsuPSPQLR6+3JJ59ZR5he27sjn7uHSFV9IZZ8wIL
 YsJlqdg93659LP2nlNLLcyP7FI4G5uodqtD+5+H9lhTrhumvlIP9mYrgc g==;
X-CSE-ConnectionGUID: rRiW8hhoQTS2usPYatWdfw==
X-CSE-MsgGUID: E+17n8nmSy2y9AFzPZnsog==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28621160"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="28621160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 20:00:15 -0700
X-CSE-ConnectionGUID: UTMWVHhSSBOFmGQEiPyp5Q==
X-CSE-MsgGUID: MQ45OACGQ6Oaub7GeMW8Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="83382687"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 20:00:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Use __counted_by for flexible arrays
Date: Thu, 17 Oct 2024 20:00:39 -0700
Message-Id: <20241018030039.1077842-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Good practice to use __counted_by in kernel coding for flexible arrays.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 7deb480e26af..1158b6062a6c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -143,7 +143,7 @@ struct xe_exec_queue {
 	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
 	struct list_head hw_engine_group_link;
 	/** @lrc: logical ring context for this exec queue */
-	struct xe_lrc *lrc[];
+	struct xe_lrc *lrc[] __counted_by(width);
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 0d3f76fb05ce..426d261d7359 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -63,7 +63,7 @@ struct xe_sched_job {
 
 struct xe_sched_job_snapshot {
 	u16 batch_addr_len;
-	u64 batch_addr[];
+	u64 batch_addr[] __counted_by(batch_addr_len);
 };
 
 #endif
-- 
2.34.1

