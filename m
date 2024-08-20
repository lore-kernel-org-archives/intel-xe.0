Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B302FC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7EC10E7F9;
	Tue, 20 Aug 2024 17:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLlfLjlN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9543710E7F2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174943; x=1755710943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XdAEBRjvQP4FGAYsJEhAsXug87LIMDeWq5QmTSvCXPc=;
 b=MLlfLjlNV4HrQLNO5P5Uqhs5mWzs1Db/7DdazmbCtKWbkjISxsKKLisA
 yF5oX3l2bQkFVWXzg1Zi1WjDYEkBSh2Reqq96WWeJ4L3UwptO5aBgWldi
 4SxNRFhPp96lfMaI1xZgWj+ppcg5DnOMNW8BE0fO8hP+oY516GIWiHZae
 9ai2juiZ4BVaxeLZw+bn0+pNyPQBoWdm9yhA1Y6VMdGP2iNg0SqAB3atp
 n4W9szOAivZejBop5yFpoK+/4AJJnRhmxRXsDUIv7S7DMNvzNsJRp5PQs
 wCNEmCfis3uBk9bMWK5GMGoowGlQNkf30iF0tY7Cx6wV20y1c9Iv0iypI A==;
X-CSE-ConnectionGUID: VuZCl3NPQHGhgZObCUzozg==
X-CSE-MsgGUID: R7oxBhZmTSO0FguAYhCZnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26365492"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26365492"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:02 -0700
X-CSE-ConnectionGUID: 9K8vDAIgTqqaJf51MdqMoQ==
X-CSE-MsgGUID: zSjtYiYWSm20fLm3vHV6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65651735"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/xe: Move ggtt_fini to devm managed
Date: Tue, 20 Aug 2024 10:29:53 -0700
Message-Id: <20240820172958.1095143-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820172958.1095143-1-matthew.brost@intel.com>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
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

