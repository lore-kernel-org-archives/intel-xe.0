Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0092FD2F33E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D2910E514;
	Tue, 13 Jan 2026 16:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jd5VZrQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EBF89EFF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768321931; x=1799857931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9wb6BEv+oTSxpC6jeqFljfkBQ+JtoAg778D+FBmjxI=;
 b=jd5VZrQlqUf+COinUer5pOK2SxavxTfzBKWAi6TKKSJdZHgo9GTUWjxg
 2p8ar/FJbM+2o8qsPj8sfa3XT3mjYryFsk0oP0/dE5HWhjTX2SgaBHdC8
 t0q4hjjlhd61rMT9E4TvLcwVQdAbU6ChBiBEXqHW55cGg5XKkS36MPQGJ
 cZmT5z/8nQAp+A9BMY0u3hfmDQZPWj62bMuqo+xrA4t059eXhQKSOhbFz
 tL49kMHtH0/9aNoXzIEJxKB+kbUyL6kaHZNfzeAhtCfwCRHep82putdKz
 lE3/KwlEtp3GDUcrV8oavMoBuFJyVw9mEUm0ufbKbAvlHNYbQrRS4oqCe Q==;
X-CSE-ConnectionGUID: /tGoqisXSSGYtFyYC7KA0A==
X-CSE-MsgGUID: j2mF4HwHRY+94AwbXoWwYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69521014"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69521014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:11 -0800
X-CSE-ConnectionGUID: 7MjBiNBsRZKE5kdPrv+/6g==
X-CSE-MsgGUID: IuXDXYwySCSP6v83orJVQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204060125"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:07 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com, matthew.auld@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com
Subject: [PATCH v6 03/12] drm/xe/vrsr: Introduce flag has_vrsr
Date: Tue, 13 Jan 2026 22:12:04 +0530
Message-ID: <20260113164200.1151788-17-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113164200.1151788-14-badal.nilawar@intel.com>
References: <20260113164200.1151788-14-badal.nilawar@intel.com>
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

Introduce flag has_vrsr to determine if platform supports VRSR feature

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
---
V2: Rebased
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f689766adcb1..a7e9d981618c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -363,6 +363,8 @@ struct xe_device {
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
+		/** @info.has_vrsr: Has capability to enter into VRAM self refresh */
+		u8 has_vrsr:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
 		u8 has_64bit_timestamp:1;
 		/** @info.is_dgfx: is discrete device */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5c705124270e..5c14e1978a72 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -375,6 +375,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_soc_remapper_telem = true,
 	.has_sriov = true,
 	.has_mem_copy_instr = true,
+	.has_vrsr = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -706,6 +707,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
+	xe->info.has_vrsr = desc->has_vrsr;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 20acc5349ee6..d9c490a68043 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -57,6 +57,7 @@ struct xe_device_desc {
 	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
+	u8 has_vrsr:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
-- 
2.52.0

