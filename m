Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DD5C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 09:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ACA10E10B;
	Fri, 14 Aug 2026 09:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0P/kmh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0806110E10B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786701193; x=1818237193;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YP1jRjQJkkRzKS/3uz+MtWoNAqOFsXkEn32oV3dE5vw=;
 b=G0P/kmh9eCvTXwjD1lU5nmll1ggNA9ILPcXmROW6BQypIAoGLaw11Xa7
 ijQEF6X0R91pGSEOXIpTrSFzhajGzRsC3/XFbuvaA2k3aPAZkb8CaXSSC
 jG9prdEbUn5JcXONE914hUmKubLN35BcVzVq0RUZaUIBc+cSjF1zXV5ur
 YmXzxyw7CwpmewyTaDUF20GmRWIke8jkfhg2KL9a8k/cTXSXwxIUpHp1d
 nPzoXJ1ITOfocmTE6ae+7rRtl9lbcNEdQeHDgd9ouX3lXfNXKA8+FRbjj
 pU89n5OqwhvhTGNOxNsT2wN0t5W7T2W3+fyCWFPTHpYfrbtleN4vuGAfH A==;
X-CSE-ConnectionGUID: twLN+3erSwKmZzOrH2Qxsw==
X-CSE-MsgGUID: BKZP6vEeRSaNd0n1YBwv+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74815243"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="74815243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:53:12 -0700
X-CSE-ConnectionGUID: iPFlhy1NQban64wGDO9JOw==
X-CSE-MsgGUID: vE49HOq3QwSSNqryMXHT6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="268037156"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:53:08 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v7 0/2] drm/xe/sysctrl: Add helper to query application status
Date: Fri, 14 Aug 2026 02:53:05 -0700
Message-ID: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
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
Initial consumers of these wrappers are added in the following series.
- https://patchwork.freedesktop.org/series/171728/
- https://patchwork.freedesktop.org/series/161655/

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

v7: (Umesh)
- Clarify diag/oCode firmware readiness helper comments for platforms
  without System Controller support
- Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id out of
  xe_sysctrl_mailbox_types.h into xe_sysctrl.c
---

Anoop Vijay (2):
  drm/xe/sysctrl: Add helper to query application status
  drm/xe/sysctrl: Add helper to check oCode firmware readiness

 drivers/gpu/drm/xe/xe_sysctrl.c               | 103 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  47 ++++++++
 3 files changed, 152 insertions(+)

-- 
2.43.0

