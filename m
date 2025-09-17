Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FBCCA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 06:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA06610E409;
	Wed, 17 Sep 2025 06:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LndzhMUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B57A10E408;
 Wed, 17 Sep 2025 06:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758091058; x=1789627058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rCNSRo5L4q3mRIi06lPtpb8bs0QvmXdOfIDYJEzqu40=;
 b=LndzhMUd45uv5Ojrk96H/fLH/2tQjHoUeaigNus0EBg7Ns7NjL9vVBHf
 T+BIVKE5WvjBNH+0007htDvt2cszeTHlVh1Iwyk9ahrG4VizXsZqlxaKI
 FH0XKQ+J4h7E7nBmgBVavzvMRfMoMcNRBERFqW8qwc/8B4aafP72wwg9a
 Ai8le7JEir9FLQlaGz2oP4PZDj9RlVUKCyVRV/NzDAZLsQW7hfCc5Xlzj
 Zmkc8QwkeqOM8RgSz++UGJVC9RjSwgQ384aoIX/JpkrIr1FysYofteuJq
 pAza7bs21YGL7R7jd9xRvAS6Y1BvHeHz+77RkyedOYpEI4qqnc6BCPzIe Q==;
X-CSE-ConnectionGUID: pAyVdGH2TK+jP+Go3trKEw==
X-CSE-MsgGUID: M3ptOV9kQgK1jOWfRtnWoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64204742"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="64204742"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 23:37:38 -0700
X-CSE-ConnectionGUID: MPhnDBk0R3G07VwyjjucjQ==
X-CSE-MsgGUID: JKcQjhPqRieTSipaZk62qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="179164360"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 23:37:36 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org,
	naresh.kumar.g@intel.com
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Date: Wed, 17 Sep 2025 12:07:26 +0530
Message-ID: <20250917063726.1093924-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915143331.3269895-2-naresh.kumar.g@intel.com>
References: <20250915143331.3269895-2-naresh.kumar.g@intel.com>
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

>Multi CCS mode can only be enabled when SRIOV is in PF mode with
>no VFs provisioned.
>Similarly, provisioning VFs is not allowed when Multi CCS mode is active.
>
>Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  7 ++++---
> drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 10 ++++++++++
> drivers/gpu/drm/xe/xe_pci_sriov.c   |  7 +++++++
> drivers/gpu/drm/xe/xe_sriov.h       | 12 ++++++++++++
> 4 files changed, 33 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index 50fffc9ebf62..39df801e9cd5 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -117,9 +117,10 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> 	u32 num_engines, num_slices;
> 	int ret;
> 
>-	if (IS_SRIOV(xe)) {
>-		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>-			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>+	if (IS_SRIOV_VF_ENABLED(xe)) {
>+		xe_gt_dbg(gt, "Can't change compute mode when running as %s / %s\n",
>+			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
>+			  "One or more VFs enabled");

Consider using the conditional (ternary) operator to differentiate 
between the two SR-IOV cases instead of hardcoding the second string.

> 		return -EOPNOTSUPP;
> 	}
> 
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>index f8779852cf0d..1a80a293daa2 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>@@ -20,5 +20,15 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
> 	return hweight32(CCS_MASK(gt)) > 1;
> }
> 
>+static inline bool xe_is_primary_gt_multi_ccs_enabled(struct xe_device *xe)
>+{
>+	/* multi CCS mode supported exclusively on GT0 */

%s:/multi/Multi

>+	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+
>+	return (gt->ccs_mode > 1);
>+}
>+
>+#define IS_PRIMARY_GT_MULTI_CCS_ENABLED(xe) xe_is_primary_gt_multi_ccs_enabled(xe)

Rename to IS_GT0_MULTI_CCS_ENABLED and xe_is_gt0_multi_ccs_enabled

>+
> #endif
> 
>diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>index af05db07162e..96e3fd51b8f5 100644
>--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>@@ -19,6 +19,7 @@
> #include "xe_sriov_pf.h"
> #include "xe_sriov_pf_helpers.h"
> #include "xe_sriov_printk.h"
>+#include "xe_gt_ccs_mode.h"
> 
> static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
> {
>@@ -153,6 +154,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
> 	xe_assert(xe, IS_SRIOV_PF(xe));
> 	xe_assert(xe, num_vfs > 0);
> 	xe_assert(xe, num_vfs <= total_vfs);
>+
>+	if (IS_PRIMARY_GT_MULTI_CCS_ENABLED(xe)) {
>+		xe_sriov_info(xe, "Can't change the number of VFs while multi-CCS mode is enabled.");

Use "Cannot enable VF's" instead of "Can't change number of VF's"

>+
>+		return -EOPNOTSUPP;
>+	}
> 	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
> 
> 	err = xe_sriov_pf_wait_ready(xe);
>diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
>index 6db45df55615..78019cee61fe 100644
>--- a/drivers/gpu/drm/xe/xe_sriov.h
>+++ b/drivers/gpu/drm/xe/xe_sriov.h
>@@ -36,6 +36,16 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
> 	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
> }
> 
>+static inline bool xe_device_is_vf_enabled(const struct xe_device *xe)
>+{
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+
>+	if (xe_device_is_sriov_vf(xe))
>+		return true;

Maybe remove this check since next return checks for provisioned VF's
and return true even when SRIOV-VF mode

>+
>+	return (pci_num_vf(pdev) > 0);
>+}
>+
> #ifdef CONFIG_PCI_IOV
> #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
> #else
>@@ -45,4 +55,6 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
> 
> #define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))
> 
>+#define IS_SRIOV_VF_ENABLED(xe) xe_device_is_vf_enabled(xe)
>+
> #endif

Thanks,
Varun
