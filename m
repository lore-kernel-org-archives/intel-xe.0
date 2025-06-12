Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46467C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D10C10E35E;
	Thu, 12 Jun 2025 22:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yt0sRkAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328C810E1C2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749766192; x=1781302192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4lXIQh8E8aWgDcRljldX4FgeqrcDqEmf/46jCKfSei8=;
 b=Yt0sRkAHPkpH9egjO8y8u1p9XD/aSjBZf7J+iHLXOaxLJilq5LBm3Nic
 Py3P+h5q1QNkRGbnQ2+42EFlCs5nBv/TDcz02g62Gx3BNY+JZGdkAMfQP
 5rLBqp1gtJxWDqbaMZHhoNez3TKHDKJCQt4IUln6fkAjl3v9nr7m2Yuy4
 vMiTKVcnAkvkszmku99KX/IMVXC6WRWhxttg11ASgUmRHAT7RVIle8fya
 Pw9qZML4vKq+DLOwh/ZEaYuIO//7hxsg/1ApcslKv3zLc65AZ148AaiPd
 ojx47Xv3iY2+/JL5cGSVOLgy0bg3BVQu7gpUOCT7BVUcZPXVF/QYLL77j g==;
X-CSE-ConnectionGUID: SXfiWkPvQlqodWA0nm88ZQ==
X-CSE-MsgGUID: IL4Yo4rDTueR96GpLLA5pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="54596252"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="54596252"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:09:52 -0700
X-CSE-ConnectionGUID: VqJB2em5TtebBr+pEqawSg==
X-CSE-MsgGUID: Ig6hHSSNQAKGfSzkoGkAhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152626835"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:09:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe: Process deferred GGTT node removals on device
 unwind
Date: Fri, 13 Jun 2025 00:09:36 +0200
Message-Id: <20250612220937.857-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250612220937.857-1-michal.wajdeczko@intel.com>
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
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

While we are indirectly draining our dedicated workqueue ggtt->wq
that we use to complete asynchronous removal of some GGTT nodes,
this happends as part of the managed-drm unwinding (ggtt_fini_early),
which could be later then manage-device unwinding, where we could
already unmap our MMIO/GMS mapping (mmio_fini).

This was recently observed during unsuccessful VF initialization:

 [ ] xe 0000:00:02.1: probe with driver xe failed with error -62
 [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747340 __xe_bo_unpin_map_no_vm (16 bytes)
 [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747540 __xe_bo_unpin_map_no_vm (16 bytes)
 [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747240 __xe_bo_unpin_map_no_vm (16 bytes)
 [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747040 tiles_fini (16 bytes)
 [ ] xe 0000:00:02.1: DEVRES REL ffff88811e746840 mmio_fini (16 bytes)
 [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747f40 xe_bo_pinned_fini (16 bytes)
 [ ] xe 0000:00:02.1: DEVRES REL ffff88811e746b40 devm_drm_dev_init_release (16 bytes)
 [ ] xe 0000:00:02.1: [drm:drm_managed_release] drmres release begin
 [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef81640 __fini_relay (8 bytes)
 [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80d40 guc_ct_fini (8 bytes)
 [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80040 __drmm_mutex_release (8 bytes)
 [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80140 ggtt_fini_early (8 bytes)

and this was leading to:

 [ ] BUG: unable to handle page fault for address: ffffc900058162a0
 [ ] #PF: supervisor write access in kernel mode
 [ ] #PF: error_code(0x0002) - not-present page
 [ ] Oops: Oops: 0002 [#1] SMP NOPTI
 [ ] Tainted: [W]=WARN
 [ ] Workqueue: xe-ggtt-wq ggtt_node_remove_work_func [xe]
 [ ] RIP: 0010:xe_ggtt_set_pte+0x6d/0x350 [xe]
 [ ] Call Trace:
 [ ]  <TASK>
 [ ]  xe_ggtt_clear+0xb0/0x270 [xe]
 [ ]  ggtt_node_remove+0xbb/0x120 [xe]
 [ ]  ggtt_node_remove_work_func+0x30/0x50 [xe]
 [ ]  process_one_work+0x22b/0x6f0
 [ ]  worker_thread+0x1e8/0x3d

Add managed-device action that will explicitly drain the workqueue
with all pending node removals prior to releasing MMIO/GSM mapping.

Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for ggtt_remove_node")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7b11fa1356f0..a8830cdb185f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -238,6 +238,13 @@ int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
 
+static void dev_fini_ggtt(void *arg)
+{
+	struct xe_ggtt *ggtt = arg;
+
+	drain_workqueue(ggtt->wq);
+}
+
 /**
  * xe_ggtt_init_early - Early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -290,6 +297,10 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (err)
 		return err;
 
+	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
+	if (err)
+		return err;
+
 	if (IS_SRIOV_VF(xe)) {
 		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
 		if (err)
-- 
2.47.1

