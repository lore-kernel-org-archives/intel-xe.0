Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16709CED270
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CB710E0E8;
	Tue,  8 Oct 2024 06:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzY4O+1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D47310E476
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370392; x=1759906392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ofqZMwSZTsCu0fdYEuBZdJ7DcUiWdEwsEf8weL7UVIw=;
 b=mzY4O+1lWpyBUqvKzt/9fmtm+Pe4h81/cdMKwE0GbORSBwi6IU5DbNJu
 1LYM0yQvAIN0lulbP0QZ9onQXYPtkiA45LnpAZxRjdFt8RnqOYPImruCq
 y99RcvAc+UdXkf3goPxxP/klTxyOcE91ZR4G+yRCcY2y9gcrIk3BTa+wX
 U5V/qxUl92aw7QXYlpUCJDSw9F2ESAtxoxdaTqYccuinJ/QF/LmkhgSyw
 LtkMjUiF9A9hzz8uKnLRXDJP/l9RECdNL4YY+bueJgssrYTqYoq3W7Nc6
 YiSxQ1JY/1XTtOd2DMgla7k3JVpL0U9fyp3U/rhuLjr/BHMF/8ytQHOQG Q==;
X-CSE-ConnectionGUID: ZzwySF0cTyaG+8reQdjjSg==
X-CSE-MsgGUID: bV5wQWgtQq+wmYM8yAt7Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430438"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430438"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:53:12 -0700
X-CSE-ConnectionGUID: NgCKietDTriGEobCvrCSBw==
X-CSE-MsgGUID: m2iFwXhsTLenjf8huG+j/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577726"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:53:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 13/26] drm/xe/mocs: Update handling of xe_force_wake_get
 return
Date: Tue,  8 Oct 2024 12:41:02 +0530
Message-Id: <20241008071115.1862704-14-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Update the return handling of xe_force_wake_get()
to reflect this behavior, and ensure that the return value is passed as
input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- don't use xe_assert() to report HW errors (Michal)

v5
- return unsigned int from xe_force_wake_get()
- Remove redundant warn

v7
- Fix commit message

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

