Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323DBEE7FE1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C786F10E04D;
	Fri,  8 Sep 2023 12:24:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AE110E04D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694175872; x=1725711872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nD75WkGkc8neipwTDoPhCTRzBtTtbuHotb7U5fvcXSU=;
 b=F6B4YQ79IFm5wS3nP2fn7QG9zyqzDNCVkz8xG+iADLnaklzmSJRH68O7
 5j0N416djKb5cqzfGxrwPSrzmXbbkDiJ7rNY/Tk76ojFzpJN+OvMkoe7Q
 7lPawCMBj2Dcpuf662ydmt6VqjlhHhU8VSbhQ0ybnnqWkID6e0/Y4Zgy8
 Ppq2Qp0KpJXZshK2VePZZRfPUOjiiTz5GHioRsPjJWvU/EGpMAE7i97z0
 2qDYXtLi5UVKwLyn4191wNpb/r2JUFQyM3d42zaRTg19oIjnoI4V5MjLx
 A1NVqo2URis+8x+t7LC/Cf/H00qKg1vBPU4n9O7fxynvkuRB0QDnGToei Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441650045"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="441650045"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692244150"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692244150"
Received: from akorchin-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:24:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:24:04 +0300
Message-Id: <20230908122415.1886366-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/11] Frontbuffer tracking refactoring
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

v2:
  - xe_bo get/put handling changed

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (11):
  drm/i915/display: Move releasing gem object away from fb tacking
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

 .../gpu/drm/i915/display/intel_frontbuffer.c  | 27 +++----------------
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  2 --
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  1 +
 .../drm/xe/compat-i915-headers/i915_active.h  | 22 +++++++++++++++
 .../compat-i915-headers/i915_active_types.h   | 13 +++++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  2 ++
 drivers/gpu/drm/xe/xe_bo.h                    | 10 +++++++
 drivers/gpu/drm/xe/xe_bo_types.h              |  3 +++
 8 files changed, 54 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h

-- 
2.34.1

