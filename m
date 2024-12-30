Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55182E77194
	for <intel-xe@archiver.kernel.org>; Mon, 30 Dec 2024 12:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9B610E4CD;
	Mon, 30 Dec 2024 12:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ku1c2Cd+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA5A10E4CD;
 Mon, 30 Dec 2024 12:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735563179; x=1767099179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eO17UJigM8JTxlq4sWJZKudi6hLJrqL/9SeYrCwxlac=;
 b=Ku1c2Cd+LRGYNODV5NSXxieF3eN1au8b/CBfuTQSXXe9I0Cn5orfsFyK
 dm/ahKfK3oOPCLW9BsGP2swjYsPU6UdmyGtT/8o002zeAaTQp+glPvepD
 WXAZyr8QjUW1UA5sIwgi9kU7T+gs9bAcJeTQd6L6/X6xk0em/MIJNLLST
 lNCGPD1u4ZIyURCKLoFmtUl4SX0dmXJ9ksI2rOyliWMFKHSNvwEPEJ2EQ
 JhmGgl+7EYCAtWNx9DKiuGCx6ur4WVVkQfR8iTy/1zMVJpZupqUcuIjvB
 uHsi2YYsl1NCkzOlgZgnr2/CwHZ5qmr6WDIX1p2/rIan7a2pvk46Qvzpb w==;
X-CSE-ConnectionGUID: e432AilkQjql91OkX5pk+Q==
X-CSE-MsgGUID: f19997LNR8SBkb8jYegiLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46846504"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="46846504"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 04:52:59 -0800
X-CSE-ConnectionGUID: DwgoRpr5TFOQGlkl9WRJrw==
X-CSE-MsgGUID: uyOAPLjsQGm1WWQOoX+vYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105780640"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 04:52:57 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Auld@freedesktop.org, Matthew <matthew.auld@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V6 1/4] lib/i915_drm_local: Remove macros added via merged
 kernel
Date: Mon, 30 Dec 2024 18:27:54 +0530
Message-Id: <20241230125757.2581381-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230125757.2581381-1-tejas.upadhyay@intel.com>
References: <20241230125757.2581381-1-tejas.upadhyay@intel.com>
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

