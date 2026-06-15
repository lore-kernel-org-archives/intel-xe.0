Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27113CD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 12:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C056310E3DE;
	Mon, 15 Jun 2026 12:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXCBm3K3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C255B10E3DE;
 Mon, 15 Jun 2026 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781527255; x=1813063255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GGyWrx5vGYdyRMD5ExKSWz6WmXjgEPZvXzaIyrDCM7Y=;
 b=dXCBm3K3Dw8EQdO75aWB1cGDY7HP6UNu/2KIw9BrpjUkIWETnLSHNIE2
 2FdeoQA+jp2V3S8uFy9W4NPJxUe7Z/kdh7L8vhxYme34MawXErJ4HPurw
 cHEDWy8IK1VLHJRrXfYSl9L+ZZm5h6LFWiFNeNh6EVA3T3n/Ehc/yrxz9
 zuY7FpHCps2jyRF6XKsJz1xAchoRPAifhEwNtA1wMnLGvgwwUVOHfC6KV
 szU1alNtbRZqkQUQHhSnS0V41a8S4MGWytnFOk0ZihDJkJTmFj7ptkRNV
 BJGdQ0amShCaQD9NlcL/keX4ET5e4K3pMMSK6lbuPLEmvbJb3VOd3SE/y A==;
X-CSE-ConnectionGUID: XDDTgfbBTMOlUES9SU5PLw==
X-CSE-MsgGUID: pJDusWwpTca9YI2/R2SKQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="104934997"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="104934997"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:40:54 -0700
X-CSE-ConnectionGUID: RMHfAhB1S7uJv3lDFKgn6A==
X-CSE-MsgGUID: qjJMFvbyRWuPx8Jg0+M4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246349730"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:40:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 0/4] drm/{i915,xe}: unify runtime pm calls
Date: Mon, 15 Jun 2026 15:40:44 +0300
Message-ID: <cover.1781527161.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Unify the runtime pm hooks for i915 and xe, apart from the xe special
d3cold handling, which gets separated from the rest.

Jani Nikula (4):
  drm/i915: add intel_display_driver_pm_runtime*() functions
  drm/{i915,xe}: add new
    intel_display_driver_runtime_pm_{enable,disable}()
  drm/xe/display: separate d3cold handling from
    xe_display_pm_runtime_suspend_late()
  drm/xe/display: unify runtime suspend/resume with i915 for non-d3cold

 .../drm/i915/display/intel_display_driver.c   | 66 +++++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  8 +++
 drivers/gpu/drm/i915/i915_driver.c            | 48 ++------------
 drivers/gpu/drm/xe/display/xe_display.c       | 28 ++++----
 4 files changed, 93 insertions(+), 57 deletions(-)

-- 
2.47.3

