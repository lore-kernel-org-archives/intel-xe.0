Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7500EC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E3F10E134;
	Tue, 30 May 2023 10:34:50 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E1710E134
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442888; x=1716978888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pu8i3mDsFdtv5onC9ZdgzoZIDoDXFj0MdeKHeGJQnQI=;
 b=Q09VaRrrVK7MEEi7ZpgWAUmXnwJdGIWzZQcrKANF9sLYD1yjHbL3C1Wh
 efLhpNvdYbchTkw36hqOxj8qAweRB/4fCyxOEWjxOW33zx+PzdLFgyqX0
 Gcr3WOYGgjcx/HprPJ6ZVm5qbU0QJ+ixNfJ1M7fsLpulhOx3z3eu6mjF6
 iNvyNX0yOP03A6nXwY9gSj+JNkH1XaybCppJbQ5buew981mBlCPWZXhlM
 6Mz+71BdPaKGTT/xLCHBKmNQQ95NuqfkSkgRe8YiqyOXQX+VvkDB8MEt1
 WN7rQij2PSZ+dw3V1a7Ece+f51NaUnlj8ugqED8DqtASXqZBjH1jeKoR8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352378031"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="352378031"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796225995"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="796225995"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:45 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:34:11 +0300
Message-Id: <20230530103420.2561722-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/9] Clean-up Xe FBC additions
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch set cleans up Xe FBC additions. All stolen memory details are
moved to i915_gem_stolen header and source files. Also some fence handling
details are move away from FBC code. This allows removing all ifdefs added
into fbc code.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (9):
  fixup! drm/i915/display: Implement FBC support
  drivers/xe: Add new type for compressed fb
  drm/i915/fbc: Add common type for compressed fb to avoid ifdefs
  drm/xe: Add i915_gem.h compatibility header
  drivers/xe: Move Xe stolen memory handling away form fbc code
  drm/i915: Move stolen memory handling into i915_gem_stolen
  drm/i915/fbc: Stolen initialize can be checked in plane check for i915
    as well
  drm/i915/fbc: Add function to get number of fences for gt
  Add new fence_id and fence count functions

 drivers/gpu/drm/i915/display/intel_fbc.c      | 134 ++++--------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  37 +++++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  13 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   2 +
 drivers/gpu/drm/i915/i915_vma.h               |   5 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   5 +
 .../gpu/drm/xe/compat-i915-headers/i915_gem.h |   9 ++
 .../xe/compat-i915-headers/i915_gem_stolen.h  |  76 ++++++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   8 ++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h        |   1 +
 11 files changed, 183 insertions(+), 109 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h

-- 
2.34.1

