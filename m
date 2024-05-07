Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD264C25B75
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 11:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E07D10F505;
	Tue,  7 May 2024 11:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCzPpIJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751F310F4EF
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715080209; x=1746616209;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SCvymZmTCfqV2w7cF7P+yEJsxuKCw8k0etOJKRur0pA=;
 b=fCzPpIJTs9ZKkMCvFOZQeH3wTWhE5KEqC6EqKESx9QJXtYidSGisVeRe
 MzM7iz/9tALCpyciB7U1Nh2pbYl/s66Y/F6wGe16qoaCwpsyFLiLWMpAj
 ovT0EqNQySozx8ou0cO5+jMoawWc7VLfINuqW8aHrd4MKpSvwRyiBxMKK
 3uhTfZ7vkj8tjr0hEw0cityURs49AMTDpqInL31MeKJ/plv3Hf9sgrjFy
 aKBKfpmrflU5NcUHlHqraBxcDQDrVgKLsaSgbqeU09h0OetOJdK/BUqFg
 2JBfOgX7NfxCNmoBTZUqCq3o3Bms1cqxODv9rZ2eQQMCSLsKF2kEosBZb Q==;
X-CSE-ConnectionGUID: S7DMUgh0Ts64W4/EYvnG/Q==
X-CSE-MsgGUID: DmwlKyUFTDKD7C6bYIHhcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21534528"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="21534528"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:10:09 -0700
X-CSE-ConnectionGUID: dC9SEcpPT6S2TLdEJ/Vsxw==
X-CSE-MsgGUID: +sJjPVwNRia4KlqlfgiraQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="33053719"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:10:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe: Don't rely on xe_assert.h to be included elsewhere
Date: Tue,  7 May 2024 13:09:57 +0200
Message-Id: <20240507110959.2747-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240507110959.2747-1-michal.wajdeczko@intel.com>
References: <20240507110959.2747-1-michal.wajdeczko@intel.com>
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

While xe_assert.h is now included and used by the xe_force_wake.h,
we want to stop include xe_force_wake.h from xe_device.h as it's
not needed there.  Explicitly include xe_assert.h where needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c         | 1 +
 drivers/gpu/drm/xe/xe_gsc_submit.c | 1 +
 drivers/gpu/drm/xe/xe_gt_clock.c   | 1 +
 drivers/gpu/drm/xe/xe_uc.c         | 1 +
 drivers/gpu/drm/xe/xe_vm.h         | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 541361caff3b..37e056fde95d 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -7,6 +7,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gpu_commands.h"
+#include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
index d34d03248843..9ede483d37ef 100644
--- a/drivers/gpu/drm/xe/xe_gsc_submit.c
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
@@ -8,6 +8,7 @@
 #include <linux/poison.h>
 
 #include "abi/gsc_command_header_abi.h"
+#include "xe_assert.h"
 #include "xe_bb.h"
 #include "xe_exec_queue.h"
 #include "xe_gt_printk.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index c7bca20f6b65..9ff2061133df 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -7,6 +7,7 @@
 
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0f6cfe06e635..45035e38388b 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -5,6 +5,7 @@
 
 #include "xe_uc.h"
 
+#include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gsc.h"
 #include "xe_gsc_proxy.h"
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 204a4ff63f88..3ac9021f970e 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -6,6 +6,7 @@
 #ifndef _XE_VM_H_
 #define _XE_VM_H_
 
+#include "xe_assert.h"
 #include "xe_bo_types.h"
 #include "xe_macros.h"
 #include "xe_map.h"
-- 
2.43.0

