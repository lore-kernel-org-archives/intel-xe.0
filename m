Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589F8EB64D9
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 17:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1407E10E5CD;
	Fri,  7 Jul 2023 17:10:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B44B10E5C7
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688749857; x=1720285857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2cpkFNJMao6ZVH/j4cEPQphGKsi3kWJnYFLLzCJpF4w=;
 b=nrBvCVHsw8Qmmfga34I3zVBQVR+/WljUlpVSaPC8UuxGTjSEhYaqKW/i
 umZD6OxRtaXMvuF1NBb5ZKLbGiWz+Fukz7bQMlVafuGz2uvr29YeHDKxo
 cuUqwzMNPDgCePOIONvd6X+mpn6KD4IR/+1tlmuXGrElepxSO2ROQVKMr
 6garK3jtfVD1pA0QObPaS5yv8fNWOrW5P8NaGxt1DMCZE/pwBiY409Ew2
 RWll7jTmPZ5BJAzBfOu8Y1d5+Drx9dQwlG8wKu1/03/n+vZJOMv3yQYIt
 Hhcy530ux/uqHITj4VxsvKIiELgYvYBmZx+MGJ5v6I8Pq25W1rGFWgiIZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="344265978"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="344265978"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 10:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="844169289"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="844169289"
Received: from bbeuka-mobl37.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.33.65])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 10:10:54 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  7 Jul 2023 17:10:39 +0000
Message-Id: <20230707171039.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
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

Fix the SPDX license string so that it can be picked by tools.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.c | 2 +-
 drivers/gpu/drm/xe/xe_trace.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.c b/drivers/gpu/drm/xe/xe_trace.c
index 1026fb37f75b..2570c0b859c4 100644
--- a/drivers/gpu/drm/xe/xe_trace.c
+++ b/drivers/gpu/drm/xe/xe_trace.c
@@ -1,4 +1,4 @@
-// SPDX-Liense-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 02861c26e145..7fdbcec8c781 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -1,4 +1,4 @@
-/* SPDX-Liense-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright © 2022 Intel Corporation
  */
-- 
2.34.1

