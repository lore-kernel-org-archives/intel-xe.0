Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDBCC83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E774E10E52C;
	Tue,  5 Sep 2023 14:14:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B219910E033
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693923243; x=1725459243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=995mJN3w5SiewKF+aJIZssh93ZaB6U6v2UbO3oZtvFk=;
 b=NAGXJDKH3Xxpjq5oyYkCc9xsWMjoYr4VtSk3T6kJ/SeUCZlo3+wxaMng
 ZRpMogcdlpym7o3PMGFpe5zKIW/+/sAdm76WOmUpjyw8xsufNrVy5Q6Ku
 a0qkJ0LVpd9dSqztnTM6eKhntVU+vUIWK1Pyn6wyfIdJNw18c/C5kwj0Z
 zViOC2lU5z7hxZLr5dLcSsVtue+Zijy+NZqoAZWy3OWEVQzRq6LWNbWNj
 x6KBiETr9g80swNRaBFAwKTbLpFT+3/PPNY8VCfYl13RSmcPuWwrIl6hS
 DXtUhyKUqvVj9ZpRcHw7eR0+QpxNNw4kmEXvlQgRmG8P6CHS4+G/SHnv1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380611076"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="380611076"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811245371"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="811245371"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.152])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 17:13:42 +0300
Message-Id: <20230905141347.1027082-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] drm/xe: drop unnecessary i915 display commits
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
Cc: Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Revert five unnecessary commits.

The rebased version with all the commits just thrown away is at
[1]. That also drops "drm/i915/display: Make FBC check stolen at use
time." which has become an empty commit.

[1] https://gitlab.freedesktop.org/jani/xe/-/commits/xe-drop-unnecessary-commits-2023-09-05


Jani Nikula (5):
  Revert "FIXME: drm/i915: display/intel_display_types.h random
    whitespace changes"
  Revert "FIXME: drm/i915: include i915_utils.h from
    intel_display_types.h"
  Revert "FIXME: drm/i915: revert the earlier mmio_offset change"
  Revert "FIXME: drm/i915/display: Prefer i915->uncore over plain
    uncore"
  Revert "FIXME: drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe"

 drivers/gpu/drm/i915/display/intel_bios.c          | 13 ++++++-------
 drivers/gpu/drm/i915/display/intel_display_types.h |  3 ++-
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.39.2

