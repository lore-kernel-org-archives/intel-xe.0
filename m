Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751E9606A32C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBbiOty2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0789910E78A;
	Tue,  3 Nov 2026 06:09:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C040B10E78A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686184; x=1825222184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b2aeGrufuUqB4oguEPm/nUw1AMqp6qgGoXLJKBiLzRk=;
 b=PBbiOty2sgN4746hVpkZxvHUeqvIsblKYonxmmrxoC7JsRXHdxYwMTj7
 X+xr1KiOqI2TT2THh2o8H+rgIZsmUXB/7U02W4fek2uhDZUwxioRyWAHl
 cqaxICG1ZEhYzr+G63mtidDZojdxv6MWMaIS9jWyW3toEXzNTlion4UZA
 piqB/Y843Y5H1mkEgSY+KStcdvBWedQvEPXKk/s9rYo7cNLIOYqP1FJAS
 cVSLHvmaA+CBIb6lRdaBKTRTrKTSahP8SCH3VQMXTbuY9emv9H/c2Y1Zc
 H7vwMlLflczNHum1JAzBa36ALw6DVAQIAvJeMraGS+8EdtBq3SiyNiyBQ g==;
X-CSE-ConnectionGUID: IX1qwOrnS2Csu1a8Re5cSQ==
X-CSE-MsgGUID: sHL6d2+1QWWui9HRk2fkLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2276698"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2276698"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:44 -0800
X-CSE-ConnectionGUID: h0Sb7B/JTY+15r1xKa3h6w==
X-CSE-MsgGUID: 1bK5gTwXQKKx7rvJUIFW4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6446333"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:09:41 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v3 0/7] Handle non-fatal errors routed via IRQ
Date: Tue,  3 Nov 2026 11:39:30 +0530
Message-ID: <20261103060929.1586783-9-riana.tauro@intel.com>
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

Raag Jadav (1):
  drm/xe/hw_error: Reuse CSC worker for generic error handling

Riana Tauro (6):
  drm/xe/hw_error: Initialize hw_error_work per tile
  drm/xe/ras: Treat non-fatal PCIe errors as recovered
  drm/xe/pci: Add upstream switch port lookup helper
  drm/xe/xe_ras: Add a flag for uncorrectable internal error
  drm/xe: Add support for wa_14028434957
  drm/xe/xe_ras: Skip double-bit ECC page offlining on AER path

 drivers/gpu/drm/xe/xe_device.c            |  3 +
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_hw_error.c          | 64 +++++++++++++++---
 drivers/gpu/drm/xe/xe_hw_error.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c               | 23 +++++++
 drivers/gpu/drm/xe/xe_pci.h               |  1 +
 drivers/gpu/drm/xe/xe_pci_error.c         | 36 +++++++++++
 drivers/gpu/drm/xe/xe_ras.c               | 79 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_ras.h               |  2 +
 drivers/gpu/drm/xe/xe_ras_types.h         |  2 +
 drivers/gpu/drm/xe/xe_tile_types.h        |  4 +-
 11 files changed, 184 insertions(+), 32 deletions(-)

-- 
2.47.1

