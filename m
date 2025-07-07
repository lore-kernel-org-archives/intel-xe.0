Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D30C83030
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 04:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DA910E2F3;
	Mon,  7 Jul 2025 04:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMXEmwhk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3204210E2F3;
 Mon,  7 Jul 2025 04:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751863432; x=1783399432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HbOfjZfFqGOQMbvNUKJEnk6p30eAyZ74DiwaSI+6DY8=;
 b=NMXEmwhkHkUtZlYWnKRQ37sJiVUTbgF0sqKPl/5yyc0s+FDRDAEB1KpG
 rZpGi2jijSvw63ajVtWeIo82YoMXB/xDfNrq2hqjTJdMBtvHtMBD6os9R
 TieJKNqRAs6tEITMUFd8LnB45Mj3sM7To8eOG1w55igwnBRd3KNXXUUzw
 4Aywju2vUBAhtmIqMMMmHkgkqAyntYFsJZ3ko7ltOyyUd1BoQIBf/kvja
 zSvg5bZ43xcUzLGM5QUMjY490achOqwSZhBwM9wnzyhB9UnHbl12vICnm
 MYPAJl59SXr9FhDn5alu3+ZiV9tBi3YSE00Nk7tz7Yg+HCNXiKoHFuUKK w==;
X-CSE-ConnectionGUID: 6p6efalpQ36pnt77vMgyVw==
X-CSE-MsgGUID: Irg5LVEHRgWd4OJsfIaJPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54215814"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="54215814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 21:43:52 -0700
X-CSE-ConnectionGUID: S3TEUGdQRsawkL4mh/wQPA==
X-CSE-MsgGUID: 1vL1avJES0SaPj+HIF6UZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="155209881"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 21:43:50 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/4] Optimize vrr.guardband and fix LRR
Date: Mon,  7 Jul 2025 10:03:13 +0530
Message-ID: <20250707043321.97343-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

Instead of setting vrr.guardband to vblank, use optimal guardband that
works for most of the cases. This will help in avoiding need of change
in guardband and fix the LRR feature that needs seamless switching to
a lower refresh rate.
Also, for seamless_mn where vtotal is same but mode clock is changed to
seamlessly switch to lower rate, re-compute the vrr timings.

Few things that still need work:
-The timestamps corresponding with next start of vactive still need to be
fixed with the new scheme.
-Re-enabling CMRR

Ankit Nautiyal (4):
  drm/i915/vrr: Use vrr.sync_start for getting vtotal
  drm/i915/vrr: Use static guardband to support seamless LRR switching
  drm/i915/vrr: Set vrr.vmin to min Vtotal
  drm/i915/vrr: Fix seamless_mn drrs for PTL

 drivers/gpu/drm/i915/display/intel_display.c |   5 +-
 drivers/gpu/drm/i915/display/intel_psr.c     |  41 +++++
 drivers/gpu/drm/i915/display/intel_psr.h     |   2 +
 drivers/gpu/drm/i915/display/intel_vrr.c     | 174 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_vrr.h     |   5 +-
 5 files changed, 200 insertions(+), 27 deletions(-)

-- 
2.45.2

