Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F00606A84C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+yOqlpm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E5210FF4B;
	Wed,  4 Nov 2026 22:18:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8329710FF4B;
 Wed,  4 Nov 2026 22:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793830727; x=1825366727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L5rL8LWzEgEkwj2uF8a0/hx5esNqM4JTgStU5sa0l9A=;
 b=f+yOqlpm/FZiYQUewir6VYYvXQ6RR8Sw2MrHPyVLdRGQGp8NG8kF4j0v
 P1WoHiNaYJjuO8jJ4zlTihyMvfCOVjpiixJYgMV7GBztD7/+bXlEGaY0q
 LMiD6La4slbd58KFcMsok4RwSqsW+y3IhN5c/LIuAzqPnFA59aLi2lB2C
 fRqFnkWwXC468sux40etDG2sKfvTmUuJmmikpg952n0PmENbJeZGN4Qas
 ipYC+eIeVuTHyx1vrFY4yRRSSC2AKY8ZzSwJqpKguqo/i4cPyxx0Rpvqx
 l4P98xDMple32cssgsEt2sCOyQnSatZQklMV5uY1oG4HMDGQOgjlhlMeH g==;
X-CSE-ConnectionGUID: oCca2/5zRma8s1R6RxjH0A==
X-CSE-MsgGUID: dBmpK4+jQ1mhXvlDsTH1Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2479785"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2479785"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:18:47 -0800
X-CSE-ConnectionGUID: 9t+ZMb/KRDyLre5iUXuRkg==
X-CSE-MsgGUID: /Vw+gyA2RRaA88ONZILGtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6989857"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:18:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/9] drm/i915/de: Work towards uncore elimination
Date: Thu,  5 Nov 2026 00:18:33 +0200
Message-ID: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Move the mmio locking and unclaimed register detection into the
display code. For now both are still i915 only to keep the
number functional changes in check.

Eventually we want to hook up the unclaimed register detection
for xe as well, but might have to think of a way to do it
without the lock to reduce the overhead a bit. Eliminating
the lock would help i915 on modern platforms as well.

Ville Syrjälä (9):
  drm/i915/de: Introduce dislay->mmio and intel_de_init()
  drm/i915/de: Convert intel_de_{read,write}() into vfuncs
  drm/i915/de: Introduce mmio read/write templates
  drm/i915/de: Eliminate runtime overhead from DMC wakelock on pre-LNL
    platforms
  drm/i915/de: Introduce display->mmio.lock
  drm/i915/uncore: Don't meddle with mmio debug upon user forcewake
  drm/i915/de: Move unclaimed mmio detection into display code
  drm/i915/de: Stop using intel_uncore_{read,write}()
  drm/xe: Nuke the intel_uncore_{read,write}() wrappers

 drivers/gpu/drm/i915/display/i9xx_wm.c        |   9 +-
 drivers/gpu/drm/i915/display/intel_de.c       | 331 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_de.h       |  29 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   3 +-
 .../gpu/drm/i915/display/intel_display_core.h |  23 ++
 .../drm/i915/display/intel_display_device.c   |   7 +
 .../drm/i915/display/intel_display_driver.c   |  15 +
 .../drm/i915/display/intel_display_driver.h   |   3 +
 .../drm/i915/display/intel_display_params.c   |   4 +
 .../drm/i915/display/intel_display_params.h   |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |   8 +
 drivers/gpu/drm/i915/display/intel_vblank.c   |  16 +-
 drivers/gpu/drm/i915/i915_driver.c            |  12 +-
 drivers/gpu/drm/i915/i915_drv.h               |   1 -
 drivers/gpu/drm/i915/i915_params.c            |   4 -
 drivers/gpu/drm/i915/i915_params.h            |   1 -
 drivers/gpu/drm/i915/i915_reg.h               |   7 -
 drivers/gpu/drm/i915/intel_uncore.c           | 239 +------------
 drivers/gpu/drm/i915/intel_uncore.h           |  26 --
 .../drm/xe/compat-i915-headers/intel_uncore.h |  16 -
 20 files changed, 423 insertions(+), 332 deletions(-)

-- 
2.56.0

