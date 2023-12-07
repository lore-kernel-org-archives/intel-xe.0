Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABBAC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5498A10E7DE;
	Thu,  7 Dec 2023 05:23:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D1610E7DA
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701926619; x=1733462619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fi3jhXQp19yU4AVlCuRxW5dc/Lo7wZCXZbHPVH/p32I=;
 b=CS3Mi85pru+U/D04KReCuxhTk/XKEYvQbMzyBovw9z3SF4VmRVX5+q4h
 JnrZm1lgA+ocMQYBR1c7mGgk8C9YHxA9/dUMYtekMOzms2brlnzKRX7jj
 ZQOkivcFSTxDE7iKBsv+Qs595qdgKrmkhsqPTKKzGDfSWjC3V0+EY/NIT
 iA3d/FU/IqkiFxafvuK1qyl9ApH1DVPhCcILIK+qpExLvqYXTdiio7Ase
 9L9lNNa3w3yi37dNg9GM77W9twkFaGN/EulPy0IS/ZmsYr7MvFXB0Td4L
 Qvc6fF17FN+2IYbxbMQG0nneanILJUPATavUeGaYZnNZXhNwKe69BrneI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7482075"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7482075"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842086064"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842086064"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:36 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 07:22:51 +0200
Message-Id: <20231207052252.2092191-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207052252.2092191-1-jouni.hogander@intel.com>
References: <20231207052252.2092191-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 8/9] fixup! drm/xe/display: Implement display
 support
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding i915_gem_object_is_tiled and i915_gem_object_is_userptr for
intel_fb.c.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../xe/compat-i915-headers/gem/i915_gem_object.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 3b305c291cdd..996b4f4f27dc 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -6,6 +6,22 @@
 #ifndef _I915_GEM_OBJECT_H_
 #define _I915_GEM_OBJECT_H_
 
+#include <linux/types.h>
+
+#include "xe_bo.h"
+
 #define i915_gem_object_is_shmem(obj) ((obj)->flags & XE_BO_CREATE_SYSTEM_BIT)
 
+static inline bool i915_gem_object_is_tiled(const struct xe_bo *bo)
+{
+	/* legacy tiling is unused */
+	return false;
+}
+
+static inline bool i915_gem_object_is_userptr(const struct xe_bo *bo)
+{
+	/* legacy tiling is unused */
+	return false;
+}
+
 #endif
-- 
2.34.1

