Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F0FCA0FF2
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 18:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E5810E399;
	Tue, 26 Aug 2025 18:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3QFzhn2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B3110E6B5
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 18:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756234460; x=1787770460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZLgIpIQQVk3NrrikD4pPMsLx4jubNQgp3/d+d+nUHaY=;
 b=C3QFzhn2IfJgHzQ+Ztx4nvjrIRVUUS9wmma3GKXN9KO1U0xZHjuqretI
 uyWEvmSVjqEJM9ngu0Rr04DwPs+ObfPzvaSdFJTPHsccRUnna9URhZ27Q
 564JC3V18fLSLlYPPYwknh/TgTpE95do6JaW0YFnluTditMOapxYzhYfO
 y5Eqh2rZV0jvlMfKliMbn2IoUUNgc57jQHutkRR1yg7kmvbjWLBYLFz0S
 eCredo9Y/Iv6N4rrtvvz9ItJbLXjItKeLaKVU842u95nMBcNIR3JaCGol
 xnawSpfBvYVxNd0bJSj7uABAA/2v/DituWXwur6nQlcAE0xQFsxPkgi/x w==;
X-CSE-ConnectionGUID: FbyBufQgTr+sNTB2ZWIIZw==
X-CSE-MsgGUID: WgHWAHtpQGGYigI/lxPpbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62317681"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62317681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:54:18 -0700
X-CSE-ConnectionGUID: 5tUNF1kaTbmIW6PZxAQCLg==
X-CSE-MsgGUID: trP8paRLT2+wSIr30VCR3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169822492"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:54:18 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 2/2] drm/xe/xe_vm: Add error injection support to lock and
 prep
Date: Tue, 26 Aug 2025 18:54:19 +0000
Message-ID: <20250826185416.94640-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826185416.94640-4-jonathan.cavitt@intel.com>
References: <20250826185416.94640-4-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1a8841116e40..d838dee5f19f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3201,6 +3201,35 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
 	return 0;
 }
 
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+/*
+ * Since faults are injected through this function, it's important to ensure
+ * the compiler doesn't optimize it into an inline function. To avoid such
+ * optimization, the 'noinline' attribute is applied. Compiler optimizes the
+ * static function defined in the header file as an inline function.
+ */
+static noinline int
+vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
+				struct xe_vm *vm,
+				struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+	int err;
+
+	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
+	if (err)
+		return err;
+
+	list_for_each_entry(op, &vops->list, link) {
+		err = op_lock_and_prep(exec, vm, op);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_lock_and_prep, ERRNO);
+#else
 static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 					   struct xe_vm *vm,
 					   struct xe_vma_ops *vops)
@@ -3220,6 +3249,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 
 	return 0;
 }
+#endif
 
 static void op_trace(struct xe_vma_op *op)
 {
-- 
2.43.0

