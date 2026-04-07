Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF24EFB518A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7841810E345;
	Tue,  7 Apr 2026 03:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loSWJ0i5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F9C10E345
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775531087; x=1807067087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kqn5KTWfK9fvLPYDrjwinMBifyrwrnBY8kSEaVfZoAk=;
 b=loSWJ0i5y11HlQHPdN8aVSq/qNfr1Bu9JZ7rvlewU0Mt/yhzIcPvcV18
 tvmQnWY7d86Ez364x7N2zupsyzPsAQPFNLjRZHonI8R66+xADGtZ7NKck
 jrNoPbo2SgsbzbuvWpO2tJQnBhPjeDRo0mBVOjRSIdR00kYABQ2C1iZSI
 zXzCYlNroMI43HgXikjNvNgEIQIwqRUG+pr/mlRTrcHkPJHd1KGuk5KMY
 vrTJC967vAaySyCp8frFYhbOylmW4+L+Fp96HQIIZ6p1acw2hZYIEkVht
 vpwTWNgItvob4PjUif9Qixnp6sLBokQBRgBMEss1UYpOTSsKtYC7UfjYR A==;
X-CSE-ConnectionGUID: sGyP69U6Qm6WkPOl+rG+FQ==
X-CSE-MsgGUID: uTR92uK/R8+iqSFOrb4ZQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76201145"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76201145"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:04:46 -0700
X-CSE-ConnectionGUID: YmVZgbPVSKycn3AeBVNo7Q==
X-CSE-MsgGUID: u8YdL4LqQzykV1xU3pFwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225295101"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:04:46 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 5/6] drm/xe/uapi: Fix code examples in xe_drm.h
 documentation
Date: Tue,  7 Apr 2026 03:00:45 +0000
Message-ID: <20260407030046.3394004-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260407030046.3394004-1-shuicheng.lin@intel.com>
References: <20260407030046.3394004-1-shuicheng.lin@intel.com>
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
- Fix descriptive text trapped inside code-block in
  exec_queue_create doc (split into two code blocks)

v3: one more fix of split code-block in exec_queue_create doc.

Assisted-by: GitHub Copilot:claude-opus-4.6
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 include/uapi/drm/xe_drm.h | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8751ad7b845f..58614f62d65b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1401,23 +1401,25 @@ struct drm_xe_vm_get_property {
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
  *
- *     Allow users to provide a hint to kernel for cases demanding low latency
- *     profile. Please note it will have impact on power consumption. User can
- *     indicate low latency hint with flag while creating exec queue as
- *     mentioned below,
+ * Allow users to provide a hint to kernel for cases demanding low latency
+ * profile. Please note it will have impact on power consumption. User can
+ * indicate low latency hint with flag while creating exec queue as
+ * mentioned below:
+ *
+ * .. code-block:: C
  *
  *     struct drm_xe_exec_queue_create exec_queue_create = {
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
@@ -2019,7 +2021,7 @@ struct drm_xe_oa_config {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
+	/** @uuid: String formatted like "%08x-%04x-%04x-%04x-%012x" */
 	char uuid[36];
 
 	/** @n_regs: Number of regs in @regs_ptr */
@@ -2181,7 +2183,7 @@ struct drm_xe_query_eu_stall {
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

