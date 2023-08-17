Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E83C2FC0E
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBAF10E3EC;
	Thu, 17 Aug 2023 08:24:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABF910E3EC
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260687; x=1723796687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fHkaEMxbJKlssDipmH389hpXzc1IsZ5VC7/pdj+NvaM=;
 b=XvVy//ZFH8GArWs1r1bwkIB39R0MgI5+KouIPpRYFyGqQg6ChtDd1OZJ
 ZdbRvaAkLC+szB0chvrfABUE1Wathfa+BI+Kl8odyfPLfH3Ha9tvP8lhM
 O8aM8kShaVbllT+grXMMm6gY010LxyU4TjVaxiGclimVlS2KXJSSSqzQ3
 1CsxJ5X7KhT8ieAl68NT/0V8HOcpoDyiQfNtH3h+6fH6ENU56RXdcLkKR
 IpyPLL6yFne77ON4eXPtnh1KABPVbX8DEhyZvJsboP7vsec9fmUVafBcI
 GuV5G5hkXQavoN08bpSHVPpj05Iz1uDONodn0nvQbCMYU2KnzD0dBrJoQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459104265"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="459104265"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799944126"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="799944126"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:24:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:28 +0300
Message-Id: <20230817082437.3116208-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 0/9] drm/xe: i915 irq backports + display cleanups
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rebased, resend.

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
 drivers/gpu/drm/xe/xe_display.c               |  4 +-
 10 files changed, 97 insertions(+), 236 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.h

-- 
2.39.2

