Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDCEE92715
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A3D10E438;
	Thu,  5 Oct 2023 15:31:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F2510E430;
 Thu,  5 Oct 2023 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519909; x=1728055909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FO+GtowxHiXrJHco/RKXDDSDlSq8G7meN/+MDsU3HYY=;
 b=Th00D13zDQnuAHkOA3V7Btj2lG9B1x3DYYtAgr/icj1FFvYUvicJlCrG
 arJQyGX8ioSE5ayqEzPSZtvRUdGomQSFE+V49fkYIFXd8X0f+k9NcSrW5
 X+uRHweJTeE5Nvh+pp5YjWPTqBwtqwFNwxd6LK3bflMHz3hphb5rt+f9l
 Tfa4N/2IS6pWNldX3DMCD9TstwQI/38Eiz7Kbs8EUgZGLmff8XK9k8HuV
 YlIXieK8dbguOmzDvH/RGG7eNB2XKFNhV+wEl4bh/CuMwOQ9S4VZ0wEA6
 kNdje6qo5Sjm8SKkSjljU9jpwAwhvPELzJs7tVltuB/eTkuxNfnN5w/lq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363810940"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363810940"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925631340"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925631340"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:31:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:14 +0100
Message-ID: <20231005153116.452319-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 10/12] lib/xe_ioctl: update vm_bind to
 account for pat_index
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Keep things minimal and select the 1way+ by default on all platforms.
Other users can use intel_buf, get_offset_pat_index etc or use
__xe_vm_bind() directly.  Display tests don't directly use this
interface.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/xe/xe_ioctl.c   | 8 ++++++--
 lib/xe/xe_ioctl.h   | 2 +-
 tests/intel/xe_vm.c | 4 +++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 80696aa59..ebaed1e96 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -41,6 +41,7 @@
 #include "config.h"
 #include "drmtest.h"
 #include "igt_syncobj.h"
+#include "intel_pat.h"
 #include "ioctl_wrappers.h"
 #include "xe_ioctl.h"
 #include "xe_query.h"
@@ -92,7 +93,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
 		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
-		  uint64_t ext)
+		  uint8_t pat_index, uint64_t ext)
 {
 	struct drm_xe_vm_bind bind = {
 		.extensions = ext,
@@ -107,6 +108,8 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		.num_syncs = num_syncs,
 		.syncs = (uintptr_t)sync,
 		.exec_queue_id = exec_queue,
+		.bind.pat_index = (pat_index == DEFAULT_PAT_INDEX) ?
+			intel_get_pat_idx_wb(fd) : pat_index,
 	};
 
 	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
@@ -121,7 +124,8 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint32_t num_syncs, uint32_t region, uint64_t ext)
 {
 	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
-				   op, sync, num_syncs, region, ext), 0);
+				   op, sync, num_syncs, region, DEFAULT_PAT_INDEX,
+				   ext), 0);
 }
 
 void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index c18fc878c..cafbb011a 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -20,7 +20,7 @@ uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
 		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
-		  uint64_t ext);
+		  uint8_t pat_index, uint64_t ext);
 void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
 			  uint32_t op, struct drm_xe_sync *sync,
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 4952ea786..ffb70973b 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -10,6 +10,7 @@
  */
 
 #include "igt.h"
+#include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
@@ -316,7 +317,8 @@ static void userptr_invalid(int fd)
 	vm = xe_vm_create(fd, 0, 0);
 	munmap(data, size);
 	ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
-			   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0, 0);
+			   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0,
+			   DEFAULT_PAT_INDEX, 0);
 	igt_assert(ret == -EFAULT);
 
 	xe_vm_destroy(fd, vm);
-- 
2.41.0

