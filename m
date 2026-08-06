Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09F0C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 12:06:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B3210F1B2;
	Thu,  6 Aug 2026 12:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3Dv8Zax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E01510F1B2
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786018017; x=1817554017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a/l0H9iKu++0TKGsPqsrEfS8qvmDtZ5RjpdBq6hMcqM=;
 b=B3Dv8ZaxvS+hdyySuAfqSAxZShiazF5i+unoNE5UvH9hruWtQP0eR/lJ
 ZWAzGyD9UASQwq4q/F7+ge2u7qeTEPJMUw/xV0h4TzbQLmZsnwExIE3Hx
 XYq33LqThLAGKiCcWQMlOPOPk/rPpkSrvDjw2u88QnYDaTiZc9nhkKGGF
 WwPaSUF6T1F1habMU7Thmzw+HhtfClhzS/kXSxyo8Pli1ihsP4Qv7AGH4
 NAv38g/Agxeve2/UOXDqLrv0xHFNnYvcx/dujLI4ddLg2sNScXjcekeEJ
 pnydOdDH6jmSP4B2F7sRS+kgICHErRGZvyyfMFfIyqHvQ/mgAyJjUaswp g==;
X-CSE-ConnectionGUID: zirL0qWMSJuahjLuMNEKvg==
X-CSE-MsgGUID: 7Q9ZxVEASey4SCanHclm7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86459571"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86459571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 05:06:56 -0700
X-CSE-ConnectionGUID: Yck8J1QDSLKK7OYdNl2GjQ==
X-CSE-MsgGUID: 0DOU+kFAS3iobiGYW2V2CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="260826766"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 05:06:53 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 0/2] drm/xe/sysctrl: Add helpers to query application
Date: Thu,  6 Aug 2026 05:06:49 -0700
Message-ID: <20260806120650.2068636-4-anoop.c.vijay@intel.com>
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

