Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3BE606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PMNNccEK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4C210F098;
	Tue, 10 Nov 2026 18:46:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A3210EC95;
 Tue, 10 Nov 2026 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794336387; x=1825872387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HVc7wMM8C9uXDwN8zyAFc2QBQnN42CgIeE2P5c6TPv4=;
 b=PMNNccEKwN1WUEf28IbIonYXMu3MjfiNjbSTJWZQGehQUd2STr9kxqjM
 zYyrxVkqQYLU2uiGgUfOP/WxTBmKb0K0G+qMJZ3jAwDJ8kz0gzGvC6uoX
 0KMeZ5KuEbkYef3TicxdJaqTRQFGtpQrWSqtxa8guR1fBeBLDteyDvASL
 tIddfDTwUD2TZDxGuha4E3evRwKBwNUU3HBKmq3/bM0XPidWWEbg/CuKy
 1XOun+qSwKiAiLOs0sK3vfxE7dPRUUZ4HlQbffuQDcTPII2HEM8fPByXo
 4PAIeF0N91sGWBPpWlOduCr3XSjUsxf4BMohH1gbHQTWUykIRrHk5jGaw A==;
X-CSE-ConnectionGUID: OpBrTz+BR2KSfU2KAaGOqA==
X-CSE-MsgGUID: GIUk4uLlSf2/rBXw9PhXsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2995463"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2995463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:26 -0800
X-CSE-ConnectionGUID: +rdA3ct2QK6OGLZO1Yn3/A==
X-CSE-MsgGUID: 087MPzRiQUSkKBts3YncJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8362369"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:25 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/10] drm/i915/de: Work towards uncore elimination
Date: Tue, 10 Nov 2026 20:46:11 +0200
Message-ID: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
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

v2: Try to handle the !HAS_DISPLAY mess sashiko spotted
    Hook up the unclaimed stuff for hsw+ not ivb+
    Clear leftover unclaimed error on driver init
    Highlight a few more details in commit messages
    Nuke the now unused .has_fpga_dbg stuff
    Odd bits and bobs pointed out in review

Ville Syrjälä (10):
  drm/i915/de: Introduce dislay->mmio and intel_de_init()
  drm/i915/de: Convert intel_de_{read,write}() into vfuncs
  drm/i915/de: Introduce mmio read/write templates
  drm/i915/de: Eliminate runtime overhead from DMC wakelock on pre-LNL
    platforms
  drm/i915/de: Introduce display->mmio.lock
  drm/i915/uncore: Don't meddle with mmio debug upon user forcewake
  drm/i915/de: Move unclaimed mmio detection into display code
  drm/i915: Nuke HAS_FPGA_DBG_UNCLAIMED()/.has_fpga_dbg
  drm/i915/de: Stop using intel_uncore_{read,write}()
  drm/xe: Nuke the intel_uncore_{read,write}() wrappers

 drivers/gpu/drm/i915/display/i9xx_wm.c        |   9 +-
 drivers/gpu/drm/i915/display/intel_de.c       | 341 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_de.h       |  29 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   3 +-
 .../gpu/drm/i915/display/intel_display_core.h |  22 ++
 .../drm/i915/display/intel_display_device.c   |  18 +-
 .../drm/i915/display/intel_display_device.h   |   2 -
 .../drm/i915/display/intel_display_driver.c   |  21 ++
 .../drm/i915/display/intel_display_driver.h   |   3 +
 .../drm/i915/display/intel_display_params.c   |   4 +
 .../drm/i915/display/intel_display_params.h   |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |   8 +
 drivers/gpu/drm/i915/display/intel_vblank.c   |  16 +-
 drivers/gpu/drm/i915/i915_driver.c            |  12 +-
 drivers/gpu/drm/i915/i915_drv.h               |   1 -
 drivers/gpu/drm/i915/i915_params.c            |   4 -
 drivers/gpu/drm/i915/i915_params.h            |   1 -
 drivers/gpu/drm/i915/i915_reg.h               |   8 -
 drivers/gpu/drm/i915/intel_uncore.c           | 239 +-----------
 drivers/gpu/drm/i915/intel_uncore.h           |  26 --
 .../drm/xe/compat-i915-headers/intel_uncore.h |  16 -
 21 files changed, 441 insertions(+), 343 deletions(-)

-- 
2.56.0

