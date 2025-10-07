Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E3DCCD18F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EF610E708;
	Tue,  7 Oct 2025 20:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsQd+NfZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6841C10E39A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870131; x=1791406131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=++5qDce4SkX7DTt8tfcjYhfYG03QnLHIhhnZnnPpRXE=;
 b=WsQd+NfZEjzw05yZMzXLD+mFVguF6IM9FxiKa2bXjcALi3kOhrGs0wnZ
 IczR1179fECF1dgRYR6cLwdZdjXdnJwwcq3EGHhThlExNL5lpDCDfqWyO
 iRkQ8HOv9qctK6YogUyE0GnhrGJ7J5cc+0fy4AHlno8lrETyPf//7NGI/
 3AgYFucAekrcxE8JBSDlaDxFTnzDIdhfWjfsRkKeQl91T/fz790mOnV5U
 D09e+Y/WsKjX3Cc7l810hBZOSlPPLlXyBkdE1BWN61EbE9diVxxu2h2xH
 2FZSxx84dF99UZIqHgMlfdhvyClQtlxd71YAKg8hpwZ78ZcWEnwdQyAN4 g==;
X-CSE-ConnectionGUID: FJiT04ohSeqKxRMPPbfDbA==
X-CSE-MsgGUID: qXv3VaLiTKCPZVNiThfvTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616763"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616763"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: 3PpTU3LqR8iLqvaS6qGR+g==
X-CSE-MsgGUID: bluXMHv4SkKH6yAITbnMgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631127"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 23/23] drm/xe/sriov: Disable SR-IOV if primary GT is
 disabled via configfs
Date: Tue,  7 Oct 2025 13:48:53 -0700
Message-ID: <20251007204829.1468209-48-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

SR-IOV operation relies on the primary GT's GuC to operate (in both PF
and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
If the primary GT is disabled in PF mode, force the device back to
native (non-sriov) mode.

v2:
 - Move handling to xe_info_init().  (Michal)

v3:
 - Just update the .has_sriov flag in xe_info_init_early().  (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9c8ab2b41737..202894deba0e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -628,7 +628,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_pxp = desc->has_pxp;
-	xe->info.has_sriov = desc->has_sriov;
+	/* SR-IOV depends on the primary GT's GuC; disable is primary GT is disabled */
+	xe->info.has_sriov = desc->has_sriov && xe_configfs_primary_gt_supported(xe);
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
-- 
2.51.0

