Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7EBC83F12
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 00:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB1010E32B;
	Wed, 30 Aug 2023 00:42:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DA010E32B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 00:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693356173; x=1724892173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZxPbvoI+aUpgku1ROSUPK8R0p9YffNwUYCZlUnf196M=;
 b=JvcS8niN/go/hpTLs1WB8b+HaZjovIZq3eARVAXntk1wxoer3StX4C6c
 njzdMNtepnUt/cZBMgmd1EDJ9uUYbOFC62NOHbiSMKRdFMg9RJuQo1IYJ
 DOIy71J4Edi/kdodqaWmoZx22StD9hT754hU85DgSC15wZa3SBGtNOpE9
 u3wk9V/OyE63IJ6Pz29/m9fpJU5U05C8XX+aJgfpnxCq7Iac1T6N/ZWQL
 yjKPTPwZZABenL9b7RPE79xte7iDyPbyyol4CHl+5P2tAB5nkdA0YoTjh
 gVVaGP+/G5sVVzg67sgWwtilxEZ75Emf2AUJI8myKKzh/z11vLRvrIubl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378233393"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="378233393"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 17:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804318442"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="804318442"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 17:42:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 29 Aug 2023 17:43:00 -0700
Message-Id: <20230830004300.1753528-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix fence reservation accouting
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

Both execs and the preempt rebind worker can issue rebinds. Rebinds
require a fence, per tile, inserted into dma-resv slots of the VM and
BO (if external). The fence reservation accouting did not take into
account the number of fences required for rebinds, fix this.

Reported-by: Christopher Snowhill <kode54@gmail.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/518
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 7 ++++++-
 drivers/gpu/drm/xe/xe_vm.c   | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 8a5b614df090..0020f7dabe0a 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -111,7 +111,12 @@ static int xe_exec_begin(struct xe_exec_queue *q, struct ww_acquire_ctx *ww,
 		return 0;
 
 retry:
-	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
+	/*
+	 * 1 fence for job from exec plus a fence for each tile from a possible
+	 * rebind
+	 */
+	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true,
+				  1 + vm->xe->info.tile_count);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 15bff0783ec9..84d64fb3ac60 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -585,8 +585,13 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto out_unlock_outer;
 	}
 
+	/*
+	 * 1 fence for each preempt fence plus a fence for each tile from a
+	 * possible rebind
+	 */
 	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
-				  false, vm->preempt.num_engines);
+				  false, vm->preempt.num_engines +
+				  vm->xe->info.tile_count);
 	if (err)
 		goto out_unlock_outer;
 
-- 
2.34.1

