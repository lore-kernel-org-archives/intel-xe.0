Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FB6EB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF09010E12A;
	Tue,  4 Jul 2023 15:32:53 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CB310E12A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688484771; x=1720020771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C7IGH0l1iSYSI/lKXS8bz5cbVTd/MDc8gHyAxPJx158=;
 b=HYgfIf9LIZLCjwftUXuCxiNxsWCJwGUcnERy3W+BXEDJWAIAD3fnuQnM
 ghVEsyTofvOG6O8+drPhFJYo2V0U62KWZYhryVb2B9c2mWiJg27dYHoOB
 1HtzBhb0d3uyVqetYmGzVSybJChG9mrbIAJGZKLEFPPqGcVzX+7ULt+dq
 jK7jNFZCEYKWtHYGmt7yj0CYv55bsmkt/g3H+Y39eh3FHjjyfJnukLaii
 T8T/zIrUA9FaK/LPKa/DSn+o89d44qfCk/i7pFLqKnHfiD26E+n4ndO+q
 jaNv+1sru5CkyeUMNEmUBocbS/EKG1ctG1OkswbXtUpfoTu2gZJ7ZNmP5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343480161"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="343480161"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712913886"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="712913886"
Received: from jbouhlil-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.173])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:32:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 18:32:39 +0300
Message-Id: <20230704153243.2489821-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] drm/xe/display: reuse soc/ code from i915
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove a bunch of duplication from xe by reusing the soc code from i915.

BR,
Jani.


Jani Nikula (4):
  drm/i915/dram: replace __raw_uncore_read32() with
    intel_uncore_read_fw()
  drm/xe/mmio: add xe_mmio_read16()
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/soc/intel_dram.c         |   2 +-
 drivers/gpu/drm/xe/Makefile                   |  14 +-
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +-
 .../drm/xe/compat-i915-headers/intel_uncore.h |   8 +
 .../xe/compat-i915-headers/soc/intel_dram.h   |   1 +
 .../xe/compat-i915-headers/soc/intel_pch.h    |   1 +
 drivers/gpu/drm/xe/display/ext/intel_dram.c   | 496 ------------------
 drivers/gpu/drm/xe/display/ext/intel_dram.h   |  14 -
 drivers/gpu/drm/xe/display/ext/intel_pch.c    | 157 ------
 drivers/gpu/drm/xe/display/ext/intel_pch.h    |  91 ----
 drivers/gpu/drm/xe/xe_device_types.h          |   9 +-
 drivers/gpu/drm/xe/xe_display.c               |   2 +-
 drivers/gpu/drm/xe/xe_mmio.h                  |  10 +
 13 files changed, 42 insertions(+), 765 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_dram.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pch.h

-- 
2.39.2

