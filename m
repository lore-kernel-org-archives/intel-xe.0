Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDB71073CBF
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 14:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B45B10E671;
	Wed,  8 Apr 2026 14:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5lFjncz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3264E10E670;
 Wed,  8 Apr 2026 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775656902; x=1807192902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LN0ROSp3F49mpSiguoHJzn0qboFLlrBBgtz8bxY/D60=;
 b=a5lFjncz2poFaXp/d58haRhH6NjDMCIetcz6M/1eLRFrjhfxJYlD92YT
 ztsfguOhxg5FFmTIJQyJiep4tR8eRQJfo470lNBVB0JxlmazH99CdS7WC
 jlTE0cabxhUsINP5e+7xZOqMMTlD/dSv2pwx99fTRx7iDmDDv5ObJVrDr
 cbKcOvnN9ErRuAVJZh/rRSxBcD7y2xANv6o6dhtSFOLbBEZ7twuC+uU8u
 mIp5qE7kt2L1zBbUr3gVsmop9hSp6DenfpyQyvS5jfIIHpbBIRy6epgr3
 gFYf35lmLmBkRm4MK+WNmGrT123h/IK9t6QkKsFPo8mnQML2Qo4uywYRE g==;
X-CSE-ConnectionGUID: JnuIudUURXWOsdka8FeRUw==
X-CSE-MsgGUID: GT6/OYAFSQ2v2ts51faudA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75811478"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="75811478"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 07:01:19 -0700
X-CSE-ConnectionGUID: mHcFky6gREO2we+HoG7ayg==
X-CSE-MsgGUID: jCdn5CmIR0a/I+ErzB3DYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="228726648"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.244.251])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 07:01:18 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/6] PSR/Panel Replay/ALPM logging improvements
Date: Wed,  8 Apr 2026 17:00:52 +0300
Message-ID: <20260408140059.252067-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

These patches are adding traces to ease parsing PSR, Panel Replay and
ALPM CRTC state using dmesg. Also printing out DPCD capability/support
registers for these features are dumped out.

Jouni Högander (7):
  drm/i915/psr: Improve PSR state information in crtc state dump
  drm/i915/alpm: Dump out computed ALPM parameters in crtc state dump
  drm/dp: Include PSR2 granularity registers into PSR capability size
    define
  drm/i915/psr: Add new macro for accessing cached PSR DPCD registers
  drm/i915/psr: Read all PSR capability registers at once
  drm/i915/psr: Dump out PSR and Panel Replay DPCD registers
  drm/i915/alpm: Dump out ALPM capability DPCD register

 .../drm/i915/display/intel_crtc_state_dump.c  | 16 +++++-
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 55 ++++++++-----------
 include/drm/display/drm_dp.h                  |  2 +-
 5 files changed, 41 insertions(+), 35 deletions(-)

-- 
2.43.0

