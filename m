Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A1BCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A4910E0D3;
	Mon, 13 Oct 2025 22:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A22gT0pR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1CE10E0D3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760394698; x=1791930698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ApzGEXphjvlwlZH3j6dOmuiJhwPoo758VWhghBYAtEY=;
 b=A22gT0pRqMdfwG0RmvkM+rgAHkFq8hbrvooX1zEWm7WK4AzRgG8Ii4HB
 76WVHnUjv91pe2pYJnhAxATTUvRG051J4R/CYQH1T+pr/WzSGtCsz1f12
 eZrJrTLExf/YhrGq/jfv/bxdx7lj7vmYi4IPPM4xziTpDEiUHbsqk39Tt
 4ZttV4iKHzaJe8w48nYYJcEjUik+kySjedg1evjyf1NNIdF2IXNXEhbFK
 dLjRsaB/Lg/q/FWyJoz2DvrfvvzlOwMK9IDso/teV6iAk8NGh2wgWEJJ0
 jKlO7VX0jBRqNBhvK49RhN4vkjJTI9VUsAf8WzDsss99rVsZiMWxZBccR g==;
X-CSE-ConnectionGUID: u81SXBK4SXGhni0D7pKt7A==
X-CSE-MsgGUID: hbJZoFUpR8OCBs1vb4YKdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="79987307"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="79987307"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
X-CSE-ConnectionGUID: gh9m0b7KRiGxpQVLUnQgEQ==
X-CSE-MsgGUID: KrYohrlDTdyP621yw179Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="212677579"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/7] drm/xe: Add a trace point for VM close
Date: Mon, 13 Oct 2025 22:31:30 +0000
Message-Id: <20251013223135.189357-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013223135.189357-1-stuart.summers@intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
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
index 179758ca7cb8..64b8a170efcf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1681,6 +1681,8 @@ static void xe_vm_close(struct xe_vm *vm)
 	bool bound;
 	int idx;
 
+	trace_xe_vm_close(vm);
+
 	bound = drm_dev_enter(&xe->drm, &idx);
 
 	down_write(&vm->lock);
-- 
2.34.1

