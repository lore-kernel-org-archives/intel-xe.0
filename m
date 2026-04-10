Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4173E99049
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 07:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83BB10E8C0;
	Fri, 10 Apr 2026 07:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndQD6hFc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FEB10E8BE;
 Fri, 10 Apr 2026 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775806507; x=1807342507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8N/zGG+0r01hEb+bnG1B9EJ5iSucl/YYvsa5cQvl9/c=;
 b=ndQD6hFc2UFownofx/xyqVbAxYM9ZSRn8WTQu/5rOpmafXf7o9yLH8QH
 Crcd59sDkeDrSsI/GSUDMUf7P4Aeeh7RNrnp2mYR9A9sg3bs1VbZYwDap
 NISaB8LYoBtPz/bztc9PcF5W18wSQbZNN+6nnJPdrL4mfYXmvEPMkkmn1
 /EwctRBzBsIR8LXj7HchAiP0IrhiNK83iIBCEnYTxqKHz1ufTOPvWxD1c
 fRGO6Mv3TnNOZpwdiio7PgGXStnJLo2f4B5gC08Jm0U9o0C/eibpld9Dq
 I+jk1ZtrHznxGcNMcQVoosXw3nTY0TeteXpMvVNgo/L5tkCMqzZBS/KH9 A==;
X-CSE-ConnectionGUID: d/Ylu8jTRAGbg40u/abgeg==
X-CSE-MsgGUID: F6V15gBRS02C2hSIYSk8iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80709872"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="80709872"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 00:35:07 -0700
X-CSE-ConnectionGUID: Y8V2HCo7QImGkNXXlPgGKA==
X-CSE-MsgGUID: Mh2GpLToSam5pbD64gGkjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="225854202"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 00:35:04 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/4] drm/i915/reset: Expose "display_reset_count" in debugfs
Date: Fri, 10 Apr 2026 10:34:56 +0300
Message-ID: <20260410073500.32308-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Expose a display reset count in debugfs. It will be used
by kms_busy/*-with-reset tests to confirm they are actually
testing the thing they are meant to test.

I expect this to fail on all platforms using execlist 
submission. I'll send a second version of the series 
with a fix after confirming that.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Test-with: 20260409200924.5409-1-ville.syrjala@linux.intel.com

Ville Syrjälä (4):
  drm/i915/reset: Reorganize display reset code
  drm/i915/reset: Move pending_fb_pin handling to i915
  drm/xe/display: Add init_clock_gating.h stubs
  drm/i915/reset: Add "display_reset_count" debugfs file

 .../gpu/drm/i915/display/intel_display_core.h |  5 ++-
 .../drm/i915/display/intel_display_debugfs.c  |  2 +
 .../drm/i915/display/intel_display_power.c    |  2 -
 .../drm/i915/display/intel_display_reset.c    | 40 +++++++++----------
 .../drm/i915/display/intel_display_reset.h    |  8 ++--
 drivers/gpu/drm/i915/display/intel_overlay.c  | 10 +----
 drivers/gpu/drm/i915/gt/intel_reset.c         | 26 +++++++-----
 drivers/gpu/drm/i915/i915_dpt.c               |  5 +--
 drivers/gpu/drm/i915/i915_drv.h               |  2 +
 drivers/gpu/drm/i915/i915_fb_pin.c            |  9 ++---
 drivers/gpu/drm/i915/i915_overlay.c           |  6 +++
 drivers/gpu/drm/xe/Makefile                   |  1 +
 .../compat-i915-headers/intel_clock_gating.h  | 10 ++++-
 13 files changed, 71 insertions(+), 55 deletions(-)

-- 
2.52.0

