Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30427606A329
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NSL/TCd+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03AE10ED6B;
	Mon, 26 Oct 2026 09:47:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D3E10ED52;
 Mon, 26 Oct 2026 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793008057; x=1824544057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=flbwI5xTvp+zKT9eNilfwJXEr5teHcE8xCv2IWP/ArU=;
 b=NSL/TCd+WRynITnSEqoI7mYvKLwQRxBAhaV2DXM7OX0NjiPf5KoNhpqx
 MM3g1Hc2BFQFQwIegLeID243h5UqLnRdaUel9s2pwHDKjRo8g80mXXVjS
 drKMgc89ZP51SQSZeNG/Y+GJPXT/FG86AkL31hc+1DQ/klpN9NUb5SxS6
 JUwsVKgaAOxPwnj0xrgZH+FGgYwdj93/VK0/FGggcwsXi/2KoBq7kAcUU
 ffwMMEurYOlFj8gxbG5YFGKLemENezGBGSfkSpRRImYXeM10r43ALJaTP
 Aq3ogTsE3reZm+YQl0+ezBJkUzy3bDy6mXTYyEGXjvgZE25j0B5yP5pGq g==;
X-CSE-ConnectionGUID: hVpgxgyiS9C3GMM6yCDz7g==
X-CSE-MsgGUID: IJxbN7GTQKatZXz/qn5/9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1570574"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1570574"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:47:36 -0700
X-CSE-ConnectionGUID: aOGPWthzR0adryf6pcBgSg==
X-CSE-MsgGUID: m1bqLgV/STi5d/BKZmtwRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4569255"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.48])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:47:35 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v5 0/2] drm/i915/display: reduce clock_gating interface
 between core and display
Date: Mon, 26 Oct 2026 11:46:06 +0200
Message-ID: <20261026094724.53374-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

Hi,

Resending this as v6 for CI results.  No other changes from v5, except for Jani's R-B's.

In v2:

  * Reworked the previous version so we have only one entry point,
    instead of an _early() and a _late() function.  It turns out that
    this is not necessary because some platforms were using only
    _early() and the others were using _late() (not both);

  * Removed back-dependency from the display code into the core code
    by avoiding calls to intel_clock_gating_init() (Jani);

In v3:

  * Added intel_display_clock_gating.o to xe's Makefile to prevent
    linking breakage;

In v4:

  * Drop the three patches already merged.
  * Preserve HSW/BDW GT/uncore clock gating workarounds on PC8+ exit
    through the display parent interface (Sashiko).

In v5:

  * Drop the parent interface and separate display and core clock
    gating completely (Jani).
  * Restore the HSW/BDW GT/uncore workarounds from the device-level
    resume paths in i915_driver.c instead of from display.
  * Handle core clock gating separately when a GPU reset also affects
    display.
  * Add a patch to move the SNB FBC workaround comment next to the
    registers it describes.

In v6:

   * Only rebased.


Cheers,
Luca.


Luca Coelho (2):
  drm/i915/display: move the SNB FBC workaround comment
  drm/i915/display: separate display and core clock gating

 .../i915/display/intel_display_clock_gating.c | 24 ++++++
 .../drm/i915/display/intel_display_driver.c   | 12 +++
 .../drm/i915/display/intel_display_power.c    |  4 +-
 .../drm/i915/display/intel_display_reset.c    |  4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |  4 +
 drivers/gpu/drm/i915/i915_driver.c            |  6 ++
 drivers/gpu/drm/i915/i915_gem.c               |  9 +--
 drivers/gpu/drm/i915/intel_clock_gating.c     | 81 ++++++-------------
 drivers/gpu/drm/i915/intel_clock_gating.h     |  1 +
 drivers/gpu/drm/xe/Makefile                   |  1 +
 .../compat-i915-headers/intel_clock_gating.h  | 14 ----
 11 files changed, 82 insertions(+), 78 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h

-- 
2.53.0

