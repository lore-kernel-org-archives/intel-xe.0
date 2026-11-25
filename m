Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79158606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fzujk9S+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C9910FBD8;
	Wed, 25 Nov 2026 11:47:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559DC10FBDB;
 Wed, 25 Nov 2026 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795607220; x=1827143220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yB89ouO6u+BUlYDMNs0zOywC9oQ4Yt4LZNg08lb1wUM=;
 b=Fzujk9S+E0MTofmZXURRIR/nHdel6NcOJYq2vDrWXunhzbC/7tOfcu7J
 fk9P3fHkQ+irAsihZXtTPdPYpkOChWaNzwEEgNhcVr+/Pod9fXPVnBc+s
 i5TA1obfngTWa7BXaKwzA17zrtq/hZjP1ho5sMxuQcYrgIQ1hos3oCCf6
 gCxpm2TiM9mWjxDa50zs+UkpWkfiowAM+qByGr8XQOoBdWjQ2GiHImCN5
 AKGiWRFl50/Zfmz6UoW9FH2CeD3A79Ofwjm8voBbcaTeDEr1QEY0e2xXA
 SavAVnxAlAfNdiqPtz22OE8DKANdqdM6uir5LIKO8WrYWgezkx0dpqWzG w==;
X-CSE-ConnectionGUID: L+1sDQh/SZeFmKd2OR0akg==
X-CSE-MsgGUID: lRk4ARk1QkiN1atfy7GUGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4358431"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4358431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:47:00 -0800
X-CSE-ConnectionGUID: 3QM3PA82TUOOUDgpQv402A==
X-CSE-MsgGUID: sjtgmA/3RD6NFUckTKqWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12167918"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 4/6] drm/i915/gmbus: deduplicate setting force bit-banging
Date: Wed, 25 Nov 2026 13:46:33 +0200
Message-ID: <7093a619be58bf8c6811260e4efae0a3dbc9f6f2.1795607055.git.jani.nikula@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The code to adjust bus->force_bit is already brittle, and it's better to
avoid duplicating it. Abstract unlocked intel_gmbus_force_bit_unlocked()
helper, and use it.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 32 ++++++++++------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index df25a8233345..0c3037ef0dcb 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -1015,19 +1015,27 @@ struct i2c_adapter *intel_gmbus_get_adapter(struct intel_display *display,
 	return &display->gmbus.bus[pin]->adapter;
 }
 
-void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
+static void intel_gmbus_force_bit_unlocked(struct i2c_adapter *adapter, bool force_bit)
 {
 	struct intel_gmbus *bus = to_intel_gmbus(adapter);
 	struct intel_display *display = bus->display;
 
-	mutex_lock(&display->gmbus.mutex);
+	lockdep_assert_held(&display->gmbus.mutex);
 
 	bus->force_bit += force_bit ? 1 : -1;
 	drm_dbg_kms(display->drm,
 		    "%sabling bit-banging on %s. force bit now %d\n",
 		    force_bit ? "en" : "dis", adapter->name,
 		    bus->force_bit);
+}
+
+void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
+{
+	struct intel_gmbus *bus = to_intel_gmbus(adapter);
+	struct intel_display *display = bus->display;
 
+	mutex_lock(&display->gmbus.mutex);
+	intel_gmbus_force_bit_unlocked(adapter, force_bit);
 	mutex_unlock(&display->gmbus.mutex);
 }
 
@@ -1085,30 +1093,20 @@ static ssize_t intel_force_bit_banging_write(struct file *file,
 	struct i2c_adapter *adapter = m->private;
 	struct intel_gmbus *bus = to_intel_gmbus(adapter);
 	struct intel_display *display = bus->display;
-	bool force_bit_banging;
-	bool changed = false;
-	u32 force_bit = 0;
+	bool force_bit;
 	int ret;
 
-	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
+	ret = kstrtobool_from_user(ubuf, len, &force_bit);
 	if (ret)
 		return ret;
 
 	mutex_lock(&display->gmbus.mutex);
-	if (force_bit_banging != bus->debugfs_force_bit) {
-		bus->force_bit += force_bit_banging ? 1 : -1;
-		force_bit = bus->force_bit;
-		bus->debugfs_force_bit = force_bit_banging;
-		changed = true;
+	if (force_bit != bus->debugfs_force_bit) {
+		intel_gmbus_force_bit_unlocked(adapter, force_bit);
+		bus->debugfs_force_bit = force_bit;
 	}
 	mutex_unlock(&display->gmbus.mutex);
 
-	if (changed)
-		drm_dbg_kms(display->drm,
-			    "%sabling bit-banging on %s. force bit now %d\n",
-			    force_bit_banging ? "en" : "dis",
-			    adapter->name, force_bit);
-
 	*offp += len;
 
 	return len;
-- 
2.47.3

