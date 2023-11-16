Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D863CC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8A010E689;
	Thu, 16 Nov 2023 19:40:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537F510E68A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700163638; x=1731699638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zliB8edtr436r3MjleoWZB4X8Z4vQtkAK89/pWI8fuU=;
 b=EmLzijWrLCtJGdjeSCbQ/ApAn5NCaXllxeOnks+IttCT89ILEmByhvR5
 XpEQ63NlcSzJw09sH2Gjj8f2+Amk+2IPVQbbWU374vdV5QrDfLt30Z7mJ
 a/WA4WVwfHjBOVZ5rnLt5LqyaEPVHZ94vsh4ZuwM69aWi0K+IC+WdxB3T
 uyNx4IkVOYAqF/mB9fAilcUzcVFq3jYvmjUZ2q/kZpuiWzizCWl7yIIl7
 Qszv/m4Bt4/kfss7cjua1mkIcRt4H/y+gBdiFTqHK9TPWqSCWngjw1gqv
 GCZOEHDgW7LP9OGsRixpnR9HY1CiHv/I5QKOVI8+oI4EvQFHhQb1xnMyf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="394016992"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="394016992"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769004699"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="769004699"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:40:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 11:40:45 -0800
Message-Id: <20231116194047.214330-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116194047.214330-1-matthew.brost@intel.com>
References: <20231116194047.214330-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] drm/xe: Use a flags field instead of bools
 for sync parse
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

Use a flags field instead of severval bools for sync parse as it is
easier to read and less bug prone.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 5 +++--
 drivers/gpu/drm/xe/xe_sync.c | 8 +++++---
 drivers/gpu/drm/xe/xe_vm.c   | 5 +++--
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 28e84a0bbeb0..7d4d22c81a42 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -181,8 +181,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	for (i = 0; i < args->num_syncs; i++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
-					  &syncs_user[i], true,
-					  xe_vm_no_dma_fences(vm));
+					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
+					  (xe_vm_no_dma_fences(vm) ?
+					   SYNC_PARSE_FLAG_LR_MODE : 0));
 		if (err)
 			goto err_syncs;
 	}
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 73ef259aa387..016d0a2ea5bc 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -100,10 +100,12 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
-			bool exec, bool no_dma_fences)
+			unsigned int flags)
 {
 	struct drm_xe_sync sync_in;
 	int err;
+	bool exec = flags & SYNC_PARSE_FLAG_EXEC;
+	bool lr_mode = flags & SYNC_PARSE_FLAG_LR_MODE;
 	bool signal;
 
 	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
@@ -118,7 +120,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
 	case DRM_XE_SYNC_SYNCOBJ:
-		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
+		if (XE_IOCTL_DBG(xe, lr_mode && signal))
 			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
@@ -136,7 +138,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
-		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
+		if (XE_IOCTL_DBG(xe, lr_mode && signal))
 			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 13c8a9c6117c..1f3e5dcbef9e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3089,8 +3089,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	syncs_user = u64_to_user_ptr(args->syncs);
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
-					  &syncs_user[num_syncs], false,
-					  xe_vm_no_dma_fences(vm));
+					  &syncs_user[num_syncs],
+					  xe_vm_no_dma_fences(vm) ?
+					  SYNC_PARSE_FLAG_LR_MODE : 0);
 		if (err)
 			goto free_syncs;
 	}
-- 
2.34.1

