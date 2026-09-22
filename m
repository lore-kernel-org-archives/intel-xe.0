Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847BCC982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4149210E6FD;
	Tue, 22 Sep 2026 15:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyDVdXct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AB310E49A;
 Tue, 22 Sep 2026 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790089264; x=1821625264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XPhGmA/V57fS6rUpKA4gCPUXmR3n3sFCWlyvU62rMxE=;
 b=nyDVdXcthyGRtMv+ys/M3L/OTpUaCR4G+rrJVW2zg9QQngL/4PU9uOBT
 rKoP2NqayixbC5rY0jNRcCRBM4mgFgkOqSrhLWNQEoLdOTMW4kCImbnLQ
 qJ//r2uDub/bVu7evCViTfMBYPr0D0hqvGgMGRbr9t1g8RW5YfjUQ3XER
 N3AhrSp5MisbTbn1zHWbhbg+ZUvaPPQtBHPOSqoEZhs2LjnFlkAlLTfri
 bzOESZ7uG1D73RlwPDaQvjwgPrSEvzI18yWlyKqHxHo5uBTQHNLnv+VJG
 Q+CjrV7rzsbpwel7A07Wz7dpG8/hklkwRuemykZwL4R1IkqixpJqSCGKt A==;
X-CSE-ConnectionGUID: zpGZQpMiR3uMOiyOSVWudw==
X-CSE-MsgGUID: 513GYOsiQSmEfBiOJ9D1+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101287186"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101287186"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:00:59 -0700
X-CSE-ConnectionGUID: qSdoOmpmRK20CFV9ML/7ug==
X-CSE-MsgGUID: OoCmyOrDRHqJJgzdYPAZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="299427786"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:00:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH 0/4] drm/{i915,xe}: some suspend/shutdown/resume unification
Date: Tue, 22 Sep 2026 18:00:48 +0300
Message-ID: <cover.1790089118.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Do some unification between the i915 and xe drivers by moving
intel_dmc_suspend(), intel_opregion_suspend(), intel_dmc_resume(),
drm_mode_config_reset(), and intel_display_driver_init_hw() calls to
display code.

Jani Nikula (4):
  drm/{i915,xe}: make intel_dmc_suspend() part of display
    suspend/shutdown calls
  drm/{i915,xe}: move intel_opregion_suspend() to
    intel_display_driver_pm_suspend_late()
  drm/{i915,xe}: add/move intel_opregion_suspend() to
    intel_display_driver_shutdown()
  drm/{i915,xe}: keep moving stuff to intel_display_driver_pm_resume()

 .../gpu/drm/i915/display/intel_display_driver.c  | 12 ++++++++++++
 drivers/gpu/drm/i915/i915_driver.c               | 16 ----------------
 drivers/gpu/drm/xe/display/xe_display.c          | 16 ----------------
 3 files changed, 12 insertions(+), 32 deletions(-)

-- 
2.47.3

