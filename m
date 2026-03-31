Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E3310F92E6
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 17:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7AC10ED07;
	Tue, 31 Mar 2026 17:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/SbMvXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA94710ED07
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774977915; x=1806513915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2m1wpN3uBmPJD3tF7hbwgfk/krA7hT096gC7R4nUOZ8=;
 b=M/SbMvXltnEBQlqv7Z07JS4N3tgotTisLvD5zXMrr3G4Qcvx7Rf4rPjZ
 mAQgZwaGV/8tahUmDCbIXMt7us65imEe9lXw9v2MFBM/9h9gRkWG7tq9D
 kJiyDuLtS2CIGk6owvK9UdGoMD0II4ThsMun9RH96wsMWiYCBrDrf2uFJ
 MxckTPA+0fAaBg4ghopHZJ94uq4jD3y68gNJPTSd36r8B2ABMmbkVi/VD
 QfkHadTeHrr2st5jvmoDtZGZSQEJWFkZh4MlIKTOtNvGvLkxxHYJJExnW
 xK3TmrjmZngUaRHzS1EgEApL2dxSPeI7a8Oviud8L+7yUOE2j65mCqd3s g==;
X-CSE-ConnectionGUID: wnPQknUZRoeoL/UCj7I6lA==
X-CSE-MsgGUID: zkvACn+GQhmRRDeOrfeggw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76016573"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="76016573"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 10:25:12 -0700
X-CSE-ConnectionGUID: xhgEkEKvRyCDr9Iwe1fQVA==
X-CSE-MsgGUID: 39EhRx6qS8Obuz3uyFZTUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="223551865"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 10:25:10 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 4/5] drm/xe/uapi: Fix code examples in xe_drm.h documentation
Date: Tue, 31 Mar 2026 17:20:54 +0000
Message-ID: <20260331172049.3053871-11-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331172049.3053871-7-shuicheng.lin@intel.com>
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
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

Fix incorrect field names and formatting in code examples:
- .num_bb_per_exec -> .width (renamed struct field
  in exec_queue_create examples)
- .num_eng_per_bb -> .num_placements (renamed struct
  field in exec_queue_create examples)
- .atomic_val -> .atomic.val (correct nested struct
  field access in madvise example)
- Remove unnecessary backslash escaping in UUID format
  string (%\08x -> %08x)

Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 include/uapi/drm/xe_drm.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 36627322448c..c2e8cf31a82a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1401,8 +1401,8 @@ struct drm_xe_vm_get_property {
  *     struct drm_xe_exec_queue_create exec_queue_create = {
  *          .extensions = 0,
  *          .vm_id = vm,
- *          .num_bb_per_exec = 1,
- *          .num_eng_per_bb = 1,
+ *          .width = 1,
+ *          .num_placements = 1,
  *          .instances = to_user_pointer(&instance),
  *     };
  *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
@@ -1416,8 +1416,8 @@ struct drm_xe_vm_get_property {
  *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
  *          .extensions = 0,
  *          .vm_id = vm,
- *          .num_bb_per_exec = 1,
- *          .num_eng_per_bb = 1,
+ *          .width = 1,
+ *          .num_placements = 1,
  *          .instances = to_user_pointer(&instance),
  *     };
  *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
@@ -2019,7 +2019,7 @@ struct drm_xe_oa_config {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
+	/** @uuid: String formatted like "%08x-%04x-%04x-%04x-%012x" */
 	char uuid[36];
 
 	/** @n_regs: Number of regs in @regs_ptr */
@@ -2181,7 +2181,7 @@ struct drm_xe_query_eu_stall {
  *         .start = 0x100000,
  *         .range = 0x2000,
  *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
- *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
+ *         .atomic.val = DRM_XE_ATOMIC_DEVICE,
  *    };
  *
  *    ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
-- 
2.43.0

