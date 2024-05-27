Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E404C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 21:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8615210EE60;
	Mon, 27 May 2024 21:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpOotdn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC9310E8C1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 21:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716847131; x=1748383131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k8bv3+g5xVjw9hl+DB+j3/2FLDePJDTle7Jwbdm07co=;
 b=dpOotdn/rTy9FUYXmPU3rA9p//UNVasof9bTkQUFKCLWD+hs3Z6YEoQM
 B/p0Kw44TYs3PfPAq+kktQrQEjo7qFnzPIq1j+FoRoxRoSMP2SMxI+gzw
 OqLy/MSz3Ef8iEDrScBEIPY6Z1WB2RI9fIqh+JKSEa5eTcCbOcw75My+7
 yTKtNh+CtmNPgLyXMdkbeCFQUPRw2ZgceUr1+Gi+vPbRtRY4ZV5CJjt1V
 V3BbMYyVRm8Difhybw9bjLrBa5fGkho1RnLOpAFrcUsfw34Rp3f5wAGma
 /O522+0gIRDO5j0jBCJ/pmgB9mdnqMeMzGIGeBsFHEq/dopRDn6uUOFtp Q==;
X-CSE-ConnectionGUID: LmpNwrpzQ++kOYKI97JpzA==
X-CSE-MsgGUID: wKSFqcsjTEem9HpjWi1RsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30697959"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="30697959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 14:58:49 -0700
X-CSE-ConnectionGUID: tUnso88fSnOWizgGmd9xkA==
X-CSE-MsgGUID: P2ruxUQtQCOwZoY9vzyt9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="39851027"
Received: from szeng-mobl2.jf.intel.com ([10.24.14.26])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 14:58:49 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: Add more document to xe_vm::lock
Date: Mon, 27 May 2024 16:07:31 -0700
Message-Id: <20240527230731.1888261-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.25.1
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

More document is added to xe_vm::lock to describe what is protected
by this lock.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce1a63a5e3e7..5597d8072046 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -161,7 +161,18 @@ struct xe_vm {
 
 	/**
 	 * @lock: outer most lock, protects objects of anything attached to this
-	 * VM
+	 * VM, more specifically:
+	 * 1) vm::rebind_list
+	 * 2) vm::flags, only XE_VM_FLA_BANNED bit
+	 * 3) vma::tile_present
+	 * 4) userptr::repin_list
+	 * 5) userptr::invalidated list
+	 * 6) vm::preempt::exec_queue
+	 * 7) drm_gpuvm::rb list and tree
+	 * 8) vm::size
+	 * 9) vm::q[]->last_fence, only if q->flags' EXEC_QUEUE_FLAG_VM is set,
+	 *    see xe_exec_queue_last_fence_lockdep_assert
+	 * 10) a contested list during vm close. see xe_vm_close_and_put
 	 */
 	struct rw_semaphore lock;
 	/**
-- 
2.25.1

