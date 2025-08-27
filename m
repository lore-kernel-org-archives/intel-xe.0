Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB03BCA0FF7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9058710E8AC;
	Wed, 27 Aug 2025 20:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6DMnKV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2C910E8AB
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756325649; x=1787861649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRw8EqMXuGbWesfePPkAvfZ1McHDfqW+27RJ5WipZcE=;
 b=N6DMnKV6oE4LAjPz+LwnW6zvSMb6oeoaCRHPvaF14R4SQU1jfiIDiDe7
 vn8CFZA5NuhVx8vv04RNxBcBKfyG1Uqudmw90kQU8oM6RmTelm/ygAbEy
 ZbguoGeYPc7wT6TxFtjtW2bUueka4zHjsWMnUoxA9YrxyiOSwipndwz9U
 ucbM/vGkCnAWf+M0ND1hCc73pYaX9dx4rJ+uaTu7CM560CZmj4BCiqXz9
 1ljrDXedTQXxDZa2VHsBm3ycg9D2fWSQ7A9XCUbJnSjaGzC4D6gftiGaF
 Sym5qIKoSUp1rS/xjPE3SPxJJQ6bQGleWy4QKG0eELNElBMSG7ipRvW7d g==;
X-CSE-ConnectionGUID: b+5MMLvmTQCwIERq5opEWw==
X-CSE-MsgGUID: nERvZByXSJ+zFiAsihKBJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58439697"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58439697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:14:08 -0700
X-CSE-ConnectionGUID: BlfEv6EqS7O6NiS9uOJbGA==
X-CSE-MsgGUID: h4vvyFqcTT60bJM9CMerpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169221894"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:14:08 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v5 3/3] drm/xe/xe_vm: Add error injection support to lock and
 prep
Date: Wed, 27 Aug 2025 20:14:09 +0000
Message-ID: <20250827201405.116855-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827201405.116855-5-jonathan.cavitt@intel.com>
References: <20250827201405.116855-5-jonathan.cavitt@intel.com>
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

Add error injection support to the function
vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
as noinline.

v2: Only noinline vm_bind_ioctl_ops_lock_and_prep when function error
injection is enabled (Brost)

v3: Use error_injectable to apply v2 change (Brost, Harrison)

v4: Move error_injectable function attribute (Brost)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5602e6cb4a72..37f88e157cd9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3205,6 +3205,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
 	return 0;
 }
 
+error_injectable
 static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 					   struct xe_vm *vm,
 					   struct xe_vma_ops *vops)
@@ -3224,6 +3225,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_lock_and_prep, ERRNO);
 
 static void op_trace(struct xe_vma_op *op)
 {
-- 
2.43.0

