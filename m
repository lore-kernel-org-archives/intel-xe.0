Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B553CCF9EE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 08:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DC210EACC;
	Fri, 31 Oct 2025 08:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHz/yEQm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB67910EAC8
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897963; x=1793433963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sxttd+QJoWvPp9k00WWBkqGofA8nAIMTVlc8Pw1k6Rg=;
 b=kHz/yEQmPaQOWSmiflNt3YqqjygqEv9jD29dWtIGoQIMfK7kLXUc6Gn0
 6OR1IPM6UfANcHrlKfXD9fpfie+DiQOpkk6v0Z/RLbSyoWTVM/JKQa7CE
 uZRiNpf+WP0colJIDIz4VQdcpV2BI1ygS38N4Sdj54shjfLB8PyosoSQI
 8MOSU89PSJseASQHh63C2QyDxujnzZPeCoe9J5RHXBajPNYnDpe7SyyPf
 ofbmBuGjBCz9f79OznzhUCswc9faSz7HkTdRf59piIYT+/jpP0zuKllVe
 1W1h0jAsa8B1t3Wspf35wZ7VD2naph85p41XcfBPyAcSj2dkftXMl2JKq w==;
X-CSE-ConnectionGUID: D1ZpfoO0S22zKUEDckH9+w==
X-CSE-MsgGUID: tGToes7ZRCal7+GCWi0Uhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74729832"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="74729832"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:41 -0700
X-CSE-ConnectionGUID: 4tdWPjnrTci6d2feTHifqA==
X-CSE-MsgGUID: tLoZ0amBSv+1v0UXPN/4JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186506616"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:40 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 0/4] PF: Add support for MERT
Date: Fri, 31 Oct 2025 09:04:57 +0100
Message-Id: <20251031080501.844-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

The MERT subsystem manages memory accesses between host and device. On
the  Crescent Island platform, it requires direct management by the
driver.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (4):
  drm/xe: Add device flag to indicate standalone MERT
  drm/xe/pf: Configure LMTT in MERT
  drm/xe/pf: Add TLB invalidation support for MERT
  drm/xe/pf: Handle MERT catastrophic errors

 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h  |  1 +
 drivers/gpu/drm/xe/regs/xe_mert_regs.h | 21 +++++++
 drivers/gpu/drm/xe/xe_device.h         |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h   |  6 ++
 drivers/gpu/drm/xe/xe_irq.c            |  2 +
 drivers/gpu/drm/xe/xe_lmtt.c           | 25 +++++++-
 drivers/gpu/drm/xe/xe_mert.c           | 82 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mert.h           | 32 ++++++++++
 drivers/gpu/drm/xe/xe_pci.c            |  2 +
 drivers/gpu/drm/xe/xe_pci_types.h      |  1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c       |  4 ++
 12 files changed, 179 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mert_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_mert.c
 create mode 100644 drivers/gpu/drm/xe/xe_mert.h

-- 
2.40.0

