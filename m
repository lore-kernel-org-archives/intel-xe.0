Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFD9C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 08:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81CD10E0B5;
	Thu,  3 Sep 2026 08:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuGg/N6L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C7A10E0B5;
 Thu,  3 Sep 2026 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788422667; x=1819958667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y25491gTUidi+WNJowVD8092fKLPg5h2ebiD0A/NKjs=;
 b=LuGg/N6L+51PxKzrvpK4Q5GETZ/ed0PBZqg1P+86KLoYMpKMNp/ZVcCE
 x4wtryBwQ6tIoNZ2b4woVmnQOfxhw4qbA+TaXpNLQolUHcxt8BUh0y/WO
 oJBLyk9dU0qxa2xgDki2DcyMTsHk0IEDBjlSkiVJExpRw3Uj8YNgz2MlD
 U/scJv0SC2SVpvdfmq9WNWkNoXVH0+aRGTYS60NesEDPLVvyt2DAlOIRf
 QJ3ootuuEr4Aoa0B0xJe+KJmGJVNRJOjea78stRlY19hNn/EK9B+hb+pP
 fvLKhgtlnKsIs0iyNqob1gIZCqGu8iDPFr5e57mOcyPHfCIraTTo+43qG A==;
X-CSE-ConnectionGUID: 2iHXrr2uT6iZcXCiomshFg==
X-CSE-MsgGUID: Aq9CLZ3/TX6XL7+NZKGKWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88919200"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88919200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:26 -0700
X-CSE-ConnectionGUID: LTeC9nfCSnu99luYRO160A==
X-CSE-MsgGUID: r2bLQa5PS8GLNnTo3vdDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266397345"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.156])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:24 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v2 0/5] PM_PME support on display hotplug
Date: Thu,  3 Sep 2026 11:04:05 +0300
Message-ID: <20260903080410.489411-1-vinod.govindapillai@intel.com>
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

Vinod Govindapillai (5):
  drm/xe/pm: initialize the device's system wakeup capabilities
  drm/i915/hotplug: add helpers to track HPDs can generate PME
  drm/i915/irq: conditional HPD IRQ resets based on PME capability
  drm/i915/hotplug: avoid HPD polling if the device is PME capable
  drm/xe/pm: handle the PME capability and runtime pm routines

 .../gpu/drm/i915/display/intel_display_core.h |  2 ++
 .../gpu/drm/i915/display/intel_display_irq.c  | 20 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_hotplug.c  | 15 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_hotplug.h  |  3 +++
 drivers/gpu/drm/xe/display/xe_display.c       | 10 ++++++++++
 drivers/gpu/drm/xe/display/xe_display.h       |  4 ++++
 drivers/gpu/drm/xe/xe_pci.c                   | 20 ++++++++++++++++++-
 7 files changed, 66 insertions(+), 8 deletions(-)

-- 
2.43.0

