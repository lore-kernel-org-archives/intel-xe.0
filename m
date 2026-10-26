Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F397606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WE+q+NJt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0047510EA7C;
	Mon, 26 Oct 2026 06:05:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B9310EA7C
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 06:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792994713; x=1824530713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0e70kTejVQprzIzyoHKHVaV2WlCr/4BT6/50YyHNUmo=;
 b=WE+q+NJtEMdaiyuD3bQvxvi8Y+B1ybL24Z0vtMfczIXHhIj2JFhqNWUL
 xzhxPpgIfX3PAjbpR9HmrCBHXvARU8GmdCicwy+5ZlK4MLmnh1W2UvDMg
 0F8kaWwUAzg9ZDtHineXPxFZZpW0r4/gPWhxUEBNiTORHLdzexkMe5amd
 u5JkwHv/O59dGfz9WDVnZYKqPdqC49W117+BpjCqYbsaoTBHkucKBXmO2
 ld4ZFFQzNVC4/M68guprlmPyZ492rrPyXoIzrpnSMEurPR1WdOYEm3ATV
 DQaI0/fzSphr0PIjqQusvOXsTbSJ9qXOMcoU/IuQXutTyPQefBzShizqA g==;
X-CSE-ConnectionGUID: O5FeR9ddRoym5+C8RF7Ejg==
X-CSE-MsgGUID: Sf54BPjcRySh3FIz2VOm1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1531010"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1531010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:13 -0700
X-CSE-ConnectionGUID: DDQO51IfRfyuiPC0yTaMdA==
X-CSE-MsgGUID: hs5PF9zjTr6XDVO7OgAP6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4557298"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:05:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2 0/9] Handle non-fatal errors routed via IRQ
Date: Mon, 26 Oct 2026 11:34:59 +0530
Message-ID: <20261026060459.771448-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement wa_14028434957 to route non-fatal errors via IRQ and trigger
SBR for all fatal errors.

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
case firmware reports all pending errors — including non-fatal ones —
as a single response, since it maintains a single queue for all error
types. Skip handling of double-bit ECC errors in that case, since the
SBR already clears the offlined pages on reload and firmware drops them
from its queue once read, so offlining them here would be unnecessary
and could leave the queue and the soft-offlined pages list out of sync.

Rev2: Handle Race between AER
      Use WA number

Raag Jadav (1):
  drm/xe/hw_error: Initialize hw_error_work per tile

Riana Tauro (7):
  drm/xe/hw_error: Reuse CSC worker for generic error handling
  drm/xe/xe_hw_error: Handle non-fatal errors routed via direct IRQ
  drm/xe/ras: Treat non-fatal PCIe errors as recovered
  drm/xe/pci: Add upstream switch port lookup helper
  drm/xe/xe_ras: Disable hw error worker for uncorrectable internal AER
  drm/xe/xe_ras: Trigger SBR for all errors reported via AER
  drm/xe/ras: Skip double-bit ECC page offlining on AER path

Varun Gupta (1):
  drm/xe: Add wa_14028434957 to Graphics Version 35.11

 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_hw_error.c          | 69 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_hw_error.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c               | 23 ++++++++
 drivers/gpu/drm/xe/xe_pci.h               |  1 +
 drivers/gpu/drm/xe/xe_pci_error.c         | 33 +++++++++++
 drivers/gpu/drm/xe/xe_ras.c               | 72 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ras.h               |  1 +
 drivers/gpu/drm/xe/xe_ras_types.h         |  2 +
 drivers/gpu/drm/xe/xe_tile_types.h        |  6 +-
 10 files changed, 176 insertions(+), 33 deletions(-)

-- 
2.47.1

