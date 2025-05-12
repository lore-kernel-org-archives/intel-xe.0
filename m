Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D7C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8F010E458;
	Mon, 12 May 2025 16:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPjAOIRn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BB710E458
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747067726; x=1778603726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wYnUXpmGYeCX0Zm1fsyvjEbeXzN1RlLuBp2RKHXOnSs=;
 b=PPjAOIRnLP+fdNhW2Z/JfwI25jY8vCa2bj+aPlbIIx8LNGU7bCBgGo3X
 fWNhsp1eXKuoXj5Yyfkklyoq0ypq2JyXz7di9g7glDmyEWzTFmGrCFTTO
 oTHadh2YuLfS2oc9JKYawy0yVBwA5f1oZCg4vnbIRV1y7lJZPH/9DtXWL
 e1aJ+M6rFNF5dSwCaHw7DaUj1K34Z0GXd1p+BaLqEoEMOwQByRT4nvFBa
 WdzQIKGKW9B+o7wj/ECXRbJ24xWiCjpsvxeikxsXvfEQRr4f1SDbquu6d
 +ep8DOVoawDtbU2/xXmgsGyKlA7rg5SP81ZYcfweOsreKcAtwQ374zOYc g==;
X-CSE-ConnectionGUID: gn2NfvsCTz6IBzyQiDYJ3Q==
X-CSE-MsgGUID: No/juA3bTKWBlTvpxF69hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36501027"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="36501027"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:26 -0700
X-CSE-ConnectionGUID: xihGfHS6QbCH6mMksOfQzA==
X-CSE-MsgGUID: +XmghTJsTMqyNI7V2DTXtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137351568"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:25 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v2 2/4] drm/xe: Don't update wedged mode in case of an error
Date: Mon, 12 May 2025 18:34:30 +0200
Message-Id: <20250512163432.22678-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250512163432.22678-1-lukasz.laguna@intel.com>
References: <20250512163432.22678-1-lukasz.laguna@intel.com>
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

Update driver's internal wedged.mode state only in case of a success to
avoid inconsistent state.

Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 7e14eb037295..2190219177e4 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -170,8 +170,6 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (xe->wedged.mode == wedged_mode)
 		return size;
 
-	xe->wedged.mode = wedged_mode;
-
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
@@ -183,6 +181,8 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	}
 	xe_pm_runtime_put(xe);
 
+	xe->wedged.mode = wedged_mode;
+
 	return size;
 }
 
-- 
2.40.0

