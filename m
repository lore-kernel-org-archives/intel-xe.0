Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFE0C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 05:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FFF10E063;
	Thu,  3 Sep 2026 05:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAsZZM9a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9E110E063
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 05:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788414386; x=1819950386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sfmtaSPtOy763TsCHy46Aquz037k4uJieglVdgIckKc=;
 b=EAsZZM9apsaHdJE3z1eY6t0vBVKjFWwYyITBlJKJurQICtnJaawhc4F1
 fvpHdFrkFTUVwzr5ChakNRVYa2MnziJ22n40J43bqKAxoXPdug57kw/rI
 UcdGG8ell3JZeEUjDAg3fw+5mTx/ajEFblW5i/k8FqXG6In9QD2vaJJIh
 b1RJHfn970cqiGM/lpuxTjY0J2es0bzcwTzdZ5jV+dgRs0RsnIfXzL+az
 8NAqwVEPiDudvbGquVatK20VmIsQN/23QzLxqKMSvziCNeYargXpwwvqj
 7WQe4x4Mio8gWjIY97W5ca58z7v8YZr5a106vxDrwnYge+ymfde06sekB w==;
X-CSE-ConnectionGUID: YkGDHXebTmCXmmdq9uiZjA==
X-CSE-MsgGUID: UzjIhb5kTVO4jD8SB4KbpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100398804"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100398804"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:46:26 -0700
X-CSE-ConnectionGUID: pql+OXcVQUmxXwkPn1PLgA==
X-CSE-MsgGUID: HTW4NlvsR4CNGMcXXRZ5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263446989"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:46:22 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v7 0/4] drm/xe: Report GT TDR and VM rebind faults using SIGID
Date: Thu,  3 Sep 2026 11:16:06 +0530
Message-ID: <20260903054610.3640788-1-arvind.yadav@intel.com>
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

This series is a small follow-up on top of the structured SIGID error
logging infrastructure series:

https://patchwork.freedesktop.org/series/171022/

That series adds SIGID-based error reporting and the xe_log_*() helpers.
This series converts selected GuC submission, SVM page-fault and GT reset
error paths to that logging path.

The VM rebind conversion from earlier revisions remains dropped.

v7:
 - Updated the GUCSUBMIT commit message.
 - Updated GuC submission wording.
 - Added a GRDOM_RESET_TIMEOUT_MS constant for GT reset timeout.

v6:
 - Moved GUCSUBMIT from DRIVER_FIRMWARE to DRIVER, since GuC submit
   is a driver submission component and not a firmware component.
   (Michal)
 - Updated the log message to print class/instance as %u:%u and
   reason as %#x. (Michal)

v5:
 - Dropped the GuC CGP protocol SIGID conversion, since malformed G2H
   handler errors are already reported by the CT layer after -EPROTO.
 - Added a GUCSUBMIT component mapped to XE_SIGID_GT_TDR and used it for
   the GuC submit reset failure.
 - Dropped "request" from the GuC submit reset failure message.
 - Kept the GT patch limited to the reset failure path.
 - Dropped GT PM-flow SIGID conversions for now, since the correct
   component/SIGID mapping needs agreement.
 - Improved the GT reset failure message to describe that full graphics
   reset did not complete.

v4:
 - Clarified that the GT component maps to XE_SIGID_GT_TDR and -EIO is
   only the errno value.
 - Split GuC CGP protocol error conversions into a separate patch.
 - Added terminal SVM page-fault allocation failures as MEM_FAULT reports.
 - Converted GT reset and power-flow failures to GT_TDR reports.
 - Kept the VM rebind conversion dropped.

v3:
 - Split GuC and VM changes into separate patches.
 - Dropped GuC job-timeout warning conversions to avoid changing warning
   logs into error-level SIGID reports.

v2:
 - Rebased on the latest structured SIGID logging series.
 - Switched from the old xe_ras_log_*() helpers to the new xe_log_*()
   helpers.

Arvind Yadav (4):
  drm/xe/log: Add GUCSUBMIT component
  drm/xe/guc: Report reset failure using SIGID
  drm/xe/svm: Report terminal page-fault failures using SIGID
  drm/xe/gt: Report GT reset failure using SIGID

 drivers/gpu/drm/xe/abi/xe_log_abi.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c          | 11 ++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.c  |  6 ++++--
 drivers/gpu/drm/xe/xe_svm.c         | 13 +++++++------
 4 files changed, 20 insertions(+), 11 deletions(-)

-- 
2.43.0

