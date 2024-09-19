Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61106CF3973
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 22:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BDD10E03A;
	Thu, 19 Sep 2024 22:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWDlfgCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEED510E03A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 22:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726785742; x=1758321742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V10tPNtDeYYUsfdo5yVocNbuGY+7G9ZgtTaX8TaAuSk=;
 b=KWDlfgCT5WHH6P6hcQzFBO8WWLxbvbhj+7ZGxQ5e1xgg08+/8EGiVWAX
 GiU8c2/15qCIqZMy97Aez7zqAQnA2rqCvOKXdiBv5GR4FBfHCFuQoeQOK
 eLhcuUatBRudbBIAunsGB6iKW1PRs3r+3SHOuyFdya6bj6XY+YjrthLjZ
 d+qlvY9U1AXHp6yxLgvSBkrMzvXDiyQSfZftcTnRxTXGnkazdGoorc5Pq
 bn5KhyG+61Xhw+zd3FVXr+7WrjEcjY438R7EU4dKz2wThvevlhR4MwjmW
 YGNt69/lFZeeAUVGullg4nyp1ISUzlaeOCOtBD6ygFAzYVwuDOCYAhS7k w==;
X-CSE-ConnectionGUID: KqoBNazFTrGCNmqb8zwTEA==
X-CSE-MsgGUID: oUewss//RjqaNWF1FyKBMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="51188520"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="51188520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 15:42:22 -0700
X-CSE-ConnectionGUID: t2MNzEbCRMmsDMTOhwXekg==
X-CSE-MsgGUID: b/HLmmKqS+mFLYMbVSCAqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69681057"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 15:42:21 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 1/1] drm/xe: Prevent null pointer access in xe_migrate_copy
Date: Thu, 19 Sep 2024 15:42:20 -0700
Message-Id: <20240919224220.1325739-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919224220.1325739-1-zhanjun.dong@intel.com>
References: <20240919224220.1325739-1-zhanjun.dong@intel.com>
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

Update lacks source flag to include resource is null case. This will
prevent null pointer derefrence in xe_migrate_copy.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5f2f1ec46b57..5e8f60a8d431 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
 			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
 
-	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
-						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
+	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
+					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));
 
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device);
-- 
2.34.1

