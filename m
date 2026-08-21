Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE738C5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 19:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5E10F51B;
	Fri, 21 Aug 2026 18:59:36 +0000 (UTC)
Received: from mgamail.intel.com (unknown [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9622510F58A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787338769; x=1818874769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5mRESjCEIVGKPfqEK0jQ4XUGzXfBkMSheloI/ecZnP0=;
 b=a3gPVc94YHLYqZRHds91gj2UkXGeOah9gHrpycRifDpoRxbQSE2lMaF2
 6NaEzP1qW7wN9zLm5uwMnX7ENCM2PEU6oZCqhCcddtB8qhUZbaYrh1rHf
 ROLTZ39OEZUDBuXEc8QA+W+M++2ltGnq1AN5P6h/ED6tSF1bkp/yahwOd
 iEmpqrHF0GyxJo7mnuiKK2iIijnPR8kdw5hAy0nQqVsYRCFrO9LwgxTcd
 k+DPAhdgZWpTYgxMJu4am48s9XwfKdj7kBNrM07qORCFeRv1Hs5SVrIia
 odqw6RlYdd5KkNou2l3AwoKi/kZpdkCbFNy15TEhgzURP+QpolujZPRpn A==;
X-CSE-ConnectionGUID: gg+s5xffQ/S9xmotqftzqA==
X-CSE-MsgGUID: Kbq9QOZjSK2XHpMKsQEaHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87951912"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87951912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 11:36:52 -0700
X-CSE-ConnectionGUID: 6xpYodCFSsOS/LNq9oK/Xw==
X-CSE-MsgGUID: 0eR8SPCIRiiUTOVJtvMq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="271635186"
Received: from dut1106bmgfrd.igk.intel.com ([10.211.177.75])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 11:36:51 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, shuicheng.lin@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] drm/xe: Bound pgtable update loops by current_op
Date: Fri, 21 Aug 2026 18:36:42 +0000
Message-ID: <20260821183642.6709-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_vma_ops_alloc() sizes the pt_update_ops->ops array with num_ops, the
number of operations reserved, and allocates it with kmalloc_objs(), so
the entries come back uninitialized. Only the first current_op entries
are ever populated. xe_pt.c reflects this and bounds its loops by
current_op, and xe_pt_update_ops_prepare() states the invariant
explicitly:

	xe_tile_assert(tile, pt_update_ops->current_op <=
		       pt_update_ops->num_ops);

xe_migrate.c instead iterates num_ops. When fewer operations are
populated than were reserved, both the CPU and GPU page table update
paths walk past the populated entries into memory that was never
initialized, read a garbage pointer out of it and dereference it.

A syzkaller reproducer triggers this with a VM_BIND / MADVISE / VM_BIND
sequence that reserves five operations and populates two:

  UBSAN: invalid-load in drivers/gpu/drm/xe/xe_migrate.c:1836:13
  load of value 107 is not a valid value for type '_Bool'
  Oops: general protection fault, probably for non-canonical address
        0xed6d696d6d6d6d6e
  KASAN: maybe wild-memory-access in range
        [0x6b6b6b6b6b6b6b70-0x6b6b6b6b6b6b6b77]
  RIP: 0010:xe_vm_populate_pgtable+0xd0/0x380 [xe]
  Call Trace:
   xe_migrate_update_pgtables+0x32b/0x2c90 [xe]
   xe_pt_update_ops_run+0x835/0x25e0 [xe]
   ops_execute+0x691/0x2630 [xe]
   vm_bind_ioctl_ops_execute+0x46d/0x1820 [xe]
   xe_vm_bind_ioctl+0x3d5f/0x45f0 [xe]

The value 107 is 0x6b, POISON_FREE, left behind in the unpopulated
entries by the slab allocator.

Bound all five loops in xe_migrate.c by current_op so that only
populated entries are consumed.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 75b83687f1b5..b1be1cb2fbfc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1825,7 +1825,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 			return ERR_PTR(err);
 	}
 
-	for (i = 0; i < pt_update_ops->num_ops; ++i) {
+	for (i = 0; i < pt_update_ops->current_op; ++i) {
 		const struct xe_vm_pgtable_update_op *pt_op =
 			&pt_update_ops->ops[i];
 
@@ -1871,7 +1871,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	bool is_migrate = pt_update_ops->q == m->q;
 	bool usm = is_migrate && xe->info.has_usm;
 
-	for (i = 0; i < pt_update_ops->num_ops; ++i) {
+	for (i = 0; i < pt_update_ops->current_op; ++i) {
 		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
 		struct xe_vm_pgtable_update *updates = pt_op->entries;
 
@@ -1939,7 +1939,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 			bb->cs[bb->len++] = ofs;
 			bb->cs[bb->len++] = 0; /* upper_32_bits */
 
-			for (; i < pt_update_ops->num_ops; ++i) {
+			for (; i < pt_update_ops->current_op; ++i) {
 				struct xe_vm_pgtable_update_op *pt_op =
 					&pt_update_ops->ops[i];
 				struct xe_vm_pgtable_update *updates = pt_op->entries;
@@ -1976,7 +1976,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 
 		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
 			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
-		for (i = 0; i < pt_update_ops->num_ops; ++i) {
+		for (i = 0; i < pt_update_ops->current_op; ++i) {
 			struct xe_vm_pgtable_update_op *pt_op =
 				&pt_update_ops->ops[i];
 			struct xe_vm_pgtable_update *updates = pt_op->entries;
@@ -1994,7 +1994,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		for (i = 0; i < pt_update_ops->num_ops; ++i) {
+		for (i = 0; i < pt_update_ops->current_op; ++i) {
 			struct xe_vm_pgtable_update_op *pt_op =
 				&pt_update_ops->ops[i];
 			struct xe_vm_pgtable_update *updates = pt_op->entries;
-- 
2.43.0

