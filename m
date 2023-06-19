Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93946EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 15:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BC410E21A;
	Mon, 19 Jun 2023 15:22:40 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE56910E21B
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687188158; x=1718724158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riwLXIUdazSrvzjUNvrTo0FMzesSrxnXeZsXthyFm5s=;
 b=BvgIfPII3y7MIlSEIGtzNfll0Fmi5s3x7ZrpeLT05EOfFvICfHZmdhj3
 3qleFVpV0cZaJf1iwqTkiieCCFhsAbfKIzecNBM9uCtrOdNtHklXYRcBQ
 au2IpSMYLB/7EQVfSsKptPKAdpBWWhQ0n0EYNUkB/xW9jzJKVHVfSkWl7
 wHH2dDNl1kac+AiYP7IZY3OWddxG6W7UGy4QiRj7ThrIzjVhhosrBchor
 dXs76lP8NLPaEFImv2B03++5yAg4Ei+eAGL5LazmeTchwNtRZT96p8QGr
 frQ1gGpx9/gv7MrVRANxZRwapb2xY6Np0CMD/AnaVcQ5XblqQaP8meMYa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349381539"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349381539"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858250591"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="858250591"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:22:17 +0200
Message-Id: <20230619152222.11733-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/6] drm/xe/bo: Don't limit the TT manager to
 half of system memory
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

TTM enforces this limit a page-allocation time, swapping out TT memory
if needed.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e1fa0c832ca..961bbc29dcdf 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -106,8 +106,6 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 
 	si_meminfo(&si);
 	gtt_size = (u64)si.totalram * si.mem_unit;
-	/* TTM limits allocation of all TTM devices by 50% of system memory */
-	gtt_size /= 2;
 
 	man->use_tt = true;
 	man->func = &xe_ttm_sys_mgr_func;
-- 
2.40.1

