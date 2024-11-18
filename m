Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAF5D49210
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 11:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD9D10E4A3;
	Mon, 18 Nov 2024 11:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4Uqb4ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42D210E49E;
 Mon, 18 Nov 2024 11:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731929520; x=1763465520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eO17UJigM8JTxlq4sWJZKudi6hLJrqL/9SeYrCwxlac=;
 b=I4Uqb4phuKybB9y5L6EjHZY2Hw7AjwyhawVKIs6ndFF31Q8Z14Goe+yx
 QIMh4x5SNovDIc1PaUf103HxEiNx8xCvyWEqSkY+HvX1lVKkYAHTiIiIM
 quJ+aIsFyfmmhqLe1y/ZqstZNN4AVdh4EWb4Z+nMPpP1PX3UsKyJ86Dp2
 MbROACJn02RYuW5OC+VGWLbte7KiNzmLxAlIfxIGqJI+i2qn5uNzib+Pm
 lLWc5qTXuljaO2T99kZGl71Skr50bGk0G+mgLZFsHiAUyTP0frxhT6bYZ
 6iIboiEeY1xSIemdcNc7OTFLdmFMh7xY6rwiG6WfAdn6g5M1z2g3DIaZN g==;
X-CSE-ConnectionGUID: ROZGzAyITYOXs/tu0xp5mw==
X-CSE-MsgGUID: 5U6WUQLkQQyNMNQ092v2qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35655439"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="35655439"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:32:00 -0800
X-CSE-ConnectionGUID: mJBFQw6oSSKEjcz8tQS14g==
X-CSE-MsgGUID: Xbn4ePDpSZe0qPXFrYGo5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="93655315"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:31:58 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [i-g-t V3 1/4] lib/i915_drm_local: Remove macros added via merged
 kernel
Date: Mon, 18 Nov 2024 17:06:03 +0530
Message-Id: <20241118113606.1490397-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118113606.1490397-1-tejas.upadhyay@intel.com>
References: <20241118113606.1490397-1-tejas.upadhyay@intel.com>
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

