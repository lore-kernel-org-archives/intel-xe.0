Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742A3C79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2981310E215;
	Mon,  7 Sep 2026 10:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRSXeXdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154410E215
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788778409; x=1820314409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D/jtxOPcBY4Lzs1RXFqBLWv+FlNgGEZ2i+MjRYUPv3g=;
 b=HRSXeXdX9gkhUy05xnCBUYfXcBNXtLU9pdRi5hhB8LYOh3UGycWlT6QW
 LgMP6V3kNN9DF/I+61NWEdTvPU4IYDaz1mMDmI8S2jTg4QVWlyGeLuGiz
 1QTW4d9D7CdbirrcR2oj4aTjOKvlrDoO1Kba5p5gfo8Y5RWh8/ThIhZbF
 cQ+HjRJi1Whhvwi7qQbUIJqTvrEWuc7R3usoh4fYN6p8j9cws5AjG201M
 mZI664od/QpS+X4NOgzTj9POjuLliZSGnaZDBAgyzQw29jzZjGZxmWcdE
 5AvaoAcpzQtoEf+KnDRUZv2A7Jw+x12MNazLOpwhPrYKWTy4Um6bNaHim g==;
X-CSE-ConnectionGUID: j80t+KYCQh69lPwlwzPIbg==
X-CSE-MsgGUID: 0Ker828rQMChDGkYHmhBwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89024489"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89024489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:53:28 -0700
X-CSE-ConnectionGUID: RU/qAGGCRberxflw32SHdA==
X-CSE-MsgGUID: tQdy38ymTJSJmoalYMEwlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308908358"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:53:24 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 0/9] drm/xe/sysctrl: Clean up error handling in
Date: Mon,  7 Sep 2026 16:23:14 +0530
Message-ID: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
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

v6:
- Move REG_FIELD_GET to different patch. (Michal)
- Update response message.
- Move all REG_FIELD_GET to single patch.
- Update log message. (Michal)
- Change correct errno. (Michal)

v7:
- Update FIELD_PREP to REG_FIELD_PREP. (Michal/Sashiko)
- Update FIELD_GET to REG_FIELD_GET.
- Remove le32_to_cpu. (Michal)

Mallesh Koujalagi (9):
  drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_clear()
  drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_set()
  drm/xe/sysctrl: Make sysctrl_write_frame() void
  drm/xe/sysctrl: Make sysctrl_read_frame() void
  drm/xe/sysctrl: Use xe_assert() for payload size validation
  drm/xe/sysctrl: Replace FIELD_GET() with REG_FIELD_GET()
  drm/xe/sysctrl: Improve firmware response error logging
  drm/xe/sysctrl: Log group and command ID on mailbox failure
  drm/xe/sysctrl: Report 'System Controller event' error using SIGID

 drivers/gpu/drm/xe/xe_sysctrl_event.c   |  14 +--
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 108 +++++++++++-------------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |   6 +-
 3 files changed, 60 insertions(+), 68 deletions(-)

-- 
2.48.1

