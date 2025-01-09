Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28EFE7719A
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 10:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9E510ED52;
	Thu,  9 Jan 2025 10:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4n4gMg3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BA910ED4B;
 Thu,  9 Jan 2025 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736418947; x=1767954947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RmB6hGeG77hgbo9CJd0mE3MiI/quaW6ddycEfnU0gsI=;
 b=b4n4gMg3BM/RHX8RHlP2Uz7SIPMv0ia1D1Q/Zy0AVcvN90tSjKcP9c/r
 QXRz4mzyq8AHQnNlGiK06vUZWCZNK7aJ/g3MwDBqVSzzQXlVESOtCllgF
 s7we0OlR96CO3cuKq6+MVUhDC2lXippzwzP3/s0eqwc1E3wEVN56HBVpT
 VmRELvXx6SYKnYRXffCHji/tnjWntnpO1IQB6mBBd8NUEF21FRosOqBza
 xCx/XazEteQD5u5icBtPV3hMp/VEAwT2tXyPaKdvnLi/4GaQotQXRUack
 xsrCCBE8xyWrbe6xRpSOLfN1SSPZP7gCnBjCevHlhcXjT1Or1SBD1ocH2 A==;
X-CSE-ConnectionGUID: hdYXLQymSoO0lBLZbJBb1A==
X-CSE-MsgGUID: sCFTQ0GVS1G//M9FTrsYJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="48034983"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="48034983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 02:35:47 -0800
X-CSE-ConnectionGUID: lm0l3yKWSfWaBf28XMwMdA==
X-CSE-MsgGUID: l3Li2cBzQo65TOACCRwIwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="103333000"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.185])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 02:35:45 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/4] Panel Replay mode change without full modeset
Date: Thu,  9 Jan 2025 12:35:28 +0200
Message-ID: <20250109103532.2093356-1-jouni.hogander@intel.com>
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

This patch set allows changing Panel Replay mode without full
modeset. There are couple of requirements in eDP1.5/DP2.0 spec:

"Enabling of the PR function shall occur prior to link training. To
re-enable the PR function after the PR function is disabled, it is
necessary to repeat link training."

This is achieved by enabling Panel Replay before link training always
if Panel Replay is supported by both sink and source. Panel Replay
enable bit is never cleared on sink side. When we are disabling Panel
Replay we are just disabling it on source side. This triggers sending
"VSC SDP" with "PR_STATE" set as "0 = PR Inactive (normal operation
mode, Live Frame mode)"

"The Source device may enable Selective Update by setting DPCD
001B0h[6] = 1 prior to transmitting a VSC SDP with the PR Active state
indication (DB1[0] = 1). The Source device that enables PR SU with
ALPM shall enable SU Region Early Transport by setting DPCD 001B0h[7]
= 1 prior to transmitting a VSC SDP with DB1[0] = 1."

These are achieved by transiting to Panel Replay Inactive state before
changing Selective Update or Early Transport bits.

Jouni Högander (4):
  drm/i915/psr: Add new function for writing sink panel replay enable
    bit
  drm/i915/psr: Enable Panel Replay on sink always when it's supported
  drm/i915/psr: Make intel_psr_enable_sink as local static function
  drm/i915/psr: Allow changing Panel Replay mode without full modeset

 drivers/gpu/drm/i915/display/intel_ddi.c     |  3 +-
 drivers/gpu/drm/i915/display/intel_display.c | 14 --------
 drivers/gpu/drm/i915/display/intel_psr.c     | 36 ++++++++++++++------
 drivers/gpu/drm/i915/display/intel_psr.h     |  3 +-
 4 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.34.1

