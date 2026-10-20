Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45AC606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bqUfkiGo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C33910E2FA;
	Tue, 20 Oct 2026 02:37:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820310E212
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 02:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792463866; x=1823999866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ne4gf3D+91CeB7KSo+KVl/eLu5nBYINeGteMnUkRAqE=;
 b=bqUfkiGoSfDMYfwIDCixhGV3SfRk8crYNIYoOYxpH0TZgwlao+bA20iv
 Fl1EZliFZ3UXdEDPurQ/0HacnA7Ez8opTRHk7zSERLyVhopXe7CVSVrfy
 vy7Nx2lVUylm8z/QjqGai2N5tXxNdGpdeDbfOWRh5x/Supq4uFD3Hu4HJ
 VUFhaThUU0i8meManuASqU5vl5BWAcCidyotBjIAPsrru4n3C0Y/A7UYy
 bpJaOe1XWV//VjI6cowy6iNNYV1DVkUUSWt7dE55S9j126wxQt6ZXUIM4
 HZeIR2POPEaWEyww3P4RjmxC+CoRAzdygxxM9nFVcjFYjnrRaxX95in4H A==;
X-CSE-ConnectionGUID: WCk/prKNS2+d9wi80H/iPA==
X-CSE-MsgGUID: 9URsoAApQy2aKzHJAnG2wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1040815"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1040815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 19:37:46 -0700
X-CSE-ConnectionGUID: 71sy++gHTiqLoxGmOUTSrQ==
X-CSE-MsgGUID: RKlfD6OHQXqKEKkn4jPJXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2648769"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 19 Oct 2026 19:37:44 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v13 9/9] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
Date: Tue, 20 Oct 2026 08:06:09 +0530
Message-ID: <20261020023641.200658-10-raag.jadav@intel.com>
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

With xe_wedge_fini() now moved to xe_wedge and registered as part of
xe_device_probe_early(), it is safe to move xe_ras_process_errors() back
to xe_ras where it belongs. This essentially reverts commit 20bc4883c7c0
("drm/xe/ras: Fix boot-time ras error processing"), which was added to
prevent PM reference leak in case of early wedging in probe sequence.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 7 -------
 drivers/gpu/drm/xe/xe_ras.c    | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9de173995a78..a07655b4c7a9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1091,13 +1091,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	detect_preproduction_hw(xe);
 
-	/*
-	 * Process and log any errors detected by hardware. Possible results can
-	 * include declaring the device as wedged, which must be done only after
-	 * xe_wedge_fini() is registered.
-	 */
-	xe_ras_process_errors(xe);
-
 	err = devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0072bb4cc5df..db3cbc186a51 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1212,6 +1212,13 @@ int xe_ras_init(struct xe_device *xe)
 	get_offline_list(xe);
 	get_offline_queue(xe);
 
+	/*
+	 * During probe, process and log any errors detected by firmware while the driver was not
+	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
+	 * causing the driver to enter survivability mode.
+	 */
+	xe_ras_process_errors(xe);
+
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
-- 
2.43.0

