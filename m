Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C719CCAC594
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965E210E4E6;
	Tue, 17 Sep 2024 17:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpXPD56S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC7510E4E6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595802; x=1758131802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0xBuRWi/fieBEMezGF6CsU8Ybi1MwMaKJdCbO06zseM=;
 b=bpXPD56Sm8pyd1fLeawcz+FRyRMrT3m2Lccad1ESyg9KuH9CF5oIRzRe
 6XLc3jscxTafGZOJhr+ZCZTosSUY+hUz7ql1Jr6/DCjE4PomzhPP6Qhix
 USShcjRqy62NAyqovto8czW6GO1Lf/H6L9IcseSbj5ETkZuve7O9ZFxOA
 INDmbTyNtrlh5fMMsKdGNFUaavNlXAkMOkDF4FydtgBW+hPg2+AwFa82e
 yVEFaHImEuNNyZp+mQ5hAuCBVzqtELn1wRm6TG4c3QMotqAvZHUxeH/ZS
 dPqMJCGb4dohY61QtjLrfwUe2Tldi86WIbz2iscgQ/x8mIqlNFfHViGua w==;
X-CSE-ConnectionGUID: rzZalANdSdaFkrI1eF/Exw==
X-CSE-MsgGUID: t13YdoUFS8qTtEBGlRo7IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13562006"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13562006"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:56:42 -0700
X-CSE-ConnectionGUID: JO0LQo37RFiud+5yulWNvg==
X-CSE-MsgGUID: ot1ZLx/wSUCMj8t34EYxvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926492"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:56:40 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 10/23] drm/xe/mocs: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 23:44:12 +0530
Message-Id: <20240917181425.515871-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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
- don't use  xe_assert() to report HW errors (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 8df41cd12d51..f618d408b003 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -775,23 +775,23 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_mocs_info table;
 	unsigned int flags;
-	u32 ret;
+	xe_wakeref_t fw_ref;
 	struct xe_device *xe = gt_to_xe(gt);
 
 	flags = get_mocs_settings(xe, &table);
 
 	xe_pm_runtime_get_noresume(xe);
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 
-	if (ret)
+	if (!fw_ref)
 		goto err_fw;
 
 	table.ops->dump(&table, flags, gt, p);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 err_fw:
-	xe_assert(xe, !ret);
+	xe_gt_WARN_ON(gt, !fw_ref);
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.34.1

