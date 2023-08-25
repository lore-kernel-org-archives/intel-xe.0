Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E06C88CB2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 11:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B72010E661;
	Fri, 25 Aug 2023 11:53:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A911010E662
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964390; x=1724500390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2cKD8UbjZKr7X+aZR+K266KhkUYqcKk8n3SEpMPDijI=;
 b=e8SNsxDK/ZDh5wvmoDcJOwFoxQ4T4eCKd6UqaOQqNqObSLCYi9EHnoQY
 fq6txChd5Jn96SO++fXUQEuxj2Xr4KPWbAgVOWFzg7xLm9dZS6WQk7J+h
 gDEarC+m/QBLi81Iuzl4YwNFTKksgrBpA/YxnF4iL+E5NS5Gb1i1NbbJ5
 +zrTsweIzhcYjcTiqBe84KqLkP1meKHaRoFV2INc/mIvnXuufgaNrnsPL
 gMW89qKd209JWxdYYSp6fqHwyHD+otpld6v0DzuS6KQeuiMCfGlW/amS4
 +xJ5lSp+ZX4qoD3cRAHx4feEh4Fm93ASPF5etp8KDsXl6CboTazsk2qmd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405696118"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="405696118"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827569030"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="827569030"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:53:07 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 14:52:50 +0300
Message-Id: <20230825115255.1319907-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] FBC refactoring
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

These patches are cleaning up all #ifdefs added into intel_fbc.c for
Xe build.  I915 part of the refactoring is already merged into drm-tip
and these patches are implementing interfaces or adding empty defines
for Xe.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (5):
  Revert "drm/i915/display: Implement FBC support"
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/xe: Xe stolen memory handling for fbc support
  drm/xe: Add i915_gem.h compatibility header
  drm/xe: Add Xe implementation for fence checks used by fbc code

 drivers/gpu/drm/i915/display/intel_fbc.c      | 101 +++---------------
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   3 +
 .../gpu/drm/xe/compat-i915-headers/i915_gem.h |   9 ++
 .../xe/compat-i915-headers/i915_gem_stolen.h  |  79 ++++++++++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   1 +
 .../xe/compat-i915-headers/intel_gt_types.h   |  11 ++
 6 files changed, 115 insertions(+), 89 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h

-- 
2.34.1

