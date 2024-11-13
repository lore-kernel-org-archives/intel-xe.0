Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B835D462A6
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 14:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE54110E713;
	Wed, 13 Nov 2024 14:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4Dw/KIn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2221E10E70E;
 Wed, 13 Nov 2024 14:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731506777; x=1763042777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F99+D3f4Jz9QtWpiizcMQnW9R/W5QDFiUHCg2/7eFBc=;
 b=f4Dw/KInhKgjfYtP9IuDu9k19RN7bgLN0bB3bfKjvjm1r/2YbcvCaDqA
 7573l86LDLIur9HvD2NM8ZIxphhW694Nqu6ZG9cIYVE6lN/61/8xXlQbz
 aF0XOmtlL6AQurAooskNQYd+rcIPrwUQrx55dpS72JFeTAmDAetMH1YMh
 Qsk/4lL7/RPkz5ugqFOUQn/NiD5Iix4hrI+YvtkXA+g4zCTfHUieTkFkA
 Vy+5uEhMgVE9invjVVZcolq/WYQOLbEYnuAAgxEWWZz4rNfBwo0q0jxtW
 vpXwZ9sCayzggDY44N/R4+psTPuXr7KsT/UrwyRzuL84HYmfORF9buxaN g==;
X-CSE-ConnectionGUID: IHHjydq4Rj+2fA/zNPHutQ==
X-CSE-MsgGUID: rkpg0jQhT1WdXS4dcZOcoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30792354"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="30792354"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:06:17 -0800
X-CSE-ConnectionGUID: BusAxl9LRNKtnYP7YRIKZw==
X-CSE-MsgGUID: hPzAVnazSG2N1ZEn87Zfsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="92654135"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:06:15 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/4] lib/i915_drm_local: Remove macros added via merged kernel
Date: Wed, 13 Nov 2024 19:40:09 +0530
Message-Id: <20241113141012.1362064-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
References: <20241113141012.1362064-1-tejas.upadhyay@intel.com>
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

