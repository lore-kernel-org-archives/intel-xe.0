Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C04C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 09:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5BB10E0B9;
	Thu,  3 Sep 2026 09:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3Er8tNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D39910E0B9
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788426402; x=1819962402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dYoats7e3KasBS6xLpy5hOsNw0HlMCoXL1yI8gSnBWs=;
 b=l3Er8tNy1WnUgZd1pevgFM/gHkICW+x/WBCST8gqgfaSngNSXGNJ8DxI
 nl+3c71M2YtqEGAkRMr0fjA48xCtoepY6mmIckxmzGauRvlj7Xfbf70gw
 9fy3S4cJ3j86UEHe93Mg8cRSdnQ+TChLLg0/zTlAP/DzNgWsJeFEDgJq6
 MOkNMH/1rch7/BSCtOeedt2KLs1ZZ2kFYtsT8fpYl7tIV0b0Ygc+19Ign
 wu9ENeS2OY+rmwHByxYbdF3GHHJm1IzO3gx8M/9m/GaZWkUT3/nEqNPqQ
 rD9vldRHNew07TOdPyR2hndo7GTTJY+EuiTUefZ0fjyeKujlwd4QX5WAX g==;
X-CSE-ConnectionGUID: jckVJef7S+KE9Fb06c054g==
X-CSE-MsgGUID: /Ujm5rorRwO3PvJhDNPEGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88749898"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="88749898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 02:06:42 -0700
X-CSE-ConnectionGUID: lJ+xVar2SO2+k9522xZyYw==
X-CSE-MsgGUID: RoZHUQxvR1iuxdl01eGKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="293171715"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 02:06:39 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/xe/vm: Handle purged BOs in VM snapshots
Date: Thu,  3 Sep 2026 14:36:30 +0530
Message-ID: <20260903090630.3857182-1-arvind.yadav@intel.com>
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

A purged BO can remain in a VM after its TTM resource has been freed.
xe_vm_snapshot_capture() can then dereference a NULL resource while
capturing a devcoredump.

Record -ENODATA for the affected VMA instead of dereferencing
the resource.

Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260831064942.315720-17-tejas.upadhyay%40intel.com?part=4
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 19b3d0be7928..77a851d9e373 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4666,17 +4666,23 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 			snap->snap[i].cpu_caching = bo->cpu_caching;
 			snap->snap[i].bo = xe_bo_get(bo);
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
-			switch (bo->ttm.resource->mem_type) {
-			case XE_PL_SYSTEM:
-			case XE_PL_TT:
-				snap->snap[i].uapi_mem_region = 0;
-				break;
-			case XE_PL_VRAM0:
-				snap->snap[i].uapi_mem_region = 1;
-				break;
-			case XE_PL_VRAM1:
-				snap->snap[i].uapi_mem_region = 2;
-				break;
+			snap->snap[i].uapi_mem_region = -1;
+
+			if (!bo->ttm.resource) {
+				snap->snap[i].data = ERR_PTR(-ENODATA);
+			} else {
+				switch (bo->ttm.resource->mem_type) {
+				case XE_PL_SYSTEM:
+				case XE_PL_TT:
+					snap->snap[i].uapi_mem_region = 0;
+					break;
+				case XE_PL_VRAM0:
+					snap->snap[i].uapi_mem_region = 1;
+					break;
+				case XE_PL_VRAM1:
+					snap->snap[i].uapi_mem_region = 2;
+					break;
+				}
 			}
 		} else if (xe_vma_is_userptr(vma)) {
 			struct mm_struct *mm =
-- 
2.43.0

