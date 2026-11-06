Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11213606A332
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CFUkDYch
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD5810E8CE;
	Fri,  6 Nov 2026 07:20:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2D410E3CD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793949606; x=1825485606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=083AcC2/adpUKwhQuSoeIbT8odn2L1aZ0QnbcJCaKeo=;
 b=CFUkDYchdnneF9y1bNkZ1vXyHrNeikkOj8M02mUF2vbr42O39yFoj2Ud
 vaNBeAftLq2NM51fN3NYfkMpuLu1dwgMFUv6mv7XVtJiIVILI5kEMEXI8
 Mfxt3/P8P2pqA/JBABgy/ZMQdYoVlgOu3xCWqrZwhgMbkO24/t1UayrzS
 36/vWO3x0KGBOPV91PIWtWtJukEQtWMvLco7C/5ECzU1Ncf2QsZWNQydJ
 dkyBJUMGSf1t9AZZUyW3D3V1opMhiuPzpOnmb/O7bO8a7UBf/+xWDaUl3
 6PqXd9KpRj/h0XPGk3JTFt9hpV8mglGBxE5aO7EIOWqRiGW6p1WQaAuiV A==;
X-CSE-ConnectionGUID: 18KWXjDXRPCurDzVLBEyWA==
X-CSE-MsgGUID: N9PZf8PjRViVFhjIxdh/8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2659318"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2659318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:05 -0800
X-CSE-ConnectionGUID: khtJ3Wb4S8ubq8hdRdJTPQ==
X-CSE-MsgGUID: 51UtMA9sQ3mGRXh8mgW3LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7548948"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:20:02 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: [PATCH v4 0/8] Handle non-fatal errors routed via IRQ
Date: Fri,  6 Nov 2026 12:49:45 +0530
Message-ID: <20261106071944.2693854-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement wa_14028434957 on platform CRI

Process, log and recover non-fatal errors routed via direct IRQ.
Double-bit ECC errors are also reported as non-fatal errors. Process and 
offline pages for user bos. Critical Bo's require a SBR to recover.
Wedge the device with bus reset.

Race Case Handling:

There is a potential race between errors reported via AER that require
an SBR (Secondary Bus Reset) and non-fatal errors still being processed
by the worker. Since a reset is imminent once AER reports such an
error, the worker processing non-fatal errors is flushed and disabled.

There is also a possibility of the AER handler running first, in which
case firmware reports all pending errors including non-fatal ones as a
single response, since it maintains a single queue for all error types. 
Skip handling of double-bit ECC errors in that case, since the SBR already
clears the offlined pages on reload and firmware drops them from its queue
once read, so offlining them here would be unnecessary and could leave the 
queue and the soft-offlined pages list out of sync.

Rev2: Handle Race between AER
      Use WA number

Rev3: Reorder patches to fix sashiko comments
      squash all WA patches
      remove delayed worker

Rev4: fix survivability issue on unload
      disable worker before wedged check

Raag Jadav (2):
  drm/xe/hw_error: Reuse CSC worker for generic error handling
  drm/xe/hw_error: Initialize hw_error_work per tile

Riana Tauro (6):
  drm/xe/survivability: Guard runtime survivability enable against
    unbind
  drm/xe/ras: Treat non-fatal PCIe errors as recovered
  drm/xe/pci: Add upstream switch port lookup helper
  drm/xe/xe_ras: Add a flag for uncorrectable internal error
  drm/xe: Add support for wa_14028434957
  drm/xe/xe_ras: Skip double-bit ECC page offlining on AER path

 drivers/gpu/drm/xe/xe_device_wa_oob.rules  |  1 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 65 +++++++++++++++---
 drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
 drivers/gpu/drm/xe/xe_pci.c                | 23 +++++++
 drivers/gpu/drm/xe/xe_pci.h                |  1 +
 drivers/gpu/drm/xe/xe_pci_error.c          | 43 +++++++++++-
 drivers/gpu/drm/xe/xe_ras.c                | 78 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_ras.h                |  2 +
 drivers/gpu/drm/xe/xe_ras_types.h          |  2 +
 drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++
 drivers/gpu/drm/xe/xe_tile_types.h         |  4 +-
 11 files changed, 196 insertions(+), 34 deletions(-)

-- 
2.47.1

