Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A5C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59D910F15B;
	Thu, 23 Jul 2026 16:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eX3Zz861";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D248210F15B
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823540; x=1816359540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RF5OaAPXmha0pSGADmZ4bkqw9/hKdraHzPeDJklPFoU=;
 b=eX3Zz861qwhc48GK6BV7gAQH5WX316pdavq/QHmsLaMpol7V7aJPJ4A4
 x1l/N8d10wNjJWxAQqAGYvuJ2i0nVOIyCQ7Wf8ASrgAY4JRzY/RcLyDML
 quagRYeunvauvVn6i/asBZotEGW78sFPyPkyaDZAEcGskOKzeMwHOOD1V
 uVSB4FZNq+M+hwJeFjFDfjlh3gQjvzX/rvkpmIHsin+YTYepLDMk457G9
 7tSzvbw6TuyAuerH1Kzope0ORMP6jn5nHwNU6oo8C2lOCEN1dQkoSP+gm
 fKMVhdF1qJnOqX45gyKhj+sc5XMAFSWS+hmxAWjuBntFvV4oCH26MB6op A==;
X-CSE-ConnectionGUID: +W4RRnohRGOYUn2EqKBgaA==
X-CSE-MsgGUID: AlnnFY2xTqqf3xLlkUw2ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88022902"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="88022902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:18:57 -0700
X-CSE-ConnectionGUID: tZE7l78bRKyxd7ACTvINnA==
X-CSE-MsgGUID: ao6JWtXLQ6CoOgCBiJgS0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255086045"
Received: from lharel-mobl.ger.corp.intel.com (HELO
 soc-PF64PT41.clients.intel.com) ([10.245.129.67])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:18:55 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, meny.yossefi@intel.com,
 shuicheng.lin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 1/7] drm/xe/mmio_gem: forbid VMA split
Date: Thu, 23 Jul 2026 19:18:26 +0300
Message-ID: <20260723161832.137153-2-ilia.levi@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260723161832.137153-1-ilia.levi@intel.com>
References: <20260723161832.137153-1-ilia.levi@intel.com>
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

The fault handler assumes it always operates on a VMA spanning the entire
GEM object. This does not hold when the VMA has been split, e.g. by a
partial munmap or mprotect. In that case the handler may map wrong
physical pages or cause SIGBUS.

Handle this by forbidding VMA split, as partial unmaps are not deemed
useful for MMIO GEMs.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 8c803ef233cc..f15a6a84af15 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -39,10 +39,20 @@ struct xe_mmio_gem {
 	phys_addr_t phys_addr;
 };
 
+static int xe_mmio_gem_vm_may_split(struct vm_area_struct *area, unsigned long addr)
+{
+	/*
+	 * Forbid splitting. Together with VM_DONTEXPAND, this keeps the VMA
+	 * matching the GEM object exactly.
+	 */
+	return -EINVAL;
+}
+
 static const struct vm_operations_struct vm_ops = {
 	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
 	.fault = xe_mmio_gem_vm_fault,
+	.may_split = xe_mmio_gem_vm_may_split,
 };
 
 static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
-- 
2.49.1

