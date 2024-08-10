Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B697EC531DB
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615D210EA62;
	Sat, 10 Aug 2024 01:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ3DiDSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7F710EA58
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cQQqPMJCHGvbFHO7qwThdRHuE8XiU+LPGyiYxWRjKw0=;
 b=LJ3DiDSlzRm1bVEP294zm0vyYq0itk+WhLWCK/O9sLFJm6EyR8C6uium
 Cal2vGTIYGGiV3pxnBVB1dBe8rxamkqX8ZCKmVA7OVnX5SR7y6pW+1Wgo
 zfTjI70o7gBljD8luzYb76kNr0C9HxCpgPZEOUqwD9FwN/n+74vPsc7eR
 uS+0kdtQXf+N5vjrjj82hd1In7G4N2ugBZPskIK/6xmWWZ3YmrhVEA7LY
 Nn+Zaxsqo8bi1qcqq/oQ20+w8DKsD1LcxsqPKEZk89QgeNGrIboTJpSPI
 Dg6LzEWl67fv3hSGWBnMU0vva6iimDmERTKO1KzStfCZcwmlBEhyHOjbf w==;
X-CSE-ConnectionGUID: m6PCfjUcR5iO5C/XTJjKVQ==
X-CSE-MsgGUID: eRLXJW8+T12y5qSw1bO4gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420034"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420034"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:54 -0700
X-CSE-ConnectionGUID: 0ZYExq2TRcCWuuW1fTay3Q==
X-CSE-MsgGUID: Or2JFVybTxOOA6HsxnhVMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813389"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/11] drm/xe: Move hw_engine_fini to devm managed
Date: Fri,  9 Aug 2024 18:55:42 -0700
Message-Id: <20240810015544.3443258-10-matthew.brost@intel.com>
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

Kernel BOs are destroyed with GGTT mappings, this is hardware
interaction so use devm.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 402dfa748e16..50c192293e7e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -266,7 +266,7 @@ static const struct engine_info engine_infos[] = {
 	},
 };
 
-static void hw_engine_fini(struct drm_device *drm, void *arg)
+static void hw_engine_fini(void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
 
@@ -584,7 +584,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
 		gt->usm.reserved_bcs_instance = hwe->instance;
 
-	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
+	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
 err_kernel_lrc:
 	xe_lrc_put(hwe->kernel_lrc);
-- 
2.34.1

