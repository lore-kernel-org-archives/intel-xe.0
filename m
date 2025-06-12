Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395A3C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 11:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B2810E7D7;
	Thu, 12 Jun 2025 11:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+VQ5sXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069AC10E7D6;
 Thu, 12 Jun 2025 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749728241; x=1781264241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jqxt38lKqpu0DMe8ORZlL9cNvGTfFta+xHzRk8oP3DU=;
 b=L+VQ5sXbFBruzT9YOt9kODXFuD3B565y/T0KaohxO6H0Gtj+Y2ylMZrX
 E9InMYH/Ue/m2FqIftdBmDrmHxNE7IamGY8PZPQbV1dFhV1RfD7Xdh+Pl
 t3xHLCm1cKSRdK7GibcidVhGUygeRb/NTKt34zyuP1qnfNWWpbnapIzNB
 bbJNeaopwOVX3CjwX6evM9yxTbSzHhzcoAixgdjbcMrDMp+587G796DkK
 3JaFlimKLBkgWXz7ojXb1UX21dPg+xktwl1jWRAp8/DpXk8nygnaNw95W
 wBNxmjiBB28QpzQL+XIZiSpCiu7Cx5+GgyTW7EfdD/2h8MRPEQp8/VaTt w==;
X-CSE-ConnectionGUID: cAJ3iELKTje28BCgmFXRAw==
X-CSE-MsgGUID: XqC0WHd9RLqopElGP8ER5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62553517"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="62553517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:37:21 -0700
X-CSE-ConnectionGUID: 6I70bylGTJWXVyZiyfAEtQ==
X-CSE-MsgGUID: 9PrPBIP2TaSR/y2ADmUOwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152259858"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:37:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [RESEND 0/5] drm/i915/plane: file and function renames
Date: Thu, 12 Jun 2025 14:37:06 +0300
Message-Id: <cover.1749728173.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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

Rebase and resend of [1].

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1744129283.git.jani.nikula@intel.com

Jani Nikula (5):
  drm/i915/plane: rename intel_atomic_plane.[ch] to intel_plane.[ch]
  drm/i915/plane: drop atomic from intel_atomic_plane_check_clipping()
  drm/i915/plane: make intel_plane_atomic_check() static and rename
  drm/i915/plane: rename intel_atomic_check_planes() to
    intel_plane_atomic_check()
  drm/i915/plane: rename intel_atomic_add_affected_planes() to
    intel_plane_add_affected()

 drivers/gpu/drm/i915/Makefile                 |  4 ++--
 drivers/gpu/drm/i915/display/i9xx_plane.c     | 10 ++++-----
 drivers/gpu/drm/i915/display/intel_atomic.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   | 10 ++++-----
 drivers/gpu/drm/i915/display/intel_display.c  |  8 +++----
 .../gpu/drm/i915/display/intel_display_irq.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  2 +-
 .../{intel_atomic_plane.c => intel_plane.c}   | 22 +++++++++----------
 .../{intel_atomic_plane.h => intel_plane.h}   | 22 +++++++++----------
 .../drm/i915/display/intel_plane_initial.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   | 14 ++++++------
 .../drm/i915/display/skl_universal_plane.c    |  7 +++---
 drivers/gpu/drm/i915/display/skl_watermark.c  |  2 +-
 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 18 files changed, 57 insertions(+), 60 deletions(-)
 rename drivers/gpu/drm/i915/display/{intel_atomic_plane.c => intel_plane.c} (98%)
 rename drivers/gpu/drm/i915/display/{intel_atomic_plane.h => intel_plane.h} (86%)

-- 
2.39.5

