Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D368F53D7E
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 18:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E66A10E283;
	Mon, 16 Mar 2026 18:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nd7VzbTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488D910E283
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 18:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773684506; x=1805220506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ewAdBEU9wSmuu7IcTsOfzwzVTZkxrPdKN5AJikkEtfw=;
 b=nd7VzbTUFz1Y4tOmum8iNHlC6x907lKUpUq60Zw6Q6B5Dmwewlib96lI
 1tP5H+Pqn8h21ziP8sqBC/v1eFmp84+sdYyW7TCTyKT7r5kWKw5OY0DDv
 z4l0nqtuPmEz55BaVbQ9zi3zqV6R2hLnxvRWOr44XUzTdYIFRPkPbwK3C
 W1+SwSMf6muKUlHEu7pNaWMXLDKmTbN9HiEaz54PBuu1JebHbab3PWidq
 Z26cnXtS8EIYhyTEKdS7rTSlH2MbzJSE0t3FGWOZuy2iLsHWk0yp1iH4V
 VgCd5Y0C7yj4ynNgmjEv5ArDpde1d/49ne17l8s1ReIi0YV3pHhOaBvPk Q==;
X-CSE-ConnectionGUID: pyVnda3JSPy6Jv41Rcb8TA==
X-CSE-MsgGUID: ssOGmdRWQgyN3OP4D5kURw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85025995"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85025995"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:08:26 -0700
X-CSE-ConnectionGUID: wd26qsUKSQyND9bDA17BSw==
X-CSE-MsgGUID: uiwfl+NiSf+9w2AsA0GmKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222213735"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 11:08:25 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 2/4] drm/xe: Add missing '@' prefix to kernel-doc member tags
Date: Mon, 16 Mar 2026 18:03:17 +0000
Message-ID: <20260316180322.1721237-8-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316180322.1721237-6-shuicheng.lin@intel.com>
References: <20260316180322.1721237-6-shuicheng.lin@intel.com>
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
index 5da1ce5dc372..095d2be93e38 100644
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

