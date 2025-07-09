Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00687C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 22:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B99910E2B7;
	Wed,  9 Jul 2025 22:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSsktI0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABF910E0E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752099369; x=1783635369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M9tHGPJY7SfO6kyx2CtkckqRDiq/sKvzmiik4oFNBuI=;
 b=JSsktI0PITorkBhZaU9yny2RRwA4z++7giP6ZpvIP0ROcnpiBYPhgJfu
 tM4NfdJksznjnZu0cT04fMJY8G680bK6bugC+okDlkHki5lOBuPH+lOa1
 /ZlsPaPktngqmE1ysfo3hd2M1Bvif2dhMgUg3zgMVVfb5b4s8ugUOM4S/
 0Fcqnt9B8UKYlA6Yd7diZ/DtBVi76dXnxQSELXE0BCak7ESPxasrpeptL
 LboSaAgZTk9MLRLXNlU3Mk1CX+KGAy18LrPb0LkCae7Qz+5gRdUb2S3Mp
 ILAjvp2w/PJqv02CbzKxfiiqIgNbikNHXnDUqdKh45eH1HEU1dZMMHC7f Q==;
X-CSE-ConnectionGUID: Df6cn3reRUeTknmSxX8nGw==
X-CSE-MsgGUID: GrfcNeqnT/2nQ5oBxfwUsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54518053"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54518053"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:08 -0700
X-CSE-ConnectionGUID: y4P+VmQGQGyUzZJcl3HT0g==
X-CSE-MsgGUID: wLuKmvLWSOq3a3p15/Vg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="193096130"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:08 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v6 0/6] Create and use XE_DEVICE_WA infrastructure
Date: Wed,  9 Jul 2025 15:15:59 -0700
Message-ID: <20250709221605.172516-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
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

There is currently no way to apply and track workarounds that are needed
ahead of GT init. This series adds a bit field to the xe_device
structure similar to those in the GT structures to apply and track
workarounds applied at runtime (oobs).

Device workarounds in this new infrastructure are tracked in sysfs in a
new workarounds file.

Currently 15015404425 is the only workaround like this, so move it to
using this new infrastructure.

Wa_15015404425 is also needed for PTL A step compute dies. Implement two
workarounds. A device Wa_15015404425 oob workaround that applies for mmio
access before GMDID is available. A GT workaround Wa_15015404425_disbale
that disables the device Wa_15015404425 when it is not needed.

v2: Change naming from SoC to device, address styling issues, update
commit messages.
v3: rebase
v4: Fix compile issues
v5: rework xe_gen_wa_oob.c to be more versatile, move device oob init
into device_probe early, move xe_device new fields into a structure for
wa_active. Rename to xe_*_wa to xe_wa_* functions. Put the check to
XE_DEVICE_WA into 1 place (mmio_flush_pending_writes). Create a disable
macro, fix incidental bit clobbering. Reword explanation around PTL
Compute die A-step explanation in commit message.
v6: split xe_gen_wa_oob changes from Makefile, style nits, catch some
safe checks in RTP, make the implementation of Wa_15015404425 1 patch

Matt Atwood (6):
  drm/xe: prepare xe_gen_wa_oob to be multi-use
  drm/xe: add xe_device_wa infrastructure
  drm/xe: add new type to RTP context
  drm/xe: Add infrastructure for Device OOB workarounds
  drm/xe: Move Wa_15015404425 to use the new XE_DEVICE_WA macro
  drm/xe: extend Wa_15015404425 to apply to PTL

 drivers/gpu/drm/xe/Makefile               |  9 +++-
 drivers/gpu/drm/xe/xe_debugfs.c           | 20 ++++++++
 drivers/gpu/drm/xe/xe_device.c            |  8 ++++
 drivers/gpu/drm/xe/xe_device_types.h      | 12 +++++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 45 +++++++++++++++---
 drivers/gpu/drm/xe/xe_mmio.c              |  8 ++--
 drivers/gpu/drm/xe/xe_rtp.c               | 32 +++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h               |  3 +-
 drivers/gpu/drm/xe/xe_rtp_types.h         |  2 +
 drivers/gpu/drm/xe/xe_wa.c                | 58 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h                | 22 ++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  2 +
 13 files changed, 208 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules

-- 
2.49.0

