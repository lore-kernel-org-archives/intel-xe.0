Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26827CA5534
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 09:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7D10E499;
	Wed, 13 Sep 2023 09:54:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9484210E493
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694598890; x=1726134890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fy/DidxqimpLgLy0NoAH4YGu71lL8b5RIk8N9/0JjkY=;
 b=d5AJO7tFrYxyFHqiVZENAhnoveyNMvZcrUtr7eTRHLnJXQ41FXw9EVwD
 irii8bXMkQrs+/LOcMZrACFpvZtZZx7esHUVUOdyoXc1vpHjGfKvD5ISX
 A2seGJFlH1Ufjb6Xl0UsIqd5RwyHji0K0+WiCRhThosalbF3Zt86nrqDS
 iH4Iq0v4Re7JBKUkCXtwXiit2lXaMrwZRpNGX8qiya1rxRDyjU0G0zE+U
 PBlFujnMXE955HULFlnLDGRRrpIjGdndhx8nxYt9SCBtiVQQwe8xRoGky
 4DH49enFyyB3fn2fcjuFJEZJ5Di1RCxxRRWLAnOvRtmy/5xQC2Zxj+qkK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409564880"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="409564880"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720749282"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="720749282"
Received: from seanpaul-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.45.158])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:54:24 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 12:54:07 +0300
Message-Id: <20230913095412.3427407-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/5] FBC refactoring
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

v3: Rebase 
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

