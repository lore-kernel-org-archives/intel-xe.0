Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160C4E8B39C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 05:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14EA10E0A1;
	Wed,  4 Feb 2026 05:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1mA5OfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AB510E0A1;
 Wed,  4 Feb 2026 05:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770182314; x=1801718314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MBi1JAhXzFoAzvRq3X9c5JQLtLXfrNA2aOB+W/P3b6k=;
 b=V1mA5OfT7wOzt81QWSZibQs+xBOWhV5wBF4Scbq962WuKl/kFmNPvzmn
 qtgkyd36cKo0if22PhFHXQKb82ccubv7XAh1TClK4LZ4UbxTTwJYhlV3z
 aacAYGHO5n3d3nHO7jqB8i6hbX6fadV5qUNMn/PJPe4MYWVDfFhoqkVpa
 aJByD4dwHSQNuaU3BZydC9jXhmY3Ellx5fOEhENNWs33utJoXOyJOqS01
 E/jBgdTetnJ55GbpDvmtaFiFD0rPdZOAQJ+RQrX7nmN51uMGhrlUanca/
 dbuYEQpmTgeR8B3BX7C7YPa6CL3MFHoDGfaZ/Ixj2AY748OncNPTSHPj+ Q==;
X-CSE-ConnectionGUID: yYQaYi3rRui0PYuqNY7iKQ==
X-CSE-MsgGUID: Ebn0QXXTQJG8yLWrHpox3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82102817"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82102817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:18:34 -0800
X-CSE-ConnectionGUID: APMR2d+qRreukhL5+ObtuA==
X-CSE-MsgGUID: EXELgwdKRxei0bTGRSzwgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210127464"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:18:32 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, ville.syrjala@linux.intel.com,
 animesh.manna@intel.com, michal.grzelak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 0/5] LOBF fixes
Date: Wed,  4 Feb 2026 10:32:45 +0530
Message-ID: <20260204050250.762718-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix lobf to use computed guardband and set context latency.
Also disable LOBF while switching to LRR/seamlessMN modes.

Rev2:
 - Use is_enabling/disabling macros for lobf checks and other suggested
   changes from Ville.

Rev3:
 - Address comments from Michal.

Rev4:
 - Address comments from Jouni.

Rev5:
 - Rebase

Ankit Nautiyal (5):
  drm/i915/alpm: Compute LOBF late after guardband is already determined
  drm/i915/alpm: Allow LOBF only if window1 > alpm check_entry lines
  drm/i915/alpm: Allow LOBF only for platform that have Always on VRR TG
  drm/i915/alpm: Simplify and align LOBF checks in pre/post plane update
  drm/i915/alpm: Disable LOBF around transitioning for LRR/seamless MN

 drivers/gpu/drm/i915/display/intel_alpm.c    | 144 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_alpm.h    |   9 +-
 drivers/gpu/drm/i915/display/intel_display.c |  29 +++-
 drivers/gpu/drm/i915/display/intel_dp.c      |   2 +
 drivers/gpu/drm/i915/display/intel_vrr.c     |   2 +
 5 files changed, 129 insertions(+), 57 deletions(-)

-- 
2.45.2

