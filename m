Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A26ACD98CC
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 05:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F3210E932;
	Fri, 12 Jun 2026 05:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECQU2R1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EE910E92F;
 Fri, 12 Jun 2026 05:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781242383; x=1812778383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DcZMkzJ/zenrG9w6cP/03EziTR528SycSbrCFxPOBQw=;
 b=ECQU2R1eeJA40w6hcVQeM7FNhztMXzZszfLfL+P9eZe/78lfyNUPYOig
 zb9A5MEtcRWgpIZK0zaMe6VJkEyJspZ7uHngvkrqghnoBKZtNnUUVNcf5
 m8K+oaEL4KAntV7gCzcULWuHkhdLNAiEnGhCIk8ccJpnchBCMbzjt7WMO
 m+iIiZNWYXIhg2kWV+aqiahfDV5soqvhnpw9ZdaVsJcYIQwzCQk+/LsFO
 54NiYJHum6lQzVH9Y2FIj57KX8CHiARX0VCZA4ktZwyHzSTTZjSeC83fx
 GL8kHbjQ3cIdoOqwT7h9752RxqVIUkemK9uga+yOVlsmNrwe0ac4SMp5L w==;
X-CSE-ConnectionGUID: gD8fp21tRs2rGtVEYuus6Q==
X-CSE-MsgGUID: zejsua0BThOjQZ6Gm8Hfuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82075217"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82075217"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:33:03 -0700
X-CSE-ConnectionGUID: WBw9GkFbRW+gqfl+68mXmQ==
X-CSE-MsgGUID: icue45p0RNaO5QTZbMCBBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="270762765"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:33:01 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/3] Deactive/Reactivate Panel replay on errors
Date: Fri, 12 Jun 2026 08:32:46 +0300
Message-ID: <20260612053249.246878-1-jouni.hogander@intel.com>
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

*** BLURB HERE ***

Jouni Högander (3):
  drm/i915/psr: Split intel_psr_short_pulse
  drm/i915/psr: Detect possible ALPM errors on Panel Replay as well
  drm/i915/psr: Perform Panel Replay exit/activate on errors reported by
    sink

 drivers/gpu/drm/i915/display/intel_psr.c | 99 +++++++++++++++++-------
 1 file changed, 69 insertions(+), 30 deletions(-)

-- 
2.43.0

