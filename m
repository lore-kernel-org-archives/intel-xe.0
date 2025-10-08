Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7FDCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 11:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B6A10E30D;
	Wed,  8 Oct 2025 11:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dF0OZ+Bv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDAE10E30D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759921873; x=1791457873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n/cIJtId66b5NFwru5ZPadg6Ij5eTi04mCC2MNNU4ZE=;
 b=dF0OZ+BvLSlkG8rkKfcLGzMV3S2PN0+kEXVH/GOsqkvq5vgH/1V/0v7C
 AAFmQepXz6Dd1vRbQFTybdZHPGWdUfz72L+uIHUnsZvD1Wzu6RqRAC2Rb
 Yd6Fcq6u2dHUtbnZqUK6uCcm0oe+ckkWgJwaXx1aGPVbNzwjrJKGcHmFx
 O9i3b2EgW45/M1x1UTGXer/Vohdx9EmqcK+qd+WOYl6sZ8T4l8s5pCwjy
 rf4juvlYvDLRE/8ARiBfsQBQLBG1SJQALG9a6wDsYSejFbYK/YeL9FNd3
 Wj+7pVWKmFyU+wdXCMHEE8dlBR4DlCkf0j6xqmmZzW1sHXwvzoJz/Larc w==;
X-CSE-ConnectionGUID: Tw7RrMaSQ3ilwrVJ2UD34g==
X-CSE-MsgGUID: Od6wiheZTGWefRwfmhSsSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62154436"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="62154436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:11:13 -0700
X-CSE-ConnectionGUID: XBSBQhVDTxCKnvJwQThkyw==
X-CSE-MsgGUID: B2F+kLsYSeKMzA1lCBgIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="211358689"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:11:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/2] drm/xe/svm: Ensure data will be migrated to system if
 indicated by madvise.
Date: Wed,  8 Oct 2025 13:10:49 +0200
Message-ID: <20251008111050.293151-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008111050.293151-1-thomas.hellstrom@linux.intel.com>
References: <20251008111050.293151-1-thomas.hellstrom@linux.intel.com>
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

If the location madvise() is set to
DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, the drm_pagemap in the
SVM gpu fault handler will be set to NULL. However there is nothing
that explicitly migrates the data to system if it is already present
in device memory.

In that case, set the device memory owner to NULL to ensure
data gets properly migrated to system on page-fault.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7e2db71ff34e..fd906eb03d71 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1034,6 +1034,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
+	dpagemap = xe_vma_resolve_pagemap(vma, tile);
+	if (!dpagemap && !ctx.devmem_only)
+		ctx.device_private_page_owner = NULL;
 	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
 
 	if (IS_ERR(range))
-- 
2.51.0

