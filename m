Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9674E9A04B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABF510E628;
	Wed, 18 Feb 2026 20:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8MZ9WxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B7310E628
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448185; x=1802984185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtPM5fF1LI6SSSkMlSrMDVRTIqAYjEIVbL+T0W/P+y4=;
 b=m8MZ9WxKOKXpU0dDC9Dw2QkNFMoC2sVkNRU4OROn6N7lUPTaTbJ5dWy6
 cFj/CwSYVYIvKDqF6RZz89MCtYAHD7fSaXiqB3idi7UieegnTgfyk0YNV
 1IKOSEZQG+l0+1o8aSMT3dJPtRFmC2MGI6+L+TM5t54TcOJnSwXodRSn5
 nMH8nQDWvpXPQwv1AjwqRwAKcX5QRnPxCG6O3IvsVR8rjIA1y6pnkFRgj
 UiswyCf2ecpuj6fBOoMvUA+zsQ5ukPKWpBvgYekJUAj4J73DFDT/wikBU
 26I8tP2F2vJSUgyr5t4jmHW9MB4UX3rgj1yGPQzmXFgp4ZeJBh1uUkMql Q==;
X-CSE-ConnectionGUID: cixtcl9HT1iV5KiSPltmaw==
X-CSE-MsgGUID: DZ4Ma91aRzSNL8MvvuHLKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710585"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710585"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:25 -0800
X-CSE-ConnectionGUID: APwXxyzlT5uckG0b29fmwQ==
X-CSE-MsgGUID: YjbZNfHySUOOHTB9ACsmvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548241"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:22 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 03/10] drm/xe/pf: Add functions for VRAM provisioning
Date: Wed, 18 Feb 2026 21:55:45 +0100
Message-ID: <20260218205553.3561-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
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

We already have functions to configure VF LMEM (aka VRAM) on the
tile/GT level, used by the auto-provisioning and debugfs, but we
also need functions that will work on the device level that will
configure VRAM on all tiles at once.

We will use these new functions in upcoming patch.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: fix typo, allow VRAM changes only when LMTT (Piotr)
    use xe_lmtt_page_size() instead local helper
    fix kernel-doc (CI)
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 106 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   4 +
 2 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 01470c42e8a7..f22ff65c59aa 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -7,6 +7,7 @@
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_policy.h"
+#include "xe_lmtt.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_provision.h"
@@ -436,3 +437,108 @@ int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int v
 
 	return !count ? -ENODATA : 0;
 }
+
+static u64 vram_per_tile(struct xe_tile *tile, u64 total)
+{
+	struct xe_device *xe = tile->xe;
+	unsigned int tcount = xe->info.tile_count;
+	u64 alignment = xe_lmtt_page_size(&tile->sriov.pf.lmtt);
+
+	total = round_up(total, tcount * alignment);
+	return div_u64(total, tcount);
+}
+
+/**
+ * xe_sriov_pf_provision_bulk_apply_vram() - Change VRAM provisioning for all VFs.
+ * @xe: the PF &xe_device
+ * @size: the VRAM size in [bytes] to set
+ *
+ * Change all VFs VRAM (LMEM) provisioning on all tiles.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_bulk_apply_vram(struct xe_device *xe, u64 size)
+{
+	unsigned int num_vfs = xe_sriov_pf_get_totalvfs(xe);
+	struct xe_tile *tile;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	xe_assert(xe, xe_device_has_lmtt(xe));
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_tile(tile, xe, id) {
+		err = xe_gt_sriov_pf_config_bulk_set_lmem_locked(tile->primary_gt,
+								 VFID(1), num_vfs,
+								 vram_per_tile(tile, size));
+		result = result ?: err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_provision_apply_vf_vram() - Change single VF VRAM allocation.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0 == PFID)
+ * @size: VRAM size to set
+ *
+ * Change VF's VRAM provisioning on all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_apply_vf_vram(struct xe_device *xe, unsigned int vfid, u64 size)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	xe_assert(xe, vfid);
+	xe_assert(xe, xe_device_has_lmtt(xe));
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_tile(tile, xe, id) {
+		err = xe_gt_sriov_pf_config_set_lmem_locked(tile->primary_gt, vfid,
+							    vram_per_tile(tile, size));
+		result = result ?: err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_provision_query_vf_vram() - Query VF's VRAM allocation.
+ * @xe: the PF &xe_device
+ * @vfid: the VF identifier (can't be 0 == PFID)
+ * @size: placeholder for the returned VRAM size
+ *
+ * Query VF's VRAM provisioning from all tiles/GTs.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_query_vf_vram(struct xe_device *xe, unsigned int vfid, u64 *size)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+	u64 total = 0;
+
+	xe_assert(xe, vfid);
+
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
+	for_each_tile(tile, xe, id)
+		total += xe_gt_sriov_pf_config_get_lmem_locked(tile->primary_gt, vfid);
+
+	*size = total;
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
index bccf23d51396..f26f49539697 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
@@ -24,6 +24,10 @@ int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio);
 int xe_sriov_pf_provision_apply_vf_priority(struct xe_device *xe, unsigned int vfid, u32 prio);
 int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int vfid, u32 *prio);
 
+int xe_sriov_pf_provision_bulk_apply_vram(struct xe_device *xe, u64 size);
+int xe_sriov_pf_provision_apply_vf_vram(struct xe_device *xe, unsigned int vfid, u64 size);
+int xe_sriov_pf_provision_query_vf_vram(struct xe_device *xe, unsigned int vfid, u64 *size);
+
 int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
 int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
 
-- 
2.47.1

