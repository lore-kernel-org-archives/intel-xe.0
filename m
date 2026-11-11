Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B9606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mXCS0t8S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B4910FB0D;
	Wed, 11 Nov 2026 11:20:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59D10FB0D;
 Wed, 11 Nov 2026 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396012; x=1825932012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=McpTB0qufurn81IejOdnNgfYVg2NR6RfO09mGlCY7Y0=;
 b=mXCS0t8SW9VRDIyP4JHALC6IEY8/G9BbaiVuLMSddNUiQX+n4dtqV23W
 /517q1Jlwtj4CjFjWm+hrFPOCqT67yVH403sEE915hs27RIMfC0G/qLDD
 ruZJ56iVucYLOrhD5UF7TKXYjxZievK2JL+HQUenS9if0Ufw//6Q5bS4I
 KJiqtQTKopw00I2w8AW7l5og1bd/y8rghsJSaqe7dkwb254+xbs9Lv5BN
 zX5moe6xuvJnRt5656bplAZMOLr67Gne7WXxhxclnYYvi42t5oT24P+h/
 X31Ya2EuZXv/KfGDY13Tfie845iMM0HcsRTPpIPGccn+CPnW62F0FBczr g==;
X-CSE-ConnectionGUID: nzAgtCCJRUqEBB31lAgylQ==
X-CSE-MsgGUID: 6uvD9gCDQZaVNQJdVXGC/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3074228"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3074228"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:12 -0800
X-CSE-ConnectionGUID: citwpFO4SYmfFxmdEstjBg==
X-CSE-MsgGUID: hyD+uS6tTJCMoDbUxAtXUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208";a="10264114"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:10 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/13] drm/i915/dpt: Optimize i915 DPT
Date: Wed, 11 Nov 2026 13:19:54 +0200
Message-ID: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
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

My original i915 DPT implementation has one annoying performance
flaw. It creates a new DPT for every new framebuffers, which
given your typical dumb userspace implementation happens every
single frame. The intel ddx might be the only userspace implementation
with a userspace side cache of framebuffers, but the intel ddx
does not even support any platform with DPT, so not relevant
here.

Take a page out of the i915 vma book and cache the DPTs in the 
gem object instead. This way the same DPT will get reused as
long as userspace keeps rotating through the same set of gem 
objects (which is the case).

As a bonus the whole DPT parent interface disappears from the
display side.

Ville Syrjälä (13):
  drm/i915: Bump surface alignment to 32k on MTL for async flips
  drm/i915/fb: Fix error handling onion in intel_framebuffer_init()
  drm/i915/dpt: Stop allocation DPTs from stolen
  drm/i915/fb_pin: Remove overzealous vma NULL checks
  drm/i915: intel_{remapped,rotation}_info_size() into
    intel/gtt_view_types.h
  drm/i915/dpt: Compute DPT size in the DPT code
  drm/i915/vma: Extract intel_gtt_view_compare()
  drm/i915/vma: Introduce i915_vma_lookup()
  drm/i915/dpt: Make i915_dpt_{suspend,resume}() internal to i915
  drm/i915/dpt: Cache DPTs in the gem object
  drm/i915/dpt: Hide the DPT even more from the display code
  drm/i915/dpt: Remove dpt->vma
  drm/i915/dpt: s/struct intel_dpt/struct i915_dpt/

 .../drm/i915/display/intel_display_driver.c   |   2 +-
 .../drm/i915/display/intel_display_types.h    |   3 -
 drivers/gpu/drm/i915/display/intel_dpt.c      |  58 -----
 drivers/gpu/drm/i915/display/intel_dpt.h      |   2 -
 drivers/gpu/drm/i915/display/intel_fb.c       |  64 +----
 drivers/gpu/drm/i915/display/intel_fb.h       |   3 -
 drivers/gpu/drm/i915/display/intel_parent.c   |  40 +--
 drivers/gpu/drm/i915/display/intel_parent.h   |  14 +-
 drivers/gpu/drm/i915/display/intel_plane.c    |  13 +-
 .../drm/i915/display/skl_universal_plane.c    |   9 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   6 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  10 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   4 +
 drivers/gpu/drm/i915/i915_dpt.c               | 233 ++++++++++++++----
 drivers/gpu/drm/i915/i915_dpt.h               |  21 +-
 drivers/gpu/drm/i915/i915_driver.c            |   8 -
 drivers/gpu/drm/i915/i915_fb_pin.c            |  56 +++--
 drivers/gpu/drm/i915/i915_vma.c               |  42 +++-
 drivers/gpu/drm/i915/i915_vma.h               |  49 ++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  15 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   3 +-
 include/drm/intel/display_parent_interface.h  |  17 +-
 include/drm/intel/gtt_view_types.h            |  38 +++
 24 files changed, 400 insertions(+), 316 deletions(-)

-- 
2.56.0

