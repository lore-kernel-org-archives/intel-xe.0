Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44DEC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7215310E134;
	Tue, 30 May 2023 10:47:33 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997310E134
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685443651; x=1716979651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6BSr0zDvXrwIdDfvdtDx6Az3ewt+dWtcfskS+Ug5fXI=;
 b=csCmqGNYMJXoMDNaA9IwUAFn0iAJlkugKIjn2z5KdBUEMeGITGAtChl7
 VgPyqmJ85fBdznIRan1ZCNJ/7YPCZi54+2sTNgqA1FfrNuY1SHtIouzKo
 yLVd+SpXuIDkNkI5tTW9/gQVCw9FHD0POu35GWFj+96RGagUk1HO/iqg7
 0kGYL0XgQ0R9tyLy7Kc/cn9heXQszb4PTw502hlvI0Hhp7Es2I78VUADb
 0n0qnS1xE+uAC6Ay4stOE2Ev/qfjQLAOlWEcIdrKycsC3SIggielLUUGj
 lx3yxZAg5uEuEa7QpJdQpRjSjzKxvqxlZV/xWaWvJdz5xvvSWtxEXQ1NR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420638338"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="420638338"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656804743"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656804743"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:47:04 +0300
Message-Id: <20230530104713.2570554-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/9] Clean-up Xe FBC additions
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

v2: add missing intel_gt_types.h header

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
 .../xe/compat-i915-headers/intel_gt_types.h   |  11 ++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   8 ++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h        |   1 +
 12 files changed, 194 insertions(+), 109 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h

-- 
2.34.1

