Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75081C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 13:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B098113388;
	Fri,  5 Apr 2024 13:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZ+v1unb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50130113711
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712324385; x=1743860385;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5MOOP59NefGiVk9s9B22iGpThKjQWOWbOvxKTDOS+1Q=;
 b=CZ+v1unbYSQzgamLWGrCTP/p8gJvSzUhV4583WO5jsGsv8TvYOatUuKo
 zbQnDC7QHl+5blsAdMMMNADQYuj8o1hSiEGTd35YE3VFrpc9LkdI7ZNeP
 Hmo+V9EaGu+0fhD81Nm03wgbjCnyzhBk2BQRLOhdxkIGwaC22YfwCCxPW
 JHIYI0lKze5KEx+tJsvhAlmQVV9BVT26mYbgNXpOJZeLZnwRiSgigGRKW
 5UOc1EonIzaxL+vf5mkmowD7ZwnnOBW34YPDAHnI1KNBFfNE8swaasi8p
 zCi96ahZ0AEJBZawzv2wykFsgLQygGCaVdlZLw1hBcPqKWgqJPYqFjL8X Q==;
X-CSE-ConnectionGUID: Rgx73tzvRlauC3GbMeZhJA==
X-CSE-MsgGUID: LVWZR4wrRH+D7I1F8f+ilA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7838165"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7838165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:45 -0700
X-CSE-ConnectionGUID: UqnaHKTeSnmezckdALL2rA==
X-CSE-MsgGUID: /UBajjwARKy8lcFOIazQnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19239406"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/vf: Don't emit access to Global HWSP if VF
Date: Fri,  5 Apr 2024 15:39:34 +0200
Message-Id: <20240405133936.891-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240405133936.891-1-michal.wajdeczko@intel.com>
References: <20240405133936.891-1-michal.wajdeczko@intel.com>
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

VFs can't access Global HWSP, don't emit questionable MI_FLUSH_DW
while processing a migration job.

Bspec: 52398
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 5b2b37b59813..d42b3f33bd7a 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -17,6 +17,7 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_sched_job.h"
+#include "xe_sriov.h"
 #include "xe_vm_types.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
@@ -367,10 +368,12 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
 
-	/* XXX: Do we need this? Leaving for now. */
-	dw[i++] = preparser_disable(true);
-	i = emit_flush_invalidate(0, dw, i);
-	dw[i++] = preparser_disable(false);
+	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
+		/* XXX: Do we need this? Leaving for now. */
+		dw[i++] = preparser_disable(true);
+		i = emit_flush_invalidate(0, dw, i);
+		dw[i++] = preparser_disable(false);
+	}
 
 	i = emit_bb_start(job->batch_addr[1], BIT(8), dw, i);
 
-- 
2.43.0

