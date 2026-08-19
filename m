Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672D3C5DF8B
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E653B10EEA1;
	Wed, 19 Aug 2026 19:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxIxKsrd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14F210EE9C
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166900; x=1818702900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MzD5xH/Ksgp7+t17UKHgFZJz2BSEaWh81/FfEs6rmpw=;
 b=LxIxKsrds2rghFEaS4BDUISAXBbLKEbQb3POFfpqMllix96AmLyX79np
 k9UJfO4on0Qzi43CuQK8UBkYRTM8ivrE20ZEq/ZliA/QaaavsdqjK+EVN
 SO/TEcADECcKtkTWvgkdYOkSQaZGoI0ib+9qXRG6zEm/JSN8gGEFGbyQP
 usvVWoUEHsFB79Nf6fK3Z/tn/xief/IIl7yMLuhaPhxENoQQZPntjeZOI
 ooiz1h7d07DqZ/t0XgBZ3UM/u/ITHXiwlyMNXcrNNadjSBrDjnDQMnqi8
 VDC+wETVTBP+d+xKYR81AuTG2qOwJ0NsNWRoVt/zf2gNiluPYjf+ld+LK w==;
X-CSE-ConnectionGUID: 4KoS11S3QJas5bjdyTcYEQ==
X-CSE-MsgGUID: sAcvg76rRVytmknpT4rHlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647296"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647296"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:15:00 -0700
X-CSE-ConnectionGUID: 4TEmMsugSra4EtCbL4wWaA==
X-CSE-MsgGUID: SY2XfxHwRqmscEESwPBxlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556770"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:58 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 09/12] drm/xe/pat: Report missing PAT table using structured
 xe_log API
Date: Thu, 20 Aug 2026 00:44:38 +0530
Message-ID: <20260819191442.1957986-10-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() with xe_log_err() using the PAT component tag
when a platform has no matching PAT table entry.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 4331ef097ba0..66a2d76ea00b 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -16,6 +16,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
@@ -686,8 +687,9 @@ void xe_pat_init_early(struct xe_device *xe)
 		 * raise an error rather than trying to silently inherit the
 		 * most recent platform's behavior.
 		 */
-		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
-			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		xe_log_err(xe, PAT, -EINVAL,
+			   "Missing PAT table for platform with graphics version %d.%02d!\n",
+			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 
 	xe_assert(xe, xe->pat.ops);
-- 
2.54.0

