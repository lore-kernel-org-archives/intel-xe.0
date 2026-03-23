Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D573EC01A9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3685D10E48A;
	Mon, 23 Mar 2026 09:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WevPovvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6A10E349
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258279; x=1805794279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GBV45AU1hAfUWH6RiqPaYDmtc9mbqvf8yKNMk/ye9C0=;
 b=WevPovvW61nDZFaWHoaEhksypw/Y4Zj4045U2uTMHAFt5HUKRSw8U4h3
 t0KF8cUazX5aRCdRQ2ERkkDLwY4cnOj43NftUnaRNB0/Conv+J/q1MCwj
 GFOYXii7WVY0el8MjRNRYIaHCiIx8Rdn2JPF74A4I+ytGF3941niMrVxC
 ASqBJy0AghXwdZqiThEoGEqEG22D5COHo2ZhbyOquvgTGSUVjFcNXIZLF
 xGMgjkzvOnxxhrB39ONI6jx6UgGHCMnNLctfXRziaX3eNFQt2eTl65l0S
 O7UnTowP6v9G3IszjpqyudyAg/AzylDQwUyLhAYlm9HRato3+LPR+x0ig w==;
X-CSE-ConnectionGUID: 7hlytxaFTcWNnxNWARVlqQ==
X-CSE-MsgGUID: Vx0VZUvlSWS+ck8SGmKMcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75221749"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75221749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:19 -0700
X-CSE-ConnectionGUID: sguVFDwtQsqk44iPd1+h+Q==
X-CSE-MsgGUID: vCrdOmlxQLqs/bN8BBa6Lw==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:17 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 02/12] drm/xe/bo: Add purgeable bo state tracking and field
 madv to xe_bo
Date: Mon, 23 Mar 2026 15:00:51 +0530
Message-ID: <20260323093106.2986900-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323093106.2986900-1-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
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

Add infrastructure for tracking purgeable state of buffer objects.
This includes:

Introduce enum xe_madv_purgeable_state with three states:
   - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
     purged. This is the default state for all BOs.

   - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
     can be purged by the kernel under memory pressure to reclaim
     resources. Only non-shared BOs can be marked as DONTNEED.

   - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
     Accessing a purged BO results in error. Follows i915 semantics
     where once purged, the BO remains permanently invalid ("once
     purged, always purged").

Add madv_purgeable field to struct xe_bo for state tracking
  of purgeable state across concurrent access paths

v2:
  - Add xe_bo_is_purged() helper, improve state documentation

v3:
  - Add the kernel doc(Matthew Brost)
  - Add the new helpers xe_bo_madv_is_dontneed(Matthew Brost)

v4:
  - @madv_purgeable atomic_t → u32 change across all relevant
    patches (Matt)

v5:
  - Add locking documentation to madv_purgeable field comment (Matt)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h       | 56 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h |  6 ++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 2cbac16f7db7..fb5541bdf602 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -87,6 +87,28 @@
 
 #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
 
+/**
+ * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
+ *
+ * This enum defines the possible purgeable states for a buffer object,
+ * allowing userspace to provide memory usage hints to the kernel for
+ * better memory management under pressure.
+ *
+ * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
+ * This is the default state.
+ * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
+ * purged by the kernel under memory pressure.
+ * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
+ *
+ * Accessing a purged buffer will result in an error. Per i915 semantics,
+ * once purged, a BO remains permanently invalid and must be destroyed and recreated.
+ */
+enum xe_madv_purgeable_state {
+	XE_MADV_PURGEABLE_WILLNEED,
+	XE_MADV_PURGEABLE_DONTNEED,
+	XE_MADV_PURGEABLE_PURGED,
+};
+
 struct sg_table;
 
 struct xe_bo *xe_bo_alloc(void);
@@ -215,6 +237,40 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
 	return bo->pxp_key_instance;
 }
 
+/**
+ * xe_bo_is_purged() - Check if buffer object has been purged
+ * @bo: The buffer object to check
+ *
+ * Checks if the buffer object's backing store has been discarded by the
+ * kernel due to memory pressure after being marked as purgeable (DONTNEED).
+ * Once purged, the BO cannot be restored and any attempt to use it will fail.
+ *
+ * Context: Caller must hold the BO's dma-resv lock
+ * Return: true if the BO has been purged, false otherwise
+ */
+static inline bool xe_bo_is_purged(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
+}
+
+/**
+ * xe_bo_madv_is_dontneed() - Check if BO is marked as DONTNEED
+ * @bo: The buffer object to check
+ *
+ * Checks if userspace has marked this BO as DONTNEED (i.e., its contents
+ * are not currently needed and can be discarded under memory pressure).
+ * This is used internally to decide whether a BO is eligible for purging.
+ *
+ * Context: Caller must hold the BO's dma-resv lock
+ * Return: true if the BO is marked DONTNEED, false otherwise
+ */
+static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
+}
+
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d4fe3c8dca5b..ff8317bfc1ae 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -108,6 +108,12 @@ struct xe_bo {
 	 * from default
 	 */
 	u64 min_align;
+
+	/**
+	 * @madv_purgeable: user space advise on BO purgeability, protected
+	 * by BO's dma-resv lock.
+	 */
+	u32 madv_purgeable;
 };
 
 #endif
-- 
2.43.0

