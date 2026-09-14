Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EAEC88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EFE10F22C;
	Mon, 14 Sep 2026 20:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ud7WNPqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7408E10F22B;
 Mon, 14 Sep 2026 20:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789418449; x=1820954449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S+mdARfdCOOb0UJOPghq+FNffEfAImKBj56Fgan3daw=;
 b=Ud7WNPqfj9GI9Ik8eH75aycVCDdFXILHCT3HFVWaJs2jEv+m0OGC0Afv
 aDbKibHJkjYOYsJHNPul/ZerXKm21Jeg9rC6XMen0WiT7K6HVM/vPutGL
 CKyOj+lKbVl0KPJkIb3jBxqpfTudIsqHfT2NFpWExIMWhMcyfZfu5u1mE
 e5G91u1mvT60wwYiBO0mnOa9OZO4GWGaxkHfRfgJumDXeW82eCNekD9sT
 9p8eHmZVBqutXh8G9QipSsD6PnMp7XnRt8nZ2t3O1E22QR+bw2Vbfx5X6
 szrwkmsKWQ3B3cyryHMkToRmIfn3b4oW+Md6LMZ0EkQTXAWUNU/+e64lA A==;
X-CSE-ConnectionGUID: iU16RGX3Rnq1bQmI/Q0G0Q==
X-CSE-MsgGUID: 3s6wwlEyR6Wtj97n3CQFAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107288119"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107288119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:40:48 -0700
X-CSE-ConnectionGUID: G5/EtEOsSfi0tJD0nvjVlg==
X-CSE-MsgGUID: +OaXV/n7SsiNG0dQdfDp2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270113209"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:40:46 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v7 0/7] pm_pme support on display hotplug
Date: Mon, 14 Sep 2026 23:40:27 +0300
Message-ID: <20260914204034.309566-1-vinod.govindapillai@intel.com>
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

Vinod Govindapillai (7):
  drm/xe/pm: initialize the device's system wakeup capabilities
  drm/xe/pm: introduce PM PME support
  drm/xe/pm: avoid reclaim when arming PME wakeup
  drm/i915: add pme_enabled() to the parent interface
  drm/i915/xe: plug the pme_enabed implementation for xe
  drm/i915/irq: conditional HPD IRQ resets based on PME capability
  drm/i915/hotplug: avoid HPD polling if the device is PME capable

 .../gpu/drm/i915/display/intel_display_irq.c  | 19 +++++----
 .../gpu/drm/i915/display/intel_display_rpm.c  |  7 ++++
 .../gpu/drm/i915/display/intel_display_rpm.h  |  1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c  |  5 +++
 drivers/gpu/drm/xe/display/xe_display_rpm.c   |  6 +++
 drivers/gpu/drm/xe/xe_device_types.h          | 13 +++++++
 drivers/gpu/drm/xe/xe_pci.c                   | 26 ++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c                    | 39 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                    |  2 +
 include/drm/intel/display_parent_interface.h  |  1 +
 10 files changed, 111 insertions(+), 8 deletions(-)

-- 
2.43.0

