Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E33606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 06:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BE/URG+r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9ED10E4F8;
	Thu, 12 Nov 2026 06:07:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D2910E4C1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794463635; x=1825999635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fz1dnuyRdASHsRZQV5cpiMPZTXGB2B0hD6cIWHrOXsc=;
 b=BE/URG+r23dognDdRYy9pBZo5EqVgwpxrm5gDulqBVAYDdUv7RdlXKpr
 wOSMHPZ5sysYMi0JlqYaTco0u2qi2W+GbePV6/caOV0C22YJJleU0mrN9
 aZ/1BwS1wWsVWFdvfwSQVpnoGNsl+wBCbXwIw26RCXL5+IRNIMji9vbma
 kkE2a6ip8eeEbY2uwlJHJ85RNPHtPkCnQ8HgifFspn+Vbvqm/59oi9G1O
 +PFIUEh0EeHq/uwkoe232ggjmpzI5WuimSrMpV/jPGH3V9C3YDkVRoZ7Y
 YZPajVMOFjYVROpVEJWUmNAv00vZOAmI2ojGs/NtFVbUS6OGk+y3xzEC2 w==;
X-CSE-ConnectionGUID: 5ossC7/OSgmELXh0CnAIGQ==
X-CSE-MsgGUID: xS3ycrN/Tvm2WY8x2+1l6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3264990"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3264990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:14 -0800
X-CSE-ConnectionGUID: 2fCp1zGuSteC18l14ufHtQ==
X-CSE-MsgGUID: ZGKuz5ScRr2NIk+LSmj7tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8576173"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:11 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v5 0/8] Handle non-fatal errors routed via IRQ
Date: Thu, 12 Nov 2026 11:37:02 +0530
Message-ID: <20261112060701.3327125-10-riana.tauro@intel.com>
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

Rev5: move dgfx and sriov check
      fix typo
      fix checkpatch

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

