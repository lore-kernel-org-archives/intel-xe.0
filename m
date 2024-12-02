Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B062E69E86
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 19:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9E410E1DD;
	Mon,  2 Dec 2024 19:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVweFt1W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BAD10E1DD
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733168792; x=1764704792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iqoqjV8QEGuje75vge9k6hXf56OUer7CPXH5vvlFstk=;
 b=IVweFt1W2tcWvre53OTXCg2rGSK0JmQ3FGRA49gXvGU7lrvbPCjLDHcV
 NPZ/SCF7qWqtV+h/6pKSlmiHv05wvP2H9lIDjB3CvRpFKQZ3h6d0DTeii
 pt2ftX0iHWlsTcWrpFTptaYeLkCAwQi8a5SWT/oyc6tWUp136P/2d00TA
 HU4qioPkRnGyU75xQ/K49xYWxHsiQOJm1YK96v996wNa7VoOKsGtdKSA9
 ComeMaVFJzGf/OEKiqxSqaEAIW3k3BIpLw5A9NWrEYBVDCQlXPw3tRRyh
 q/MREKNvsXl+odIFtLmvlApwp+vf+u2iX/W4mMT31kp68KMPz4aPRziTK A==;
X-CSE-ConnectionGUID: 34hB2abcR2a1XjJpCYyiBw==
X-CSE-MsgGUID: 1ChtIuDJSIuiuA+521Be1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33283266"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="33283266"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 11:46:32 -0800
X-CSE-ConnectionGUID: C5iQAZOuRvSTqVRT0ImrjA==
X-CSE-MsgGUID: rG8XphIYSlOmAudWzX8+Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93674776"
Received: from dut4066lnl.fm.intel.com ([10.105.8.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 11:46:32 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com,
	alex.zuo@intel.com,
	jonathan.cavitt@intel.com
Subject: [PATCH] drm/xe/xe_sync: Add debug printing to check_ufence
Date: Mon,  2 Dec 2024 19:46:31 +0000
Message-ID: <20241202194631.106940-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 610226c7c1ce..09ab7111e091 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2400,7 +2400,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
-		if (err)
+		if (XE_IOCTL_DBG(vm->xe, err))
 			break;
 
 		err = vma_lock_and_validate(exec,
@@ -2413,7 +2413,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
-		if (err)
+		if (XE_IOCTL_DBG(vm->xe, err))
 			break;
 
 		err = vma_lock_and_validate(exec,
-- 
2.43.0

