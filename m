Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3366FC8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 19:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED29810E781;
	Wed,  2 Jul 2025 19:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGTK9XSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3F410E062
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484641; x=1783020641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OgEYEgkflCOMef1MzNwXj4DXknQlAXbIA7wWjdU9mCE=;
 b=HGTK9XSsdvEommsp5xBfl9UL5Ee+RNojnKbtAwCUPXhlngeG5fet9lRr
 bxAbFyjwClyEmpPEjjBvECyJ3p0XVOfQdB+VYL0aD1Ffnfm4mltcaJnps
 99IQPzBnDblHB24ReuGzPu299ubeqiNCjo/s6NIZ0zhjughLvxypMIYmM
 yi43LgGTjsU4PL1SK6N4EVa2LmToEHokSEpe3URJMzNUqQ0oj3N3nF74a
 TT+V3YyBQ/jsDRoqC7EDfEUySmGnoLVng+JxEf7DVHuBuk0fY97RNohdp
 /2cfWGlAGffP/0M3bIRFZ/r5xntN7a47eB7aZxmisJdNEYtpFvVB+PPsf A==;
X-CSE-ConnectionGUID: EzJILxMFS1GzC9szNQD4Wg==
X-CSE-MsgGUID: 2+vAIBFBR+GsNpnwP1/bFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64039097"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64039097"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:41 -0700
X-CSE-ConnectionGUID: KlYiC4UGQs6odaa+c/wapQ==
X-CSE-MsgGUID: V8jyQSI+QoibGV0YlCD1BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153615528"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:41 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 4/6] drm/xe: Move Wa_15015404425 to use the new
 XE_DEVICE_WA macro
Date: Wed,  2 Jul 2025 12:30:34 -0700
Message-ID: <20250702193036.1417416-5-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
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

Move Wa_15015404425 to use the new implemented OOB macro XE_DEVICE_WA()

v2: rename from SoC to Device
v5: move workaround call back into the flush call

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 drivers/gpu/drm/xe/xe_mmio.c              | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index e69de29bb2d1..b7d12ea4d65c 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -0,0 +1 @@
+15015404425     PLATFORM(LUNARLAKE)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7357458bc0d2..f92fd8e97079 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -22,6 +22,9 @@
 #include "xe_macros.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
+#include "xe_wa.h"
+
+#include "generated/xe_device_wa_oob.h"
 
 static void tiles_fini(void *arg)
 {
@@ -163,7 +166,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 #define DUMMY_REG_OFFSET	0x130030
 	int i;
 
-	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
+	if (!XE_DEVICE_WA(mmio->tile->xe, 15015404425))
 		return;
 
 	/* 4 dummy writes */
-- 
2.49.0

