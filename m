Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C012C5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 06:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCEE10EF1E;
	Thu, 20 Aug 2026 06:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rcq+YDLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A5310EF1E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787208897; x=1818744897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v6Qxkd9pDJZpYOSsgUg//4erP+b7TRaIPHPTUmrT8Xs=;
 b=Rcq+YDLrTeaR1JY/w77mSHmTLpySZJ3FAdIftlhBj1Wy6cZCpfeiPx3v
 Gsm9QmVZzaRhFY8AEAPyrvXKUR0qVy6vr3k0YWAKRdvPYLVnBh8yPGbjz
 TxuiptNvwe8jJdUjU25y1+dJdv9cXyuiOKjXDI91hN5rTQWmovNmgUcvg
 7+QdhhF4Gq7M3oLPywJwCaJMa/82PrNuiU/eXYuT9DqNPnjEpu06zxmK2
 eVPfk+ORjZeYLb2r8MLYK+IJL8I4mEzpbcww+Q79IMvPSS0GEblwBhGJN
 x+u/d3J7jIKxBdUyqdDVKoCT9BLI6l3O1LrV/7innCqprFZOrXpdyoKMt g==;
X-CSE-ConnectionGUID: oJ5GwtWhQPeNjKkymQ2LMg==
X-CSE-MsgGUID: J5GPhLQ6TFmLDX+OUZPjBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87650881"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="87650881"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 23:54:56 -0700
X-CSE-ConnectionGUID: SCE6C/LAQSyYvnx5zDnpiA==
X-CSE-MsgGUID: iuFgprPjTLO72NpKpez0OQ==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 23:54:54 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: Reject page faults from non-fault-mode scratch VMs
Date: Thu, 20 Aug 2026 12:24:45 +0530
Message-ID: <20260820065445.567228-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Having scratch enabled does not make a VM capable of handling recoverable
page faults. Allowing scratch VMs through the ASID lookup also admits
dma-fence mode VMs.

If such a VM faults on an already valid VMA, the handler reports success
without fixing the fault, causing the GPU to retry indefinitely.

Only allow fault-mode VMs through the ASID lookup. Fault-mode VMs using
scratch remain supported, while faults from 3D VMs are rejected.

Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index b2d7bca9e407..19cc7c59bec4 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -234,7 +234,7 @@ static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
 
 	down_read(&xe->usm.lock);
 	vm = xa_load(&xe->usm.asid_to_vm, asid);
-	if (vm && (xe_vm_in_fault_mode(vm) || xe_vm_has_scratch(vm)))
+	if (vm && xe_vm_in_fault_mode(vm))
 		xe_vm_get(vm);
 	else
 		vm = ERR_PTR(-EINVAL);
-- 
2.43.0

