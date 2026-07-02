Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D450EC43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A18110F2CA;
	Thu,  2 Jul 2026 11:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hni3zYdo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EE210F2CA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782990170; x=1814526170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J1KLRBw8szRqUHWdHzXUcqlT6UrvHkrYYKENzionbCM=;
 b=hni3zYdoRRBL6mF4f+pd/qpnF8OUoaG5ZvxB/bLVEzibYz7rCEfyyFf3
 JjjpbzOJVVH6U52dkpgIJZ9aXpV5t853FjAdhpGk9zxO7aGbAuudwSggi
 zrg8xXP0GYYJWZEqfxnMBxqyc49CILBg0ziZt7XPjiurfg0jjd6+us0eG
 Dye7L/MAmQYy4htW6/oZqeKtau3zwbUiky2CKq3WHD6zuMDH1a53Audyi
 pslLp3Sc9yApvT/3CKuTYWbLC0ddlMIbaEzxxUv/erZxaUCK6AqmDhkLY
 UmEzJgIJLppCbnD0Dmwac3BkRJAL/zctMZlNRC8v8LxZztd9tgvqXQ6s3 w==;
X-CSE-ConnectionGUID: 1T8JXQdqQji1jWhVSuLLAQ==
X-CSE-MsgGUID: XUpizLLNQNutUH/1C2z9yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82852875"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82852875"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:02:49 -0700
X-CSE-ConnectionGUID: +fEBGQPyQLCk1v9yU6HQVA==
X-CSE-MsgGUID: x/MCWK59Q0qpU+6KHHu/YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256738700"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:02:46 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [RFC PATCH 0/7] Add CPER logging support for CRI
Date: Thu,  2 Jul 2026 16:44:02 +0530
Message-ID: <20260702111401.3680214-9-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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

This patch series adds CPER (Common Platform Error Record) logging support
for Correctable errors reported by Intel Xe GPUs. CPER logging is done
through trace event.

In subsequent patches will add CPER logging support for Un-correctable errors.

Do not review patch "drm/xe: Add error Signature IDs for RAS logging" as
it is part of https://patchwork.freedesktop.org/series/168333/ 

Badal Nilawar (6):
  drm/xe/xe_ras: Add support to retrieve info queue data for CRI
  drm/xe/xe_ras: Refactor get_counter() to return response structure
  drm/xe/cper: Add CPER structures and trace event
  drm/xe/cper: APIs to prepare and log CPER record
  drm/xe/cper: Prepare Intel CPER error info from info queue
  drm/xe/cper: Log CPER record for correctable errors

Mallesh Koujalagi (1):
  drm/xe: Add error Signature IDs for RAS logging

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_cper.c                  | 215 ++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  30 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 186 ++++++++++++
 drivers/gpu/drm/xe/xe_ras.c                   | 272 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras_types.h             | 122 +++++++-
 drivers/gpu/drm/xe/xe_sig_ids.h               |  29 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 +++++
 10 files changed, 921 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.54.0

