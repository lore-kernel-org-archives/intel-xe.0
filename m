Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BCAC88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 09:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD3410F39F;
	Tue, 15 Sep 2026 09:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XS41uT15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17C110F39D;
 Tue, 15 Sep 2026 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789464349; x=1821000349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/PM3hscEQCMxQC6sQlwdrMb6uq/qV+u6tsIMXtJIF00=;
 b=XS41uT15sdT5d47JTS/Y/z9P6i7gJR1ELfteaJ5ucQTXi71XhCQaqa4s
 m3fQZk3bbsNPqlJ6dKTRHto3xz/Adr/hj5WYUeOy2OsMoTaMk3h6vOCLs
 HU3jJIA48Bxk5zqobr6eAv5MNPoFLv7d8fVGMoEAk2KebTcr3C/ty+Ds0
 3fCexn6Y/acS2PtCVSWIGMJPnysHxK/DVc+YOqsXCvUqxnt+cJj+Kv3+E
 3kCgYNUD6M62Gl/Zq+4th1ZQ6vyhvW8jDzV21iXhPJkZ3mCtEBTZQSF24
 HcXsCKSAT7V947rj+DmEEFWqw15HXwJNpZN57jeVOrT9FmmIuTvHWEftb A==;
X-CSE-ConnectionGUID: 31rTnD1sSI2yhjy5q7N1GQ==
X-CSE-MsgGUID: ZXx/Mf2OTtmoVbU5Vj8H/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89581821"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89581821"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:25:34 -0700
X-CSE-ConnectionGUID: 9Iz8kaTBQxalZvXQJ3bWPQ==
X-CSE-MsgGUID: HEVWVjDPS+SAEnJuZHlEIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1118070"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:25:32 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	vinod.govindapillai@intel.com
Subject: [PATCH v8 0/5] pm_pme support on display hotplug
Date: Tue, 15 Sep 2026 12:25:12 +0300
Message-ID: <20260915092518.639448-1-vinod.govindapillai@intel.com>
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

v2: Instead of plumbing keep_hpd and pme_capability to
    the existing interfaces, a separate helper function to
    set and get pme capability is added.

    HPD polling is handled directly inside the
    intel_hpd_poll_enable() based on the pme capability
    flag

v3: Lockdep related splats were observed during some rare testing
    scenarios. The PCI PME api to enable wake internally use kmalloc
    and can trigger deadlocks. So the calls to the PCI PME APIs are
    updated and placed within the no reclaim loop. Also any display
    specific calls are isolated within xe / i915 blocks and display
    parent interface is used to tackle the inter dependencies to
    keep the display module design clean. 

v4: No need to maintaining another variable to keep track of PME
    can be generated from HPD in intel_hotplug. Instead the parent
    interface function can be used directly to get the xe.pme.enabled
    to know PME is enabled and configure the IRQ resets and HPD polling

v5: Rebased

v6: Avoid "wakeup" false reporting platforms where PME is not supported

Vinod Govindapillai (5):
  drm/xe/pm: introduce PM PME support
  drm/i915: add pme_enabled() to the parent interface
  drm/i915/xe: plug the pme_enabed implementation for xe
  drm/i915/irq: conditional HPD IRQ resets based on PME capability
  drm/i915/hotplug: avoid HPD polling if the device is PME capable

 .../gpu/drm/i915/display/intel_display_irq.c  | 18 +++++---
 .../gpu/drm/i915/display/intel_display_rpm.c  |  7 +++
 .../gpu/drm/i915/display/intel_display_rpm.h  |  1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c  |  5 +++
 drivers/gpu/drm/xe/display/xe_display_rpm.c   |  6 +++
 drivers/gpu/drm/xe/xe_device_types.h          | 13 ++++++
 drivers/gpu/drm/xe/xe_pci.c                   | 22 ++++++++-
 drivers/gpu/drm/xe/xe_pm.c                    | 45 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                    |  2 +
 include/drm/intel/display_parent_interface.h  |  1 +
 10 files changed, 112 insertions(+), 8 deletions(-)

-- 
2.43.0

