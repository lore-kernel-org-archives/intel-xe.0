Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD760A2603
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UMMCNqK8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0E610F7EB;
	Wed, 11 Nov 2026 07:52:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC1B10F7EB;
 Wed, 11 Nov 2026 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794383569; x=1825919569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JLRPMm41UinlYmI3l4HgPzGbu/VTDxE1ADcMgg6Wdso=;
 b=UMMCNqK8A8GMAPss4RlqGWDjjPeRq64gbeNES5YYAuCD/9y48a9MQdPo
 jpsN6/zw/beUESZt07yMDtslxM+Su0a1G8d1diOQxwcXG8GVjsUSNQrD0
 siUmT9M0MBr9KFA4sZcVvY83LYJ3otdolgOkN9SaHdVGYyT1RYDxG3r2d
 +XL4ItY2mMHccS1UQasL/CQQNlvH7oTb4i5nczxK7g8FwyVtcDWVdYFsr
 UC3GVU6vBnu/nwM8KezcpDBJq2GrwS/QZLvxPQ+QHKuyUYhvQbyecoDvR
 QGYlnUBxBYrKVbThm19keYabtgg9DMmE27GAJPvIHvcRvoOzV3usAzZW/ g==;
X-CSE-ConnectionGUID: 3ACtAGRORhaENEc5WvYRIQ==
X-CSE-MsgGUID: 3kD6U+woTM6coTTm4GancQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3032728"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3032728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 23:52:48 -0800
X-CSE-ConnectionGUID: j7KjqhTRQmGqTtxVJVR7jQ==
X-CSE-MsgGUID: CzEgR/bvQHCrlFKAXAdCKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8780572"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 23:52:47 -0800
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: luciano.coelho@intel.com,
	uma.shankar@intel.com,
	imre.deak@intel.com
Subject: [PATCH v2 1/2] drm/i915/display: avoid logging DC3CO transitions
Date: Wed, 11 Nov 2026 13:21:07 +0530
Message-ID: <20261111075105.2166760-5-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075105.2166760-4-dibin.moolakadan.subrahmanian@intel.com>
References: <20261111075105.2166760-4-dibin.moolakadan.subrahmanian@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DC3CO transitions can happen every frame.
Logging them floods the log and adds overhead to the flip path.

The DC3CO exit log is printed from intel_display_power_get(DC_OFF) at the
start of intel_atomic_commit_tail(), before the flip is armed. This delays
the arm and reduces the time left before the latch point.

Skip logs for transitions to or from DC3CO, while retaining logs for
other DC state changes. Log DC3CO trigger changes through
intel_display_power_dc3co_update().

The generic power well logs are kept, as they cover all power wells and
help debugging.

v2:
- Explain why skipping the DC3CO log helps in commit message (Luca)

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c |  6 ++++++
 .../drm/i915/display/intel_display_power_well.c    | 14 ++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 8c56f0e0e9cd..4d6ceba82e6d 100644
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
index 66be8826381b..cc91eafb30f8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -864,8 +864,18 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
 
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

