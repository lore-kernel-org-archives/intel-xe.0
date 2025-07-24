Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85208C83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 15:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3010E08F;
	Thu, 24 Jul 2025 15:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nB6snmma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81D610E08F
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753370703; x=1784906703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4u7pY0zcZ1tB7lYwsX6JysfTboYw70mDf+ln1YnxJss=;
 b=nB6snmmaPl2npIG33idFIVOdMVNQgQvJD3L9cFwjWHGFCUiE8kOn3b1n
 /KUl49noWrcm4FBsJgMXSo44M/yPxAg8JrXQzrYNojet0rzCJ6k4UpGGc
 uts59eHXolmewgHUMwsbS8/0GFILwUpuE7SlFmMaJ6UPCIupZjimic5P1
 uPTaTlO0i9ExgBT+6ADmEt4ObwS+Tv5/yt06gEhMT/xXsXIysoSI1VGLi
 k0WNIo3qXYT9JxPZwdHrpqcUA7YvrcWjJqbSRep7UM+Wp9nkI5be1Ib9Z
 wSwTlwvJ9yv52Ip0RoK6cX4hsh2xg7ESfc3a418Y+3QpLvN5lY8Ls8pF1 Q==;
X-CSE-ConnectionGUID: lW9M0eneRZKFg/5UQ8cckw==
X-CSE-MsgGUID: TMjNylu0TsShF8y4YJQZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66766920"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="66766920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 08:25:03 -0700
X-CSE-ConnectionGUID: D3JNxy3lSPeYcOPD23LVrQ==
X-CSE-MsgGUID: hPhYnYx2TYySUzkyjuneSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159520224"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa006.jf.intel.com with ESMTP; 24 Jul 2025 08:25:02 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1] drm/xe/uc: Add xe_uc_stop on hardware initialization error
 handling
Date: Thu, 24 Jul 2025 11:25:00 -0400
Message-Id: <20250724152500.110367-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

During hardware initialization, GuC communication is expected, which
will increase the outstanding counter. Non-zero counter will cause
assertion failed during shutdown process.
Add xe_uc_stop call to clear the counter.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..6c72ce305d6c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_uc_stop(uc);
 	xe_guc_sanitize(&uc->guc);
 	return err;
 }
@@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
+	xe_uc_stop(uc);
 	xe_guc_sanitize(&uc->guc);
 	return ret;
 }
-- 
2.34.1

