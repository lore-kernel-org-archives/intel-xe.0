Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC875C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 03:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EA810E5F0;
	Wed, 21 Feb 2024 03:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdORLQsk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E9010E5F0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 03:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708486014; x=1740022014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=809GqWhsIiYE0wr4BJIrkS6b1772act97odngeuPNOc=;
 b=JdORLQskZ9hpfpNtzhimBNLvcO06e3rvqM1ld5/Ebyk+9sDiNcAb4wJy
 VuIgb04/2ubmcSRKen7wmY+H1QzyMHkM6ldjFjY5zI4Ql9qaRNbMahbAA
 pDmf0R0tjQMtoVuNiPSW1hdi+q0qaXQgFRRM1BDsnibDqhkY4w6N05gmn
 WUzXQFBipisTgUKJbHTLEvSGIwy3YodzH1NKNeM0azE1vdDy0sG8CiZi9
 U7szXJ7aEodmLtaxyo2AAdTklzYW4GHmRBiBzR1tEq1R6krw7Ov4FZiYK
 RwZaOJGqtv29bBClBRaNFictivRs4occyvUkcMxVoKWXuz5Ul7ftUbraT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6407948"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="6407948"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 19:26:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9650041"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 19:26:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Add debug prints for skipping rebinds
Date: Tue, 20 Feb 2024 19:27:43 -0800
Message-Id: <20240221032743.3698849-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Will help debug issues with VM binds.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 23a44ef85aa4..bf040df0d02b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2287,6 +2287,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
 				   struct list_head *ops_list, bool last)
 {
+	struct xe_device *xe = vm->xe;
 	struct xe_vma_op *last_op = NULL;
 	struct drm_gpuva_op *__op;
 	int err = 0;
@@ -2362,6 +2363,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 						xe_vma_end(vma) -
 						xe_vma_start(old);
 					op->remap.start = xe_vma_end(vma);
+					vm_dbg(&xe->drm, "REMAP:SKIP_PREV: addr=0x%016llx, range=0x%016llx",
+					       (ULL)op->remap.start,
+					       (ULL)op->remap.range);
 				}
 			}
 
@@ -2392,6 +2396,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					op->remap.range -=
 						xe_vma_end(old) -
 						xe_vma_start(vma);
+					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT: addr=0x%016llx, range=0x%016llx",
+					       (ULL)op->remap.start,
+					       (ULL)op->remap.range);
 				}
 			}
 			break;
-- 
2.34.1

