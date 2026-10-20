Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C05606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 02:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=byAoVhRy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D50610F1C8;
	Tue, 20 Oct 2026 02:37:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3049910F1C2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 02:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792463853; x=1823999853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZwww6RixpMJKg7J7PCoslcbQd2wEKTr1aQVWb3P1Ys=;
 b=byAoVhRysiwYOvs9nspLcCmvuAEHgOBqokSYEMq744PIDCKZ2zOzLqWc
 qjJoSnaRh02W0lE4YJK8Iw1hrXlZzYCP48h2mIpSs/x7ZE9KghrMziXxA
 FizD70zoDABS6VxIHPlmxrO2OS7Hpxc03HDiVySH5DtdcRDGAw//HqxOu
 uGCFHwVpPbKj/kJwez05FoV9vN7NZA+fGUPwrKnJrWw6+TJ02XXC/NDu/
 mWdH6XJzL4UyXpRfFrzu3NeOrT8I7tFxfyU/7Q7VMARZqjpvLPJD1zMVY
 Verh1ZXCVm945wi6VFqKwb/rgF8QlLWGO9OZq/9+1oQ8Eck330CzaMT8o A==;
X-CSE-ConnectionGUID: +dgIp9riTP2dNqMF3mLu1Q==
X-CSE-MsgGUID: yVj3ASe6ReGfZiT590IcZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1040807"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1040807"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 19:37:33 -0700
X-CSE-ConnectionGUID: n7C9JnqFS5m1gE4RGqT8Kw==
X-CSE-MsgGUID: 9Pqd/2/fSPq/CkA5bIK+og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2648670"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 19 Oct 2026 19:37:31 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v13 4/9] drm/xe: Move xe_device_wedged_fini() registration to
 xe_device_probe_early()
Date: Tue, 20 Oct 2026 08:06:04 +0530
Message-ID: <20261020023641.200658-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020023641.200658-1-raag.jadav@intel.com>
References: <20261020023641.200658-1-raag.jadav@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The device can be declared wedged while processing boot-time hardware
errors, which can result in PM reference leak if driver probe fails
before xe_device_wedged_fini() is registered.

Early register the required cleanup action and fix this.

Fixes: a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: Split fixes into separate patches (Rodrigo, Michal)
---
 drivers/gpu/drm/xe/xe_device.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cf0235e57827..b185c7d33185 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -697,6 +697,8 @@ static int xe_device_vram_alloc(struct xe_device *xe)
 	return 0;
 }
 
+static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -765,6 +767,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
@@ -1099,10 +1105,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	detect_preproduction_hw(xe);
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
-	if (err)
-		goto err_unregister_display;
-
 	/*
 	 * Process and log any errors detected by hardware. Possible results can
 	 * include declaring the device as wedged, which must be done only after
-- 
2.43.0

