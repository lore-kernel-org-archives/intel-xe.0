Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17633C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D1F10E20A;
	Tue, 25 Aug 2026 17:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7w8gXDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AF310E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679751; x=1819215751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zn8qLh7W+HfLmNL/wh35tfiwpqhm7FddkOJMoLzvfbY=;
 b=R7w8gXDABc3T3VcmyWrfvvSjFo+1xYByrD+/yCZBY92BC/sDXumjpgnp
 q8ZAFGVeU3n0IRnPEXFC2VoHmHktJqfasaKwWdtVVWunthQrHzvbh6Vhb
 J1rD3gEhZ9NZS0JS9Qa51f4ex7uaQBswE+GNK3W+ZeQ+NpMJBgzQqrLWn
 SB0zR6DgDB/65pqxzd5l01/QBBdR5Wz9kS0JaD5i7vocO5eTJIJE+MBRc
 wzbNnMeQfyq6yvbmdo7XOl66rCNEJcEEXxck7srnoARAitnzgt/0Iv1/1
 WwhcUP+nFRXZMhfE9SinpuESFwXB2oJgmUEyveE8iFZhsC4QEaAW2b0Pw Q==;
X-CSE-ConnectionGUID: 6pwTy1sRRLKNrgW5STS1Cg==
X-CSE-MsgGUID: 1Lq2pK/aRfGZv863ldX56g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210805"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:30 -0700
X-CSE-ConnectionGUID: 7xFJRwPkSU2dU4z3bvTuKQ==
X-CSE-MsgGUID: e0nnIwvXRtWCS1kw4DTZAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585060"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:27 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 00/11] Add CPER logging support for CRI
Date: Tue, 25 Aug 2026 23:29:17 +0530
Message-ID: <20260825175916.1103841-13-badal.nilawar@intel.com>
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

v2:
   - Extended CPER logging to Uncorrectable errors and xe_ras_get_counter
     request
   - Log CPER records via xe_log SIGID infra 

Badal Nilawar (11):
  drm/xe/xe_ras: Add support to retrieve info queue data for CRI
  drm/xe/xe_ras: Refactor get_counter() to return response structure
  drm/xe/cper: Add CPER structures and trace event
  drm/xe/cper: APIs to prepare and log CPER record
  drm/xe/cper: Prepare Intel CPER error info from info queue
  drm/xe/cper: Log CPER records for aggregate counter retrival
  drm/xe/cper: Allow hardware error CPER reporting from xe_log
  drm/xe/ras: Report device memory errors using SIGID
  drm/xe/ras: Report core compute errors using SIGID
  drm/xe/ras: Report soc internal errors using SIGID
  drm/xe/ras: Report correctable errors using SIGID

 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/regs/xe_regs.h             |   2 +
 drivers/gpu/drm/xe/xe_cper.c                  | 184 +++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  34 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 186 +++++++
 drivers/gpu/drm/xe/xe_log.c                   |  17 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 506 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_ras.h                   |   4 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  66 +++
 12 files changed, 1093 insertions(+), 39 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.54.0

