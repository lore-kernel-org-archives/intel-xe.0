Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A11AC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 01:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF06010E16D;
	Tue, 15 Sep 2026 01:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuLht8WM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CAE10E16D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 01:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789434779; x=1820970779;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u7zNsMssecIKrFpijlAULWpKO/OPox9J1VH+pNRuOK0=;
 b=DuLht8WMkkpqH1RwdbljQ/RJBVWZMZuLHlDKCqFUdyIakBLwU05D58NY
 u/hyLjcvdCxX39cGtq27y13wwwL8jU+NBfjHCoj6NgvUWD5fd24oXeO7H
 wBoDLmMD1FeNkIGobpLP+Zr5cx1+t3sclj5ms3+ndZ0XVnZ9R5sTW7BEi
 jlwBF9i/MOs3EFnHCrFEdvhjr5zfHfrbWY/Vu9rsRkqUOFi59TfGLDi2j
 2S9HhWB5sHNdyqFB09tckJ6PgrW1+d4fyUmXsPoMJLnZahpi5uXBsWJsy
 Z8K4Rm8ejPV/GPxfyUwBc6wKvf1++RnK7bBu+cUL4BY47e6K4z8p1S00N A==;
X-CSE-ConnectionGUID: SVX0d6vpSJm6TMDeny9FBA==
X-CSE-MsgGUID: BzsBQ+6ZT1aEjbX3BDOxEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101308011"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101308011"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 18:12:58 -0700
X-CSE-ConnectionGUID: fT+xDtDBSu2ylp6xIz7dwA==
X-CSE-MsgGUID: IlXeZ7x+SION0kYcsK3arw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272787819"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa007.jf.intel.com with ESMTP; 14 Sep 2026 18:12:56 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/madvise: Remove unreachable madvise_funcs NULL check
Date: Tue, 15 Sep 2026 01:12:29 +0000
Message-Id: <20260915011229.203424-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

The NULL check on madvise_funcs[attr_type] in xe_vm_madvise_ioctl()
is unreachable. madvise_args_are_sane() already validates args->type
via a switch statement whose default case rejects any type not present
in madvise_funcs[]. Every type that passes the sanity check has a
corresponding entry in the table.

Beyond being dead code, the check's error path (goto err_fini) would
also skip xe_svm_notifier_unlock() if it were somehow reached with
has_svm_userptr_vmas set, since err_fini only tears down the drm_exec.
Removing the check eliminates both the redundancy and the latent
unwind hazard.

No functional change.

Assisted-by: LLM
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Arvind Yadav <arvind.yadav@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 0474768a38aa..5c7aefc641ee 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -713,12 +713,6 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 
 	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
 
-	/* Ensure the madvise function exists for this type */
-	if (!madvise_funcs[attr_type]) {
-		err = -EINVAL;
-		goto err_fini;
-	}
-
 	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
 				 &details);
 
-- 
2.43.0

