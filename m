Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9F6C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 13:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52DC10EC10;
	Tue,  8 Sep 2026 13:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoZUauXu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA6F10EC0A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788875457; x=1820411457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIQiM4HWI7Yjxs74bLFNGL0H1WgrAeVBRnl3CHA1OZM=;
 b=LoZUauXurKfWjNoLKObYiUWIlbe2C4TQuMDLnu9IP8d3EO5IRCgrZgwP
 hSIhpvUJsC2E981HiPQjsiXJ7CzbyQy3POvVudgdW32PhZXM3GUzY/D5J
 3xCRgp42ptwZNvp/WKXtVW0RRTVshGUUMbCIEk2a/zq8J2yPmBblzSbl3
 X2g7vrXzMywl9dyAou2kXS3MCBYUxLhUc4Te00ntDp1vlc/58Q31wJaFg
 a1culG8py/ILCYasAFnmy9QiDOF3CeIv/ouufpemnk4uw0vfotoSRRazD
 W0xo82UjxB18E/toUS2Y9wmFFzTc17PXZ8TY1y7dTqEteX2vaV/8EwNEl g==;
X-CSE-ConnectionGUID: EmYMw5wuQJ+Hr4ZbRJqHcw==
X-CSE-MsgGUID: SIHgOmiCR/uJZwVDBQ2vMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106793388"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106793388"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:57 -0700
X-CSE-ConnectionGUID: YFbWSH+nQ7y87u2Ca4G9hg==
X-CSE-MsgGUID: YZrEpjhkStCOMjbGdCnbnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270519723"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH v4 7/8] drm/xe/mmio_gem: reject VM_EXEC and drop VM_DONTCOPY
Date: Tue,  8 Sep 2026 14:50:03 +0100
Message-ID: <20260908134955.1344429-17-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908134955.1344429-10-matthew.auld@intel.com>
References: <20260908134955.1344429-10-matthew.auld@intel.com>
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

