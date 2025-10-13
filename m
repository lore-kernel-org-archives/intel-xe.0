Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E1CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696A10E500;
	Mon, 13 Oct 2025 20:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Epxr6ias";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B9310E50E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386204; x=1791922204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnt8Et+EjAKua9xTem38cv2pxb3N0srlXnupKztS0q8=;
 b=Epxr6ias82To8vkpl36pTnvcugtCN/lr0nB63TwWCQxS6uNwZO07gYuY
 4aXAGkvofO3Mapgpw6DMbNlxMnkRA83yCmPY3gSaycjzaZJqF/dci79kh
 RKTtenjkQRzu/PIVZPaoPO4zVguEhBQCOp5vGumxBeUTOuliCmuly0aL7
 bJu2MOBD8YcGVA7cO6glLuHTAops18nd+KBwPjjZ+3bvfKFnR1SB3u6qm
 L5yArN2AlsE7iyuT8ep6n+HEXiBggduJMR0+T3sZK8NqeGfOU8QbUCJ2q
 HRb70NuC2ZbEpbYwzvQbYultXlU8qdziuNWSsovu0T9rzjgwmP0q+a4ir Q==;
X-CSE-ConnectionGUID: ea+aWUNaSWu4ypYNH905ww==
X-CSE-MsgGUID: rSA1jQ9MT/yMBLnlj4MuOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800563"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:04 -0700
X-CSE-ConnectionGUID: 5sc/fa86SHCQSoTuURnFfw==
X-CSE-MsgGUID: GEecWqfqSQe7bC7eC2KGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707638"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 23/23] drm/xe/sriov: Disable SR-IOV if primary GT is
 disabled via configfs
Date: Mon, 13 Oct 2025 13:10:06 -0700
Message-ID: <20251013200944.2499947-48-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

v4:
 - Drop unnecessary comment.  (Michal)
 - Flip condition order for consistency with other checks.  (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ef559a79c5ba..24a38904bb50 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -631,7 +631,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_pxp = desc->has_pxp;
-	xe->info.has_sriov = desc->has_sriov;
+	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
+		desc->has_sriov;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
-- 
2.51.0

