Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341FFC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 17:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB44F10E65F;
	Wed,  8 May 2024 17:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCUi1K2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2F410E65F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715190544; x=1746726544;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q+PPC36x8dfP67LbS20dBTwnGNgagKE0xCxjKzwb1OI=;
 b=KCUi1K2GkfdVycn7EqqVWj5MDiYghEqczxd6Dm+c9TAqbA5Z+XRPjSjC
 8dWe/1JbJIiCZxlAqi/W5NwQFDov8oKz5zHORnUPVO0QRu5AcvWZ07rWN
 5ZIfOkCplvNR7EQQSBnd8Rv0xz6nwrrdUALSxjcqlrhS8GObxjUupgARA
 6xcx27Z8tmwsGKYXmTpg7daxLA7HARVNwQb3CJT03NAjfHcTnUCERf26R
 ISa+KxVp/xisLpfI+jmNmLoWnKE4r9UoNieBUzk+i30lcDgCvCY8hD6KD
 +FPO2i/HBWpGZ0oat7LJ6PfcOL891DNmQbM1+zBDOkwDTfxhyY1mQWlnu g==;
X-CSE-ConnectionGUID: L4uoLfhJT+y6M5i2BQY2JQ==
X-CSE-MsgGUID: 6IQHzExvQfy6eElQvLs7Vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="33579392"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33579392"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:49:03 -0700
X-CSE-ConnectionGUID: dTE1yHvtQWeCAPWtae0fqA==
X-CSE-MsgGUID: gd+dSobWTFqGEZNe8eIRRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="52169744"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:49:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Move xe_gpu_commands.h file to instructions/
Date: Wed,  8 May 2024 19:48:56 +0200
Message-Id: <20240508174856.1908-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

All other files with commands definitions are in instructions/
folder. Move xe_gpu_commands.h also there.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/{regs => instructions}/xe_gpu_commands.h | 0
 drivers/gpu/drm/xe/xe_bb.c                                  | 1 -
 drivers/gpu/drm/xe/xe_device.c                              | 2 +-
 drivers/gpu/drm/xe/xe_execlist.c                            | 1 -
 drivers/gpu/drm/xe/xe_lrc.c                                 | 1 -
 drivers/gpu/drm/xe/xe_migrate.c                             | 2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                            | 2 +-
 7 files changed, 3 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/xe/{regs => instructions}/xe_gpu_commands.h (100%)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
similarity index 100%
rename from drivers/gpu/drm/xe/regs/xe_gpu_commands.h
rename to drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 37e056fde95d..a13e0b3a169e 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -6,7 +6,6 @@
 #include "xe_bb.h"
 
 #include "instructions/xe_mi_commands.h"
-#include "regs/xe_gpu_commands.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_exec_queue_types.h"
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b63d98872a41..f89c781986a5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -17,7 +17,7 @@
 #include <drm/xe_drm.h>
 
 #include "display/xe_display.h"
-#include "regs/xe_gpu_commands.h"
+#include "instructions/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index dece2785933c..e9dee1e14fef 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -9,7 +9,6 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
-#include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2066d34ddf0b..a0cdd6977ebe 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -11,7 +11,6 @@
 #include "instructions/xe_gfxpipe_commands.h"
 #include "instructions/xe_gfx_state_commands.h"
 #include "regs/xe_engine_regs.h"
-#include "regs/xe_gpu_commands.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9f6e9b7f11c8..36db5ed1a572 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -14,8 +14,8 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "instructions/xe_gpu_commands.h"
 #include "instructions/xe_mi_commands.h"
-#include "regs/xe_gpu_commands.h"
 #include "regs/xe_gtt_defs.h"
 #include "tests/xe_test.h"
 #include "xe_assert.h"
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index d42b3f33bd7a..a3ca718456f6 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -7,9 +7,9 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "instructions/xe_gpu_commands.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
-#include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_exec_queue_types.h"
-- 
2.43.0

