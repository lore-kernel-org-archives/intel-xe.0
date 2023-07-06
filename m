Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52707EB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 14:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267D110E412;
	Thu,  6 Jul 2023 14:27:50 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE2810E402
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688653668; x=1720189668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1hangm2nUJvR2emCc+DzMznlFOnOjJ5FiJG3rPnJEfU=;
 b=iY71VolF7KezqNMeLkslBaG7gTtPuPinh06Dxk84FLopAnHPUj7hkvmB
 rXsNc1+mHhctrO6ooy2RHrgK3GMPBHcp62500mCzeRVvln1PcNGEKTZOD
 9AchEts+ogvZ2o4Tu1+AOUF/vk5UW+1jdYev0lbWRlR/WaxtMbYzkZsC3
 bKdF0wsWdAwiuazlb6yS74JmeXN7NeGLB6OW0r8/wmcTqO3cB2ZyMs1lZ
 +SRYfPBE97AdgfqpxpivIU8DnQ6okBkyS7OXPiuKS/UOrVtZwbDHkpRmH
 jcKqnQcUD3c3NdASqaZcHHbA7ytBKMvZHAwSWJdiTS6tp6OcROT4DX7Up A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427293298"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="427293298"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="1050115785"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="1050115785"
Received: from rblanarx-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.33.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:27:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 14:27:28 +0000
Message-Id: <20230706142728.6-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706142728.6-1-francois.dugast@intel.com>
References: <20230706142728.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] fixup! drm/xe/display: Implement display
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix some SPDX license identifier warnings reported by checkpatch
in the display code.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 .../xe/compat-i915-headers/soc/intel_dram.h   |  5 +++++
 .../xe/compat-i915-headers/soc/intel_pch.h    |  5 +++++
 .../drm/xe/display/ext/intel_clock_gating.c   | 20 +-----------------
 .../drm/xe/display/ext/intel_device_info.c    | 21 +------------------
 .../drm/xe/display/ext/intel_device_info.h    | 21 +------------------
 5 files changed, 13 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
index 1532ca7e0af6..65707e20c557 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
@@ -1 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../../i915/soc/intel_dram.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
index 823803f7e853..9c46556d33a4 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
@@ -1 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
 #include "../../../i915/soc/intel_pch.h"
diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
index 0d67b0961d74..766c21a19181 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
@@ -1,25 +1,7 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2012 Intel Corporation
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  * Authors:
  *    Eugeni Dodonov <eugeni.dodonov@intel.com>
  *
diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 29f3909e018a..fb8112ee5b28 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -1,25 +1,6 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2016 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  */
 
 #include "intel_cdclk.h"
diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.h b/drivers/gpu/drm/xe/display/ext/intel_device_info.h
index 959acb261007..57f3aaaa95e5 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.h
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.h
@@ -1,25 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2014-2017 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
  */
 
 #ifndef _INTEL_DEVICE_INFO_H_
-- 
2.34.1

