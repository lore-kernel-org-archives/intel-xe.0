Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51052606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T7aRmbxE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13EB10FBCA;
	Wed, 25 Nov 2026 11:46:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FD610FBBC;
 Wed, 25 Nov 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795607212; x=1827143212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JoFF8uQgVjmPhGM9oV/aLqOC3qH9M62t8vBSRaaLI84=;
 b=T7aRmbxEcEge/UquoAOJsySiROadBW3aeg/kw+ot/UsBTjFbKC6Yp2vi
 NOaF6jOAhEj7c6jzDluQl8fcFJMYerxAESIK81yBotnIMmb61nTcx2Ct3
 VAHSXFV7EXNeMxR+RZ6jHAeZWekAOUER7wsSEg51/FPvBrskEQNLEFZAQ
 1ao6lTtuzyEGZZ/OngHOTXfIeWnbm4XCzzt+MmQO380aYWvQkLJojj1uS
 gp6N1EY7citt7X+Uz2flZj6NAAY7mmeoF1j2KLT3kz/MJttqBENWyki/D
 Ifn4kfXCSJDry4nmKWQjwkF4qcwvzdy0XKpyyslvTGZOWAY88ysQd7ILB Q==;
X-CSE-ConnectionGUID: ESzu2pO2TISoTAigRjvOIQ==
X-CSE-MsgGUID: fe1HlTUFQge1RZjOsChkhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4543300"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4543300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:48 -0800
X-CSE-ConnectionGUID: U/8NQD9mQCehBE37KcvwZw==
X-CSE-MsgGUID: l2lPMbvaQX+TizVUIaUEyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11845474"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 2/6] drm/i915/gmbus: pass struct i2c_adapter to debugfs
 functions
Date: Wed, 25 Nov 2026 13:46:31 +0200
Message-ID: <b1932eb5ddd156dfe3d2dc2e3b2074c3a5b74fc4.1795607055.git.jani.nikula@intel.com>
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

Throughout the gmbus implementation, struct intel_connector usage isn't
really a thing, and the conversions flow naturally from struct
i2c_adapter to other types. Using struct intel_connector is a
hindrance. Pass struct i2c_adapter to debugfs functions instead, letting
us use to_intel_gmbus().

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 70784e7dae2a..c8f79384260d 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -1070,9 +1070,8 @@ void intel_gmbus_irq_handler(struct intel_display *display)
 
 static int intel_force_bit_banging_show(struct seq_file *m, void *data)
 {
-	struct intel_connector *connector = m->private;
-	struct intel_gmbus *bus = container_of(connector->base.ddc,
-					       struct intel_gmbus, adapter);
+	struct i2c_adapter *adapter = m->private;
+	struct intel_gmbus *bus = to_intel_gmbus(adapter);
 	struct intel_display *display = bus->display;
 	bool force_bit_banging;
 
@@ -1090,9 +1089,8 @@ static ssize_t intel_force_bit_banging_write(struct file *file,
 					     size_t len, loff_t *offp)
 {
 	struct seq_file *m = file->private_data;
-	struct intel_connector *connector = m->private;
-	struct intel_gmbus *bus = container_of(connector->base.ddc,
-					       struct intel_gmbus, adapter);
+	struct i2c_adapter *adapter = m->private;
+	struct intel_gmbus *bus = to_intel_gmbus(adapter);
 	struct intel_display *display = bus->display;
 	bool force_bit_banging;
 	bool changed = false;
@@ -1116,7 +1114,7 @@ static ssize_t intel_force_bit_banging_write(struct file *file,
 		drm_dbg_kms(display->drm,
 			    "%sabling bit-banging on %s. force bit now %d\n",
 			    force_bit_banging ? "en" : "dis",
-			    connector->base.ddc->name, force_bit);
+			    adapter->name, force_bit);
 
 	*offp += len;
 
@@ -1139,8 +1137,10 @@ static const struct file_operations intel_force_bit_banging_fops = {
 
 void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
 {
+	struct i2c_adapter *adapter = connector->base.ddc;
+
 	if (intel_gmbus_is_adapter(connector))
 		debugfs_create_file("intel_force_bit_banging", 0644,
-				    connector->base.debugfs_entry, connector,
+				    connector->base.debugfs_entry, adapter,
 				    &intel_force_bit_banging_fops);
 }
-- 
2.47.3

