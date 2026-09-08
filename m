Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB348C79F9E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 16:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6236310ED39;
	Tue,  8 Sep 2026 16:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bujX1/H5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CA710ED32
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788886278; x=1820422278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9QfJCFMkDgfIR+Y+hb2Id+Bp8GUCpTsWUGHl86yIH0=;
 b=bujX1/H548YJDG+UmWa+MIXXMvCceYXeMgcZzKsgSsnhRkyc0Vl6maLQ
 kj1oa0vwO6GUOMobL8zg/LvhEWC9mOpGWr13464eiM5dQyivF1clfO9Da
 H8ykJQPRYKoSqru14FYQdBKBdQIhlhskQ/2oBZyJ4WZWo3hrnvPal5oer
 Rqg7AGn8EvUj/z/LSiV2pOv9cP+G05g48Fdz0F+ZxmExaYVBQdnQqT50A
 skxeccPZYDrd8poRZWuvEjzIUbogeZ36YS41IcdQlf3IECGR2H5BBlDP3
 SlXZmA5bdbT4dljouFFLSGo9CPGUFrpmPKcrI6RXbgz3YoxvktljfnWfs A==;
X-CSE-ConnectionGUID: 0X+YzwJyR1qVzcO8NgvMKw==
X-CSE-MsgGUID: b1tU8NSjTSSdk9WHMBCmMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99888279"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="99888279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:18 -0700
X-CSE-ConnectionGUID: UiY7L9zBQQySioQ2pbz6Lg==
X-CSE-MsgGUID: tfAHg5dFT3anxvgZqfD0dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="272995706"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:16 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH v5 7/8] drm/xe/mmio_gem: reject VM_EXEC and drop VM_DONTCOPY
Date: Tue,  8 Sep 2026 17:50:54 +0100
Message-ID: <20260908165046.1393557-17-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908165046.1393557-10-matthew.auld@intel.com>
References: <20260908165046.1393557-10-matthew.auld@intel.com>
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

Hardware MMIO registers should never be executable; reject VM_EXEC
at mmap time and clear VM_MAYEXEC to prevent later mprotect attempts.

Also drop VM_DONTCOPY so that child processes across fork() can
inherit the mapping and lazily fault in the PFNs, matching standard
DRM GEM semantics and making the existing drm_gem_vm_open() callback
functional.

This aligns with existing PCI_BARRIER, which will use this in the next
patch. We don't want any noticeable behaviour change there, since this
will be user visible. This will also be the first user.

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_mmio_gem.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 5ffe03d36190..3cdc9538957d 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -177,9 +177,12 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
 	if ((vma->vm_flags & VM_SHARED) == 0)
 		return -EINVAL;
 
+	if (vma->vm_flags & VM_EXEC)
+		return -EINVAL;
+
 	vma->vm_page_prot = pgprot_noncached(vma_get_page_prot(vma));
-	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
-		     VM_DONTCOPY | VM_NORESERVE);
+	vm_flags_mod(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+		     VM_NORESERVE, VM_MAYEXEC);
 
 	/* Defer actual mapping to the fault handler. */
 	return 0;
-- 
2.55.0

