Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90BED2AB3B
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 12:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA7210E262;
	Tue, 29 Oct 2024 12:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOq2QKpP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCDF10E262
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 12:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730206321; x=1761742321;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/I+GPYbGcsNj8reGM68lR2LG34pAPw0hLwwsPAGqk6c=;
 b=IOq2QKpPCAmLU8Zs4RUwD2HUVYY6pt8+zjMsD59a53IffCdhK3pl9ra1
 UvmQ8uKVd2yAl9LAWl92pPqhDyyirTLOHObTClFGy/ieDLe9gtBcUHfo1
 h9rqEHgOJVItGbPW26kn25lXQk1gYuGyoN0KxNaM/Ta5gYEQurfez4vf4
 jIQT5rKLsdU/FDO1Rl/62A90tkummDs1X2a/dg5YpUWxejTNctCI6veUh
 rMMwRuxZaYu19QTgUdKGdsS88RqdfpH82lHXfnAlbtHp78o0QEAbof9fh
 1j+II+jUbTvmyU078Hj8nKpMZ3A3iP8YhrX8wf6nKyAfXyT/QUNfd6ssh g==;
X-CSE-ConnectionGUID: F99IryT+RS+5Iz0tzN/9TA==
X-CSE-MsgGUID: rC4iYzThS8OVO5uUho3znw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29808657"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29808657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 05:52:00 -0700
X-CSE-ConnectionGUID: Egz7Oz81S7eltdImeWFnRg==
X-CSE-MsgGUID: cI2T3IzaQ5SMrzht2zj2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="86565094"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 05:51:59 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vm: Add debug log on pending previous ufence
Date: Tue, 29 Oct 2024 13:09:56 +0100
Message-ID: <20241029120956.477817-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add debug log when a vm_bind fails because corresponding vma still
contains a un-signaled ufence from previous operation.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3233
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..643415af4ff1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2369,12 +2369,12 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 	return err;
 }
 
-static int check_ufence(struct xe_vma *vma)
+static int check_ufence(struct xe_device *xe, struct xe_vma *vma)
 {
 	if (vma->ufence) {
 		struct xe_user_fence * const f = vma->ufence;
 
-		if (!xe_sync_ufence_get_status(f))
+		if (XE_IOCTL_DBG(xe, !xe_sync_ufence_get_status(f)))
 			return -EBUSY;
 
 		vma->ufence = NULL;
@@ -2396,7 +2396,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 					    op->map.immediate);
 		break;
 	case DRM_GPUVA_OP_REMAP:
-		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
+		err = check_ufence(vm->xe,
+				   gpuva_to_vma(op->base.remap.unmap->va));
 		if (err)
 			break;
 
@@ -2409,7 +2410,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock_and_validate(exec, op->remap.next, true);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
-		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
+		err = check_ufence(vm->xe,
+				   gpuva_to_vma(op->base.unmap.va));
 		if (err)
 			break;
 
-- 
2.46.0

