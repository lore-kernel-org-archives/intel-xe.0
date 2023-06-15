Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451E9EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 18:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6B910E0A0;
	Thu, 15 Jun 2023 18:19:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1577F10E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 18:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686853142; x=1718389142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sYyERpyUVIvR4eguBKwTCF3tkTt82D3zt0Cz6g3pgUY=;
 b=KPaNvMSf6EqKXhNzuTEqDXYj1HApNOoWPjyQsKXE/PMW+YojtU+qDcqE
 TV3lbixM37U1A3i/RZVdZNW9abnfiDzOSJoE2nM6xNH7qPs1HFNlxJ5BB
 zdurKKZYtUdb1LwG+pk/ELRukaBF7V7X4FX9pH45zRZJO8Do/PCaJm/aF
 /z3UcWNcmLweVP7cLZxrTeWjk63cYsZgIrcidMnTXsBfNd0oK6vt5B7pZ
 3quvxYjmbYyvqeZWXmq/Z+F2ySx2ufnhnQuYxzEs3jaumoeGAZGyjJPJ3
 DgXYTy1oYAz3+rzZM4dbR97Bx8/oTz/F1sKAu93OqlfbJG43yAaPsXeQG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="356493158"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="356493158"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 11:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782599362"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="782599362"
Received: from apanek-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.6.155])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 11:18:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jun 2023 19:18:40 +0100
Message-Id: <20230615181840.76075-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/bo: handle PL_TT -> PL_TT
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

When moving between PL_VRAM <-> PL_SYSTEM we have to have use PL_TT in
the middle as a temporary resource for the actual copy. In some GL
workloads it can be seen that once the resource has been moved to the
PL_TT we might have to bail out of the ttm_bo_validate(), before
finishing the final hop. If this happens the resource is left as
TTM_PL_FLAG_TEMPORARY, and when the ttm_bo_validate() is restarted the
current placement is always seen as incompatible, requiring us to
complete the move.  However if the BO allows PL_TT as a possible
placement we can end up attempting a PL_TT -> PL_TT move (like when
running out of VRAM) which leads to explosions in xe_bo_move(), like
triggering the XE_BUG_ON(!tile).

Going from TTM_PL_FLAG_TEMPORARY with PL_TT -> PL_VRAM should already
work as-is, so it looks like we only need to worry about PL_TT -> PL_TT
and it looks like we can just treat it as a dummy move, since no real
move is needed.

Reported-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b94a80a32d86..5aed626cce80 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -603,6 +603,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
+	/*
+	 * Failed multi-hop where the old_mem is still marked as
+	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
+	 */
+	if (old_mem->mem_type == XE_PL_TT &&
+	    new_mem->mem_type == XE_PL_TT) {
+		ttm_bo_move_null(ttm_bo, new_mem);
+		goto out;
+	}
+
 	if (!move_lacks_source && !xe_bo_is_pinned(bo)) {
 		ret = xe_bo_move_notify(bo, ctx);
 		if (ret)
-- 
2.40.1

