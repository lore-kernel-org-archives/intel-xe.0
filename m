Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9C7D29C2A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 13:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912E710E45E;
	Mon, 19 Jan 2026 13:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZ8eQNUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4388B10E44C
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768829421; x=1800365421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DsS3F4FYzMNIACzRBynRFS1+f0FebWJ41XHZCWvHpFg=;
 b=gZ8eQNUAFeMt8cLQfSuPuAbBQvOL/sEIIRvqDRrfcIytH1IzU9OOr52c
 R3jVM0EbOVtVX89S/UY4Lal9Oj50P49YNEsZZ5hbF7mWukhzgRef/Uodn
 1uJIqMmnwa27Tp5WR3knqqHejC9hHOQb/nXC82Nf15/G6gquRiraA24XA
 Kl+MZzYXVPvvjjZZ5DFs9nJG3AnM0Vrvu8nF4KYzfs6fFLInv6GJSHUZV
 RPchcI32Rkb3s42LZw+GMTgHoGABZhh+VqjvOc3Sqj8wT9a/qDeEec4/s
 6m8hzmHFwD4P4tvK/EB//WZSNxzbfaAuQ+c6YVCEy7AaprUqWCIxR7y3y w==;
X-CSE-ConnectionGUID: RRzy5DBYRqG38A5P2LmAQg==
X-CSE-MsgGUID: h0or3y6CQBqDTJLvMv6l7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70202373"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="70202373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:30:19 -0800
X-CSE-ConnectionGUID: KOkrYfvvRlOqyLsSEwG5Hw==
X-CSE-MsgGUID: KduJcV3GQH2HLmgL8pz44A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205659297"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:30:15 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v4 6/6] drm/xe/sysctrl: Enable System Controller for Xe3p
Date: Mon, 19 Jan 2026 05:29:43 -0800
Message-ID: <20260119132938.2173032-14-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119132938.2173032-8-anoop.c.vijay@intel.com>
References: <20260119132938.2173032-8-anoop.c.vijay@intel.com>
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

Add PCI device detection for System Controller capability
and update build system to include System Controller
components.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/Makefile       | 2 ++
 drivers/gpu/drm/xe/xe_pci.c       | 2 ++
 drivers/gpu/drm/xe/xe_pci_types.h | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 2b20c79d7ec9..947fbcac65d5 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -121,6 +121,8 @@ xe-y += xe_bb.o \
 	xe_step.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
+	xe_sysctrl.o \
+	xe_sysctrl_mailbox.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_tlb_inval.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91e0553a8163..b6dc3030b673 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
+	.has_sysctrl = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
 	.va_bits = 57,
@@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5f20f56571d1..53e44a32883d 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -56,6 +56,7 @@ struct xe_device_desc {
 	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
+	u8 has_sysctrl:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
-- 
2.43.0

