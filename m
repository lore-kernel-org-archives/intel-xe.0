Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7907AD3568D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 08:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3643910E629;
	Wed, 28 Jan 2026 08:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5mqMqWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3935810E628
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769588103; x=1801124103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jpg1oiMmSWD3L3PyvlA00J8MGyatipNp8LFLW62CwZA=;
 b=f5mqMqWkKWpNuRsbXCH/KlUhLbz+hYfuIXFev4ymYsL/l7P3ZuTdrbzD
 +z+cuXy4E9o/C3e7mEjbLQUcnqBhdK47HVUx4Q23wIdt97ZWgU7GY+aB6
 XoLkPDFcZ0v6MmVDfr+v1SqQMeYbCX911ADV7vXPir8yPm4JzxA8HT30h
 hKX6/lONwQu/z68pscPvcpCg68FiT3HJZXz0jf60CkCNrQy+prma4Pklf
 PqnrHjw4FhVmvd+WIJ3MIih/BopkFePb3W8IPIC8+IbGbwHAbgt5MaV3i
 LCXC7dkecYETn3RiQCpRN3yJ7y2lAPYsKZxK+DRt1tEFILMgeGldNIU82 w==;
X-CSE-ConnectionGUID: nmEnU25RRg+f2hls2uCNCw==
X-CSE-MsgGUID: cVWQPChlSouECEQLDxerxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74643536"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74643536"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:32 -0800
X-CSE-ConnectionGUID: msbC7RsCTmGHux3DRB3PBQ==
X-CSE-MsgGUID: Rq88crFvQx+trMfkz9GNFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231156845"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:29 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 6/6] drm/xe/sysctrl: Enable System Controller for Xe3p
Date: Wed, 28 Jan 2026 00:14:08 -0800
Message-ID: <20260128081403.3138456-14-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

