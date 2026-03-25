Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ED5106B50C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 12:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF3810E897;
	Wed, 25 Mar 2026 12:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIqaDYXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7741510E89A
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774440063; x=1805976063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BUrZv37tUDyZhxQju4bbqtDXipVJBzwQpZZvDZt3kBA=;
 b=oIqaDYXbw67gGEQU0T4C1Mw9y/201oe0TNRJlIahBoUiS05TxRKtt0md
 A79e6//5spytpQDmo9ude6J55cQTfyu5lxBZapxoGu9J1ajZSW4k27tiF
 yD+RD4M3ZuL/h0fYokxlnlmbj3gli7hs+KutfiJeJenCcU5jMDQnf7YkE
 IDtprhRmAszKDTknK4IQgbch8VAUGui22Y9PDDpV/nZOzUFxLQ8BNVQgH
 BXsqJlgm/OP0A9G7USUAgRfFUNB5wbSP2ro5M4cbktL9/QFMrBDLBrXVX
 O80rOGQ9KgiTWsp2Uk6pMAY528e3+ZIEV2Weh7Taan5LLoQztg8cGz8xO w==;
X-CSE-ConnectionGUID: ynQdgVL7SE2SxY1e+tKatA==
X-CSE-MsgGUID: mP0zCB6jTVGrQMfa9vIT1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="98094677"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="98094677"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:01:02 -0700
X-CSE-ConnectionGUID: MZDqCusOSU6zgAkClUc+cg==
X-CSE-MsgGUID: W2pmmpfOTaOT+h+Kb9EkuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="218087363"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:00:59 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v12 7/7] drm/xe/xe_pci: Enable System Controller support on
 CRI platform
Date: Wed, 25 Mar 2026 05:00:34 -0700
Message-ID: <20260325120030.510480-16-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325120030.510480-9-anoop.c.vijay@intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
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

Enable System Controller support on CRI by setting has_sysctrl capability
flag in device descriptor and runtime device information.

This allows sysctrl subsystem and mailbox communication to be initialized
on CRI platforms.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v8: (Matt, Michal)
- Reordered patches for logical flow

v10: (Riana)
- Cleaned up commit message
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 189e2a1c29f9..f5dd77b6680f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -465,6 +465,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
+	.has_sysctrl = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
@@ -764,6 +765,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
-- 
2.43.0

