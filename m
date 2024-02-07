Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA66C4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F1D113214;
	Wed,  7 Feb 2024 10:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRpmidGb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C2C113207
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 10:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301887; x=1738837887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aJtuOImgg4oDiJ/XbRI4Um+/Ddl+K6ByV/R2ZcD8CpM=;
 b=TRpmidGbYEgND/CseLCzBskXdOT1nUiHDRWjUmG3gJSZ2BcUB0VbxWo4
 thX2lC5GvaIf69Mny4zM0hug2+5B6pF4cgK9/6Y4DVc2n6yNIZvLv2BmV
 a6QHuBUXR7CIMXD+vzpmCDqF2qnl+JrI6BcNuisJNijqihXLsWej+rKO5
 P5wJo0GE2JadPAiDMP7E0xgLmGhU8WyfSYAbpd++0XKewSVUy0uEcBLUD
 RtpjkPxgHmKx7tQzvzMNyrybXFghz/3GLzggznwCrmxC9l4Ir/qssGbA9
 PwygrtzTW2VFHWg6qcZlOa74MsSTLjghfVgC4zqpWyQ0+fCbucfDSC5iX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12317327"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="12317327"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1328785"
Received: from mlyngsie-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.252.42.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:30:21 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, gustavo.sousa@intel.com
Subject: [PATCH 0/6] drm/i915/display: DMC wakelock implementation
Date: Wed,  7 Feb 2024 12:30:01 +0200
Message-Id: <20240207103007.665367-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

Hi,

This is the third version of my series, now not as an RFC anymore, but
as a proper patchset.

This is what changed compared to RFC v2:

  * Renamed intel_wakelock.[ch] to intel_dmc_wl.[ch]
  * Renamed all functions to match the new file name, intel_dmc_wl_*()
  * Removed the excessive logging
  * Added comment about other CTL registers
  * Changed DMC_WAKELOCK_CFG_ENABLE to DMC_WAKELOCK_CTL_REQ for the
    control registers
  * Add disable function
  * Add module parameter
  * Moved the init to DMC load and added disable

This is one item I promised to look into, but didn't derive into any
code changes:

  * No need to bail out on refcount == 0 in the work handler


Please review.

Cheers,
Luca.


Luca Coelho (6):
  drm/i915/display: add support for DMC wakelocks
  drm/i915/display: use wakelock in the remaining read operations
  drm/i915/display: use wakelock in register waiting functions
  drm/i915/display: use wakelock in the last write function
  drm/i915/display: add module parameter to enable DMC wakelock
  drm/i915/display: call DMC wakelock enable when DMC is loaded

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_de.h       | 119 ++++++++++-
 drivers/gpu/drm/i915/display/intel_display.c  |   1 +
 .../gpu/drm/i915/display/intel_display_core.h |   4 +
 .../drm/i915/display/intel_display_driver.c   |   1 +
 .../drm/i915/display/intel_display_params.c   |   5 +
 .../drm/i915/display/intel_display_params.h   |   1 +
 drivers/gpu/drm/i915/display/intel_dmc.c      |   8 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |  32 +++
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   | 197 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dmc_wl.h   |  35 ++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 12 files changed, 395 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.h

-- 
2.39.2

