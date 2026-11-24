Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782F606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BcalUeaM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAAA10F5C0;
	Tue, 24 Nov 2026 13:49:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3FB10E880;
 Tue, 24 Nov 2026 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795528165; x=1827064165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FdLHvdiazqmqJSMUEohB2c7BTuKwOYulqHegc+UcClU=;
 b=BcalUeaMxVH7YbEOx1uV5ELdi9iygDT6VZXDFUnvUhxOfrzSMl/JT3GW
 865ycwzQrRKE1dK1Ov7M/Kx/XVW1CxrLTNjuEc1ofjb5ltCMCmD1GtgMm
 Krd8IZaq1rJ6IYyUFEc/I2KveNPKzKca6L4GFRBz1+DZuUBgyJq65/DwQ
 qx430xfL6FxeZkUNCgDhk8JG4AbIvCV87U/Yz/p2rYQsqykFZhMSpfAsy
 fH+4yoNF01CbrX9ZFopLeI92YAI6GZiXBMFz84gYk3LYxadiRhTThrvew
 9jFJyS2BIm2IQ0WuyPy7VawVbZbCKI0T0+skejooOP5bmYyIgPHolCcd7 w==;
X-CSE-ConnectionGUID: Z0bQBSymQD+HDMxyElhe0g==
X-CSE-MsgGUID: mBovdie8THm7QCEboDgwqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4261030"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4261030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:49:24 -0800
X-CSE-ConnectionGUID: V6fFlzhPQXy78147o4RgsA==
X-CSE-MsgGUID: YbEmOBaETpibL+sfYiNYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11776443"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:49:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe: remove unused fake uncore lock
Date: Tue, 24 Nov 2026 15:48:50 +0200
Message-ID: <20261124134850.1520247-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

The xe fake uncore lock usage was removed in commit 527a438bf738
("drm/i915/de: Introduce display->mmio.lock"). Remove the lock too.

Keep the now empty uncore sub-struct in struct xe_device for a while
longer, as we're still using container_of() to get from the uncore
pointer to xe_device in the xe compat uncore code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 3 ---
 drivers/gpu/drm/xe/xe_device_types.h    | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0236f69a0f88..b1a6008bf15c 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -85,9 +85,6 @@ int xe_display_init_early(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return 0;
 
-	/* Fake uncore lock */
-	spin_lock_init(&xe->uncore.lock);
-
 	intel_display_driver_early_probe(display);
 
 	intel_display_device_info_runtime_init(display);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a31949073..f624c717aebf 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -637,7 +637,6 @@ struct xe_device {
 	 */
 
 	struct intel_uncore {
-		spinlock_t lock;
 	} uncore;
 #endif
 };
-- 
2.47.3

