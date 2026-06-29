Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2EDC43327
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 08:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E522410E76B;
	Mon, 29 Jun 2026 08:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmGMR+EV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8694D10E76B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782721698; x=1814257698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AzYeJJcmyk0G2i+mfk2dtpPJQCxHUHk5jBmxJHHylbA=;
 b=VmGMR+EVGhAB4NXNc/eXifmQZ3YZ7lAUhEQJbc06P/hN5OxXuHWOixQT
 deifbIpGQNgQ3WCNsDYN0YcPtbvDBeK/ctUit5PBb01mxx+Daw4OTXkXv
 jZAH7nT9W80W6xSovCD8B0igmq7JXdqHkMNGE/QJKURqSSc0zUw+JEy8I
 pRrNDsyXqqom72BS8gWHQXsUUChth2QdlJ3Kj0n69Wx2fnHDHWt0Y22Ul
 ZlPbGBujBUMOJHQoiui/SzJ+X94L/LyZX1milOWZuXjZyHiKnTKy/XVLb
 BeywJjyAvlvmalp0cFg8YgHyVdfkjkmYfiZO/zfI8hXR6ANOaAxVzK5FZ g==;
X-CSE-ConnectionGUID: SwTjSdJ6RV2minjAsQI82A==
X-CSE-MsgGUID: +UrLOFIdQHOSKC5BhB3AXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="82398887"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="82398887"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 01:28:17 -0700
X-CSE-ConnectionGUID: TXCrhmteROqYhIQMAAdxNQ==
X-CSE-MsgGUID: NZBIrq5jQjSI8o4qYF1pCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="281980213"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 01:28:15 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v9 0/4] Add PCI error handlers to Xe
Date: Mon, 29 Jun 2026 13:58:02 +0530
Message-ID: <20260629082802.3690896-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

This series is split from [1] for CI.

This series adds PCI error handlers to Xe driver. It allows the
driver to detect errors, contain their impact and recover the device.

For Fatal errors, userspace access is blocked and device is queisced and
a Secondary Bus Reset (SBR) is requested from the PCI core.

For Non Fatal errors, the system controller is queried for error details
and appropriate recovery action will be taken based on error type.

After SBR, VRAM contents are lost. This patch adds a re-probe to
initialize the device fresh. This will be replaced by minimal
initialization once [2] is merged.

[1] https://lore.kernel.org/intel-xe/20260608084700.640376-17-riana.tauro@intel.com/
[2] https://lore.kernel.org/intel-xe/20260603101814.916948-1-raag.jadav@intel.com/

Riana Tauro (4):
  drm/xe/xe_pci_error: Implement PCI error recovery callbacks
  drm/xe/xe_pci_error: Group all devres to release them on PCIe slot
    reset
  drm/xe: Skip device access during PCI error recovery
  drm/xe/xe_ras: Initialize Uncorrectable AER Registers

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.h       |  15 ++++
 drivers/gpu/drm/xe/xe_device_types.h |   6 ++
 drivers/gpu/drm/xe/xe_gt.c           |  14 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c   |   9 +-
 drivers/gpu/drm/xe/xe_pci.c          |  10 +++
 drivers/gpu/drm/xe/xe_pci_error.c    | 122 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_error.h    |  13 +++
 drivers/gpu/drm/xe/xe_ras.c          |  70 ++++++++++++++-
 9 files changed, 251 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.h

-- 
2.47.1

