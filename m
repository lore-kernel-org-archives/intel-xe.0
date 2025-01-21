Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B03C02185
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 09:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D330F10E216;
	Tue, 21 Jan 2025 09:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwIi9Ai9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F8610E1D6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737452927; x=1768988927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hw6kmMjIgYiaJe8L2QH5jpnsGlop5qXXP9J3tThu5kk=;
 b=WwIi9Ai9iiUyykcNrR4MYyXhbBG7hHUfanM++QKWeRBgxXhu/tZM+qI2
 F/5T9GTg+3fu7davx507Y4Aw8Q7Z8vQQRw+Pw2lVoLPLRmCsqHxkDx/8Q
 8npo7H9nc9AfkQLoOrogfLU/Ut+HL8EURIxhfgC/bs4W/hc3/EIk2GQ0f
 oDB5ovDVGuFhquQ8BV5RVFxKEFf3efxfF6mu4XDR1IFgvgbzHvhva891V
 aNx+igHblviCLYWuNrXQQ/KKiLV9MdFtfFVQjxQ6WcwmhZi1QJTewZsts
 8mqtldf7jKylWs1ijSeOjX74nid2/bI/7AJfYSreUt0HBChMNXNme0eCA Q==;
X-CSE-ConnectionGUID: 4xShiZj5QtG9K/BL47/ZxA==
X-CSE-MsgGUID: Fv1xwumgTyeEf6x96RkoBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49271015"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49271015"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 01:48:47 -0800
X-CSE-ConnectionGUID: K3Fut8tJRiiHcXuoZDLFaw==
X-CSE-MsgGUID: 7jJHnBxKRny1e62oH1vB7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="111756354"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 01:48:44 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc: Fix sizeof(32) typo
Date: Tue, 21 Jan 2025 10:48:32 +0100
Message-Id: <20250121094832.588-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

A small typo leads to the following static code checker warning:

	drivers/gpu/drm/xe/xe_guc_buf.c:81 xe_guc_buf_reserve()
	warn: sizeof(NUMBER)?

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/intel-xe/0d5bcbf1-79f9-4a10-a221-ddbaec9f6122@stanley.mountain/
Fixes: 696bfdf273ea ("drm/xe/guc: Introduce the GuC Buffer Cache")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index ce6d9830e13b..0193c94dd6a0 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -78,7 +78,7 @@ struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords)
 	struct drm_suballoc *sa;
 
 	if (cache->sam)
-		sa = __xe_sa_bo_new(cache->sam, dwords * sizeof(32), GFP_ATOMIC);
+		sa = __xe_sa_bo_new(cache->sam, dwords * sizeof(u32), GFP_ATOMIC);
 	else
 		sa = ERR_PTR(-EOPNOTSUPP);
 
-- 
2.47.1

