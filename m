Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A570DC61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F86610E132;
	Tue, 25 Aug 2026 11:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ES+fP7e8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11F810E132
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787655955; x=1819191955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JWAiRgo9+HimKN4pu6RFBjuj9oG8JLOSj1nXW9rxs2g=;
 b=ES+fP7e8bjIGUxb3fJqsPEyZbq5vturGl4QMg98YayLpppeQmLE209F9
 u6yEIp+AZgR7fUUDlzFxFhrMrlqAzWeEZZtitNAJuhWBnTOUPYYjJas6z
 LCFTgN8DIZoXRo4rik5C5PIr22yOpW48mLbQNpFCOo3nlFg50+ysQHooJ
 kgTYiEdh4QSWfLfemtRZeaOQcL98KE7PlllxluQvcoMHvtCEfuFflLmwV
 +Oyfs2PcElN9ewPc7BPHSrcAJFzqPOj5oUonqHsC9SzIFAHBilefTqGrg
 n8pxfrEz11p378RnlpuSDPTWoC3j87TeG3EZkSm2aeuOY3WgPwMeWhYBo g==;
X-CSE-ConnectionGUID: tFuHAJxARf+gTj9kZXPvhg==
X-CSE-MsgGUID: nDN2s3jMT66mdtpraW+wtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88248235"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88248235"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 04:05:54 -0700
X-CSE-ConnectionGUID: BCnzYnp5Q3+Il0VYD8Vafw==
X-CSE-MsgGUID: NoWBxorFRMG8INrkNx1q1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="261131335"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 04:05:50 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 0/7] drm/xe/sysctrl: Clean up error handling in
Date: Tue, 25 Aug 2026 16:35:43 +0530
Message-ID: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
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

The patch series improves error handling in the System Controller mailbox
driver by making error propagation more consistent and using
xe_log_err() for structured error reporting.

It also removes a few redundant checks and simplifies helper
interfaces where no error path exists.

v2:
- Use -EOVERFLOW.
- Drop sysctrl in xe_log_err. (Michal)
- Drop redundant %pe.
- Print response->count.

v3:
- Rebase.

v4:
- Replace xe_warn to xe_log_err_info for. (Michal)
- Use xe_assert().
- Change sysctrl_wait_bit_* to return errno.
- Make sysctrl_write_frame return type as void.
- Log mismatched header info.

v5:
- Fix align issue. (Michal)
- Use %#x after REG_FIELD_GET change.
- Use REG_FIELD_GET instead of FIELD_GET.
- Modify logging message.
- Change Error as EXFULL. 
- Update logging message.

Mallesh Koujalagi (7):
  drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_clear()
  drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_set()
  drm/xe/sysctrl: Make sysctrl_write_frame() void
  drm/xe/sysctrl: Use xe_assert() for payload size validation
  drm/xe/sysctrl: Improve firmware response error logging
  drm/xe/sysctrl: Log group and command ID on mailbox failure
  drm/xe/sysctrl: Report 'System Controller event' error using SIGID

 drivers/gpu/drm/xe/xe_sysctrl_event.c   | 14 ++--
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 88 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  6 +-
 3 files changed, 53 insertions(+), 55 deletions(-)

-- 
2.48.1

