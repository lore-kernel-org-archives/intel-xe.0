Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA103D591A8
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 17:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D9010E538;
	Mon, 18 Nov 2024 17:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtW4cJ2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB48710E538;
 Mon, 18 Nov 2024 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731950849; x=1763486849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eO17UJigM8JTxlq4sWJZKudi6hLJrqL/9SeYrCwxlac=;
 b=gtW4cJ2yArNrfkztZvR6u1zqtQbhWGamuX3h1FMuMQ1Fxb5zx7YA7FBD
 yPVSQOIe27MApvghaqNjdzI5x3aaorYs3b4pEbVgpICAC/MmaXyKFgrCD
 jyQ2gUCdTeMAPN1MHS/lwymEXdqosjbHlQ+QS+hZagmOA4rRr8uKQ2om0
 Jd/p/rdgNqJevGVPj4XBYp9lP8TRFsTT31pyxsFc+Vv+Poav+JhJPY4kn
 /nonukCD9acIHc42ReQBRmDFWIoRTOuVfvTrbTAH7LzHa9Q2vdOIglPhO
 id+G8f+mMfxxTrRHTuXOnMMSRz5DCSxWax291F2tkQ94XoHbq+YQFge62 A==;
X-CSE-ConnectionGUID: j+jGV0gOQY2BKa1l8M4WdQ==
X-CSE-MsgGUID: xrMA59VQQWekyjYmgD8flA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31857916"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31857916"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:27:28 -0800
X-CSE-ConnectionGUID: teoeYrojSlumkEs9n9r22A==
X-CSE-MsgGUID: Bp6/ixM2QqinndpEZwmWsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94099938"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:27:26 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [i-g-t V4 1/4] lib/i915_drm_local: Remove macros added via merged
 kernel
Date: Mon, 18 Nov 2024 23:01:34 +0530
Message-Id: <20241118173137.1512581-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118173137.1512581-1-tejas.upadhyay@intel.com>
References: <20241118173137.1512581-1-tejas.upadhyay@intel.com>
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

The uapi on the kernel side is merged, I915_ENGINE_CLASS_COMPUTE,
DRM_I915_PERF_PROP_OA_ENGINE_CLASS, DRM_I915_QUERY_GEOMETRY_SUBSLICES
and DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE  is part of drm-next,
remove this.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 lib/i915/i915_drm_local.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index af0176500..dd646aedf 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -19,12 +19,6 @@ extern "C" {
  * or local_ prefix and without any #ifndef's. Attempt should be made to
  * clean these up when kernel uapi headers are sync'd.
  */
-#define I915_ENGINE_CLASS_COMPUTE 4
-
-#define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
-
-#define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
-#define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
 
 #if defined(__cplusplus)
 }
-- 
2.34.1

