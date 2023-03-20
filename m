Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2A2C6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 17:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AF010E62C;
	Mon, 20 Mar 2023 17:50:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7199010E2D0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679334601; x=1710870601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IsECOvXBioKMief2aLYxjoGC9JuNZr/nkUaDhySzFiI=;
 b=MY7uEazXx/bvnfgZrRM2y7eLlB7ifvs+db1XrGnhaIRGEpcZl6X9JSsx
 5h8Dp1whxp5c9WX8s99Z5PpeoxZ5LF7iErr6zUmVTKCCghqJDKA6ADT6Q
 qhmYI3Hrq8LIbtAzunmOoOLyyZmbcLtG3JVTx22mOTrCN93nA+iCr0M5W
 D9jMRNMeR7S1rqq66GaOXkjvBIErFF3xmcAIS1SGCt/KUuj1IPi2wb9Tl
 zmiItvM80xgmiOUnfL0AyWdsHxrWA+pMQW0cqlNVrJH3VTnhOanL5QTND
 nzydMQtr1oDoSLiNV6FlzF+9Ktj6JkebYQL98hmLnLTqDzB64u24+dQBG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="425007334"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="425007334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 10:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631204484"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="631204484"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 10:49:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Mar 2023 10:49:44 -0700
Message-Id: <20230320174944.650704-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Drop zero length arrays
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

Zero-length arrays as fake flexible arrays are deprecated and we are
moving towards adopting C99 flexible-array members instead.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_types.h    | 2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index d0f1849e8ad5..36bfaeec23f4 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -151,7 +151,7 @@ struct xe_engine {
 	/** @entity: DRM sched entity for this engine (1 to 1 relationship) */
 	struct drm_sched_entity *entity;
 	/** @lrc: logical ring context for this engine */
-	struct xe_lrc lrc[0];
+	struct xe_lrc lrc[];
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index fd1d75996127..5534bfacaa16 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -40,7 +40,7 @@ struct xe_sched_job {
 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
 	u32 migrate_flush_flags;
 	/** @batch_addr: batch buffer address of job */
-	u64 batch_addr[0];
+	u64 batch_addr[];
 };
 
 #endif
-- 
2.34.1

