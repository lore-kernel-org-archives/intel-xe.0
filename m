Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444A7606A326
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsTCrQzn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E912710FBD2;
	Wed, 25 Nov 2026 11:47:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B7C10FBCB;
 Wed, 25 Nov 2026 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795607213; x=1827143213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gdcsRTPkp8ENyTKe1tfgFB8Hp2ewM7vYeGe7DLIVTqk=;
 b=RsTCrQznm5ukU3N4iYUHAlE58vbtJFDjKGEkMy+smZlEjL6HPYK+E50g
 QxPX49sANQ00H5VTr990x/KST7Sp5tQORtIZZFV0H3mEo4V7vJuovbCoR
 EZRrulWyckw4w8kI6Z0xOskOZjnV3UiVZJepUN2tUfdT8X06TyXd+2+pN
 x5K1gEzVsBc/Flog/rs0Uc82FC31M8F2DhKh2mj/wELWyLDIotZ5KecxW
 Mjchn59NtpN/MJSOSF8NnwlrFLv0fipeCoS2GMUuK50FNoCTol78aanM8
 nNE0oi1EhBa2iDPxRQERLbw4rn7Cu3rGZ/G+berY5VTs4AgyecVGXItxg g==;
X-CSE-ConnectionGUID: t78eRN6OSoKv85+K+mNqSg==
X-CSE-MsgGUID: SIk/T+JKSQ+D4hZv5CDa3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4543314"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4543314"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:53 -0800
X-CSE-ConnectionGUID: YX0CyM7lT1utkpnBdDrW5g==
X-CSE-MsgGUID: 4B49DqFZSbuso2giXOLvjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11845493"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:46:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 3/6] drm/i915/gmbus: remove and open-code
 intel_gmbus_is_adapter()
Date: Wed, 25 Nov 2026 13:46:32 +0200
Message-ID: <0aa2d44a353afa5b3f06893009ed7cf67f5c9521.1795607055.git.jani.nikula@intel.com>
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

intel_gmbus_is_adapter() is a single-use function based around struct
intel_connector, which isn't really a thing in the gmbus code, and
shouldn't be encouraged further. With the slightly confusing naming,
it's more of a distraction than helpful. Just open-code it, as it's only
used in one place anyway.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index c8f79384260d..df25a8233345 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -891,13 +891,6 @@ static const struct i2c_algorithm gmbus_algorithm = {
 	.functionality	= gmbus_func
 };
 
-static bool intel_gmbus_is_adapter(struct intel_connector *connector)
-{
-	struct i2c_adapter *adapter = connector->base.ddc;
-
-	return adapter && adapter->algo == &gmbus_algorithm;
-}
-
 static void gmbus_lock_bus(struct i2c_adapter *adapter,
 			   unsigned int flags)
 {
@@ -1139,7 +1132,7 @@ void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
 {
 	struct i2c_adapter *adapter = connector->base.ddc;
 
-	if (intel_gmbus_is_adapter(connector))
+	if (adapter && adapter->algo == &gmbus_algorithm)
 		debugfs_create_file("intel_force_bit_banging", 0644,
 				    connector->base.debugfs_entry, adapter,
 				    &intel_force_bit_banging_fops);
-- 
2.47.3

