Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAE6D58E78
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 08:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FA910E453;
	Mon,  2 Mar 2026 08:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAddvzyz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33B210E453
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772439032; x=1803975032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=01ftsjKomkAFDjS2mKl2zVdfIFEMiGVqv4f0CyODgds=;
 b=OAddvzyz/S/7xxrO6Dig/ZCGAsqNYUKqn+PgGIzGVKitOp5PdtYepV/h
 g9oH+LDfsoTXWJ8WN+TcGvB3ZbSXXMlSacaVBotf5HXGnMNCFGKn5VaCk
 RZgcYHlDTUr0s8mtnWrLLDw/Ah72ft25wmzUqf9Ds33XA+ZGzy6bNtfvO
 50mVXKwo+TuTY+t2uNnUDP69LdCUn8bkxQWJKReiAsKc68sfZkDP5q7Ra
 QRosvmCObvd6uiMeN1zuniVOPTBkWMhOrdHB6+dPV2ammiCgJq7a3GQgi
 simCC11wrZ9c6tZTFCW2lmmJ7QcnxdpRBXyfFIvGrkNaltu+lE5LcKUkC A==;
X-CSE-ConnectionGUID: /mqJN0sMSIOhTFjpetZHTg==
X-CSE-MsgGUID: ftfMgD65STa2FFzkD0hnBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84790355"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84790355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:10:32 -0800
X-CSE-ConnectionGUID: N3CvwOttTC2TlrlICYBHVA==
X-CSE-MsgGUID: OFQcqrTASRSetFbVmPgFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="214079217"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 00:10:28 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v8 6/6] drm/xe/pci: Enable System Controller for CRI platform
Date: Mon,  2 Mar 2026 00:10:08 -0800
Message-ID: <20260302081002.3275868-14-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
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

Enable System Controller support for CRI platform by setting
has_sysctrl flag in device descriptor and runtime device info.

This allows the System Controller subsystem and mailbox communication
to be initialized on CRI platform.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v8 (Matt, Michal):
- Reordered patches for logical flow
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3ac99472d6dd..ad1e5ef2ee89 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -462,6 +462,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
+	.has_sysctrl = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
@@ -761,6 +762,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_sysctrl = desc->has_sysctrl;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
-- 
2.43.0

