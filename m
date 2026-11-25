Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBE5606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=blTH3ngT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7134410FBD7;
	Wed, 25 Nov 2026 11:47:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DBD10FBBC;
 Wed, 25 Nov 2026 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795607224; x=1827143224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yHdycH75seVe7ddIzgNKPNF9+gVLBLATzVDpPE6xirw=;
 b=blTH3ngTs26uvdYo5HfOBhLROODAYiCeO/fon/qqNi4XFV8/EEKvWgBO
 D7Li27EJpSN+36u27XvwN48g3pfP74+D/8C0yu87V4plAZbNXzMrj4s9c
 VJnmnp090CEE/eZtfhePOT/xfRW2SMs40bon1x0V2CF/eG2yy8jCelGZu
 tlDD+dg5JbiWZu3vnVFIzsycXTyKNuY/hPiYETCg4qo+ZkhCGocc+wpo0
 yuGwOaxc7EnZXIvl7797gGMyYk9dh5YgDs7frDVYr+fzUEWj/uS8JJc+9
 Npvo+sVuYq33KWdiEg/djqTiNhwnD00uc2AdpcNDeqa1l9XY3MP0rAxpg g==;
X-CSE-ConnectionGUID: T+SkNnMLQb2zmk2vuZhh6g==
X-CSE-MsgGUID: 67zC74jrQ9aU0U8wmdKr3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4358437"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4358437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:47:03 -0800
X-CSE-ConnectionGUID: GW55wTYzRMmLx5kIgBgqDA==
X-CSE-MsgGUID: cPQtKfFNT1yZ51R7iyFU1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12167942"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:47:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 5/6] drm/i915/display: don't be cute about printing
 enabling/disabling
Date: Wed, 25 Nov 2026 13:46:34 +0200
Message-ID: <b2083460376976a93772d0c06a933c27d910d157.1795607055.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795607055.git.jani.nikula@intel.com>
References: <cover.1795607055.git.jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Convert "%sabling", enable ? "en" : "dis" patterns to use
str_enable_disable(). The imperative is just fine here.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fdi.c     | 3 +--
 drivers/gpu/drm/i915/display/intel_gmbus.c   | 5 ++---
 drivers/gpu/drm/i915/display/intel_hotplug.c | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index c170d3104e4c..8f83762c1031 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -404,8 +404,7 @@ static void cpt_set_fdi_bc_bifurcation(struct intel_display *display, bool enabl
 	if (enable)
 		temp |= FDI_BC_BIFURCATION_SELECT;
 
-	drm_dbg_kms(display->drm, "%sabling fdi C rx\n",
-		    enable ? "en" : "dis");
+	drm_dbg_kms(display->drm, "%s FDI C RX\n", str_enable_disable(enable));
 	intel_de_write(display, SOUTH_CHICKEN1, temp);
 	intel_de_posting_read(display, SOUTH_CHICKEN1);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 0c3037ef0dcb..990e5cd14863 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -1023,9 +1023,8 @@ static void intel_gmbus_force_bit_unlocked(struct i2c_adapter *adapter, bool for
 	lockdep_assert_held(&display->gmbus.mutex);
 
 	bus->force_bit += force_bit ? 1 : -1;
-	drm_dbg_kms(display->drm,
-		    "%sabling bit-banging on %s. force bit now %d\n",
-		    force_bit ? "en" : "dis", adapter->name,
+	drm_dbg_kms(display->drm, "%s bit-banging on %s. force bit now %d\n",
+		    str_enable_disable(force_bit), adapter->name,
 		    bus->force_bit);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index d095eb13dc06..09f34c9a8643 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -1309,8 +1309,8 @@ static ssize_t i915_hpd_short_storm_ctl_write(struct file *file,
 	else if (kstrtobool(tmp, &new_state) != 0)
 		return -EINVAL;
 
-	drm_dbg_kms(display->drm, "%sabling HPD short storm detection\n",
-		    new_state ? "En" : "Dis");
+	drm_dbg_kms(display->drm, "%s HPD short storm detection\n",
+		    str_enable_disable(new_state));
 
 	spin_lock_irq(&display->irq.lock);
 	hotplug->hpd_short_storm_enabled = new_state;
-- 
2.47.3

