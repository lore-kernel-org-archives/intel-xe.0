Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AC4C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 07:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F12A10E05D;
	Fri, 19 May 2023 07:42:07 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B8B10E05D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684482125; x=1716018125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2VB026pLn5bl6vwm6wKBOmdFhxzB0xakpqvAmFc9jCs=;
 b=QyoKFRQ43DFk23efUfKCncG8B+UH/Vt2afzOtqGOMlrEWSDoXARQbiLH
 trCIlkgx2ol3US58Uuda5LjnyJ6blscPnWuV56CGVdcCEWTnmnBk6sBEy
 ze/AIUD+l/+ElgSRErXclDwyjehi6hda1z1Ss5UDhVW6WC4GrCOn9eomK
 VjobGz3SdJzGBWBai+N8ZBMquWTgvADs9+2cMSCC4T6PgjBYifSmiK5mS
 TVkRjIqIOUlmVmHwth0wKCdjM0zYWhvJqyXTOBjZgp5bF6fs93qaqpy/9
 ubR/A0lKYTWPTvTdNE6wLGCM5p0kfs+4iNZbcBd/4kGhBIJA8HOxXXgEj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="415772214"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="415772214"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 00:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="705494559"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="705494559"
Received: from sischoen-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.43.104])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 00:42:00 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 10:41:07 +0300
Message-Id: <20230519074111.3364590-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] Revert frontbuffer tracking removal
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
Cc: jani.nikula@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, rodrigo.vivi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Even if frontbuffer tracking is targeted being discontinued it is seen as
too risky to remove it completely at this point -> Revert frontbuffer
tracking removal patches. Also add fixup patches to handle build breakage
caused by these reverts.

v2: rebase

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Jouni Högander (4):
  Revert "drm/i915/display: Neuter frontbuffer tracking harder"
  Revert "drm/i915: Remove gem and overlay frontbuffer tracking"
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 -
 drivers/gpu/drm/i915/display/intel_cursor.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  19 ++-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 128 ++++++++++++++++--
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  76 +++++++++--
 drivers/gpu/drm/i915/display/intel_overlay.c  |  14 ++
 .../drm/i915/display/intel_plane_initial.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 +++
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 +
 drivers/gpu/drm/i915/i915_driver.c            |   1 -
 drivers/gpu/drm/i915/i915_gem.c               |   8 ++
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 +
 drivers/gpu/drm/i915/i915_vma.c               |  12 ++
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 23 files changed, 321 insertions(+), 40 deletions(-)

-- 
2.34.1

