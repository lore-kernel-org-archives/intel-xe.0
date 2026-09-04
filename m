Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E873C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 07:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47E010F8E2;
	Fri,  4 Sep 2026 07:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kw6WeiY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EC510F8C7
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 07:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788506586; x=1820042586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KZO6NKGFWh42W8EDKB6Cv9PvJ5QcQHaMowjGJpnytk4=;
 b=Kw6WeiY9EbBx0GTD7PFKytRSgzDvHm5h4fVQ7XJN5oOCs6BcIFzekVzr
 2MKPClX4+QyKUCYfdd6DxaxEOWYGxgbIrPmys0MVcVbPR8lXHkAS1yeu4
 oE/9NwcZwP/e87rgy/6hByjXj4HtBErz2YP6/vF5pPLIN5gi5RLxKu3gn
 xPA8Jz9e3FlqYCVVsI4J4d6uKMQd54dYrtL7GltJZrZqRO7oUY0fy4/WN
 oLEXPzHS+jUvr1zKI1MuT6f+R9fU5eGmyzZokpScoP/ULXzIuctW5pB5N
 LK01PigsGulUIt+gK6TMiVsM2xknd/tz120GfKnaXW+m8NZFGkCVktQFf Q==;
X-CSE-ConnectionGUID: cwsuTM7JSqymhCSASklSMA==
X-CSE-MsgGUID: O5Is+tIXTHy3oIzLQ+v1Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92822948"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92822948"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 00:23:06 -0700
X-CSE-ConnectionGUID: vgQAMguJRAOk11Ul28W2RQ==
X-CSE-MsgGUID: KrLzkRmhT12/vpeKL504Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="269424444"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 00:23:05 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] drm/xe/vm: Handle purged BOs in VM snapshots
Date: Fri,  4 Sep 2026 12:52:52 +0530
Message-ID: <20260904072252.4009491-1-arvind.yadav@intel.com>
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

v2:
 - Read the BO resource once with READ_ONCE(). (Matt)

Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260831064942.315720-17-tejas.upadhyay%40intel.com?part=4
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 19b3d0be7928..fcdd34c4f0fa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4663,20 +4663,29 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 			XE_VM_SNAP_FLAG_READ_ONLY : 0;
 		snap->snap[i].pat_index = vma->attr.pat_index;
 		if (bo) {
+			struct ttm_resource *res;
+
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
+			res = READ_ONCE(bo->ttm.resource);
+			if (!res) {
+				snap->snap[i].data = ERR_PTR(-ENODATA);
+			} else {
+				switch (res->mem_type) {
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

