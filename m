Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E14C531DC
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAC810EA58;
	Sat, 10 Aug 2024 01:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbO49kCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5F110EA54
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XdAEBRjvQP4FGAYsJEhAsXug87LIMDeWq5QmTSvCXPc=;
 b=SbO49kCs3fmkNATK5Bz8QUEaC6tk9HF4jBkismB8fICCVwcBYlIJe6pd
 NYet3EY5UWPDsbCm5j1NpWxgCWoTd449sx3OyfXN7KIRBcI6fuBwhVdik
 aBV+QqlNI337U2VIkSKALMBwDZ6bk7mb7/nnmQpmp1ymbmw34tLHW8kpA
 QiyrsgfekFHT2PgXuWDLtrx8fn65BLO1SK1E3V0Lly2Lbz/r8Nf3k8DW/
 EvPuYD8bZiDG5ZzQflqZTHyMdvRbG+7LIfO+q915uZHTD1/QrlxU+QYZt
 GLqmhylO2VEKTij89Ma5gj0S1X48OsW8hh1jBNxyCuVcqHw2EZo3iK6zR g==;
X-CSE-ConnectionGUID: RbYRF/nhThimCYlz7TINrw==
X-CSE-MsgGUID: 12yH1qI1QjObpDSflsb+4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420029"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420029"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: CXLGugFqSViWzAp+Iw4mUQ==
X-CSE-MsgGUID: Hd4IscyLTIunOgsg5OOiLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813386"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/11] drm/xe: Move ggtt_fini to devm managed
Date: Fri,  9 Aug 2024 18:55:39 -0700
Message-Id: <20240810015544.3443258-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

ggtt->scratch is destroyed via devm, ggtt_fini sets ggtt->scratch to
NULL, ggtt->scratch in GGTT clears, so ensure ggtt->scratch is set NULL
before the BO is destroyed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0cdbc1296e88..21cc9ffcef1c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -132,7 +132,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 	drm_mm_takedown(&ggtt->mm);
 }
 
-static void ggtt_fini(struct drm_device *drm, void *arg)
+static void ggtt_fini(void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
@@ -289,7 +289,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 
 	xe_ggtt_initial_clear(ggtt);
 
-	return drmm_add_action_or_reset(&xe->drm, ggtt_fini, ggtt);
+	return devm_add_action_or_reset(xe->drm.dev, ggtt_fini, ggtt);
 err:
 	ggtt->scratch = NULL;
 	return err;
-- 
2.34.1

