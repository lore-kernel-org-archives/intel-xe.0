Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E220DCF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02AE10E2C8;
	Mon, 30 Sep 2024 05:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zic+YjmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE28E10E2CA
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673230; x=1759209230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Klq1/3hO/hwZRmDyssMw9EY6mT+2qmy7LMkplmOqpUw=;
 b=Zic+YjmEHMLSGzHeO2BuJ1YBOzvizhXDG280wPznGfsNaaikIayoy1cs
 RbCgDZepe95OpeaaiHiCrzXB3uAc0yz9+jx1p+jFKg/2d+HT4FzKU2Lyp
 licUHNDTn9GvFbd9Yl8dhdBnmy4kFAWanJDUth8KA1gBvZD8XrDBZNQFi
 YiRhT7LzNG/H/ZHw1DUMSjC1f3bxJQ2AKcJcBvkgSM1seGIw0NmZ9vQdc
 +vYhsmHxZTbbrWAXVFhp8QY6VkU+rSQkoDslCIQCS6P61JrY8ImoE+4ml
 YgnIIb8XfiSGo/+XwhGXwIPa6z8InyCl1uk2Dxu6zpq/O5xLv+ZSVxguL Q==;
X-CSE-ConnectionGUID: hzuhTRixR9ynSjJKgf1o5g==
X-CSE-MsgGUID: RGcyegSaTb6vQ//veJFCBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367970"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367970"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:50 -0700
X-CSE-ConnectionGUID: 62FqLpfxRPuswc9cpyzWRw==
X-CSE-MsgGUID: n/CpS1g0SYGIyLzZweGfZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752184"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 12/25] drm/xe/mocs: Update handling of xe_force_wake_get
 return
Date: Mon, 30 Sep 2024 11:01:36 +0530
Message-Id: <20240930053149.1246339-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- don't use xe_assert() to report HW errors (Michal)

v5
- return unsigned int from xe_force_wake_get()
- Remove redundant warn

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 8df41cd12d51..9b673d7bf4b9 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -773,25 +773,21 @@ void xe_mocs_init(struct xe_gt *gt)
 
 void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_mocs_info table;
-	unsigned int flags;
-	u32 ret;
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_mocs_info table;
+	unsigned int fw_ref, flags;
 
 	flags = get_mocs_settings(xe, &table);
 
 	xe_pm_runtime_get_noresume(xe);
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-
-	if (ret)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		goto err_fw;
 
 	table.ops->dump(&table, flags, gt, p);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 err_fw:
-	xe_assert(xe, !ret);
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.34.1

