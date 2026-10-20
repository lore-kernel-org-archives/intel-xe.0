Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4691C606A320
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KSRRMgA7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF0710E7A0;
	Tue, 20 Oct 2026 09:07:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9BA10E7A0;
 Tue, 20 Oct 2026 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792487258; x=1824023258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lD67p+5ros6bSGuFDfgABg+lvfLxmSg7iM7l92xpvYQ=;
 b=KSRRMgA7netDDi4U1qeMctcwGEJwWZ8NBfX8MqHOwo/po2n2h43ZwuLm
 uiqZPfvW/kBVG3DiXuMPMxqg/CWLH8PZLWqj55pYWGRgBu32+fT6eGz55
 t5bIOLmptr3H2dVoj6g+Ruz61OSMS8DMS2PApMSLpfN2bW41UhVZb2oWD
 iNm8qare19j9Mbx+XenqyQ6TJ9ybOyxTQ7UBQo56Xd+50BAOp7jO/EUkX
 zQAqRKCfNWEYpo8PaDr8AE5hhWQ8dwkx9ScoF7xMQwE2T9x0uDtkTOvya
 bkGZJGJl7aAjwD9sFzpAY/GD51ipBOxWuL6vz9nP1mhUWVH+hvzCoDJyh A==;
X-CSE-ConnectionGUID: NMwrgem/ReCyihKYptj3mQ==
X-CSE-MsgGUID: qgpJc0fHQKeEHEMJJt5XPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1196511"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1196511"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:07:38 -0700
X-CSE-ConnectionGUID: SlNyLy0UQ+ut9oNpA7FADA==
X-CSE-MsgGUID: Krtw+z8fRK6s1oXts5wu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2729093"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:07:36 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v5 0/2] drm/i915/display: reduce clock_gating interface
 between core and display
Date: Tue, 20 Oct 2026 12:05:48 +0300
Message-ID: <20261020090723.803321-1-luciano.coelho@intel.com>
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is v5 of the series to reduce the clock gating interface between
the display code and core i915.  The first three patches received
Reviewed-by tags and have already been merged, so this version
contains only the remaining work.

Jani pointed out that the GT/uncore workarounds shouldn't be restored
from display, even through the parent interface.  So instead of
adding more calls between the two sides, this version separates
display and core clock gating at the high level.  Display clock
gating is now handled by the display code and core clock gating is
handled by the core, with no calls in either direction.

The former two patches have been replaced by a single patch that does
the separation.  The extra patch just moves a comment that ended up
in the wrong place after the display clock gating was split out.

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

Please review.

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

