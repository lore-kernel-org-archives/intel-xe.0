Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D0BC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6991F10E1A5;
	Mon, 18 Sep 2023 07:01:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C047910E1A5
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 07:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695020506; x=1726556506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HTKl6geMyYEDwpypHd58A/eC0z+c03UDE2ttVzXZeB0=;
 b=VHDcouDbwVQ439RJLouovcbed+3uWTfIW3DrVs6wkgTKGtjDUY3cfrZ0
 epfonX4TDpljNKT3QOn3o0rqM1vQX2qoimRtYVIGD36H18G7QJS2xL6zw
 LRLiubcR7j3n7XALaCAK1wU05FTKwvHN/jogtfcoyd2AT837c55NlKtuO
 iNCDwys4P3/cDhS30DnvwBjXYgNjfgXGhxWPM4X5WzmwLjow+cLfjYja4
 NvWu0ttdG9qIbyFY/8NVBdRn2Pz0VH57EZbbvr9rdINyTnqT33h/BvmkB
 ILWDYNARYeeXDdRjcTqquF4jhHiHd7YlDXa65hecvYJxPqMcyou2ZsvUw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382325197"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="382325197"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695420422"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695420422"
Received: from pjfarr-mobl2.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.251.218.135])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 10:00:56 +0300
Message-Id: <20230918070100.1387082-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] Xe runtime pm refactoring
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
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These patches are dropping some ifdefs added to build Xe runtime pm code. Mainly it's renaming xe_runtime_pm to intel_runtime_pm.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Jouni Högander (4):
  Revert "FIXME: drm/i915: runtime pm changes"
  drm/i915: Remove runtime suspended boolean from intel_runtime_pm
    struct
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  fixup! drm/xe/display: Implement display support

 .../drm/i915/display/intel_display_power.c    | 25 ++++++++++---------
 drivers/gpu/drm/i915/i915_driver.c            |  3 ---
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c       |  1 -
 drivers/gpu/drm/i915/intel_runtime_pm.h       |  4 +--
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  8 +++---
 drivers/gpu/drm/xe/xe_device_types.h          |  2 +-
 7 files changed, 21 insertions(+), 24 deletions(-)

-- 
2.34.1

