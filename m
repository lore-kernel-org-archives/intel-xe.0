Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6612C5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 10:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6980810EFC1;
	Thu, 20 Aug 2026 10:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmKQvbMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4510EFB9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787221003; x=1818757003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=81dcz80qDYkyYu7UfpXO7R7cJXuiH0N4DUgca9mlFVg=;
 b=UmKQvbMv7frXHA2RLYaNxcGhB/cy0RStprdWyPlTF6yL8yyCfazNk3Gz
 05v353Iu2cTY6GtEWih6Km5GE+442Rnp4kAYUJcv+LtE+s3VEaANLBUhz
 QioUjqUSCJIw9FxOc02ARkB9XiCi2n/q6wIi5J7W5jpFcRvu+xT/n29eY
 NzarafAeOxNWB+/1uBSOutYpRI1gkDpt3yi5ISRJCy/ZkEp3Ce3MU4L/D
 8fk0aYJfEYCVX0soEAYmHB53bjiIuk/7MO6+aBt0zVfp9p0cx7ceW0MtX
 2bi5zKqgPKwEWPAlMmMRuxCGHOq6h+5h6lGrf86yG7u1Rg5DbAjm7OD2O w==;
X-CSE-ConnectionGUID: jn/2pOJLRzmEZr8vGH7Odg==
X-CSE-MsgGUID: V7NoCl4AQwOOsCBwx7juDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113290920"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="113290920"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:16:43 -0700
X-CSE-ConnectionGUID: F8KiZM3nRYile4jlcymzfg==
X-CSE-MsgGUID: y0JTiRMQT9GYfcm0GyxryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="271176379"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 20 Aug 2026 03:16:39 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 0/7] drm/xe/sysctrl: Clean up error handling in
Date: Thu, 20 Aug 2026 15:46:33 +0530
Message-ID: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
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

Mallesh Koujalagi (7):
  drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_clear()
  drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_set()
  drm/xe/sysctrl: Make sysctrl_write_frame() void
  drm/xe/sysctrl: Use xe_assert() for payload size validation
  drm/xe/sysctrl: Improve firmware response error logging
  drm/xe/sysctrl: Log group and command ID on mailbox failure
  drm/xe/sysctrl: Report 'System Controller event' error using SIGID

 drivers/gpu/drm/xe/xe_sysctrl_event.c   | 14 +++--
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 76 ++++++++++++-------------
 2 files changed, 44 insertions(+), 46 deletions(-)

-- 
2.48.1

