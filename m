Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B485FD4F19
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 18:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B73810E2CF;
	Tue, 10 Mar 2026 18:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llE/Kc84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC93D10E789
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773167049; x=1804703049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b76ZgRv7UAIK9GwVPyyP1J0jj4H6dYD5y32oOvccN70=;
 b=llE/Kc84YkTMkaF1+q7ZfvYIUkofjPgJ0ZkuWYKfvOCMMqmwM5Xjw7PW
 XYmrQXTft0jUUok8iM3C679VraDNHWtI9cNzeD9bFmmPO9fuH+F8r5XQ0
 lssZPBpSezYB3etMxLXiJMmpvRaT+lBr7kWQabjoKYxMS9s9q9uFkmTO7
 rpeR4D8fo3V9ShSaYYud0X60v2CeIYeAxCYCj2qtiQ1OAdoDi6hZd9SUX
 DiOA6OgMGzM6+8jt09S3KaVx06wwMALE7azSn0em/jhBmRb/TCIZqnECH
 UNN6zAdDSXeJgQpOhY8Z4uI6lhSx1M3UC5BvazphUnGONiINaPD+uNTzy w==;
X-CSE-ConnectionGUID: 8nsimCELSDivrhXJXDoa/w==
X-CSE-MsgGUID: CmnLTGT5Q5+pYujaWisp/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78109845"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="78109845"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 11:24:08 -0700
X-CSE-ConnectionGUID: q3iAgBKtR2WctgJ2cIi/Bw==
X-CSE-MsgGUID: vJfxWUafQ8yNTO6SfC7LSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="258127645"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 11:24:05 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v9 6/6] drm/xe/pci: Enable System Controller for CRI platform
Date: Tue, 10 Mar 2026 11:23:25 -0700
Message-ID: <20260310182336.611041-14-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310182336.611041-8-anoop.c.vijay@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
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
v8: (Matt, Michal)
- Reordered patches for logical flow
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 29f976e66848..3d4a6619315f 100644
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

