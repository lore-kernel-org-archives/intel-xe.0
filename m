Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60175606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RxUjGFkQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D4D10EC3F;
	Mon, 26 Oct 2026 08:29:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE31F10E069;
 Mon, 26 Oct 2026 08:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793003350; x=1824539350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ThjPbOBibmnx2KNI2AKf984+kh5zOn5dcV3Qf9ubClw=;
 b=RxUjGFkQEPdUI/EHgbdEjYsWpuiJLB6XGu9M3WHqlQsTrXzMcCaSGBdg
 pOLr1lQeHFxbTAn4cRO4hCLK1OOP35hadF5pPLBbg6v1K3E6eOo0qJDe+
 sdHB/JkeKkJtuwCZTjV784x7IUZdEJ0pIrqjxiiNfXbZ4HVFGAl9Z6BvX
 FE7aq3RkZmwuJwO/m8P5UD/i/h6oQri903cUDR9rBZj5PeeregN7UDTMu
 4fD2tWUyslw/ElnpyameY3MiwWgAVQTy10EzlGTE7DV1Qx1VghsR+3jwd
 8KEcGRBoJI9UGVUiUEuai5Hux4L6nJ1gebBTlQx8Bj8HKAUv2l4pBBivz w==;
X-CSE-ConnectionGUID: EoRA/6VqQ0+xiy/GL+1Z0A==
X-CSE-MsgGUID: 1D1hfATmQeuH+W2Svi5Q7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1547722"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1547722"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 01:29:10 -0700
X-CSE-ConnectionGUID: 5ikZlHNcSMi+WAZw9kPaEQ==
X-CSE-MsgGUID: 9IJ+ptp7TzCVftv8gO3XKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6033388"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 01:29:09 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 0/1] drm/i915/cmtg: Fix CMTG disable timeout in
 hsw_crtc_disable()
Date: Mon, 26 Oct 2026 13:58:45 +0530
Message-ID: <20261026082906.802048-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hsw_crtc_disable() disables CMTG at the very start of the CRTC disable
sequence, before intel_encoders_disable(). With this ordering the wait
for CMTG_STATE to clear intermittently times out:

  xe 0000:00:02.0: [drm] CMTG: A disable timeout

This is seen with igt@kms_hdr@bpc-switch-suspend, which repeatedly
disables and re-enables the eDP across modesets and suspend/resume.

The patch moves the CMTG disable after intel_encoders_disable(), so the
eDP-side teardown has completed, but keeps it before
intel_encoders_post_disable() and intel_dpll_disable(), so that the
transcoder and the port PLL feeding CMTG are still running while
CMTG_STATE is polled.

v1 described the fix as disabling CMTG after PSR exit. As pointed out in
the v1 review, PSR is already disabled in intel_psr_pre_plane_update()
before hsw_crtc_disable() is called, so PSR exit is not the cause. v2
corrected the commit description and added the Fixes tag. v2 was posted
as a new thread because the subject changed, so the earlier review
history is linked below.

Cc: stable will be considered once the fix has been in drm-tip for some
time without the timeout reappearing.

v1: https://patchwork.freedesktop.org/series/171766/
    https://lore.kernel.org/r/20260807055452.2997983-1-animesh.manna@intel.com
v2: https://patchwork.freedesktop.org/series/176583/
    https://lore.kernel.org/r/20261021190631.527183-1-animesh.manna@intel.com

v3:
- Add a cover letter with links to v1 and v2 for the review
  history. [Dibin]

Animesh Manna (1):
  drm/i915/cmtg: Disable CMTG after encoder disable in
    hsw_crtc_disable()

 drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

-- 
2.43.0

