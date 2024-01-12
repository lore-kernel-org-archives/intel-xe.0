Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B58C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A466710EB3E;
	Fri, 12 Jan 2024 15:27:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F4C10EB39
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073222; x=1736609222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zBzMPOhgGcQe1aBWfdM6Y9ECNBGAiyU+1MZSK2e+OFo=;
 b=W/sEWudU/I7z5IJmWt9yQzuzvojqEhuJZBoubUmEM9sibOgDSwCU43Pr
 IhBEE7ITRKC+E244NI/ej+m7baDyz0jSlainUTdj+7dQ3nnVZuOyRlt2J
 kWpc8n65pzGwppkyqfhLCi4M5/bcg/dR3Izsdqf8NbQQRNeUMY6ThbMOG
 aHbdbllt+hMcV2UplskRHLl/15+RKvCgUomUQuxRZXzElcEEOTprv5zGn
 0u58B71hUjp7ImEAWlDktENY+c7xGNRvZn9gJC7b+PDkWfLuQiQYoJSou
 ZSRawIQdXDNVIRG8o/1EmoR1W8Z8DuoemVl0b3EjN1J9va6TSIycQ7uLl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566361"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566361"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003154"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003154"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/8] drm/xe/vf: Don't try to capture engine data unavailable
 to VF
Date: Fri, 12 Jan 2024 16:26:43 +0100
Message-Id: <20240112152649.849-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Don't capture engine ring registers as thoe are not available for
the VF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e279ef6c527c..5722f7ef8ce5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -25,6 +25,7 @@
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
 #include "xe_sched_job.h"
+#include "xe_sriov.h"
 #include "xe_tuning.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -771,6 +772,10 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 						    hwe->domain);
 	snapshot->mmio_base = hwe->mmio_base;
 
+	/* no more VF accessible data below this point */
+	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
+		return snapshot;
+
 	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
 	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
 							   RING_HWS_PGA(0));
-- 
2.25.1

