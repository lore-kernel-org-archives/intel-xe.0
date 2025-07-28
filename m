Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66926C87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 04:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0598910E033;
	Mon, 28 Jul 2025 04:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BE3RzFsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C19810E033
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 04:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753677220; x=1785213220;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OWbjNMAy1FwVu/ixTUJBUFhHd9y8JZT6cqfMmf6kcIY=;
 b=BE3RzFsg6c7myW0r74bL8l0UgowvfAzUuXt4dTf3MZLUL+u+rP3mSUR6
 IB9hTj+5Xzr+FPF6TGbX+aH2IlS5pdJoiNWdzjqHDfGLIeBKosyAn0jzL
 IQV4ebHkwwrG7ZJMQ+jl657ZPPforu3cir+1JuJMBkYBcHZtVujMzZJRL
 nLiF7b8tI+egl7r3XDbK/mIuFOc5A+ZZgVliyXDn5SLHYtf0fS+VXXiXs
 8Zhqm9YS2NdwIa0c9Qp09hhDlG7L1JqSSGqhFKTbioT6qawpn9aEc1FLt
 mJcDi8+TRRl0NFhr8iSR0pqMlRp4fBipacJfuSpI5oj73yb3P2cIlMit+ A==;
X-CSE-ConnectionGUID: /bMo6G0RRLOH9BjndefgAQ==
X-CSE-MsgGUID: cfKemWV8R9WCofb4o58fbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56010505"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56010505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 21:33:39 -0700
X-CSE-ConnectionGUID: ml1UTkrnQbe6QAALBJVK4w==
X-CSE-MsgGUID: 1aGfOFgtQeeUzqaDGqmlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="199453104"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by orviesa001.jf.intel.com with ESMTP; 27 Jul 2025 21:33:37 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/uapi: Add documentation for
 DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
Date: Mon, 28 Jul 2025 10:03:36 +0530
Message-Id: <20250728043336.3319521-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add documentation for drm_xe_gem_create structure flag
DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING.

v2: Modified to be in a more generalised way.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/uapi/drm/xe_drm.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e2426413488f..c721e130c1d2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -760,7 +760,11 @@ struct drm_xe_device_query {
  * gem creation
  *
  * The @flags can be:
- *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
+ *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING - Modify the GEM object
+ *    allocation strategy by deferring physical memory allocation
+ *    until the object is either bound to a virtual memory region via
+ *    VM_BIND or accessed by the CPU. As a result, no backing memory is
+ *    reserved at the time of GEM object creation.
  *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
  *    possible placement, ensure that the corresponding VRAM allocation
-- 
2.34.1

