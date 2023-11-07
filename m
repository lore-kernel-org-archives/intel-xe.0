Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362E6C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 08:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC5710E4CB;
	Tue,  7 Nov 2023 08:24:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B277F10E4CB
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699345495; x=1730881495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cXthRh/VLdTUbs3Bn4hHPHXoBN0ElmGDCzj6EFV0S+c=;
 b=cxf3bmzoIz8X+uYhu9ZWTg4d477FQdmWXS45rG7MrItyhO96x/ZPUN1A
 E/eoYhuvirYna/BjndzOcG+GJnYY2euSJpplSukTUKBYXOAfycgYBu2j3
 G4d1sPPG3hryQoUF7EgFda78prLtqLdRyb8z0lkwqPSRQo2K0vejcvA7Q
 MOr5KE8QU2A9IBXC5UmVTN7EVPvngVRUO7yDJcYXgEbqLgdf2nCGe6uxF
 f4AkjEW3gPVyaEAnLav/aR5qYCop1l4zYeDQPxOcWfSn/Cmfeikp7kszL
 d4Q9Y00f+mhjl7IKjp1IItNnmi6eym21lVRMs8tnfB2+fHRHQno2yXpSy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="389266397"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="389266397"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 00:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="879727029"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="879727029"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.78])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 00:24:53 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Nov 2023 09:24:40 +0100
Message-ID: <20231107082440.7568-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Update SPDX deprecated license identifier
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The "GPL-2.0" SPDX license identifier is deprecated. Update the
code to use "GPL-2.0-only" instead. Choose this identifier over
"GPL-2.0-or-later" since it's the most restrictive of the two and it's
not fully clear that "GPL-2.0" also allows "GPL-2.0-or-later".

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt_walk.c    | 2 +-
 drivers/gpu/drm/xe/xe_pt_walk.h    | 2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h | 2 +-
 drivers/gpu/drm/xe/xe_trace.c      | 2 +-
 drivers/gpu/drm/xe/xe_trace.h      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt_walk.c b/drivers/gpu/drm/xe/xe_pt_walk.c
index 0def89af4372..8f6c8d063f39 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.c
+++ b/drivers/gpu/drm/xe/xe_pt_walk.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
index 42c51fa601ec..ec3d1e9efa6d 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.h
+++ b/drivers/gpu/drm/xe/xe_pt_walk.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 006fc1361967..0a306963aa8e 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
 /*
  * Copyright 2020 Advanced Micro Devices, Inc.
  *
diff --git a/drivers/gpu/drm/xe/xe_trace.c b/drivers/gpu/drm/xe/xe_trace.c
index 2570c0b859c4..2527c556bff1 100644
--- a/drivers/gpu/drm/xe/xe_trace.c
+++ b/drivers/gpu/drm/xe/xe_trace.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index d55dd1521df3..1536130e56f6 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright © 2022 Intel Corporation
  */
-- 
2.41.0

