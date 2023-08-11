Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D186C001DB
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 09:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48F410E684;
	Fri, 11 Aug 2023 09:36:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F73D10E684
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691746569; x=1723282569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rdiYSN9UeivOIub1at1weaPyEpJ6+uy0YtC/r+qsnuI=;
 b=DGz6gQ9smDT6u69uq84zAxc9UtzjSDo+OvOqa1ehWT8bWlGHups7kxhe
 tM1rQ61hVaWLyTK0QO5szXDXP1e1viiovxhHtC6fvYSxY/7kO5LSsbBgD
 tlvEsnZ7Qvb+UHkurpQxO6jx30zGPcvBU8OTey8WjKBjGB+K3Zva7VWWn
 Kn9R4gvPG8jl89UYfjyC1mzLeaRVYksfF05YAhfl+nX90Fj8D3FFI023O
 O/pc/e2y+cJvyKdm/APkeYgjQtURoxnXHbYJvK5oPrsiZUlvaKjPV+bbW
 WumeqeaBgJ3HBjbHN7EFxEebMMcicL4OqgXL1QEW/zfAOqDnxveTyviVk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="458012752"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="458012752"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906374723"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="906374723"
Received: from unknown (HELO localhost) ([10.252.49.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 12:35:50 +0300
Message-Id: <20230811093559.2304457-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/9] drm/xe: i915 irq backports + display cleanups
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Backport the i915 display irq refactors. They will break the build until
fixed by patch 5. In rebases, the backports should be moved before
"drm/xe/display: Implement display support".

Additionally, there are a few display cleanups on top.

BR,
Jani.

Jani Nikula (9):
  drm/i915/irq: add dedicated intel_display_irq_init()
  drm/i915/irq: add dg1_de_irq_postinstall()
  drm/i915/irq: add ilk_de_irq_postinstall()
  drm/i915/irq: move all PCH irq postinstall calls to display code
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 .../drm/i915/display/intel_display_driver.c   |  2 +
 .../gpu/drm/i915/display/intel_display_irq.c  | 84 ++++++++++++++++++-
 .../gpu/drm/i915/display/intel_display_irq.h  |  7 +-
 drivers/gpu/drm/i915/i915_irq.c               | 74 +---------------
 .../gpu/drm/xe/compat-i915-headers/i915_irq.h |  6 ++
 .../xe/compat-i915-headers/intel_pm_types.h   | 34 --------
 .../xe/compat-i915-headers/soc/intel_gmch.h   | 14 +---
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 50 -----------
 drivers/gpu/drm/xe/display/ext/i915_irq.h     | 58 -------------
 drivers/gpu/drm/xe/xe_display.c               |  3 +-
 10 files changed, 97 insertions(+), 235 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.h

-- 
2.39.2

