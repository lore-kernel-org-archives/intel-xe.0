Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F20C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 20:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2809410EB36;
	Tue, 21 Jul 2026 20:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqmkeY9y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6554A10EB36
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 20:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784667342; x=1816203342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nuDAHcU2kbdVaF4Z8AGExP0Pg/VEAnKFCsFnYf4Cfjc=;
 b=JqmkeY9yaiUig9Xjz5u9PY4oBe/ffJax5nzCQyhit5V4z13lieeaGxy+
 H+niNCUX+Rx6dM5bfCoMODnzcxq98Hlh2tQweprmxyLRBBwwzT+CsEilS
 EwmbV6odKkVs1w1PfpGc3d7RIy2iKvDYVpblCC6BiwjANo2IkhJi1QAQK
 waNU35IuTJjdVoLHttdB3EnGJ7oirucjppiqPwDQtfmYPLzjvskAdLnwC
 y4r7nz2pkh7/B680ACzyU5BmklPuGWtMpWhZZpEQ/bONfp3r//JW6wBnu
 h+PLwVI03RB07OegGyfU5r3YYMfBl3LwCtekxciyyMLft8zSrDrzlWnJD A==;
X-CSE-ConnectionGUID: 6dhAiuPcSAiqTc6fE4Ry9A==
X-CSE-MsgGUID: GmF9CTtLRvWlTXrKeaa7lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108074000"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="108074000"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 13:55:42 -0700
X-CSE-ConnectionGUID: /TDO2364RLS3njiMZWmOFQ==
X-CSE-MsgGUID: ykprKYviTLWPvd819OgOBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262805959"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2026 13:55:40 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/3] drm/xe/vm: Use regular comment for GSC VM lockdep note in
 xe_vm_create()
Date: Tue, 21 Jul 2026 20:55:16 +0000
Message-Id: <20260721205516.4058959-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721205516.4058959-1-shuicheng.lin@intel.com>
References: <20260721205516.4058959-1-shuicheng.lin@intel.com>
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

The block comment describing the GSC VM lockdep annotation uses the
kernel-doc opening marker (/**), but it is an in-function
implementation note rather than API documentation. Per
Documentation/doc-guide/kernel-doc.rst, /** is reserved for kernel-doc
comments describing functions, structs, and other API elements, and
using it for other comments can confuse kernel-doc tooling.

Switch it to a regular block comment (/*).

No functional change.

Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cdd131f7c7cf..5f37e84cb42a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1645,7 +1645,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 	if (xef)
 		vm->xef = xe_file_get(xef);
-	/**
+	/*
 	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
 	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
 	 * under a user-VM lock when the PXP session is started at exec_queue
-- 
2.43.0

