Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436FBC7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD8010E656;
	Fri,  2 Jun 2023 10:42:57 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BAA10E656
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702575; x=1717238575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IF9TX9jkH9hyEdjUxOYH/z4bnfDQSqNUhRtnkzRpEA4=;
 b=ghxGM4MMhb7VYI+lFVnQxTvR4L1NLC2WqeW8JqNDlqdTnDA49B5KcnB9
 UsM+dcX4jc/fE9HiemBWkIU4a1WM/Jpnin1v2ZS/de+JQ3yLlr6JadUbE
 Cf+QV6I53wQ8An1QvyAqW/w+VZ2I6X8Iwj6KfStaj5f/FBdlReEGQkKhh
 D/FK5zZN/tTIEWMayEsFFAWJ1HSfAjPt8mHdkoPH/NOHIem1tyiZYhAyz
 YZp548eKeJYSWt24Qci8dgwWAu6gA6KWIf45FD3x6AsP7Fjrjjo1KbUIs
 GKVFx9svJMA02C1Nsghnbwdoi8uMmwRI21XglnKl8UPMGVSOvhIF2DKgg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442215535"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442215535"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:42:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658237885"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658237885"
Received: from amelillo-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.209.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:42:51 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 13:42:27 +0300
Message-Id: <20230602104237.1014684-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 00/10] Clean-up Xe FBC additions
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

v3:
  - Move all the ifdef removals to fixup patch
  - Revert as necessary instead of modifying
  - intel_gt_fence_count -> intel_gt_legacy_fencing_support
  - Add !WARN_ON(1) to i915_gem_stolen defines that are not supposed to be
    used in case of Xe
v2: add missing intel_gt_types.h header

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (10):
  Revert "drm/i915/display: Make FBC check stolen at use time."
  Revert "drm/i915/fbc: set compressed_fb to NULL on error"
  Revert "drm/i915/display: Implement FBC support"
  fixup! drm/i915/display: Remaining changes to make xe compile
  drm/i915: Move stolen memory handling into i915_gem_stolen
  drm/xe: Xe stolen memory handling for fbc support
  drm/xe: Add i915_gem.h compatibility header
  drm/i915/fbc: Make FBC check stolen at use time
  drm/i915/fbc: Moved fence related code away from intel_fbc
  drm/xe: Add Xe implementation for fence checks used by fbc code

 drivers/gpu/drm/i915/display/intel_fbc.c      | 139 ++++--------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  37 +++++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  13 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   2 +
 drivers/gpu/drm/i915/i915_vma.h               |   5 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   3 +
 .../gpu/drm/xe/compat-i915-headers/i915_gem.h |   9 ++
 .../xe/compat-i915-headers/i915_gem_stolen.h  |  79 ++++++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   2 +
 .../xe/compat-i915-headers/intel_gt_types.h   |  11 ++
 10 files changed, 188 insertions(+), 112 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h

-- 
2.34.1

