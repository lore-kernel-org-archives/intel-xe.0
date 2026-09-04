Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FBEC79F84
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B259210F833;
	Fri,  4 Sep 2026 02:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPMzfJXn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD4010E1CD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788488535; x=1820024535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xHjKxa+pX7HFaAD70e+D/LTtGIcZ9rORP/N9cHfVC64=;
 b=fPMzfJXnExtxUfowKzpXbcv84a5ednYZLe4Ft4GH0TjpJw2bsZF6/LTy
 yauJEcTuYhsEC5EoBicYiVBt+tlciGIIJi9G4VYS19CI+4eLC3DQte2SR
 QZOD4Tt1gTDxV9je6g7TIRsrTCtOmgcSKqMBbw6l1jcSs+jdYo4QKuIG+
 iPwy5oYG4Bn3ct3LSLhuS8zwDaS7M5xgOzd9aTnZTNPKrO6VlGlQaRY8h
 Vx6QAUH4UlZdXzG9JJWu2yPp51/Wk4vRJ8jtCwb8SbQx6g8amE2Hy8Qzv
 Wz171zcccJeVfwmHkoS0+ga6qN79xbqvS5WqFx9oPmw/FzP8t8Pk1f9/W A==;
X-CSE-ConnectionGUID: 46z5ziS0Rz+6XUCXicndxw==
X-CSE-MsgGUID: +QLMMhr9SuSHuDowMjgmjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106506283"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106506283"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:15 -0700
X-CSE-ConnectionGUID: NkUAFESRRUuVs4r3c1oh4A==
X-CSE-MsgGUID: iMzS2M6WSSaGmjh2hZiw0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275185128"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 11/25] drm/xe: Store level in struct xe_vm_pgtable_update
Date: Thu,  3 Sep 2026 19:21:53 -0700
Message-Id: <20260904022207.3490018-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
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

The level was previously extracted from struct xe_pt inside
xe_vm_pgtable_update during CPU binds, which always occurred during the
bind IOCTL. With CPU binds now supported in bind jobs, struct xe_pt may
no longer be valid in memory at that point. To address this, store the
level directly in struct xe_vm_pgtable_update.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-12-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_pt.c       | 3 ++-
 drivers/gpu/drm/xe/xe_pt_types.h | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 30127ebf1b60..16126ffc2ec1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -388,6 +388,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->flags = 0;
 	entry->qwords = 0;
 	entry->pt_bo->update_index = -1;
+	entry->level = parent->level;
 
 	if (alloc_entries) {
 		entry->pt_entries = kmalloc_objs(*entry->pt_entries, XE_PDES);
@@ -2025,7 +2026,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
 				  u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
 	if (map && map->is_iomem)
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 39c5b89ce9b7..ccab6613385f 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -65,12 +65,18 @@ struct xe_vm_pgtable_update {
 	/** @qwords: number of PTE's to write */
 	u32 qwords;
 
-	/** @pt: opaque pointer useful for the caller of xe_migrate_update_pgtables */
+	/**
+	 * @pt: opaque pointer useful for PT building in the bind IOCTL. Only
+	 * safe to touch during the bind IOCTL (i.e., not in bind jobs).
+	 */
 	struct xe_pt *pt;
 
 	/** @pt_entries: Newly added pagetable entries */
 	struct xe_pt_entry *pt_entries;
 
+	/** @level: level of update */
+	unsigned int level;
+
 	/** @flags: Target flags */
 	u32 flags;
 };
-- 
2.34.1

