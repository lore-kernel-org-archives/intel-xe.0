Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE7BC98313
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6D110E711;
	Thu, 24 Sep 2026 06:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myyvaCb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EB210E711
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790230155; x=1821766155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3ScV+EpdNrDBppxHwWiIhl6zdj4XTAa1m+1bT5dHi4o=;
 b=myyvaCb0b4jKjMVVaDdxagCq82/ShlkXlN9nSAWDxyFXIiO01wuB2WpV
 bEoP2+1jczig8nGs122ZtRqGFYiM17fjleM3DGqul8+vkSjeTgFX8LBGg
 3ry0By5MnGUeBs9V1CHW/thVVN9GM38S6bSLOp56ArcVVYfELmHmk6Fsr
 7ONvTZO0Kt83ly6LBLa+RQPCky0M3osJDTsm9DiYXHodOQTwgp7P7MW70
 tnH0hdlamv1Aw5zVYpajqKNnVbpDhOn3DgDP9pTNU//Uo1WgoNJNegr8K
 qSYmqBKKjOk3hVDEGs4FMh+Ok22uZHO7AytoyjqUgC2XhrbJUtHTkt1n7 g==;
X-CSE-ConnectionGUID: 8qPeqWidS16atCU7mmmvwQ==
X-CSE-MsgGUID: +6+gLQtgRqG/hkiMt4B72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90853953"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90853953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:09:14 -0700
X-CSE-ConnectionGUID: gZDqf4sWReqVHv8fL2oCPg==
X-CSE-MsgGUID: bT971m/ZRpW96eDGFFkdFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277096591"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:09:11 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v9 00/10] drm/xe/sysctrl: Clean up error handling in
Date: Thu, 24 Sep 2026 11:39:01 +0530
Message-ID: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
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

v8:
- Rebase.
- Rephrase commit message. (Michal)

v9:
- Update commit message. (Michal)
- Use fix tag. (Umesh)
- drop __packed.
- s/simplify/Fix/

Mallesh Koujalagi (10):
  drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_clear()
  drm/xe/sysctrl: Return error codes from sysctrl_wait_bit_set()
  drm/xe/sysctrl: Make sysctrl_write_frame() void
  drm/xe/sysctrl: Make sysctrl_read_frame() void
  drm/xe/sysctrl: Use xe_assert() for payload size validation
  drm/xe/sysctrl: Fix mailbox header handling
  drm/xe/sysctrl: Replace FIELD_GET() with REG_FIELD_GET()
  drm/xe/sysctrl: Improve firmware response error logging
  drm/xe/sysctrl: Log group and command ID on mailbox failure
  drm/xe/sysctrl: Report 'System Controller event' error using SIGID

 drivers/gpu/drm/xe/xe_sysctrl_event.c   |  14 +--
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 112 +++++++++++-------------
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |   6 +-
 3 files changed, 62 insertions(+), 70 deletions(-)

-- 
2.48.1

