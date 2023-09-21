Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C4DE7071D
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F4D10E5C6;
	Thu, 21 Sep 2023 11:14:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0867810E5C6
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695294894; x=1726830894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OLPfOVAIecGJpxfP9cR+KrZqZ329iLn0QycJbMFM42Y=;
 b=AtGng0vioH8m9xb9KnvheWMKW4D+jHwF79IE0BB9DvS4O2ewcqv9hKY8
 TEeMmWjMq1V8a9Mybzy0d5SaK6Sx3jdaj+UhAcnFvCkbSv/TS2IqiPoMZ
 ijyXJ40xvP8svcMr6Cfb2dIJHwFn8fMr2qPHUIGEket9/llujxcKSTN16
 X7S20cKWtJ/FAYz4SSoCDimdkwKXJd0IsC7szLtVnIdtJBIuzS/h975zd
 ru5EnFs82m3kPWtYWpErB7yJro10CFDcQCHxJ5s3eso+4PsfmbNp7/qFR
 vXGtGZxnZJzLbKZjGzNJLxG9Vfn8nfTV4bpCNzDvUJw19ubP98ed9kLgh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359872809"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="359872809"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="994040667"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="994040667"
Received: from jhogande-mobl1.fi.intel.com ([10.237.72.74])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:14:52 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 14:14:30 +0300
Message-Id: <20230921111434.3051325-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] Xe runtime pm refactoring
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

These patches are dropping some ifdefs added to build Xe runtime pm
code.

v2:
  - Remove xe_runtime_pm completely from DRM driver patch
  - Add xe_runtime_pm struct pointer to xe_device in display fixup
  - Add define (xe_runtime_pm -> intel_runtime_pm) instead of rename

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>

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
 .../xe/compat-i915-headers/intel_runtime_pm.h |  2 ++
 6 files changed, 18 insertions(+), 19 deletions(-)

-- 
2.34.1

