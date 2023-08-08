Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D46C001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 09:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4EE10E3D3;
	Tue,  8 Aug 2023 09:12:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0026010E3D3
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691485938; x=1723021938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I70OqPTbtKZqW3CQ1Et1Iah8077x/NZluJY42fn8S90=;
 b=NvQelFIqvp67BvZjzxwHg/KfAGGsBb1K8OGPRlhY8NXLl7Ap3nUcLShV
 Y19VcmbwZ9L6iJ2PYvvMUgyiJ1Cc7+cUXvxf/xEHfQgeRodrNc0/RBcYg
 o0eIeAjdqNsPVaEU/dLGNU8LcR4HFP3h0sCRijXuKoQQWuKzqycxKiza6
 KM23GDBpJahatM7MeTFhQnmvt6fs2Jj6pI/BmXKrBqRAVARBkYFgC+AiU
 nION1ZSlaNhXPXEZW2K63Tv1zrIWmnXggA13tqqhT9rtMyHRi8566f9Ks
 GnVl79Th6Nkvqd9JJ9eOO4ttEnKWaMWPTGgFsnuup2d8LwVodmpWAmJaO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434616891"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="434616891"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 02:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731313475"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="731313475"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.47])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 02:12:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 10:12:09 +0100
Message-ID: <20230808091208.112793-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: skip rebind_list if vma destroyed
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

If we are closing a vm, mark each vma as XE_VMA_DESTROYED and skip
touching the rebind_list if this is seen on the eviction path. That way
we can safely drop the vm dma-resv lock on the close path without
needing to worry about racing with the eviction path trying to add stuff
to the rebind_list which can corrupt our contended list, since the
destroy and rebind links are the same list entry underneath.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/514
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 ++++++----
 drivers/gpu/drm/xe/xe_vm.c |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 284c86107a5f..6a7dc14feab0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -504,15 +504,17 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 				vm_resv_locked = true;
 			else if (ctx->resv != &vm->resv) {
 				spin_lock(&vm->notifier.list_lock);
-				list_move_tail(&vma->notifier.rebind_link,
-					       &vm->notifier.rebind_list);
+				if (!(vma->gpuva.flags & XE_VMA_DESTROYED))
+					list_move_tail(&vma->notifier.rebind_link,
+						       &vm->notifier.rebind_list);
 				spin_unlock(&vm->notifier.list_lock);
 				continue;
 			}
 
 			xe_vm_assert_held(vm);
-			if (list_empty(&vma->combined_links.rebind) &&
-			    vma->tile_present)
+			if (vma->tile_present &&
+			    !(vma->gpuva.flags & XE_VMA_DESTROYED) &&
+			    list_empty(&vma->combined_links.rebind))
 				list_add_tail(&vma->combined_links.rebind,
 					      &vm->rebind_list);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 936492915ecb..aef032ba8e27 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1450,6 +1450,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		}
 
 		list_move_tail(&vma->combined_links.destroy, &contested);
+		vma->gpuva.flags |= XE_VMA_DESTROYED;
 	}
 
 	/*
-- 
2.41.0

