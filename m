Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A596ACDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 05:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723DA10E40A;
	Thu, 12 Oct 2023 05:11:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81A010E40A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 05:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697087470; x=1728623470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sRgfHWGhJIykNYSmPA+BuZujWnHtGWqejoz054xY2CQ=;
 b=AVwjkmYFxOQsWAfqKGk1G5ndyEfbx7xr0NHEuL6AnI5adB2eoV1pn4fh
 U87YCMOuTjCzwgK+7Ll5f6BIIFp2xUzi9J9E2rZN99gBtDIkfbydRMeOc
 XtWFAgR01y4Z1/SmzbHHnTwzkEWWYRDzIrkLRRlvHHfZKNzKCDz2jqkS3
 wKkVGpRRJ6JIO9RtTtsY/y8YFi0JojzLg+hKdpq17/uDCe3bcgOlS6Mi9
 XsZ8m+k0bkHTR7uSBojZWgYgXZMp97rkhvO7vm/yvYMFBNwRrhjwlNTCY
 hXW4FdBWd9VYhQb3CC59RTGW1zbKx4wDVy9yNm1nmRTodDpC4WGW7bG3g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415883613"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="415883613"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 22:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747740732"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="747740732"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 22:11:06 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 10:36:39 +0530
Message-Id: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] Fix compatibility issue for intel_dmc
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series reverts hacky #ifdefs from intel_dmc

v2: Rebase

Acked-by: Jani Nikula <jani.nikula@intel.com>

Chaitanya Kumar Borah (6):
  Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
  drm/i915: Add wrapper for getting display step
  fixup! drm/xe/display: Implement display support
  drm/xe: Add intel_step.h compatibility header
  drm/xe: Add i915_gpu_error.h compatibility header
  drm/xe: Add intel_uc_fw.h compatibility header

 drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
 drivers/gpu/drm/i915/intel_step.c             |  5 +++++
 drivers/gpu/drm/i915/intel_step.h             |  1 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
 .../xe/compat-i915-headers/i915_gpu_error.h   | 18 +++++++++++++++++
 .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
 .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 12 +++++++++++
 7 files changed, 61 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h

-- 
2.25.1

