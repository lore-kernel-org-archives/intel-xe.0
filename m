Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4448ECCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 16:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C1010E43C;
	Mon, 10 Nov 2025 16:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsheCHP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB8610E437;
 Mon, 10 Nov 2025 16:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791501; x=1794327501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RFvdI7pevlMfVD/uv33U32HTYJnP7JxXbb7bP00vk8o=;
 b=KsheCHP1jJ6ZJoL6LmGbyIo+dJViP4BihP144aPmK1crsfHhx2oyfYEC
 9DTHLH8BzXbtJ8vsjN2IL3bCFzkc9j5wiUQBl83jbtSgOm6VhiNRkZEXR
 8teU9ZxOea8xxyJSKkaEyHYT078Y6rCS8oDUL1zuvlmibdRKCEvI3Cr80
 PYgdTYqMlqWSdqqNSRmyN4fiAiUaK7mNRpSO2mkUPlAJ6VkYMra56U+pV
 +WElozvV11gmWilwwZXxEFTSgLXe8Hi2ex7sEvZTPSEBz3pKVeaCKKkbU
 gfj66AGos4Z3EWnS/QFqNfdCpE1oEAwtsCuHWwfAPMaXgGv3syhGUdDWK Q==;
X-CSE-ConnectionGUID: iW0DjzTrSJ+PvzmZshpg1Q==
X-CSE-MsgGUID: HrcyAuJKSeyyGzTaGirDkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64545051"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64545051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:20 -0800
X-CSE-ConnectionGUID: xaJF1Y+XTKCklnhjysCD2A==
X-CSE-MsgGUID: W2kwDQaDRS+Sr7fxdVCaNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189433571"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/24] drm/vblank: prefer drm_crtc_vblank_crtc() over
 drm_vblank_crtc()
Date: Mon, 10 Nov 2025 18:17:24 +0200
Message-ID: <2a20632181adc85a737b0a87dce7e753ff8d5b0d.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Use the higher level function where crtc is available.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index e3a5a783686f..96dbff63f52d 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -712,7 +712,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct timespec64 ts_etime, ts_vblank_time;
 	ktime_t stime, etime;
 	bool vbl_status;
@@ -1302,7 +1302,7 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	int ret;
 	u64 last;
 
-- 
2.47.3

