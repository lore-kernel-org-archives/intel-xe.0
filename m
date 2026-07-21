Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209E3C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 20:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16D610E5D2;
	Tue, 21 Jul 2026 20:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfLKSNvl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F3A10E5D2
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 20:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784667327; x=1816203327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rMewqnrqNolhCNZMsHAGzmX25uYtNNR5rcWUXF45uDo=;
 b=CfLKSNvlA46U03tZGAJwbtj/kBEDsrknmuhTWqWKpSSv4sIzFCiq5U2v
 uRUlyWKfYRkjM8tq/zANNQoWbTVYtdRUmvfCRiWWu3I27OL5HgssmI9zR
 lxwlln6cZWg/IXGMOmH5RL+eIm7VMg2DjevHiqBXhlondqqFXV9Za9rBJ
 vZ9gNTAeAfKUWitfrqjB/mTl5/Koao91b2huwVKHEU649H4/ZHHlofi++
 nuB+u++UyyLL9MWdV7Lt4MMltORIuM2PkuFM0vkPyCYMF3BUm3lklVO4T
 uMo0K2Ev3kQRdIhzNNdWVXgGdhg1FU6QCD4jhXAmvONqVXPVQhL3OteHR w==;
X-CSE-ConnectionGUID: Cx/FZcXxQYmn68HeJR1GTg==
X-CSE-MsgGUID: VC/9xw/oThO2LT9DrRDd0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108073954"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="108073954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 13:55:27 -0700
X-CSE-ConnectionGUID: TkWJjc+KSN6O/T1wdSMvuQ==
X-CSE-MsgGUID: reCbl1HATgijz/L8yTLD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262805937"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2026 13:55:25 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/3] drm/xe/vm: Fix SVM leak and clean up xe_vm_create()
Date: Tue, 21 Jul 2026 20:55:13 +0000
Message-Id: <20260721205516.4058959-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series contains one bug fix and two related cleanups in
xe_vm_create() found while reviewing the function.

Patch 1 fixes resource leaks on the drm_gpuvm_resv_object_alloc()
failure path. After commit 9e9787414882 ("drm/xe/userptr: replace
xe_hmm with gpusvm") made xe_svm_init() unconditional and extended it
to initialize a "simple" gpusvm state for non-fault-mode VMs, the
error unwind path was not updated to match. As a result:

- Non-fault-mode VMs leak the resources allocated by
  drm_gpusvm_init(), because xe_svm_fini() is only called under
  XE_VM_FLAG_FAULT_MODE.

- Fault-mode VMs additionally leak the pagemap owner acquired by
  drm_pagemap_acquire_owner() and the pagemaps acquired by
  xe_svm_get_pagemaps(), because xe_svm_close() (which releases them)
  is not called on this error path either.

Patches 2 and 3 are pure cleanups with no functional change:

- Patch 2 removes a duplicate INIT_WORK() call for
  vm->preempt.rebind_work in the LR-mode setup that was introduced by
  the conversion to xe_validation_guard() and makes lifetime and
  ordering harder to reason about.

- Patch 3 replaces a kernel-doc opening marker (/**) on an
  in-function implementation note with a regular block comment (/*),
  since /** is reserved for API documentation per
  Documentation/doc-guide/kernel-doc.rst.

Shuicheng Lin (3):
  drm/xe/vm: Fix SVM leak on resv obj alloc failure in xe_vm_create()
  drm/xe/vm: Remove redundant INIT_WORK() for rebind_work in
    xe_vm_create()
  drm/xe/vm: Use regular comment for GSC VM lockdep note in
    xe_vm_create()

 drivers/gpu/drm/xe/xe_vm.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

-- 
2.43.0

