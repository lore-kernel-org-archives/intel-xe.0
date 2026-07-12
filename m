Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625E0C44501
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F6310E40A;
	Sun, 12 Jul 2026 11:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krXEuokq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D124810E2BB
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783854891; x=1815390891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UpXlKa2q6ijjtqawxFjBUnOwM+UsXn8KyU3jsWe0N54=;
 b=krXEuokqJSrNsK2kfalmvxk9V/n4ALBhaSbC6alyomv4A954emjgkbB1
 A61WismKjYZkaJ34gXea2Ie+PLGarrXYkGWermMz6kEdcIW+qkmedUSfN
 fwu4qUSlhD96yOUpSV+Jtep47ArOKyPm/m2kJYDKZdF3cB00xjb3waRT+
 hLRxNjBhO/5NhZ3LJ2+J94/otnszt10KlwBKBlmKq8Dsar8XRm0qehZn2
 IUzW5f+Zjtt1WSnxnh2RCmu6N0f7AH8C8V8FxcPVeT2nzrTZxtGpjWlqQ
 fkia+vZ+byLcOEpVrBarTN+9/fb78kZYzpjD2MUs9sS4V32FQJ99ta0a0 A==;
X-CSE-ConnectionGUID: 4//7WKAjQk++vggOAFGuag==
X-CSE-MsgGUID: h3a+qNbrQCueTUZmFlbTcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84457619"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84457619"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 04:14:51 -0700
X-CSE-ConnectionGUID: tFKbOYLTQcu/Z3KsycWsMg==
X-CSE-MsgGUID: iTAiWsKmSdKMPpUArpLckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255367703"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 04:14:51 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v3 1/8] drm/xe: add page size allocation control state to
 xe_device
Date: Sun, 12 Jul 2026 16:45:10 +0530
Message-ID: <20260712111517.1956177-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Introduce xe_page_size_alloc_ctrl_mode and add page_size_alloc_ctrl
state to struct xe_device along with mutex lock.

The new control supports forcing user BO allocations to 2M pages,
forcing them to 1G pages, or using a mixed round-robin mode across
4K, 64K, 2M, and 1G page sizes. Track the current mixed-mode index
in xe_device so allocation policy can be applied consistently.

v2
- make cur_index to atomic as update need in later patch to
  avoid race/concurency (sashiko)
v3
- reworded comments
- protect mode/index updates with a mutex for proper concurrency handling

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  9 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c9fa4bfed2b9..ab3e7f25d4cd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -923,6 +923,13 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+static void xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
+{
+	mutex_init(&xe->page_size_alloc_ctrl.lock);
+	xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE;
+	xe->page_size_alloc_ctrl.cur_index = 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1112,6 +1119,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_debug_page_size_alloc_ctrl_init(xe);
+
 	detect_preproduction_hw(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 022e08205897..8cd70756413b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -61,6 +61,21 @@ enum xe_wedged_mode {
 	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
 };
 
+/**
+ * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE: Use the normal allocation policy
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M: Force user BO allocations to 2M pages
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G: Force user BO allocations to 1G pages
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED: Select page sizes in round-robin order
+ *     (4K, 64K, 2M, 1G)
+ */
+enum xe_page_size_alloc_ctrl_mode {
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE = 0,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED
+};
+
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
 #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
@@ -474,6 +489,16 @@ struct xe_device {
 	/** @late_bind: xe mei late bind interface */
 	struct xe_late_bind late_bind;
 
+	/** @page_size_alloc_ctrl: User BO page-size allocation debug control state */
+	struct {
+		/** @mode: xe page size allocation control mode */
+		enum xe_page_size_alloc_ctrl_mode mode;
+		/** @cur_index: Round-robin index used by mixed mode */
+		u32 cur_index;
+		/** @lock: Protects @mode and @cur_index */
+		struct mutex lock;
+	} page_size_alloc_ctrl;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
-- 
2.43.0

