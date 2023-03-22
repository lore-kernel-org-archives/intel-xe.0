Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3865AC74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 23:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E0110E41E;
	Wed, 22 Mar 2023 23:24:57 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A38D10E41D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 23:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679527494; x=1711063494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kumz/eAg0eXwnKZQ4YevrE3NoT0VToHbBBI/gB8ojy0=;
 b=jvOHcIT+HFsCdq9nkkkFzCGl3iYbaLTWRVeUhiVrhnLc3NmMZ+jB50al
 bf8vJlcG0ci88YQ++MswgVxCtwVvTcjTa2/v+6OfYHfEQgr2STiVvFji1
 qcabw/8A+z7ySUbK2tSe0veJJ2iF9wqxoQ/7MpVUwS06Madk8PjB8Mt7/
 tBHlErJ7mkvZFmGZDF5w9D+C20jyXzlh4nEq2zSLsll3mFIEekiOCFUlM
 xLGU8EtIYz0ypHBzczApvJSosT6WUQMvIc11FDKgrUbB7Fc8m+nklLA14
 5FGRHcyoF+9l8v5rNThI8ChaTLHp3f6KqOsF25V1cxPt9zaqxWLTqYYzo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="401922727"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="401922727"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 16:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632149525"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="632149525"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 16:24:54 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Mar 2023 16:28:11 -0700
Message-Id: <20230322232812.3624914-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322232812.3624914-1-anusha.srivatsa@intel.com>
References: <20230322232812.3624914-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Cleanup HuC Debugfs entries
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For platforms under force_probe protection, HuC minor version
can change. Debugfs entry shold clearly state the minimum version
required for the platform.

For platform not under force_probe protection driver need not
do a version checks for HUC.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  1 +
 drivers/gpu/drm/xe/xe_uc_fw.c        | 11 +++++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a02c4eb6bd0d..c87b65b3c447 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -99,6 +99,8 @@ struct xe_device {
 		bool has_link_copy_engine;
 		/** @enable_display: display enabled */
 		bool enable_display;
+		/** @require_force_probe: platform under force_probe protection */
+		bool require_force_probe;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct xe_device_display_info {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91fed9d3105e..2562e87160d6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -422,6 +422,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe->info.has_4tile = desc->has_4tile;
 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
 	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
+	xe->info.require_force_probe = desc->require_force_probe;
 
 	spd = subplatform_get(xe, desc);
 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 4ade5b1b6d31..b8452c91c170 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -441,10 +441,21 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 
 void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
 {
+	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	drm_printf(p, "%s firmware: %s\n",
 		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
 	drm_printf(p, "\tstatus: %s\n",
 		   xe_uc_fw_status_repr(uc_fw->status));
+	if (uc_fw->type == XE_UC_FW_TYPE_HUC) {
+		if (xe->info.require_force_probe)
+			drm_printf(p, "\tversion: minimum wanted %u.%u, found %u.%u\n",
+				   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
+				   uc_fw->major_ver_found, uc_fw->minor_ver_found);
+		else
+			drm_printf(p, "\tversion: found %u.%u\n",
+				   uc_fw->major_ver_found, uc_fw->minor_ver_found);
+	}
+
 	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
 		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
 		   uc_fw->major_ver_found, uc_fw->minor_ver_found);
-- 
2.25.1

