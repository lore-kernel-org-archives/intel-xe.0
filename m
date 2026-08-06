Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A70CC55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 12:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F9A10F1B2;
	Thu,  6 Aug 2026 12:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CO1rG1p8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F21892F6
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786018177; x=1817554177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a/l0H9iKu++0TKGsPqsrEfS8qvmDtZ5RjpdBq6hMcqM=;
 b=CO1rG1p8Ci27DCthHMNR9ipdsILSGeTnat1zuPdBmXHwNriCGV6Qk+Df
 z32YNHGmFWw77w1Wx+dGEnKrEc3J/yAY40NHPzXVRvEDYTk7W9p16Knro
 u/8bufbq48yoH83Y+eFTqpoCQNfdYJ9Ne/Ty2GqFGGGp4kpkV9bKja5vv
 TpJyG2Iqzz0xKvzAvYNjkBpzNHktt/4wyYGuKWcA2UBD63nLC8gsJYIUI
 kZZWCLogcHGtmttyrQOQGuSQjJAy2vd7Sko22XTgjJxcIF6ursg1xT7tX
 4dkAJPtiILUY6eFCdzEgdBXXgQ+/AaTIZ63iZsdRsGFZvL7Ned7LWsuFd g==;
X-CSE-ConnectionGUID: iKm/o6RwTNaVQpUcQt+WeQ==
X-CSE-MsgGUID: VegRZk3RQYiFX0akMoWZWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96961489"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="96961489"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 05:09:37 -0700
X-CSE-ConnectionGUID: Qd0Cdh/ZQESN3SbC18pWzQ==
X-CSE-MsgGUID: cCdS0OS4SzmZ9biT472HdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="260320982"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 05:09:32 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 0/2] drm/xe/sysctrl: Add helper to query application status
Date: Thu,  6 Aug 2026 05:09:30 -0700
Message-ID: <20260806120930.2072613-4-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

This series adds helpers to query the readiness state of individual
System Controller (sysctrl) firmware applications via the
get_app_status_by_id mailbox command.

xe_sysctrl_check_app_status() maps an xe_sysctrl_app_id to its firmware
application identifier and returns the reported application state:
not supported, communication failure, booted, or fully initialized.

Convenience wrappers are added on top of this helper to check
readiness of the Diagnostics (diag) and oCode firmware applications.
The initial consumers of these wrappers are added in the series
https://patchwork.freedesktop.org/series/171728/

---
v2: (Badal)
- Return SysCtrl firmware application states instead of errno for
  application lifecycle conditions

v3: (Riana, Badal)
- Replace string-based app identifiers with enum xe_sysctrl_app_id
- Use get_app_status_by_id (opcode 0x05)
- Move mailbox definitions to xe_sysctrl_mailbox_types.h
- Return enum xe_sysctrl_fw_status consistently
- Map communication failures to COMM_FAILURE
- Add INITIALIZED state and status helpers
- Fix Diagnostics typo

v4: (Anshuman)
- Make xe_sysctrl_check_app_status() internal
- Remove unused app identifier

v5: (Anshuman)
- Rename OOBMSM status helper to use xe_sysctrl_* prefix
- Remove xe_is_diag_fw_ready() helper

v6: (Riana)
- Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
  header packing
- Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
- Use hex constant for application ID
- Split oCode application readiness helper into its own patch
- Add xe_sysctrl_is_diag_fw_ready() helper; consumer lands in the RAS
  error-injection series
---

Anoop Vijay (2):
  drm/xe/sysctrl: Add helper to query application status
  drm/xe/sysctrl: Add helper to check oCode firmware readiness

 drivers/gpu/drm/xe/xe_sysctrl.c               | 82 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  2 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 65 +++++++++++++++
 3 files changed, 149 insertions(+)

-- 
2.43.0

