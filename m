Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD69C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DA010E401;
	Wed, 12 Aug 2026 12:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLJwyrv1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA43410E401
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538099; x=1818074099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tj9qX4NjTb3uz3XhIHmMcNCl2hWZeEyWWxNMTSrKOAY=;
 b=XLJwyrv14GrRhBx+jc1GY24sC+pWe3PUoEuhh9yxZZ0l1CY3GJj+X0Kw
 1UCrj8+CeysSHfZWFhr7JRroUrS7vYhgzq0sJDLXU/VYQyyOojRiL1/Td
 gJTjYgcdvOrBgCDhDxYay1Lvs52ujgGWJfhrFtRip+Z9F8pZeHexb5+ji
 Etn81+kn+HhfR+2EbxAq/aJU1yQQMZstJPBD42Xs/f85HQzOgoV0Z3tia
 0whx1VIpPv33r+SqwHnlHYgUZPUMzBBrKbdnFK+jU0/t6A3PqzbJ9d0aL
 6LdJ3aXm+CbCWJqO2XdOKIiZiQqEUWgb5sCrzYlPeiWLroc0ucPcpMaMw g==;
X-CSE-ConnectionGUID: BQPcxiHSTQeiaPluo7vX8w==
X-CSE-MsgGUID: msDdJ76sSWe0UhORxz9/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87304346"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87304346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:34:59 -0700
X-CSE-ConnectionGUID: bEkkkex9SM6gMWn7YNV1pg==
X-CSE-MsgGUID: sJIQsUMdRJScuR7mI2kvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="260322565"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2026 05:34:54 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 0/3] drm/xe: Adopt xe_log SIGID API for structured error
 reporting
Date: Wed, 12 Aug 2026 18:04:50 +0530
Message-ID: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
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
- PCODE
- System Controller (SYSCTRL)

v2:
- s/pcode/PCODE. (Michal)
- Drop PCODE in xe_log_err.
- Use -EOVERFLOW.
- Drop sysctrl in xe_log_err. (Michal)
- Drop redundant %pe.
- Print response->count.

Mallesh Koujalagi (3):
  drm/xe/log: DO NOT REVIEW
  drm/xe/pcode: Improve PCODE logging using xe_log helper
  drm/xe/sysctrl: Add better sysctrl error reporting

 Documentation/gpu/xe/index.rst          |   1 +
 Documentation/gpu/xe/xe_sigid.rst       |  14 ++
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/abi/xe_log_abi.h     | 198 +++++++++++++++++++++
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h   | 195 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_any.h             | 142 +++++++++++++++
 drivers/gpu/drm/xe/xe_log.c             | 221 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h             | 158 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c           |   9 +-
 drivers/gpu/drm/xe/xe_ras.c             |  11 ++
 drivers/gpu/drm/xe/xe_sysctrl_event.c   |  12 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c |  29 ++--
 12 files changed, 973 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_any.h
 create mode 100644 drivers/gpu/drm/xe/xe_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_log.h

-- 
2.48.1

