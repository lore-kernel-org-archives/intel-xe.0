Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2DACAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF14710E85F;
	Thu,  2 Oct 2025 23:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kY1ZXLXd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6103210E0CF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759446288; x=1790982288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOSyPflZ6IpgNrg4Ax2ZCeGWhIXWxZMpFPv3ewkPQZ4=;
 b=kY1ZXLXdqDIEZ1dYSl/xmmEw+kv6CBJz0HDELsGujPUqVTgIUoYWhcFW
 E1HnJrUk6lq8Jw9ST1JbBBwi28NB2pxkb9M6yyfvtHW94oabtOfDUY3TC
 pUwg8+ydJ51zYKXdu0u8FknI4NXMUn2YFcYLIN/d4dMmIYrKxtIdlWVFf
 l3qzlD8TPASCtHyECtxEL83sepm+OSe5GV1YzWp3d156Ko49TjBfR1KfL
 +kXMmd1aD7IDRIWFgoMeesmrElIrXhDI6+U6p5MJCY+kc42EXr0OxW7o2
 GckXH6pCi7qePY8NivUvcpmoAa6HgJi8ggpNyNb3duNrpAsuedksJnE0x Q==;
X-CSE-ConnectionGUID: Ewi+IY3EQ1m8uxrLN0AGlQ==
X-CSE-MsgGUID: 0U+3LOlVS5mlG1fQN/PBJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79165579"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79165579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:47 -0700
X-CSE-ConnectionGUID: uRAej2rGTZaGUCGB1uBvkw==
X-CSE-MsgGUID: nBwi10Q3QcOQScDgFC4snw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179566719"
Received: from dut4351arlh.fm.intel.com ([10.105.10.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/7] drm/xe: Add a trace point for VM close
Date: Thu,  2 Oct 2025 23:04:39 +0000
Message-Id: <20251002230444.313505-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
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

All better tracking of error cases when calling through
xe_vm_close_and_put().

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 6 ++++++
 drivers/gpu/drm/xe/xe_vm.c       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 86323cf3be2c..238311cfb816 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -14,6 +14,7 @@
 
 #include "xe_bo.h"
 #include "xe_bo_types.h"
+#include "xe_exec_queue_types.h"
 #include "xe_vm.h"
 
 #define __dev_name_bo(bo)	dev_name(xe_bo_device(bo)->drm.dev)
@@ -223,6 +224,11 @@ DEFINE_EVENT(xe_vm, xe_vm_free,
 	     TP_ARGS(vm)
 );
 
+DEFINE_EVENT(xe_vm, xe_vm_close,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
 DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
 	     TP_PROTO(struct xe_vm *vm),
 	     TP_ARGS(vm)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4e914928e0a9..e5c196729b47 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1657,6 +1657,8 @@ static void xe_vm_close(struct xe_vm *vm)
 	bool bound;
 	int idx;
 
+	trace_xe_vm_close(vm);
+
 	bound = drm_dev_enter(&xe->drm, &idx);
 
 	down_write(&vm->lock);
-- 
2.34.1

