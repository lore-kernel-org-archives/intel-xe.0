Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04731D277CD
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 01:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B790810E313;
	Sat, 10 Jan 2026 01:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsbJyQUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A80710E2B8
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 01:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768008469; x=1799544469;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kcBYOO3fV36rGBuG5xov5aN196QgVWN5/eQZA9hA0Wo=;
 b=nsbJyQUiP497yeIPt/HFg5bJFu3gL/dW3W4U/5gDQa+Rv03BneLdVYRz
 Ly8UujRLZznBvcrcyKorPNsGDQgoG5WGegJcTokLZrBsOqFU1tYh+x/eT
 CojkcvijfQqeR5KqtZISiIpi3TctS+bRiqfpX6uSpum3Vw+8J4gsGIY2u
 VVjEP61J+8ebaKofcfhNM3RGnO/Xw0DLXesOMORqjAHKgKJ/RQbu4PXa7
 GqeAxk+2NHrHS0sBkEsztLZ5ykSwXOa5VaEUnXGloW/sqOFr2zXR0AXWC
 pIVuo+vwvXB52G/G6efgEEymjrQzLQn8CXaYYwd+6CmS/u6Jiim+nttBI Q==;
X-CSE-ConnectionGUID: 1r4PWE2DSIe5Ze4/X6Ht2A==
X-CSE-MsgGUID: IU3ZA708TV+nab+H7ik8sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73021821"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="73021821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:47 -0800
X-CSE-ConnectionGUID: mNpe70ICTLaA9+/FlXs0bA==
X-CSE-MsgGUID: Y46iXuu5TGCPd3KCLzleWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="208132053"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 6/7] drm/xe: Disable timestamp WA on VFs
Date: Fri,  9 Jan 2026 17:27:38 -0800
Message-Id: <20260110012739.2888434-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260110012739.2888434-1-matthew.brost@intel.com>
References: <20260110012739.2888434-1-matthew.brost@intel.com>
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

The timestamp WA does not work on a VF because it requires reading MMIO
registers, which are inaccessible on a VF. This timestamp WA confuses
LRC sampling on a VF during TDR, as the LRC timestamp would always read
as 1 for any active context. Disable the timestamp WA on VFs to avoid
this confusion.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")
---
 drivers/gpu/drm/xe/xe_lrc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 70eae7d03a27..bf27fc9eebd3 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1068,6 +1068,9 @@ static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
 {
 	u32 *cmd = batch;
 
+	if (IS_SRIOV_VF(gt_to_xe(lrc->gt)))
+		return 0;
+
 	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
 		return -ENOSPC;
 
-- 
2.34.1

