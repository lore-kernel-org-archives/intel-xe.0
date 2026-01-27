Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E4CD2FEC6
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 17:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7517910E5A8;
	Tue, 27 Jan 2026 17:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fir43sCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721810E5A2
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 17:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769533498; x=1801069498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zn5jTmerUNkrbCmXKfWSkBaKSE5gUrq1fv//SmwgjLk=;
 b=Fir43sCelZLExDIZ17VnVJXjhwaKd7vulyIyJqg7J18F2RvPLBOlIzRz
 kU8ZzCa5EbZXnlZTon5m/lNp2/EPKDs0MsI0bSnRZHJ2bgn03R3t3RPEu
 FGS7QGQR9I9lRBptooQum7q7WdIxol71XHJql9GJ4fOZ9BSk+R/dWaRWV
 n0EpSGU8APaKfOMqQK5AlhAd5+p0+2flucELGqgySCKCJrg4rNxv6u23H
 QJo1+d9/NyaubIyydAFvX5WPtr8MIWfDqFx2UObOZTUivKrNPg+iaBoFA
 yNCm05IBEpZ800f3Cu8kueiv0axGb+0igqJXO/VcPBtUyZGU33QGDak4c g==;
X-CSE-ConnectionGUID: nTxMRE6LQ0usPv2QYwKGxg==
X-CSE-MsgGUID: 6yDSRlE9Q3W0MWIQ15fOZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93393531"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93393531"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 09:04:58 -0800
X-CSE-ConnectionGUID: YvHudb4JRmuUtlvyQ7ng+Q==
X-CSE-MsgGUID: TeOnzCMRSiGWNLMdWQilYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208039401"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa008.jf.intel.com with ESMTP; 27 Jan 2026 09:04:58 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 5/5] drm/xe/uc: Drop xe_guc_sanitize in favor of managed
 cleanup
Date: Tue, 27 Jan 2026 12:04:55 -0500
Message-Id: <20260127170455.618616-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127170455.618616-1-zhanjun.dong@intel.com>
References: <20260127170455.618616-1-zhanjun.dong@intel.com>
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

If the firmware fails to load in GT resets the device is wedged also
initiating a GuC state cleanup.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 3f63c2a7e86d..39101120d43a 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -171,7 +171,6 @@ static int vf_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
 	return err;
 }
 
@@ -229,7 +228,6 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	return 0;
 
 err_out:
-	xe_guc_sanitize(&uc->guc);
 	return ret;
 }
 
-- 
2.34.1

