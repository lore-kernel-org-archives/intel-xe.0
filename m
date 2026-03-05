Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8D5F30946
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1053F10E282;
	Thu,  5 Mar 2026 12:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJWLJk35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B851110E278
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772712191; x=1804248191;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=ilTsJHX+3n7O9N3owuYC1a1NCmwl145eXT47A8Eg2+k=;
 b=HJWLJk35KTA4JzDMbj4daBWD3rBNa5XvW3MdFsyYHcPstga2Mk/mZF4r
 E7TKaqmlNMhYhY40DBVcNLqLUeTqZi94b84T8UMQJcZ8cuQUu7hTTrve5
 sHONojGA0XG32jfDyUKHTvn8p3YQIBJJ3P8KD9n+t2uEmVaxLUljLvvDd
 85QjuJ+154dmPjqLG41VG22zpvOe96xHNIxSY39/RmUWcalOCNM4ElrMJ
 gOFV+24gGyJM2CZ5LlvOlFd525rGJ2FY1wr/QX7+RCyNg/nmOKoOei7fy
 gnjfv+dQXkus0sNDmbLznikPsJNz37HMsWKquCNb1D01F1hYDNAh2mXpi w==;
X-CSE-ConnectionGUID: T8QhX/IXTA+ZBptDcoGtIQ==
X-CSE-MsgGUID: GG14D6nyRjS3uRVMBaDV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73702506"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73702506"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:09 -0800
X-CSE-ConnectionGUID: cwEmVhnWTOe+/OhdJzJFtQ==
X-CSE-MsgGUID: EbwyvRUhS1muAVBXFlduNA==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:08 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/7] Extra enabling patches for NVL-P
Date: Thu, 05 Mar 2026 09:02:27 -0300
Message-Id: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBAF0KvIrDuQxrS0XqW4GO1XB2QMiYgg3
 t3g8m3eQRlJkampDkrYNOtiBc9HRf0kNoL1X0ze+berXWDsaxK2bebIMOlmtZGjrP2EzOELCR9
 4F4YXlSImDLrf/a89zwtsOIOWbgAAAA==
X-Change-ID: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

This series contains some extra enabling patches for NVL-P.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Gustavo Sousa (7):
      drm/xe: Modify stepping info directly in xe_step_*_get()
      drm/xe: Drop unused IS_PLATFORM_STEP() and IS_SUBPLATFORM_STEP()
      drm/xe/nvlp: Read platform-level stepping info
      drm/xe/rtp: Add support for matching platform-level stepping
      drm/xe/nvlp: Implement Wa_14026539277
      drm/xe/xe3p: Drop Wa_16028780921
      drm/xe: Translate C-state "reset value" into RC6

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 ++--
 drivers/gpu/drm/xe/xe_device_types.h | 10 -----
 drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       |  8 ++++
 drivers/gpu/drm/xe/xe_pci.c          |  8 ++--
 drivers/gpu/drm/xe/xe_rtp.c          |  7 ++++
 drivers/gpu/drm/xe/xe_rtp.h          | 20 ++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h    |  1 +
 drivers/gpu/drm/xe/xe_step.c         | 74 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_step.h         | 10 +++--
 drivers/gpu/drm/xe/xe_step_types.h   |  1 +
 drivers/gpu/drm/xe/xe_wa.c           |  4 --
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 +
 13 files changed, 133 insertions(+), 47 deletions(-)
---
base-commit: e4b36c44f536abdf724e6a17700a47ce1631699f
change-id: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

