Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1697DFB5164
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 20:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50EF10E2A1;
	Mon,  6 Apr 2026 20:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/R/BsCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F158910E2A1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775507713; x=1807043713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R7vquLMzgCrzAD8x+k/1bC9nNXTFZU8bpGMUrEZ5N7w=;
 b=R/R/BsCE7twG+kR9FDO+/7ra6Kwjmcj/jxCT7Op22L5/5OpFfvlEgLvp
 bfZfRZ/QzscldTMlO4CjifxvOGY1spOZyPApXJti9Hl9XS3cHTJiDD1hF
 X7XMJnEXnWA4HSICBYpWaNoHIi8Q+pcIwMDlJ5xqUydAD5AK0C356hRo7
 zwgBaYxViDP2indJZfivlCTsfhTbKZitOfhkJrG7RhuzlEroysm6MwgJ3
 uYwTeUFJ40L37coLcR//+jMs5RiqGGO23zdzdrmwDIqqtnqavkCKS36hV
 ZnUttFs4/dSHV9XZvz1/tnnrMVSSlVQBuDdQi/Tgb59ckIiu7RNp0pbH7 g==;
X-CSE-ConnectionGUID: 8gaYNthES9eGcKIYXdgK+Q==
X-CSE-MsgGUID: zYw4X8tjQPWvlEluMwjQWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75503334"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="75503334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:35:12 -0700
X-CSE-ConnectionGUID: CvycKj1TQwuF3T5ZK6P9ew==
X-CSE-MsgGUID: Au4rnhVYRUacBMcFmobXsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227137301"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 13:35:11 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 2/4] drm/xe: Add missing '@' prefix to kernel-doc member
 tags
Date: Mon,  6 Apr 2026 20:31:19 +0000
Message-ID: <20260406203122.3392365-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260406203122.3392365-1-shuicheng.lin@intel.com>
References: <20260406203122.3392365-1-shuicheng.lin@intel.com>
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

Add the required '@' prefix to member documentation tags that were
missing it. Without the prefix, kernel-doc does not associate the
comment with the struct member.

- xe_guc_ct_types.h: snapshot_ct -> @snapshot_ct,
  snapshot_log -> @snapshot_log
- xe_pagefault_types.h: consumer.reserved -> @consumer.reserved
- xe_pt_types.h: addr -> @addr

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct_types.h    | 4 ++--
 drivers/gpu/drm/xe/xe_pagefault_types.h | 2 +-
 drivers/gpu/drm/xe/xe_pt_types.h        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index c81996f8915a..f88e588af0d3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -102,9 +102,9 @@ struct xe_dead_ct {
 	bool reported;
 	/** @worker: worker thread to get out of interrupt context before dumping */
 	struct work_struct worker;
-	/** snapshot_ct: copy of CT state and CTB content at point of error */
+	/** @snapshot_ct: copy of CT state and CTB content at point of error */
 	struct xe_guc_ct_snapshot *snapshot_ct;
-	/** snapshot_log: copy of GuC log at point of error */
+	/** @snapshot_log: copy of GuC log at point of error */
 	struct xe_guc_log_snapshot *snapshot_log;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index b3289219b1be..aa3cfae01b9c 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -86,7 +86,7 @@ struct xe_pagefault {
 		u8 engine_class;
 		/** @consumer.engine_instance: engine instance */
 		u8 engine_instance;
-		/** consumer.reserved: reserved bits for future expansion */
+		/** @consumer.reserved: reserved bits for future expansion */
 		u64 reserved;
 	} consumer;
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 84b51d3762a4..a7d1bb708b69 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -34,7 +34,7 @@ struct xe_pt {
 	bool rebind;
 	bool is_compact;
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
-	/** addr: Virtual address start address of the PT. */
+	/** @addr: Virtual address start address of the PT. */
 	u64 addr;
 #endif
 };
-- 
2.43.0

