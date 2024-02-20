Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B18BC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 09:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5BC10E053;
	Tue, 20 Feb 2024 09:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="ch1+ChuY";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F9910E053
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 09:00:21 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1708419611; bh=TLXVrQBKuRVXlq7TfCDSH1isfnII9nIJaTkf16Gw0qk=;
 h=From:To:Cc:Subject:Date:From;
 b=ch1+ChuY0m1IG2OlcrF1X/2UgFgF3cbMIsUoiDT04PB9Oh4cVlsolGv2zDhp1RPTv
 G7jjxoZ/m5RZ2ndoytv/OIoltouiAeOoq1UgEn6qaK5uXuqKMBuoa9508dOokMMdPD
 lFgzl6M2aKgQ2pQ/sfOcoPE/As2H7VQOUK1ZCXpf0XjXGMO92ErcSKWZ/M0trdqX6v
 Vta7/aS9ZfJTtFN9IJJjRVXXrc1ah+w6BM+HXqpMPPFadJtscmm2aQLdSY2GO0PmNM
 C/XQmZrHC0NMrD7bczqVpJQHpR+lHddyXgf9DOq0DAU1kmlYCqOT2AbdF5EZeUBTTN
 j76467s44r0UQ==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 41K9051V1523880
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 11:00:05 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 41K905HM1523879; Tue, 20 Feb 2024 11:00:05 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ogabbay@kernel.org, obitton@habana.ai, lucas.demarchi@intel.com,
 Dafna Hirschfeld <dhirschfeld@habana.ai>
Subject: [PATCH] drm/xe: change 'include' syntax for generate/xe_wa_oob.h
Date: Tue, 20 Feb 2024 11:00:03 +0200
Message-Id: <20240220090003.1523866-1-dhirschfeld@habana.ai>
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

The generated file 'generated/xe_wa_oob.h' is included using:
"generated/xe_wa_oob.h"
which first look inside the source code. But the file resides
in the build directory and should therefore be included using:
<generated/xe_wa_oob.h>

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
---
 drivers/gpu/drm/xe/xe_gsc.c            | 2 +-
 drivers/gpu/drm/xe/xe_guc.c            | 3 ++-
 drivers/gpu/drm/xe/xe_migrate.c        | 3 ++-
 drivers/gpu/drm/xe/xe_ring_ops.c       | 3 ++-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 3 ++-
 drivers/gpu/drm/xe/xe_vm.c             | 3 ++-
 drivers/gpu/drm/xe/xe_wa.c             | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0b90fd9ef63a..ea01caeb423c 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -6,9 +6,9 @@
 #include "xe_gsc.h"
 
 #include <drm/drm_managed.h>
+#include <generated/xe_wa_oob.h>
 
 #include "abi/gsc_mkhi_commands_abi.h"
-#include "generated/xe_wa_oob.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 868208a39829..fa217f5a386e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -7,9 +7,10 @@
 
 #include <drm/drm_managed.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_errors_abi.h"
-#include "generated/xe_wa_oob.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3d2438dc86ee..a66fdf2d2991 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -12,7 +12,8 @@
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
 
-#include "generated/xe_wa_oob.h"
+#include <generated/xe_wa_oob.h>
+
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gpu_commands.h"
 #include "tests/xe_test.h"
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index d5e9621428ef..c4edffcd4a32 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -5,7 +5,8 @@
 
 #include "xe_ring_ops.h"
 
-#include "generated/xe_wa_oob.h"
+#include <generated/xe_wa_oob.h>
+
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 662f1e9bfc65..3107d2a12426 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -11,7 +11,8 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 
-#include "generated/xe_wa_oob.h"
+#include <generated/xe_wa_oob.h>
+
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda..efe9a0d300c0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -18,6 +18,8 @@
 #include <linux/mm.h>
 #include <linux/swap.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -34,7 +36,6 @@
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
 #include "xe_trace.h"
-#include "generated/xe_wa_oob.h"
 #include "xe_wa.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 3299130ba10a..a0264eedd443 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -9,7 +9,8 @@
 #include <kunit/visibility.h>
 #include <linux/compiler_types.h>
 
-#include "generated/xe_wa_oob.h"
+#include <generated/xe_wa_oob.h>
+
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
-- 
2.34.1

