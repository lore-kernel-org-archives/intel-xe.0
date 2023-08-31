Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2AFC83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 09:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BBC10E5E3;
	Thu, 31 Aug 2023 09:52:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CC110E5E3
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 09:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693475529; x=1725011529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9oq3sQWFhethpk9cmXwlq25r18oML91Yjq3UD7b3JcU=;
 b=h6uoEKUATB0sY9cjWFlI3toYZ2gUo/NsTSF3Kc+VOnUCnWUKc32tmrpv
 +qYqt2Z64lqvqp3Ef/ZHtogWuJecfamLKxH25cuPzPj/DkPxsAXMI9Wip
 MIbwXPR3GJUAOqLno+dbdwVOZv9CVxolKXkWD1Q+ormE2te8jnW7QGW0w
 lzNTTI+8EimEIatIHSs8s5lftymAEDlKbZEcc4ksdtGldkfkzVq0Ox6IL
 G97tVaecpfbxw0ylh+8r8MFT4tPLZA5xxTlJrddO/YEJgqBCd1l6BoA0i
 4DLxdddt/tqFGplyjxy783NG73uqW6BWjNtmkc/r8IYZ3ladu3DBcW7Fd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373284394"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="373284394"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739440763"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="739440763"
Received: from zlevit-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.47.221])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:52:05 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 12:51:49 +0300
Message-Id: <20230831095154.3121578-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/5] FBC refactoring
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

v2: Add parenthesis around parameter in i915_gem_stolen_node_allocated

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

