Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE0FC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BFE10E195;
	Mon, 31 Aug 2026 10:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsTseZX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BF210E195
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788173110; x=1819709110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xViDNEz+qXqtZ7UevX+xh4u2lh5P8trgQ8+P8goQEt8=;
 b=HsTseZX0VF6/wujQqyUF12cZC9QxpXU4l68oL08nut6WU5jvldJCjVtK
 9fwl5XRwW8iAJhb7ISLSGeOFbt3QlQQuIqxYC1+oktVAObtbfqgFqdLwz
 FGKJ6zyb6m1sLSQlNi+pJZFQlH6hwik5IisY85TLTnqtcd2zaEkYv4BJ9
 ZMzokPUg3QmgRfxbWITfWF25wEgrFl01LJWRgvoWDnFSToD17TEdZaIhd
 pYcSlrcauTKxNlsVgN3bc1a65ruFH2rj0YtHBwSi5OUYmGPhQnWi16xPh
 epBwJ4Ze+hlPZHA3o04Hg/YsOB/moPdD0EWtTCc8dlR2VSryP/3f38eUJ Q==;
X-CSE-ConnectionGUID: vLyLM4ZgSXerhzJI6m7QYg==
X-CSE-MsgGUID: W8rvAYZ8SrimaW/Xvhh9UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92264614"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92264614"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:45:09 -0700
X-CSE-ConnectionGUID: VLCRUZgnTXKlRL/UjBYgWw==
X-CSE-MsgGUID: t4TRwsHSTuy7DUlug0w8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270685391"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2026 03:45:04 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6 0/9] drm/xe/sysctrl: Clean up error handling in
Date: Mon, 31 Aug 2026 16:14:57 +0530
Message-ID: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
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

 drivers/gpu/drm/xe/xe_sysctrl_event.c   | 14 ++--
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 96 +++++++++++--------------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  6 +-
 3 files changed, 54 insertions(+), 62 deletions(-)

-- 
2.48.1

