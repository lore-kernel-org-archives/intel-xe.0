Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C0AC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5D210EE19;
	Wed, 26 Aug 2026 22:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWxdkPkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B7810E364;
 Wed, 26 Aug 2026 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787784842; x=1819320842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2+GQwlKukb1Bg+wAlbpjGQ4ItDR4rpahcji4s9k6xQo=;
 b=dWxdkPkkgtorsYRg1bFmClfsdJ4Irg0QA+ugEa0FWbVUzRht6APMXX72
 qJ/ZcP9P+vddXz5drla/AF7TGOkvG2GkBVbllIfXCERKZMktJcVpBAFOS
 1AQpQ/QyMFXTjPvebnRIK9xXM/+p8BRM8xrdyAk1IwyHVU0cfYdwppBKh
 EMYzuO8qxL0yyKE2cTcEgskudUVntl9liKqMyVxkVI+fpoznrQUP1foaz
 6rVRS2KJElNFelQscyDPWA3iOUgOp90DWh2RlyxfYEZlS1iXiNLeIx2EZ
 8+YVl+v0Jn7L5RCosirF+eV0/+B77EY70273MM4pbNOm/yLG04UEy44L7 A==;
X-CSE-ConnectionGUID: FfhGfeUgTGiayDEs4wckAg==
X-CSE-MsgGUID: BTx0TFMSQq2XJUUEvdfkAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87223479"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="87223479"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:53:56 -0700
X-CSE-ConnectionGUID: aRcNc5rrSYSCIAEUQVVFGQ==
X-CSE-MsgGUID: MMn9lTNPRBinU12x6HMexQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="272946041"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:53:53 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, pranay.samala@intel.com
Subject: [PATCH 0/4] PM_PME support on display hotplug
Date: Thu, 27 Aug 2026 01:53:33 +0300
Message-ID: <20260826225338.804902-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Introduce PME support for PME capable devices and avoid
HPD polling on runtime suspend. For PME capable devices
HPD will trigger PME which will wakeup the system. And
rest of the runtime resume call is same as before.

Vinod Govindapillai (4):
  drm/i915/hpd: plumb keep_hpd through irq reset
  drm/xe/pm: plumb PME capability to runtime suspend handler
  drm/xe/pm: allow the device to signal PME from D3hot
  drm/i915/display: Avoid HPD polling if the device is PME capable

 .../drm/i915/display/intel_display_driver.c   |  6 ++-
 .../drm/i915/display/intel_display_driver.h   |  3 +-
 .../gpu/drm/i915/display/intel_display_irq.c  | 46 +++++++++++++------
 .../gpu/drm/i915/display/intel_display_irq.h  |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               | 16 +++----
 drivers/gpu/drm/xe/display/xe_display.c       |  8 ++--
 drivers/gpu/drm/xe/display/xe_display.h       |  8 ++--
 drivers/gpu/drm/xe/xe_device.c                |  2 +-
 drivers/gpu/drm/xe/xe_irq.c                   | 18 +++++---
 drivers/gpu/drm/xe/xe_irq.h                   |  2 +-
 drivers/gpu/drm/xe/xe_pci.c                   | 22 ++++++++-
 drivers/gpu/drm/xe/xe_pm.c                    | 34 ++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h                    |  3 +-
 14 files changed, 120 insertions(+), 52 deletions(-)

-- 
2.43.0

