Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85532C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B86410E752;
	Thu, 26 Oct 2023 04:02:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A2210E752
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292913; x=1729828913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k4xnv45rC4JblgeLsOBXA8M+RnYqsV2DKcyDOTfMeLY=;
 b=n+2kfT1/qRU9XXILO4nbSAmamoRZmmR6Pjan6jCIIk9zL2Rcdyc6ErQD
 26UFuLJdy3eDTCcIH3g7ekOdVV0PhxibL/iJ6gBgaqR9Ys/MG9Y4kEhQ2
 xbNXFLB+eqHx75MgcQnavOJWKMb8jwz8eswXfHyLYxId2fzn1/Reivyg/
 B/R5uJjW2IMT5HUlTvUKxPJFECXGo+WT85mk/rUW/7G/4uJzMWvV1KNrR
 noRpnaTyU4cEv6wgPdomzeudxiFIYV9PsjOHN/QQluVWSGs0GB8QhQ0Rx
 KeUWJoZB5y+lChSgacztODIeumQsUbe5QTV1r47NSXpFrA+pZ8j9LTf1G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822003"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822003"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682371"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682371"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:00 -0700
Message-Id: <20231026040213.1272993-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/26] drm/xe: Drop rebind argument from
 xe_pt_prepare_bind
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

This is unused, drop it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 31afab617b4e..f06ceaea98cf 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -914,8 +914,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
-		   struct xe_vm_pgtable_update *entries, u32 *num_entries,
-		   bool rebind)
+		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	int err;
 
@@ -1271,7 +1270,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
 	       xe_vma_start(vma), xe_vma_end(vma), q);
 
-	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
+	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
 	if (err)
 		goto err;
 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
-- 
2.34.1

