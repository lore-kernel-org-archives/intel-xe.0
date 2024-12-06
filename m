Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE9FE77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 18:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C107510E13A;
	Fri,  6 Dec 2024 18:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adpuPMVE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990CE10E13A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733508716; x=1765044716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/YTRrHf8mjaq8QB/gLstAPL/nX0nVGrshlyr8EJrqsA=;
 b=adpuPMVE9jdjNs43KB93AE8qPorWnLIbImRfsIVLvHD4C4lDAhbvFzh1
 a9OTyQyHh9qxOEMCY88gOjB9iluhTaZk47c/10vLSJdolTW4AmixhwB/W
 ho00ljeVszSKxeH3LntWAVVmf7VVzEv39u1ngH2Htjizo5m1O3S498D1z
 ElSxWx7LItRbJRwtrsAGI6A4rOA3C5rlb8/7BSG3tYVYguA1auOlfXnVa
 rF7rOksx830vHzS5EYsda36dCtax/MmtrK+xaOTdYEbmCT3ScEORe114f
 0cs/qYptkA/A/KcwBixXfqiVgBYEjj7hpCRl+wX6ns6xg8d+7ItnVUmdC g==;
X-CSE-ConnectionGUID: tbVm6x6hQn2/z9APG6yJRQ==
X-CSE-MsgGUID: AknP9AM6QJOb5JpICTL6zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33791133"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="33791133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 10:11:55 -0800
X-CSE-ConnectionGUID: lgpvIUi+Tvef1Lr1T2opwQ==
X-CSE-MsgGUID: ratMiuvvQneknyx796ZmzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="94144616"
Received: from dut4066lnl.fm.intel.com ([10.105.10.226])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 10:11:55 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH v2] drm/xe/xe_sync: Add debug printing to check_ufence
Date: Fri,  6 Dec 2024 18:11:55 +0000
Message-ID: <20241206181155.87070-1-jonathan.cavitt@intel.com>
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

The xe_sync helper function check_ufence can occasionally report EBUSY
if the ufence has not been signalled yet.  EBUSY is a non-fatal error
value for the function, so it is not desireable to warn in cases where
EBUSY is reported because it is up to the user to decide if EBUSY is a
fatal error in their use cases.  However, we can and should report EBUSY
to the debug logs for diagnostic purposes.

v2: Use vm_dbg instead of XE_IOCTL_DBG (Rodrigo)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 74d684708b00..8c770d1b916c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2402,8 +2402,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
-		if (err)
+		if (err) {
+			vm_dbg(&vm->xe->drm,
+			       "REMAP: vma check ufence status = %i\n", err);
 			break;
+		}
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.remap.unmap->va),
@@ -2415,8 +2418,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
-		if (err)
+		if (err) {
+			vm_dbg(&vm->xe->drm,
+			       "UNMAP: vma check ufence status = %i\n", err);
 			break;
+		}
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
-- 
2.43.0

