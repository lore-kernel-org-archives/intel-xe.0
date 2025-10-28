Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA480CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8927C10E5CE;
	Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/NwFafZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C84310E3E8
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654310; x=1793190310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pl77ZwRvxfMueeh1Q3Cqjv7dYkyICBt5nNsLlaWt5qw=;
 b=L/NwFafZj4a8u2lBBB52wvQqjgEtRTeCT5ANdFZBUifXjyKuFavfrbbz
 VvvFYaCtQOmAyBkK01RN+huJfrA91pxxeazq+4ZmBYOQRF1B+TCaOm92e
 mvjVuaEncvrpUVc9IZdZZCEgJmc+PUpmAMwDwfDafCKdI8gsmOZwyay/X
 fpC8iH6wgN2Me8Va2okFQMvpxP17PDflcLRUZ5Bp2sH+0bW4vhn9wddzp
 T6n1aoWBPrD/n1eCdY3WxnX3l6Ya2kZxBVP1jlEZt9qxxCUQBBDb/tsgd
 S314TgTB6t/c6NhYrdyIiycmZjfhGQg/tdahavFEQ407cfAwv1W2KrcfF A==;
X-CSE-ConnectionGUID: g/GZI1zBQqyxRlN9VSxnNw==
X-CSE-MsgGUID: D8KQ8c4oTZW4w2LYPF0kaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956623"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956623"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:06 -0700
X-CSE-ConnectionGUID: BidAtpasQ7+/wHnA7Q0tsA==
X-CSE-MsgGUID: 9GmAhjm9QCmhXx65yvWlbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524427"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:04 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 2/9] drm/xe/bo: Add purgeable bo state tracking and field
 madv to xe_bo
Date: Tue, 28 Oct 2025 17:54:08 +0530
Message-ID: <20251028122415.1136721-3-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
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

- New enum xe_madv_state defining three states:
  * XE_MADV_PURGEABLE_WILLNEED:  BO is actively needed, should not be purged
  * XE_MADV_PURGEABLE_DONTNEED: BO can be purged if memory pressure exists
  * XE_MADV_PURGEABLE_PURGED: BO has been purged by the kernel

- Add atomic_t madv field to struct xe_bo for state tracking
  of purgeable state across concurrent access paths

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h       | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 911d5b90461a..d85c691d06e0 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -85,6 +85,28 @@
 
 #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
 
+/**
+ * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
+ *
+ * This enum defines the possible purgeable states for a buffer object,
+ * allowing userspace to provide memory usage hints to the kernel for
+ * better memory management under pressure.
+ *
+ * @XE_MADV_PURGEABLE_WILLNEED: The buffer object are needed and should not be purged.
+ * This is the default state.
+ * @XE_MADV_PURGEABLE_DONTNEED: The buffer object are not currently needed and can be
+ * purged by the kernel under memory pressure.
+ * @XE_MADV_PURGEABLE_PURGED: The buffer object have been purged by the kernel.
+ *
+ * Accessing a purged buffer will result in an error. The user must call
+ * madvise(WILLNEED) to re-validate the buffer before using it again.
+ */
+enum xe_madv_purgeable_state {
+	XE_MADV_PURGEABLE_WILLNEED,
+	XE_MADV_PURGEABLE_DONTNEED,
+	XE_MADV_PURGEABLE_PURGED,
+};
+
 struct sg_table;
 
 struct xe_bo *xe_bo_alloc(void);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d4fe3c8dca5b..57b4dc7012e2 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -108,6 +108,9 @@ struct xe_bo {
 	 * from default
 	 */
 	u64 min_align;
+
+	/** @madv_purgeable: user space advise on BO purgeability */
+	atomic_t madv_purgeable;
 };
 
 #endif
-- 
2.43.0

