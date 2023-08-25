Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD40C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486E010E64B;
	Fri, 25 Aug 2023 09:39:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F4410E64A
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956363; x=1724492363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Dv2cMPm/X+eu/lHlIwCOxOrbybUutVfV283r/I/Kh8=;
 b=Fidc6bOjG03f9sgplSVi4c/lSIOAn8gKpys+aDfwL5yzjX4h9cIIb2KB
 co8/2Od9G6jlMIl+SzjW0FFOP4IRU0Cp+PvGd/LGQ69593wwLJTREoe4Q
 c1RNX4traf+QQrhDrEOlBBylbsxMUqlQcsF0a1K3SuN9dtJ36KSYMmerg
 h0SO8WXc3Ks9mEND1xU+lKZM6Y7GBai353wrGJ2fOTxAssUQGRbwIQq9w
 XYDZjmAQh/mr5lbInS01GMA2GcJWsH7UlVkLnk8PVIwovrVFSKCUlWMm0
 U9qV5CkFF0It4sxcxu26uF9gG6qz4lyTIirKwSGuvw8Cen9RAldHWJRFa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037101"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037101"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246756"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246756"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:19 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:38:52 +0300
Message-Id: <20230825093904.1230143-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/12] Frontbuffer tracking refactoring
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These patches are cleaning up all #ifdefs added into
intel_frontbuffer.[ch] for Xe build. I915 part of the refactoring is
already merged into drm-tip and these patches are implementing or
adding empty defines for Xe.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (12):
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/xe: Add macro to get i915 device from xe_bo
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/xe: Add frontbuffer setter/getter for xe_bo
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/xe: Add i915_active.h compatibility header
  drm/xe/display: Include i916_active header
  drm/xe: Add struct i915_active for Xe
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/xe: Add empty define for i915_ggtt_clear_scanout
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: Use drm_gem_object_get/put

 .../gpu/drm/i915/display/intel_frontbuffer.c  | 28 ++++---------------
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  2 --
 .../drm/xe/compat-i915-headers/i915_active.h  | 22 +++++++++++++++
 .../compat-i915-headers/i915_active_types.h   | 13 +++++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  2 ++
 drivers/gpu/drm/xe/xe_bo.h                    | 10 +++++++
 drivers/gpu/drm/xe/xe_bo_types.h              |  3 ++
 7 files changed, 55 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h

-- 
2.34.1

