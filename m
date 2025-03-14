Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA9DC28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DBA10E97D;
	Fri, 14 Mar 2025 07:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFDIA3ZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1468610E97C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937897; x=1773473897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dyfnbyn5JY5KBJvWcU6mpu9VzzqNJisi8zNZRDTzUkk=;
 b=CFDIA3ZOBoxRdnBdeAldrwaxuOjlrMMsG9BCnmX+5aXr1bnLGdePBa/f
 Exg8EfJBmAtSWnItqZ7Q5uCGfJruElH6dd66g/tGKyzehcWiKuNWzTx65
 Kovfg8MbVqWk9sv70bTk1w/c66fSmtdbTWirdYh7N9PEqp/SfOoZ9+dep
 1vfBpFw4xVKdNqvYrPkHAZdHvtg6bNUc/6Z/yhWRRYfWPd90xTuf3PPSr
 Ajjwefm2yugQJQ3slbdK7B//Z/Sy8Hswp5r7i8lXcD1buLALIviwpCGhX
 lCHe4KUJnK0Rpb94SnfAGgbhKGnNvs9ydy3oD4oSWWlF3LDai0AfWyRVr A==;
X-CSE-ConnectionGUID: mNbRasCDRfmlGO67h8dYew==
X-CSE-MsgGUID: Yi4MWOpEQqqwPE9cby7gpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68445964"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68445964"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:17 -0700
X-CSE-ConnectionGUID: MTa683noTeizGEdt82uGXw==
X-CSE-MsgGUID: j1FDRVh3RTa7R9NbqvJMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043691"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 03/29] drm/xe/svm: Helper to add tile masks to svm ranges
Date: Fri, 14 Mar 2025 13:32:00 +0530
Message-Id: <20250314080226.2059819-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

Introduce a helper to add tile mask of binding present and invalidated
for the range. Add a lockdep_assert to ensure it is protected by GPU SVM
notifier lock.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ffaf0d02dc7d..cf7a6ba2aec8 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2178,6 +2178,16 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	}
 }
 
+static void range_present_and_invalidated_tile(struct xe_vm *vm,
+					       struct xe_svm_range *range,
+					       u8 tile_id)
+{
+	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
+
+	range->tile_present |= BIT(tile_id);
+	range->tile_invalidated &= ~BIT(tile_id);
+}
+
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -2232,12 +2242,11 @@ static void op_commit(struct xe_vm *vm,
 	}
 	case DRM_GPUVA_OP_DRIVER:
 	{
-		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
-			op->map_range.range->tile_present |= BIT(tile->id);
-			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
-		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
+			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
+		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			op->unmap_range.range->tile_present &= ~BIT(tile->id);
-		}
+
 		break;
 	}
 	default:
-- 
2.34.1

