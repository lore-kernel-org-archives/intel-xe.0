Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8CC606A6A9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 21:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dj5WOMBV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9710E203;
	Fri, 20 Nov 2026 21:11:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DBA10E203
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795209070; x=1826745070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rgKtMtgQBgIy266LfrIdtUnJP88Y6Ts4kjumMMXaX/w=;
 b=Dj5WOMBVh8+rYtoQz9GfkSk7lXzRwAIdMmtQmcvzW82AKVN5W6VFMGwU
 jYKPJk4TSLLH8H4aYOQkWRwuBPUgrLDNoXlTBJHywNDYQNbRitQ610bX4
 eab9KgAc87IBKNhsf5zhJaVT2LeKqfPHwXTqDbO5iPtXbPGgOt3xVLEkR
 eM+QtdBvdOwA6N9H4Zu3N8y8zuXb9hy7rGJF6F6ODQqfoSb74BJprNfl9
 m5Zf0EUWlXn3TpAw4X1pMdOs3Qbz5YXzVxr6xeE44nO8W+hq1K9jDaeyV
 X8zFDHc8Eln0hfX8EtPZTA+QvRWd+iQtjXnsDME94cS5rFKmJm8LJ36mJ g==;
X-CSE-ConnectionGUID: QKdGszg0RWKLThB/C5GSSw==
X-CSE-MsgGUID: heDT2Y9eROKNjnN65B6nmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4126978"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4126978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 13:11:09 -0800
X-CSE-ConnectionGUID: 6ux2+F74THCLICpSoutELw==
X-CSE-MsgGUID: ZZaVwf9XQlaVlyrec9LA7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11140548"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2026 13:11:08 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 1/3] drm/xe/lrc: Snapshot configfs ctx_restore_post_bb at
 probe
Date: Fri, 20 Nov 2026 22:12:01 +0100
Message-ID: <20261120211203.2119555-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120211203.2119555-1-tomasz.lis@intel.com>
References: <20261120211203.2119555-1-tomasz.lis@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reading the configfs ctx_restore_post_bb setting by searching a matching
entry each time is a little less performant, but more importantly it
creates dependencies between xe_configfs.su_mutex and other locks.

This complicates further changes significantly.

Avoid creating new lock dependencies by copying the post_bb commands into
struct xe_device at probe time, before any LRC is created, and reading
that copy when building the WA BB. The setting can't be changed once the
driver is bound (configfs stores return -EBUSY), so a probe-time copy
is completely legal. The copy is also drm-managed, so LRC setup no longer
relies on a pointer into the configfs device that was documented as only
valid during probe.

The ctx_restore_mid_bb is read from configfs the same way, but isn't part
of this possible locking dependency chain, so leave it as is.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  5 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++
 drivers/gpu/drm/xe/xe_lrc.c          | 42 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_lrc.h          |  1 +
 4 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c5433fbae18d..3781351b2d3a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -50,6 +50,7 @@
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
 #include "xe_log.h"
+#include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_mmio_gem.h"
 #include "xe_module.h"
@@ -923,6 +924,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_lrc_snapshot_configfs_post_bb(xe);
+	if (err)
+		return err;
+
 	err = xe_mmio_probe_tiles(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a31949073..1be8cbdb7096 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -103,6 +103,18 @@ struct xe_device {
 	/** @devcoredump: device coredump */
 	struct xe_devcoredump devcoredump;
 
+	/**
+	 * @ctx_restore_post_bb: per engine class snapshot of the configfs
+	 * ctx_restore_post_bb setting, taken at probe so that LRC setup does
+	 * not need to take configfs locks.
+	 */
+	struct {
+		/** @cs: batch commands, owned by the drm managed memory */
+		const u32 *cs;
+		/** @len: batch length in dwords */
+		u32 len;
+	} ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
+
 	/** @desc: device descriptor */
 	const struct xe_device_desc *desc;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 54d50b1b28eb..8b76e949abb7 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -7,6 +7,8 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include <drm/drm_managed.h>
+
 #include <linux/ascii85.h>
 #include <linux/panic.h>
 
@@ -1180,18 +1182,50 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	return cmd - batch;
 }
 
+/**
+ * xe_lrc_snapshot_configfs_post_bb() - Copy configfs ctx_restore_post_bb setting
+ * @xe: the &xe_device
+ *
+ * Keep a private copy of the configfs setting, so that LRC setup, which may run
+ * in the job submission path, doesn't depend on configfs locks.
+ * Must be called at probe, before any LRC is created.
+ *
+ * Return: zero on success, negative error code on failure
+ */
+int xe_lrc_snapshot_configfs_post_bb(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	enum xe_engine_class class;
+
+	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
+		const u32 *cs = NULL;
+		u32 len;
+
+		len = xe_configfs_get_ctx_restore_post_bb(pdev, class, &cs);
+		if (!len)
+			continue;
+
+		xe->ctx_restore_post_bb[class].cs =
+			devm_kmemdup(xe->drm.dev, cs, len * sizeof(u32), GFP_KERNEL);
+		if (!xe->ctx_restore_post_bb[class].cs)
+			return -ENOMEM;
+
+		xe->ctx_restore_post_bb[class].len = len;
+	}
+
+	return 0;
+}
+
 static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
 						  struct xe_hw_engine *hwe,
 						  u32 *batch, size_t max_len,
 						  bool indirect)
 {
 	struct xe_device *xe = gt_to_xe(lrc->gt);
-	const u32 *user_batch;
+	const u32 *user_batch = xe->ctx_restore_post_bb[hwe->class].cs;
+	u32 count = xe->ctx_restore_post_bb[hwe->class].len;
 	u32 *cmd = batch;
-	u32 count;
 
-	count = xe_configfs_get_ctx_restore_post_bb(to_pci_dev(xe->drm.dev),
-						    hwe->class, &user_batch);
 	if (!count)
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 840f303db97e..e0b4c44c4065 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -108,6 +108,7 @@ static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
 }
 
 size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
+int xe_lrc_snapshot_configfs_post_bb(struct xe_device *xe);
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
-- 
2.43.0

