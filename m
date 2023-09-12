Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09791CA0ECE
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3FB10E350;
	Tue, 12 Sep 2023 06:47:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02E210E35B
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501243; x=1726037243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fyoVFIe8Md6442gDwosWXDkjfaaixDo58+Ag/MRFx6E=;
 b=f8vvvTxFm2FTC4BDy6vUJbs3izS5zRgYGP9yn6L2LFJfXLjWsXMNtvXZ
 nlJvhtCJ2snKh8PIPK1TdW6xMHXqgUa03nKfjfoNkh3YOm/IVK4O9tXl3
 nHcDtgArIQ4zNAdiSVESRf/WQh37Ko+7eNY/yE0kflKBlL5+d9gZgal1k
 It+12CIslOy1aQBg291O/L0hgbU2NK4ZiyXIfoWZS0qTB1/qjM0qxsjdm
 mje1ZbhBkbEA0yaNCJHrIzrV+WzWHU5IkTE9Q9Lo3ou//Y4JF0P5OlBBL
 uwxyRT02HT/DlEPKSgjF36nqRQVCgJNlDx9Q6AKY/cIBERH1m+YAaxDC5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730314"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730314"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699002"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699002"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:20 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:46:57 +0300
Message-Id: <20230912064709.2802305-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 00/12] Frontbuffer tracking refactoring
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

v3:
  - drop reference counting from xe frontbuffer set implementation
v2:
  - xe_bo get/put handling changed

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (12):
  drm/i915/display: Move releasing gem object away from fb tracking
  drm/i915: Ignore set frontbuffer return value on release
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

 .../gpu/drm/i915/display/intel_frontbuffer.c  | 29 +++----------------
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  2 --
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  1 +
 .../drm/xe/compat-i915-headers/i915_active.h  | 22 ++++++++++++++
 .../compat-i915-headers/i915_active_types.h   | 13 +++++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  2 ++
 drivers/gpu/drm/xe/xe_bo.h                    |  3 ++
 drivers/gpu/drm/xe/xe_bo_types.h              |  3 ++
 8 files changed, 48 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h

-- 
2.34.1

