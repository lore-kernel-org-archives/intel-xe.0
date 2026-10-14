Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFBDCC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA7A10FD1D;
	Wed, 14 Oct 2026 12:05:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09E910E9BF;
 Wed, 14 Oct 2026 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979547; x=1823515547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x17OpzMlrJ6oPLDdW8euNk+6xMbipC5El2pPe+RivFk=;
 b=JJQDdEO2zQLZC0bwY6P1SyYTuF+jFE0EuGESYO5MeTP25WPkS0T2QJPH
 hYyV6RWFHo3VkQq38+pvwVN7wJ3wMkfT638FzG9XiyBhtGl5oeIlGeCmm
 91ZCYb8y3CwZMyWUDg6aL3gW59ArLyu431bw15csgS/DQUSaZj1c6or+w
 XJcT0e6bNhWUWhBAmBE3U+aRaB4OcRoD6SUQQ24i6aqfyYU2n6EHiDF6r
 mApkcVxw19UhveerJ8QHsGk+j6NbLpLSOhwea7PG4IAApgKnL0rlGJD/w
 qQhZNRIg/JSQijpPIIW3+ZVGAuTvoWtnV6WWczLfIqyNTnw+cOir3Idb1 Q==;
X-CSE-ConnectionGUID: 7wpe0+OrRZq2oswfoScpdw==
X-CSE-MsgGUID: ec6tVQFNQLCWCg2NnO/zKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="739790"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="739790"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:05:47 -0700
X-CSE-ConnectionGUID: 2l4cVOM0QMyQySLHbQ7Qfw==
X-CSE-MsgGUID: sLF1ofTwS4aO3ra3QVaCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1736774"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:05:45 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915/de: Uncore reduction
Date: Wed, 14 Oct 2026 15:05:36 +0300
Message-ID: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Tweak a bunch of stuff in intel_de.h to reduce the uncore
footprint.

Ville Syrjälä (6):
  drm/i915: s/PIPEFRAME/PIPEFRAMEHIGH/
  drm/i915: Modernize PIPEFRAMEHIGH/PIPEFRAMEPIXEL bits
  drm/i915/de: Convert intel_de_read64_2x32_volatile() to
    intel_de_read64_2x32_volatile_fw()
  drm/i915/de: Implement intel_de_rmw() by hand
  drm/i915/de: Implement intel_de_posting_read() via intel_de_read()
  drm/xe: Remove unused uncore wrappers

 drivers/gpu/drm/i915/display/intel_de.h       | 53 ++++++++-----------
 .../gpu/drm/i915/display/intel_display_regs.h | 14 ++---
 drivers/gpu/drm/i915/display/intel_vblank.c   | 13 +++--
 .../drm/xe/compat-i915-headers/intel_uncore.h | 35 ------------
 4 files changed, 38 insertions(+), 77 deletions(-)

-- 
2.55.0

