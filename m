Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF81C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 19:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AA310FF21;
	Wed, 20 Mar 2024 19:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8XREq7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DE810FF22
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 19:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710963734; x=1742499734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+futQIdecaQsNrxBX4Ih2CzEQH40DMO7ITY7hpnkLQw=;
 b=g8XREq7OkvCjYHdrohsEBNtwjZtPI2t3nsUnz7JhRMbUSexHlL4kllmN
 9CX5coRhmsyo/L0pJJ2WWkQ1PwzGaIrI1bXoTYj0L1PRo/fSY+374rIeF
 MJ9hMZ2z0U6LKBhDUz+mqav24RRketu7aeA7Qew35q9yZeMSeq6TZGoqz
 XUhleMsDdCCo/8RdOKwaKLuvwzQ75Wjpb37RCv+Y+4TgBcUufDZjesrNY
 OR1bDli1zid6iS2eIt8XYeYU1L6cj+ISbqXORpu9VuS5IiaYG0DXD+n3y
 aRbTgPbJ1aDl8GcDBjcP3f0GVSHbU2M8jwAO2lPZjchY5N8DUElxXkRe0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23371115"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="23371115"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14163302"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:42:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Add debug messages for MMU notifier and VMA invalidate
Date: Wed, 20 Mar 2024 12:42:32 -0700
Message-Id: <20240320194232.1910688-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Extra debug is useful when working on VM issues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80d43d75b1da..e3692b7e1711 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -648,6 +648,10 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	if (!mmu_notifier_range_blockable(range))
 		return false;
 
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
+		xe_vma_start(vma), xe_vma_size(vma));
+
 	down_write(&vm->userptr.notifier_lock);
 	mmu_interval_set_seq(mni, cur_seq);
 
@@ -3233,6 +3237,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	xe_assert(xe, !xe_vma_is_null(vma));
 	trace_xe_vma_invalidate(vma);
 
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "INVALIDATE: addr=0x%016llx, range=0x%016llx",
+		xe_vma_start(vma), xe_vma_size(vma));
+
 	/* Check that we don't race with page-table updates */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
 		if (xe_vma_is_userptr(vma)) {
-- 
2.34.1

