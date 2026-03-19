Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E78310854D2
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 17:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22FF10E7DD;
	Thu, 19 Mar 2026 17:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKFGTchw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C079810E955
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773941468; x=1805477468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BUrZv37tUDyZhxQju4bbqtDXipVJBzwQpZZvDZt3kBA=;
 b=FKFGTchwJ3xCkDTfK5cxM97B2yiUcWV96SFuW2KdbQgPALi1fZmHNIxm
 kkwg+MLf4e9e+jtIkC293u5EFb8z7KoG2og90ZfZ+QR+TgQRkwEJm43Ff
 0ZUL+zD/mk4XT75RPZxhNHtQ2XIN1owyAH+9COoGoT5cfFHk8oSzcWxmv
 2Z1A7u98lRsYFzSw2pVaKVnKmnLrR3U+Lwny24a8BtWSCHe+1W2UI0Nyq
 3/IeR7oJ6OzXr9YYXMbi35X8uuuEjpby/EXAiRC2lTCLG7/E3MZ+CyTOT
 Lu3KUA+C6e4mea9uluX8P1rQAutDqYNnAzym8dPBFfY/H4AnK6A2+VX9M Q==;
X-CSE-ConnectionGUID: Oeh0q3IzRYi6k8sVHTVXpg==
X-CSE-MsgGUID: qf9SEWyIQQOR+PJhdKhrsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86385187"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="86385187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:31:08 -0700
X-CSE-ConnectionGUID: WpWAtgemR5ylHNLm+ASkXQ==
X-CSE-MsgGUID: PtxDz2rrQ5eHv1GXv5Gvvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="260925308"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:31:04 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v11 7/7] drm/xe/xe_pci: Enable System Controller support on
 CRI platform
Date: Thu, 19 Mar 2026 10:30:37 -0700
Message-ID: <20260319173031.1320708-16-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
References: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
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

