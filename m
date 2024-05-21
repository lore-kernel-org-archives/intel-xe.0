Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58162C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB44910EA61;
	Tue, 21 May 2024 10:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2EGrKy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5A510EA61
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287321; x=1747823321;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RrFNA8VbAEYDwjRBpic4mKeT6W+rZd57zm4tpoMp+mA=;
 b=L2EGrKy8hipHIsrdM+ABHiDXw5CP8qzgwJSTJv7Tz7hKKshk5f89bLF8
 VTf/RuHSrlyhucknePlt3hxR8nTNGpUvXyUoU4E6ImkxWZPKNukIuiRTE
 MbalSAK/jAr6SfwfHFyjy6+5Qlkt9OrtwXn8wIGAzcUG2tspMHNhuadqQ
 Cds7K21x9WuBm1XA2XscY9NUX70Cul3z4TM7FpFGOrCnBuMwCvoOObuU3
 b08jQHaWlG4njOpLmOLSLZuJImaxRjPxIucESqwpjp2j1UG4Kx4v9S1Tz
 aaSWCvJXyGFOfiqfnxtnx34qKwWOK94eMEGG9911ENmQbGduhggiu9Li7 w==;
X-CSE-ConnectionGUID: H9kyl9ZYRbSoaBep5YTqLA==
X-CSE-MsgGUID: jTneAarITDyjmaGKMQJOGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23606686"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23606686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:41 -0700
X-CSE-ConnectionGUID: f0/XpmX5S42CsTetdhuOww==
X-CSE-MsgGUID: kLx7AAW1SKOdGB6kbznjIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37392863"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe: Fix xe_guc_pc.h
Date: Tue, 21 May 2024 12:28:28 +0200
Message-Id: <20240521102828.668-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240521102828.668-1-michal.wajdeczko@intel.com>
References: <20240521102828.668-1-michal.wajdeczko@intel.com>
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

Prefer forward declaration over #include xe_guc_pc_types.h

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index d3680d89490e..532cac985a6d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -6,7 +6,9 @@
 #ifndef _XE_GUC_PC_H_
 #define _XE_GUC_PC_H_
 
-#include "xe_guc_pc_types.h"
+#include <linux/types.h>
+
+struct xe_guc_pc;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
@@ -27,4 +29,5 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
+
 #endif /* _XE_GUC_PC_H_ */
-- 
2.43.0

