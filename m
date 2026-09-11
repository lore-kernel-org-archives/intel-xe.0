Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A72BC88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5EB10F55E;
	Fri, 11 Sep 2026 08:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2OVYgI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B4310F55E;
 Fri, 11 Sep 2026 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113934; x=1820649934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2644hrIAyO1+nXAcEo8d5tVieD2wyXDz0u3gq3mWZ6k=;
 b=T2OVYgI9MsiDwoRgTpxmkiS4N1bhOZKJGfD0hfn0RGAO7Gr5hX6DXwOm
 LfqDhoaOMV/X6zH5a5kCcj8meHAzH/atB3vhKKKCwKSPxPySYnwx51qXZ
 axSzWpz+6XmJsxhF9ogzVQ7tyv/FU2Aw7lYPpGvWk9zKCdD2oAiGTx6Ag
 /BH8It9fty0N+PVV/HAFhQNtfn7D5/oNX6uZNn7ePXhzyL3meByYBXY3t
 pzUFlIJYq+y6czahvxG51OlKfmPDiBFo3V6XE6rUJaFgGjLvqzIJZ1Oy9
 bCBusrLHXhQiPZM4J5kGTbwxxu0uV+VykQDfJ1vUvYxY37JzdTvav71hc A==;
X-CSE-ConnectionGUID: dv3ydeyBR5agclPbcnArpQ==
X-CSE-MsgGUID: umu+R3cASKS2YdQ1fdS1GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094752"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:34 -0700
X-CSE-ConnectionGUID: BQnjoNd3Qny7ndbDhV/C8Q==
X-CSE-MsgGUID: eV0pN9vzThOFocCQe0L2lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295334205"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:31 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 07/10] drm/i915: plug the pm runtime handlers with PME HPD
 handling
Date: Fri, 11 Sep 2026 11:04:45 +0300
Message-ID: <20260911080448.778316-8-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080448.778316-1-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Runtime PM suspend routine should set the HPD can generate PME flag
if PME is enabled. This will avoid resetting the HPD IRQs during
IRQ reset on suspend and also avoid starting HPD polling. Then
during the early runtime PM resume call, the HPD can generate PME must
be cleared unconditionally. Plug the routines to set/clear the flags
based on pme capability to intel_display_driver_pm_runtime_suspend()
and intel_display_driver_pm_runtime_resume_early().

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../gpu/drm/i915/display/intel_display_driver.c  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 70d112fd4287..263eb3e08ea1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -34,6 +34,7 @@
 #include "intel_display_driver.h"
 #include "intel_display_irq.h"
 #include "intel_display_power.h"
+#include "intel_display_rpm.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
 #include "intel_display_wa.h"
@@ -898,9 +899,17 @@ void intel_display_driver_runtime_pm_disable(struct intel_display *display)
 	intel_display_power_disable(display);
 }
 
+static void intel_display_driver_pm_runtime_set_pme(struct intel_display *display)
+{
+	bool pme_enabled = intel_display_rpm_pme_enabled(display);
+
+	intel_hpd_set_pme_capable(display, pme_enabled);
+}
+
 /* before irq suspend */
 void intel_display_driver_pm_runtime_suspend(struct intel_display *display)
 {
+	intel_display_driver_pm_runtime_set_pme(display);
 }
 
 /* after irq suspend */
@@ -935,9 +944,16 @@ void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display)
 		intel_hpd_poll_enable(display);
 }
 
+static void intel_display_driver_pm_runtime_clear_pme(struct intel_display *display)
+{
+	intel_hpd_set_pme_capable(display, false);
+}
+
 /* before irq resume */
 void intel_display_driver_pm_runtime_resume_early(struct intel_display *display)
 {
+	intel_display_driver_pm_runtime_clear_pme(display);
+
 	intel_opregion_notify_adapter(display, PCI_D0);
 
 	intel_display_power_runtime_resume(display);
-- 
2.43.0

