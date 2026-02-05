Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3544CECD997
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 19:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88C610E070;
	Thu,  5 Feb 2026 19:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agE81+Dn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789C210E049
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770321551; x=1801857551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Grd7GYUzEaFfTS1bIL9SsSSNKByi2JnwfH5joQhG/k=;
 b=agE81+DnwAACaaZJY77jMyxwHKp+x4Ab3o5wga4ayulvcAkHCmsE1jrk
 obPVvjiF7iWvzpqX3YgBmDsuT4OA/T9ZuBhyBCBjz+KidhtBGiocxSoJG
 /myAUCyTF5ugbPSLtHNFKc62BivTOgv82xEj7HT8kh6E+VV/RB2LkS+UH
 BW7QvT2OFxXajwHfm/upkaQT5T4iTzpLLgxN97Rmx5PvmWMjXzzvfSv1R
 D+XBrwBJnefj4hfWPnw25rlBnyKhgSQP5M0gadLM3Ik6owNlWF3VcmeMd
 HXpbv1/hAzuVnRH5eQB7cHRrqyHgloaI5sGR6UEKb6yFPntD9xupbgb1k g==;
X-CSE-ConnectionGUID: 541kKswTSruJebfC8P2RUw==
X-CSE-MsgGUID: PMZgUzsiRAeU1j9xyAoZog==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70548518"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="70548518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:59:11 -0800
X-CSE-ConnectionGUID: j9KznM2VSM+4Tjnmhq0ycw==
X-CSE-MsgGUID: nQNY8CuhT/KiprY4ruZHbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210705507"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:59:11 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/7] Revert "drm/xe/pvc: Add GuC firmware definition"
Date: Thu,  5 Feb 2026 11:57:50 -0800
Message-ID: <20260205195833.2928038-12-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260205195833.2928038-9-julia.filipchuk@intel.com>
References: <20260205195833.2928038-9-julia.filipchuk@intel.com>
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

This reverts commit 8fe3addb2c47c6577ace99f22beceeba77afc8ba.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 8904cc696569..ed153c2e7599 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -119,7 +119,6 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
-	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-- 
2.51.0

