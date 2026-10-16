Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF7CCCA463
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC5A10E292;
	Fri, 16 Oct 2026 03:16:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E106B10EC4C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792120592; x=1823656592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ne4gf3D+91CeB7KSo+KVl/eLu5nBYINeGteMnUkRAqE=;
 b=K+rVev4NcmxzFvQWV76eXBhGWOUvIW0yYfK31QiZ8rAKDGLQ4GwLnWmL
 aozj3Gs5+R0cCymxcfExC1teI0M8ykMSkOn57hE/gMBgCBzK0S2KWLgIT
 o0jCBml6npN9Cky9lHbmKJz6WME05ySHjZfMuq1GrSNyh6cFYDril1Hm9
 kBA3h3dJANv0aR21Mt7IkPdbLhQtAhfbgrusTIP4eQcycDTjbsYrX/nRV
 Myhxahy5OvNpGPFHdLvSU7ec9T6kRCRMdPohJ2KgnmI+RTgrj+9FEBDIY
 vGzGSE2BSWWY/TdMDRiqiyOmOkJ+BsZiKzUCvne/3E5uAezn0KRFkp1JC A==;
X-CSE-ConnectionGUID: eR5a5T73THWFLnSmNLzuQg==
X-CSE-MsgGUID: n/jfAO9FT3i+1dXUuMAhsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="933510"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="933510"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 20:16:32 -0700
X-CSE-ConnectionGUID: 77fZ1qm2RDq0fYAvrI4Gxg==
X-CSE-MsgGUID: JKw0bxNYQH6q/6nWRzfkug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1854132"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 20:16:29 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 7/7] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
Date: Fri, 16 Oct 2026 08:45:20 +0530
Message-ID: <20261016031559.427941-8-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016031559.427941-1-raag.jadav@intel.com>
References: <20261016031559.427941-1-raag.jadav@intel.com>
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

