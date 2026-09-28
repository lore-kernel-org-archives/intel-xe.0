Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2937C9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866C010E909;
	Mon, 28 Sep 2026 09:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qi1q62xS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D328D10E840
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587449; x=1822123449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fAP03bffW9GaPF3/1Z3gTULUE2SRvBof2/83xsoDWcs=;
 b=Qi1q62xSC2mmHzT2xoLtBKwXgVwUaqYJ59X2O1jR7tY2v+alLDeeqU5j
 qY5eHhuwoWJDTU1BEcaXJ+gNxr+9IYwNDXGWUjt2fWhKf038R97Igm/XJ
 HJmsULv2BnqnvrJUW5To4yQcR2cepfQ5ejptsdp19uOIzvX8kBdAa8D6U
 L8QtSoWi65rPWA7VDe67G7gctIe8TMRrWrdY/pNnHrP8sgH7WWB0PALAj
 WmilBC3bBXLndbmkgPcSlIh4PTm44ibaI5AtFyXMdBOJBMm3O21PRG3iU
 vamZED7pMrjsH3cJpV1mxRg47v1pVGaDQWX0F3tOO56ZGlLXeW3X26Bmg A==;
X-CSE-ConnectionGUID: +r2zjQdRT5y89PBiosx0+Q==
X-CSE-MsgGUID: iLnNpJs5TSKsU+YISmmGlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845481"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78845481"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:20 -0700
X-CSE-ConnectionGUID: vHu45mXRQ8Oqk/JZHDaJ3w==
X-CSE-MsgGUID: r2cmj88WTgyqZXEp+E+bfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283078037"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:21:27 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 07/12] drm/xe/pat: Return error from xe_pat_init_early() on
 unknown platform
Date: Mon, 28 Sep 2026 14:51:09 +0530
Message-ID: <20260928092114.1610203-8-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
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

xe_pat_init_early() currently only logs an error when the platform's
graphics version doesn't match any known PAT table, but continues
probing with an uninitialized pat.ops. This can lead to a NULL
pointer dereference later when pat.ops is used.

Change xe_pat_init_early() to return an int and propagate -ENODATA
to xe_device_probe() so the driver fails to load cleanly instead of
continuing in a broken state.

Fixes: 152d7f2db978 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
v2:
 - Update kernel-doc for xe_pat_init_early. (Michal)
---
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_pat.c    | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_pat.h    |  4 +++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 44975e7823be..327f018fe15e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -879,7 +879,9 @@ int xe_device_probe(struct xe_device *xe)
 	int err;
 	u8 id;
 
-	xe_pat_init_early(xe);
+	err = xe_pat_init_early(xe);
+	if (err)
+		return err;
 
 	err = xe_sriov_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a5fe1beec652..519f7d5a2765 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -590,7 +590,13 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
 	.entry_dump = xe3p_xpc_pat_entry_dump,
 };
 
-void xe_pat_init_early(struct xe_device *xe)
+/**
+ * xe_pat_init_early() - Init early pat table operation.
+ * @xe: the &xe_device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_pat_init_early(struct xe_device *xe)
 {
 	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
 	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
@@ -686,14 +692,19 @@ void xe_pat_init_early(struct xe_device *xe)
 		 * raise an error rather than trying to silently inherit the
 		 * most recent platform's behavior.
 		 */
+
 		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		return -ENODATA;
+
 	}
 
+	xe_assert(xe, xe->pat.ops);
 	xe_assert(xe, xe->pat.ops->dump);
 	xe_assert(xe, xe->pat.ops->program_graphics);
 	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
 	xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
+	return 0;
 }
 
 void xe_pat_init(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 7060f66e1d63..6398c3ab4805 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -42,8 +42,10 @@ struct xe_pat_table_entry {
 /**
  * xe_pat_init_early - SW initialization, setting up data based on device
  * @xe: xe device
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
-void xe_pat_init_early(struct xe_device *xe);
+int xe_pat_init_early(struct xe_device *xe);
 
 /**
  * xe_pat_init - Program HW PAT table
-- 
2.54.0

