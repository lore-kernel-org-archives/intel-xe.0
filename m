Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3170AD65553
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 05:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1A10EC23;
	Thu, 28 Nov 2024 05:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRgUSgYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AED210E23C;
 Thu, 28 Nov 2024 05:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732773144; x=1764309144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eO17UJigM8JTxlq4sWJZKudi6hLJrqL/9SeYrCwxlac=;
 b=kRgUSgYJFwDFJPTabbtmNYXLU+UNuQJWfkHWWRumksTVR6ziL9FYrqZ3
 rcdDSVwZLNa8+1oPIQCS9oPJuNR8zuFtuiJlMEqnKi1UzzPgihozZ+0/z
 Szaib79RJVkTTdwDjm0FajG7Jb4Wi/Tyawq8HjbLM80UpLi+6MjmrdOQ+
 o93mzEva2GDfL6ts1JwMFDeUY7KUpvOx986qqTUxR732jGs1qfJ5yc4iC
 zi+ebZwsCLInpCFUhP/lAu2+NTeR3P/sKSxUNCdYm5OoDsITRWwyOy1zw
 a5B/Ob5tpSsaRoCEs/EW9QAckVIqzywLWzisAKUBEp6ys+k6TpGLzuWew A==;
X-CSE-ConnectionGUID: auV2zGKjRaqhQAJuCYGFNA==
X-CSE-MsgGUID: RFcyBviyRiyerG9yZ7TA8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32366804"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="32366804"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 21:52:24 -0800
X-CSE-ConnectionGUID: oT8yr2KORBKE7i2f9GQ/BA==
X-CSE-MsgGUID: 0s3NO12gSyqBTYLIzf71JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97201719"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 21:52:22 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [i-g-t V5 1/4] lib/i915_drm_local: Remove macros added via merged
 kernel
Date: Thu, 28 Nov 2024 11:26:44 +0530
Message-Id: <20241128055647.1677371-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128055647.1677371-1-tejas.upadhyay@intel.com>
References: <20241128055647.1677371-1-tejas.upadhyay@intel.com>
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

