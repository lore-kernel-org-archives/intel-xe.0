Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203CECA0FF0
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 20:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F6010E3BA;
	Tue, 26 Aug 2025 20:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWJjAlDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954E510E6DC
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 20:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756241881; x=1787777881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEP5Ge7QCRSB9EP5tbQrZKtglQHGFNE2n6ae+yqknfc=;
 b=WWJjAlDddNvc2F1juh+RSxHfldT75yVrp9PYiAdKK+moXXPIw2Meb6nh
 n1qV2tsHcQWJEcYRAx3dAvuOjbpDgJUtSRX/HX4STjjDVEyndywMtMiOx
 21EanZ6AIVCHxkqCC7z4mnSj4QxFYLHUOGtcU1Y7zhJjAP+tmJRUPfZC0
 doQo2LUme8xKSjyMZwOtOgw+3mdQwdmts9T4ZK738J3fswQ9iXCUgygr4
 kTNtyiNi1pCIJT3xeslIhPcISzYTQAcn0B+a8MzGI0QbjQ4dLT7Fzb4n8
 Hmtr3w4WHHRbw1DYbXRTI87WMCaA15kuXgNt0ZeSgADUTFSS/lapC39n4 w==;
X-CSE-ConnectionGUID: iev1gycwSeWNXe4k+lxZEA==
X-CSE-MsgGUID: zWhXKtMFR8WL4px3cTPmAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58425202"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58425202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:58:01 -0700
X-CSE-ConnectionGUID: sQBjmqM5Rq2VrKh5E+PAuQ==
X-CSE-MsgGUID: IEDlVltmQmaRoTacN41kAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169583890"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:58:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 3/3] drm/xe/xe_vm: Add error injection support to lock and
 prep
Date: Tue, 26 Aug 2025 20:58:02 +0000
Message-ID: <20250826205758.235606-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826205758.235606-5-jonathan.cavitt@intel.com>
References: <20250826205758.235606-5-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ce8a35418357..41006d355468 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3201,9 +3201,10 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
 	return 0;
 }
 
-static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
-					   struct xe_vm *vm,
-					   struct xe_vma_ops *vops)
+static error_injectable int
+vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
+				struct xe_vm *vm,
+				struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op;
 	int err;
@@ -3220,6 +3221,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_lock_and_prep, ERRNO);
 
 static void op_trace(struct xe_vma_op *op)
 {
-- 
2.43.0

