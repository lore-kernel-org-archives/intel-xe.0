Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE2CFF60F9
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 09:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1359210E9FC;
	Tue, 31 Mar 2026 09:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0Y8UIzB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD4E10E9FC;
 Tue, 31 Mar 2026 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774950568; x=1806486568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xG1qfyOvJN6gc/Pe+Ulx4zBfNQMT7BDLkmU5k1tvQT0=;
 b=Y0Y8UIzBQUyqynvePqAq5vAxbLrS9M1zSB0tmdKNgCjdq1t3OXQdiyw/
 frVVUtS2/AlFyG8seVuDkryhE66REwE9uwR00oAeNBoe3PNav3xeYyfLE
 E4xpF7epXLm0Fxf90ptGxpYCCSsfe5l/nCvGlYbGvf5hANZ+mO0kLtN8U
 xQ8spDG15H7RoCA3SXPl8uzYSSHk02Qmq2Zn6jmf/qdsxKQ2z4br0hz3Q
 E1yjvOAxnz5ruT24NIGh/L6DFdVpApGF3uENq2pbKRYZXnTqagoP7GkqL
 7iPJ/P4UvVWyUtWFB2BweKTGvRUsg5yiF54AxlkbYYl+mmhWXmV/eg5s6 A==;
X-CSE-ConnectionGUID: myo7PuhgSpmEjkVVperj/w==
X-CSE-MsgGUID: nKdDHUqeTruqtuKHXUbZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="101414040"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="101414040"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 02:49:28 -0700
X-CSE-ConnectionGUID: QMr87mNLS4KZtFT+F9gDKw==
X-CSE-MsgGUID: PaKn6izqS2WmmRrPVs7Nuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="231252223"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 02:49:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 1/5] drm/xe/fbdev: put intel_fbdev_fb_prefer_stolen()
 behind IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION)
Date: Tue, 31 Mar 2026 12:49:14 +0300
Message-ID: <245880a591fe5267a1c06bfbbcc42a4dd9f2e4ee.1774950508.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774950508.git.jani.nikula@intel.com>
References: <cover.1774950508.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Unify the behaviour with i915. Similar to commit b63c6b9b7f5e
("drm/i915/fbdev: fix link failure without FBDEV emulation"). The
difference is that unlike i915, xe doesn't build
display/intel_fbdev_fb.c conditional to CONFIG_DRM_FBDEV_EMULATION.

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 8bcae552dddc..d44746f4966c 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -86,6 +86,7 @@ initial_plane_bo(struct xe_device *xe,
 		flags |= XE_BO_FLAG_STOLEN;
 
 		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
+		    IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
 		    !intel_fbdev_fb_prefer_stolen(&xe->drm, plane_config->size)) {
 			drm_info(&xe->drm, "Initial FB size exceeds half of stolen, discarding\n");
 			return NULL;
-- 
2.47.3

