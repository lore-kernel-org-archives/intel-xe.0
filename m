Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC75C36019
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0356710E464;
	Tue, 17 Sep 2024 12:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a52W5sZi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379B710E211
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574619; x=1758110619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0xBuRWi/fieBEMezGF6CsU8Ybi1MwMaKJdCbO06zseM=;
 b=a52W5sZilrKtfWoNCdzLEMEfucnds2pQ7Q7Sd0rXHSpPStfitVQOgcD+
 gwth4yIHtbAoFdoQu0lzq/50EjadLgKC134rllAj2AzLZR3uIxBMACR1a
 0CkzIeA4w4EGAnpSoLgC2MfwGeJa/SYlY98CaAOXCgsBQuEsMGn8dS+Ve
 cNGs1hWaf+Ms8MgZcUVVMUhufZU2Q/CA7HTIWoXZFkyy5akWnGn2VCQjs
 nN9fnt7CDHSvmYhsNOBnEgj7I/bq/7mF8oRg8p/wj5HdGPJFuLX1fTnPS
 ZNMFDK1Pum/xKDVVl4v9VdXU2q0UtJuhUi9Xgxy8b9OKNkCUUlroZzEYw A==;
X-CSE-ConnectionGUID: Vj5/sFVgQ5q6k9+drSaJHA==
X-CSE-MsgGUID: li+dAM8MSjadU0oDdcKMeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210590"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210590"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:03:39 -0700
X-CSE-ConnectionGUID: G6TRvytcQrCsvpdCR37oPw==
X-CSE-MsgGUID: i3QPaiRST6uaJQpyXn6p6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388493"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:03:37 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 10/23] drm/xe/mocs: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 17:51:13 +0530
Message-Id: <20240917122126.438448-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

