Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278AFE63F17
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF7110E095;
	Sun, 15 Feb 2026 20:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IotYNyaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D7C10E079
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187621; x=1802723621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wVZvlElcqFlASsrcnLD739QLWxX4MQyfC4+AlrsmySU=;
 b=IotYNyaOdL+BHTuABdwRlp68qH/CV3KwK3aJiuCpWUjypU0y/GXoDLNa
 PO2EhMyZgECh32Uyh7iDyWatLVnItqHO7WR6zj7SeRgx/ZYwQx7xE1Xur
 X8hE0I4qeeyBhBMY0yGn8b0kgy8LF9Lg6ceOHm9xjAY2sEuXn7+LPRjXl
 aK8eG1nMAgIG4UHmf587COfDJujJzKerL1mLJ7peYwjfmP5YAJf0lWXUr
 smu95orhlaLYBAWp7Wat+g2f5UjZAGCcrFUmno/hEbuwQyvqMbJnnxhrW
 4WtT2Ob4ethsxl2k0NGWQZ1Nu7hZeWwKVL+1iLhM8Vx64JOFINChprYoU A==;
X-CSE-ConnectionGUID: frlOhe51RU2b8fts+hDERg==
X-CSE-MsgGUID: Uk+DgUOHQoyCbPmeaw/TAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996388"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996388"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:41 -0800
X-CSE-ConnectionGUID: 2te15FbEQp+8VgFz3AU4Yw==
X-CSE-MsgGUID: 3/B82v8tSJyX3QF6SU4hmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096592"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/9] drm/xe/pf: Add functions for VRAM provisioning
Date: Sun, 15 Feb 2026 21:33:16 +0100
Message-ID: <20260215203323.595-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

We already have functions to configure VF LMEM (aka VRAM) on the
tile/GT level, used by the auto-provisioning and debugfs, but we
also need functions that will work on the device level that will
configure VRAM on all tiles at once.

We will use these new functions in upcoming patch.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 108 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   4 +
 2 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 01470c42e8a7..e7187d03fe1b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -436,3 +436,111 @@ int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int v
 
 	return !count ? -ENODATA : 0;
 }
+
+static u64 vram_alignment(struct xe_device *xe)
+{
+	/* this might be platform dependent */
+	return SZ_2M;
+}
+
+static u64 vram_per_tile(struct xe_tile *tile, u64 total)
+{
+	struct xe_device *xe = tile->xe;
+	unsigned int tcount = xe->info.tile_count;
+	u64 alignment = vram_alignment(xe);
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
+ * xe_sriov_pf_provision_apply_vf_vram() - Change single VF VRAM allocatio.
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
+ * @prio: placeholder for the returned VRAM size
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

