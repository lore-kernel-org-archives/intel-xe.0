Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13081CC6B0E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 16:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A495C10E8E9;
	Tue, 13 Oct 2026 16:12:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8813310E8E7;
 Tue, 13 Oct 2026 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907949; x=1823443949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EUVsS/gMP3JBiMPlyMgyIdBY6uG61HNs3lCk/xSCzA0=;
 b=GvIOG2h455RmXv8wTg/yYDOdWtIQsyetRPlKDRs2u7Xa7F0jNVIiwptg
 WcvX1aCCBQctqQumS8525P+mQ3xhjpm8nnKGfyCrzr7/weys4t+tR2ich
 KsRQGVoxFXqYVVcnQ2OkGdksqWF8y2IdDoXeBG/DdYdN8FP7AZkQ82BEQ
 p/AG6qCLoUrdqZYe3P24Rc3c/9A3p+X0Yy2UW9RigX/jpDzs61qA7SnB/
 QAh4ovDHTyWUYsHfCfrp9/2rvFsY54quXru7p4tFXVPA/2caI8gQlh7N/
 NnYgaHTXLAdeOUMLm/n3hTtJOyOINck8ds3WQaAxBGCYk0FLxgLecf//e Q==;
X-CSE-ConnectionGUID: iQvU2VFPQ8ir+6qR774pUg==
X-CSE-MsgGUID: FvRKULRMRnuV6FiFfLyl9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="534508"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="534508"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:12:29 -0700
X-CSE-ConnectionGUID: feJzP0hlQ/62ht5gAln9cg==
X-CSE-MsgGUID: 9XpiVUmLSNOiuP6xfGb8Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1205081"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:12:28 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	imre.deak@intel.com
Subject: [PATCH 1/2] drm/i915/display: avoid logging DC3CO transitions
Date: Tue, 13 Oct 2026 21:41:33 +0530
Message-ID: <20261013161131.2572279-5-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
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

DC3CO transitions can happen every frame.
Logging them floods the log and adds overhead to the flip path.

Skip logs for transitions to or from DC3CO, while retaining logs for
other DC state changes. Log DC3CO trigger changes through
intel_display_power_dc3co_update().

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c |  6 ++++++
 .../drm/i915/display/intel_display_power_well.c    | 14 ++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 1b60ce2dd00c..53afd791381e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/string_choices.h>
 #include <linux/string_helpers.h>
 
 #include <drm/drm_print.h>
@@ -419,6 +420,11 @@ void intel_display_power_dc3co_update(struct intel_display *display, u32 trigger
 		return;
 
 	mutex_lock(&dc3co->lock);
+
+	if (dc3co->trigger != trigger)
+		drm_dbg_kms(display->drm, "DC3co allowed:%s trigger %#x -> %#x\n",
+			    str_yes_no(trigger), dc3co->trigger, trigger);
+
 	dc3co->trigger = trigger;
 	dc3co->allowed = !!trigger;
 	mutex_unlock(&dc3co->lock);
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 233465a8306e..6d07643fc14f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -862,8 +862,18 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
 
 	val = intel_de_read(display, DC_STATE_EN);
 	mask = gen9_dc_mask(display);
-	drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
-		    val & mask, state);
+
+	/*
+	 * DC3co is entered and exited once per frame while PSR2 or panel
+	 * replay is active, so logging both transitions floods the log. The
+	 * exit additionally happens from intel_display_power_get(DC_OFF) in
+	 * the atomic commit path, before the flip has been armed, where the
+	 * printk is a measurable part of the time budget. Skip both.
+	 */
+	if ((val & mask) != DC_STATE_EN_UPTO_DC3CO &&
+	    state != DC_STATE_EN_UPTO_DC3CO)
+		drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
+			    val & mask, state);
 
 	/* Check if DMC is ignoring our DC state requests */
 	if ((val & mask) != power_domains->dc_state)
-- 
2.43.0

