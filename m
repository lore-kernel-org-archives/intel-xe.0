Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B426C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543FA10E370;
	Tue, 28 Jul 2026 14:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXnDQVLB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10EB10E370
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785250230; x=1816786230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iN4g4Ig8yr50jJMYWIMxtQAhKpQ4BOKAMdUFtJH6OPw=;
 b=AXnDQVLBCmPH4iTAI+QRF/ua0hChZz+CFFOuGpOn15GyqUayu1W6zaQS
 h0bdnhR695mtArS+YNPEtVB0gDt7DwMFmWz+qM5aM6SJ2IJovzArXd8T7
 /jJsNd4j5dIjEWs4482hulrggKpKiHK3k2Kp2ZJb7gTGfkP4BirRPMgyV
 P//Vlci761n85iu9U7ftrZ0BRifN/cEKVqbOLahhRE8Qly19kqCKNlRWF
 dMnqCjOVmZFkqSiIpA+P0jPPg2kiRbjjPqDS/3r1YGRxdHKylv2SSj42H
 uBvlnJMKeHG4xv3MDOWqlPoKOb74HzwgwTymP6YGiOmWlwZdgK/sPGTb2 Q==;
X-CSE-ConnectionGUID: emJtqKl9Tlqi+4fiSwCIDQ==
X-CSE-MsgGUID: O6vqi36XRDKXf4PxXQEc5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97209988"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="97209988"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:50:30 -0700
X-CSE-ConnectionGUID: LFVzM2DyR+ijrJ4k0aoTzw==
X-CSE-MsgGUID: +nivR7hBR9u9SEbwE2QS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="256372696"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:50:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/3] drm/xe/display: drop redundant intel_hpd_poll_fini() call
Date: Tue, 28 Jul 2026 17:50:19 +0300
Message-ID: <6c3a537d69af2bca21e9f04cd678aaf9d72f7c8e.1785250188.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785250188.git.jani.nikula@intel.com>
References: <cover.1785250188.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

intel_hpd_poll_fini() is already being called via
xe_display_fini_early() -> intel_display_driver_remove_noirq(). Remove
the redundant call.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 8da4c457a4a0..57088e24aba2 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -129,7 +129,6 @@ static void xe_display_fini(void *arg)
 	struct xe_device *xe = arg;
 	struct intel_display *display = xe->display;
 
-	intel_hpd_poll_fini(display);
 	intel_hdcp_component_fini(display);
 	intel_audio_deinit(display);
 	intel_display_driver_remove(display);
-- 
2.47.3

