Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A192BC5AC79
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 11:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3445210E097;
	Thu,  6 Aug 2026 11:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwwB4D07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFD610E097
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786014050; x=1817550050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7nNIe8uuefu9YooOklMeSzCDm/9bBJd7e9OiFrqIeI0=;
 b=dwwB4D07l4XZ+tI1H5BJ94XziphgFq8VJubtsQQTURRwcG0wwzI0iVSU
 lV143vP4LfMTg85HuReE0CKvX3tTkUBWqJB4uWVFVBiljRnBsV+Q9lRUQ
 wAoQd/+Nn3ZwYArygFTEWjnLemUoRBpm5bJnMi2kCb/UdHRxHgxXSyfvu
 CHbENNl6uSXmQfwrqa0YcMFk8zautHTwSyxdUAaC+HBLgbevoAWS8Vqes
 CIZYyVKEQu+YajN+RuGC4ErxnjXO4qnulapQG1qVBNpQZiLp5q27reY+c
 JN44iit1592GaKMzGWzzY1fKlE1jGT0o5yeTJFLulJyGGj4wdxwXnMHgs g==;
X-CSE-ConnectionGUID: sKPp+MlyTdmWkz9m/sf0Fw==
X-CSE-MsgGUID: QDGuQkRbQDia1baWtZmpqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86614748"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86614748"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:00:49 -0700
X-CSE-ConnectionGUID: 0ZCeOjYlSbiAJELV/mwbhw==
X-CSE-MsgGUID: iNp4vqwQQkCc9SdMUFHqiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="259453598"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2026 04:00:45 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 0/4] drm/xe: Adopt xe_log SIGID API for structured error
 reporting 
Date: Thu,  6 Aug 2026 16:30:40 +0530
Message-ID: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series updates error logging in the Xe driver to use the new
xe_log SIGID API introduced in:

https://patchwork.freedesktop.org/series/171022/

The xe_log API provides stable and machine-readable error IDs (SIGIDs),
making it easier for monitoring and fleet tools to identify and track
known issues without relying on log message text matching.

This series converts existing drm_err()/xe_err() calls in the following
areas:
- Probe path
- PCODE
- System Controller (SYSCTRL)

Dnyaneshwar Bhadane (1):
  drm/xe: Use xe_log SIGID API for probe-path error reporting

Mallesh Koujalagi (3):
  drm/xe/log: DO NOT REVIEW
  drm/xe/pcode: Improve pcode timeout logging
  drm/xe/sysctrl: Add better sysctrl error reporting

 Documentation/gpu/xe/index.rst          |   1 +
 Documentation/gpu/xe/xe_sigid.rst       |  14 ++
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/abi/xe_log_abi.h     | 198 +++++++++++++++++++++
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h   | 195 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_any.h             | 142 +++++++++++++++
 drivers/gpu/drm/xe/xe_device.c          |   6 +-
 drivers/gpu/drm/xe/xe_hwmon.c           |   4 +-
 drivers/gpu/drm/xe/xe_irq.c             |   9 +-
 drivers/gpu/drm/xe/xe_log.c             | 221 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h             | 158 +++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.c            |   5 +-
 drivers/gpu/drm/xe/xe_pat.c             |   6 +-
 drivers/gpu/drm/xe/xe_pci.c             |  14 +-
 drivers/gpu/drm/xe/xe_pcode.c           |   9 +-
 drivers/gpu/drm/xe/xe_ras.c             |  11 ++
 drivers/gpu/drm/xe/xe_sysctrl_event.c   |  11 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c |  29 ++--
 drivers/gpu/drm/xe/xe_vram.c            |   5 +-
 19 files changed, 1003 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_any.h
 create mode 100644 drivers/gpu/drm/xe/xe_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_log.h

-- 
2.48.1

