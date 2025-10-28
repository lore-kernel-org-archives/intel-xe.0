Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64391CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FA910E5CD;
	Tue, 28 Oct 2025 12:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leI0UBrC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A10010E5D4
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654315; x=1793190315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rQU7Fr6kuU1VtLRh/Vl5nIc9cJcKVfv5Oc+xMjwYHDg=;
 b=leI0UBrCvT/KAeSZ+5ZGlAJ0dJ3jRrpFX0jSozx0KqMq3n4C+LTov88h
 QiOSFbwFSlGjoELiGqwl3I00xZnKA0eePguaO5ULP9pPImPbWdzKanHAI
 NkLQCgspfp5bm54VGfvoMcsP7M08AMFZFpixjMaaQpC/i2rNfS/Tgkdxa
 t0BhrfdUlhzcuX6RDKG5mDycOvr05NykEL+CO9xo1MNhb89XLEw603A7u
 b31W6ccWulMh3jOOICnb4VdadMBlz5JK4lp0GygsPWVbZaR83N8rQrKqQ
 1t/ZbPCfrp7Ons+Nes5eS6jgFIProhzjhxwaN9+kWWlEHVN1m61xXyTgy A==;
X-CSE-ConnectionGUID: u/IWs0GWTgiXkNulfTzoyg==
X-CSE-MsgGUID: JVxxuWTKSVGl1M9R1iJ+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956646"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:14 -0700
X-CSE-ConnectionGUID: QZqP5GbzR8eZEC/W9LTIlA==
X-CSE-MsgGUID: FhJDCELXSWekBVhbgifMyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524466"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:13 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 7/9] drm/xe/vm: Prevent binding of purged buffer objects
Date: Tue, 28 Oct 2025 17:54:13 +0530
Message-ID: <20251028122415.1136721-8-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
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

Add validation in the VM bind ioctl path to prevent a purged buffer
object (BO) from being bound to a virtual address space.

When a BO is in the `XE_MADV_PURGEABLE_PURGED` state, its memory has
been reclaimed by the kernel, and its contents are invalid. Attempting
to bind such a BO is an error, as it would lead to the GPU operating
on undefined memory.

This patch checks the BO's madvise state inside
`xe_vm_bind_ioctl_validate_bo()`. If the state is
`XE_MADV_PURGEABLE_PURGED`, the function now returns `-EFAULT`,
signaling an invalid memory access to the application.

Userspace must first re-validate the buffer by calling `madvise(WILLNEED)`
before it can be successfully bound again. This change ensures a clear
error path and prevents silent data corruption.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 10d77666a425..b8d60550c191 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3466,6 +3466,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u16 pat_index, u32 op, u32 bind_flags)
 {
 	u16 coh_mode;
+	int state;
 
 	if (XE_IOCTL_DBG(xe, range > xe_bo_size(bo)) ||
 	    XE_IOCTL_DBG(xe, obj_offset >
@@ -3473,6 +3474,11 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return -EINVAL;
 	}
 
+	state = atomic_read(&bo->madv_purgeable);
+	/* Cannot bind a purged BO: must madvise WILLNEED first (revalidation path) */
+	if (state == XE_MADV_PURGEABLE_PURGED)
+		return -EFAULT;
+
 	/*
 	 * Some platforms require 64k VM_BIND alignment,
 	 * specifically those with XE_VRAM_FLAGS_NEED64K.
-- 
2.43.0

