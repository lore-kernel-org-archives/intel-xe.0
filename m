Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ACAC7EE33
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DD310E56E;
	Sat, 25 Feb 2023 00:16:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A655810E5D9
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284188; x=1708820188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YqSx9PiT4wt/seyGSBY7meNCnFxuocKg7KHlKdp4Jwo=;
 b=mCQkEw8Ls+o2pCReIvXbDM7W6n+5wJkOOWaGJieLjib6iGjrdJLXyb04
 WAGcZ2TL3D0TpGv713W7wGly9Ufxsgx7ttMIYD5z4xcspunH21n1NrZB5
 lHOu2MDKC7CK7A/NH11JUADUm0eunbm1S7a7vYi8JM3ajRb02yhPdLgkb
 G+vb7W3WpMH7yJ381YQLVVQ4kYXt7BnfZc1frlLhFAchwS7AMX+Y8w5ff
 BJg7Jgv3sTEP72gcR3cqPW6abrs1m0N+e1O3lKDxn55ad5jvLRYlr1df5
 tDrx63Vr1qp7TcjKLINjftUimNTXc0YoZRvg46RhbzuAFHLVXjBr3I0id A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332297356"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="332297356"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761956606"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="761956606"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:15:48 -0800
Message-Id: <20230225001548.1743820-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230225001548.1743820-1-lucas.demarchi@intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 12/12] drm/xe: Prefer single underscore for
 header guards
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Keep header guards consistent with regard to ifdef used. Prefer the more
commonly used in the driver.

	$ git grep  "ifndef __XE_" -- drivers/gpu/drm/xe | wc -l
	8
	$ git grep  "ifndef _XE_" -- drivers/gpu/drm/xe | wc -l
	112

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo_test.h      | 4 ++--
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h | 4 ++--
 drivers/gpu/drm/xe/tests/xe_migrate_test.h | 4 ++--
 drivers/gpu/drm/xe/tests/xe_test.h         | 4 ++--
 drivers/gpu/drm/xe/xe_gt_topology.h        | 4 ++--
 drivers/gpu/drm/xe/xe_map.h                | 4 ++--
 drivers/gpu/drm/xe/xe_migrate.h            | 4 ++--
 drivers/gpu/drm/xe/xe_res_cursor.h         | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.h b/drivers/gpu/drm/xe/tests/xe_bo_test.h
index d751a618c0c8..0113ab45066a 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_bo_test.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef __XE_BO_TEST_H__
-#define __XE_BO_TEST_H__
+#ifndef _XE_BO_TEST_H_
+#define _XE_BO_TEST_H_
 
 struct kunit;
 
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
index 4e9a8bef5751..e6b464ddd526 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef __XE_DMA_BUF_TEST_H__
-#define __XE_DMA_BUF_TEST_H__
+#ifndef _XE_DMA_BUF_TEST_H_
+#define _XE_DMA_BUF_TEST_H_
 
 struct kunit;
 
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.h b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
index db1f8ef035bb..7c645c66824f 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef __XE_MIGRATE_TEST_H__
-#define __XE_MIGRATE_TEST_H__
+#ifndef _XE_MIGRATE_TEST_H_
+#define _XE_MIGRATE_TEST_H_
 
 struct kunit;
 
diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
index 1ec502b5acf3..00c8a3f9af81 100644
--- a/drivers/gpu/drm/xe/tests/xe_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_test.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef __XE_TEST_H__
-#define __XE_TEST_H__
+#ifndef _XE_TEST_H_
+#define _XE_TEST_H_
 
 #include <linux/types.h>
 
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index 7a0abc64084f..70a86538f742 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef __XE_GT_TOPOLOGY_H__
-#define __XE_GT_TOPOLOGY_H__
+#ifndef _XE_GT_TOPOLOGY_H_
+#define _XE_GT_TOPOLOGY_H_
 
 #include "xe_gt_types.h"
 
diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index 0bac1f73a80d..032c2e8b5438 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef __XE_MAP_H__
-#define __XE_MAP_H__
+#ifndef _XE_MAP_H_
+#define _XE_MAP_H_
 
 #include <linux/iosys-map.h>
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index b2d55283252f..a569851db6f7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -3,8 +3,8 @@
  * Copyright © 2020 Intel Corporation
  */
 
-#ifndef __XE_MIGRATE__
-#define __XE_MIGRATE__
+#ifndef _XE_MIGRATE_
+#define _XE_MIGRATE_
 
 #include <drm/drm_mm.h>
 
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 365c8ad7aeb8..4e99fae26b4c 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -21,8 +21,8 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#ifndef __XE_RES_CURSOR_H__
-#define __XE_RES_CURSOR_H__
+#ifndef _XE_RES_CURSOR_H_
+#define _XE_RES_CURSOR_H_
 
 #include <linux/scatterlist.h>
 
-- 
2.39.0

