Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CF0F53D81
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 18:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8095910E283;
	Mon, 16 Mar 2026 18:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1ltehLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD05C10E283
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773684522; x=1805220522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zJ/l9geOskrOb3yLI8pDB1qcYDXpi4nTCy8E4NTiq9A=;
 b=m1ltehLjJjVdW1bNaDTlrdz8E605qqjOTyI6/f0A6kd+FvMwpgILD+H9
 Q/xlQ5OWVfZhq5N87N+bIgAZjkcLeOm8w2iAYVVmyAn6yQS299CBPLCUq
 Ad75qrxezscRK4zqtswxrCPqzMlZU1CJIXV/OokLD2g4RE3PwtCj0WdpM
 pznuzKMD1Du3ZvBnMl1N4OxT6lmaK97GqKnSs1G2oZWUKJwluzygbEj4N
 NAUOB5E3Vzfwx+dxKbP0KGIFJwC2VENl3B9wwlRkNOmoW1kNY8hUhhWYB
 5RMbgd8l6juPExMIWbzxuA7JOz1lSvJAnU1vdLZzbytdQmppWVbDAfy92 Q==;
X-CSE-ConnectionGUID: CHkjcFx1QCu4cllXahnA7g==
X-CSE-MsgGUID: qTy+rXtOTA+dlD9ZUJrPtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85026016"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85026016"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:08:31 -0700
X-CSE-ConnectionGUID: MYinhtb2SwWERIo0mV/76Q==
X-CSE-MsgGUID: phEasyz9RIeS3J67FshZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222213756"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 11:08:30 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 4/4] drm/xe: Fix type and parameter name mismatches in
 kernel-doc references
Date: Mon, 16 Mar 2026 18:03:19 +0000
Message-ID: <20260316180322.1721237-10-shuicheng.lin@intel.com>
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

Fix kernel-doc references that point to wrong type or parameter names:

- xe_guc_capture_types.h: register_data_type ->
  capture_register_data_type to match actual enum name
- xe_oa_types.h: enum @drm_xe_oa_format_type ->
  enum drm_xe_oa_format_type (spurious '@' before type name)
- xe_pt_walk.h: @sizes -> @shifts to match actual struct member,
  @start -> @addr to match actual parameter name,
  page.table. -> page table. (typo)

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture_types.h | 2 +-
 drivers/gpu/drm/xe/xe_oa_types.h          | 2 +-
 drivers/gpu/drm/xe/xe_pt_walk.h           | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index 6cb439115597..04e9bbe3e20b 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -32,7 +32,7 @@ struct __guc_mmio_reg_descr {
 	/**
 	 * @data_type: data type of the register
 	 * Could be 32 bit, low or hi dword of a 64 bit, see enum
-	 * register_data_type
+	 * capture_register_data_type
 	 */
 	enum capture_register_data_type data_type;
 	/** @flags: Flags for the register */
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 0c48c1e0c2c6..8906c3084b5f 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -67,7 +67,7 @@ struct xe_oa_format {
 	u32 counter_select;
 	/** @size: record size as written by HW (multiple of 64 byte cachelines) */
 	int size;
-	/** @type: of enum @drm_xe_oa_format_type */
+	/** @type: of enum drm_xe_oa_format_type */
 	int type;
 	/** @header: 32 or 64 bit report headers */
 	enum xe_oa_report_header header;
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
index 5c02c244f7de..6a1741f83f36 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.h
+++ b/drivers/gpu/drm/xe/xe_pt_walk.h
@@ -34,7 +34,7 @@ struct xe_pt_walk {
 	 * changed during the walk.
 	 */
 	const u64 *shifts;
-	/** @max_level: Highest populated level in @sizes */
+	/** @max_level: Highest populated level in @shifts */
 	unsigned int max_level;
 	/**
 	 * @shared_pt_mode: Whether to skip all entries that are private
@@ -49,7 +49,7 @@ struct xe_pt_walk {
 
 /**
  * typedef xe_pt_entry_fn - gpu page-table-walk callback-function
- * @parent: The parent page.table.
+ * @parent: The parent page table.
  * @offset: The offset (number of entries) into the page table.
  * @level: The level of @parent.
  * @addr: The virtual address.
@@ -118,7 +118,7 @@ static inline bool xe_pt_covers(u64 addr, u64 end, unsigned int level,
  * @level: Page table level.
  * @walk: Walk info.
  *
- * Return: The number of page table entries at this level between @start and
+ * Return: The number of page table entries at this level between @addr and
  * @end.
  */
 static inline pgoff_t
-- 
2.43.0

