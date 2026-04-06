Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B4BFB5170
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 20:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25C610E2D8;
	Mon,  6 Apr 2026 20:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fr/41wBV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBD110E2C7
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775507715; x=1807043715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dUaiCd1RiC8mGTf7+eMEfG/OR/x/uug1Xea0pjlVCK8=;
 b=fr/41wBVrT79DLrEVxsa75FxIhYEU/xLF3ywI9+th2eMgcYXMpiouWnE
 wAuASNhlfujWUOG5z38dCY94HJEak4C7cJ+juCdQxjV3niC2BQt4iyPMj
 1/VKSlDqk7C76L/VSbvBN8UKAEEZwugomjlqUrcUalE7eVXbleO3UN0Mt
 GMblNjV+TyFIF3NJ1OM9YgGpzFTBKMStVt477Yk+57nKKI1qUwrnLLQcB
 1qtB8SoSbtniJnvQkeCXB78XK0by6+zuvGgfC4NwZyUFWrnz+MMwFy7UK
 8wMoKHgsBWG3Y7Axk7OC0nTfHfUwAjFon1zge3cKGdAQ+UIuwk8Zj9iMG g==;
X-CSE-ConnectionGUID: JjOis6nkRTKzxnOcJYiW2w==
X-CSE-MsgGUID: nLmqA5bjQ4SGFPRUJfJydg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75503342"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="75503342"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:35:14 -0700
X-CSE-ConnectionGUID: 2UPowS2FT6Oq8YUiPhAGoA==
X-CSE-MsgGUID: UN4dI6vfQBKatujeWH5z8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227137309"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 13:35:13 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Fix kernel-doc comment syntax issues in header
 files
Date: Mon,  6 Apr 2026 20:31:20 +0000
Message-ID: <20260406203122.3392365-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260406203122.3392365-1-shuicheng.lin@intel.com>
References: <20260406203122.3392365-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix doc comment formatting that does not conform to kernel-doc syntax
rules:

- xe_guc_relay_types.h: Add missing space after '/**' in member doc
  comment (/**@lock -> /** @lock)
- xe_oa_types.h: Fix struct documentation to use proper kernel-doc
  format (/** @xe_oa_buffer: -> /** struct xe_oa_buffer -)
- xe_pagefault_types.h: Use dash instead of colon as separator in
  struct doc (struct xe_pagefault_queue: -> struct xe_pagefault_queue -)
- xe_pt_walk.h: Use dash instead of colon as separator in function
  docs (xe_pt_num_entries: -> xe_pt_num_entries -,
  xe_pt_offset: -> xe_pt_offset -)

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_relay_types.h | 2 +-
 drivers/gpu/drm/xe/xe_oa_types.h        | 4 +++-
 drivers/gpu/drm/xe/xe_pagefault_types.h | 2 +-
 drivers/gpu/drm/xe/xe_pt_walk.h         | 4 ++--
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay_types.h b/drivers/gpu/drm/xe/xe_guc_relay_types.h
index 20eee10856b2..b99a6686416b 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_relay_types.h
@@ -15,7 +15,7 @@
  * struct xe_guc_relay - Data used by the VF-PF Relay Communication over GuC.
  */
 struct xe_guc_relay {
-	/**@lock: protects all internal data. */
+	/** @lock: protects all internal data. */
 	spinlock_t lock;
 
 	/** @worker: dispatches incoming action messages. */
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index acd78bc14822..0c48c1e0c2c6 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -154,7 +154,9 @@ struct xe_oa {
 	u16 oa_unit_ids;
 };
 
-/** @xe_oa_buffer: State of the stream OA buffer */
+/**
+ * struct xe_oa_buffer - State of the stream OA buffer
+ */
 struct xe_oa_buffer {
 	/** @format: data format */
 	const struct xe_oa_format *format;
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index aa3cfae01b9c..c4ee625b93dd 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -112,7 +112,7 @@ struct xe_pagefault {
 };
 
 /**
- * struct xe_pagefault_queue: Xe pagefault queue (consumer)
+ * struct xe_pagefault_queue - Xe pagefault queue (consumer)
  *
  * Used to capture all device page faults for deferred processing. Size this
  * queue to absorb the device’s worst-case number of outstanding faults.
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
index 07c8f409f236..dcedfc9a28df 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.h
+++ b/drivers/gpu/drm/xe/xe_pt_walk.h
@@ -111,7 +111,7 @@ static inline bool xe_pt_covers(u64 addr, u64 end, unsigned int level,
 }
 
 /**
- * xe_pt_num_entries: Number of page-table entries of a given range at this
+ * xe_pt_num_entries - Number of page-table entries of a given range at this
  * level
  * @addr: Start address.
  * @end: End address.
@@ -132,7 +132,7 @@ xe_pt_num_entries(u64 addr, u64 end, unsigned int level,
 }
 
 /**
- * xe_pt_offset: Offset of the page-table entry for a given address.
+ * xe_pt_offset - Offset of the page-table entry for a given address.
  * @addr: The address.
  * @level: Page table level.
  * @walk: Walk info.
-- 
2.43.0

