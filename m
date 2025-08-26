Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFC8CA0FF2
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 17:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97F310E6B1;
	Tue, 26 Aug 2025 17:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBErpBLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABAF10E6B1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756230652; x=1787766652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CvEQ6QFqtpRuIjWlQrPo7dQP+d9Q4DRdX/k5APELPGc=;
 b=TBErpBLhAnNhd5sKULTzOS/8x34ZCNVEWifgY32U0gt67NsBwVBYUYg/
 mW/tuZquLyAFEQjliq0BBP/M4lyLwhZOsG31iUbIXJyhLXDi8v0bj1RZR
 mDPoqQmR/Md+SOsIEG+L80FpWQXJaq6fTDfl8psxLX6iSKgb7XKP+rKPT
 UmHoSLRamS20KALTkoUyoQICK5YTgXkx6qGGCmv6OkmRphfWG8QPhORo9
 WdhJKRF9DDDwtHdzhZQAkHtnv7SZ4B8Iyq5N/+By1sjsMWHq2OKzyNTu2
 OcfzKgBR/MM0Pp4POjEQzAcD7cwqtGZZCvXX7zvsd2rQsafv/iQNKFEMn A==;
X-CSE-ConnectionGUID: Y8PgAciYSwKABRw2EkriRQ==
X-CSE-MsgGUID: YZRQMINRQOCp24gVq0wbsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61110843"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61110843"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:50:52 -0700
X-CSE-ConnectionGUID: wjMS3oSnSqaXEGN9CaLvXQ==
X-CSE-MsgGUID: KiKZ5AVxSFONz1rWoChz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169150391"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:50:52 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH 2/2] drm/xe/xe_vm: Add error injection support to lock and prep
Date: Tue, 26 Aug 2025 17:50:54 +0000
Message-ID: <20250826175051.92563-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826175051.92563-4-jonathan.cavitt@intel.com>
References: <20250826175051.92563-4-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1a8841116e40..e527c90b8c33 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3201,9 +3201,10 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
 	return 0;
 }
 
-static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
-					   struct xe_vm *vm,
-					   struct xe_vma_ops *vops)
+static noinline int
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

