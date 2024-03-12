Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D230C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 15:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC00C10ED7A;
	Tue, 12 Mar 2024 15:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwDmbqjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35FA10ED91
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710258862; x=1741794862;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BBGTji13prcBO18GsUld/bjLmzD8iRW3bXBOokfj1oo=;
 b=MwDmbqjXgDkxZQLqweCyCjEhR5tn512LLvmK5XbUD2sRCQYLpECwnGnU
 KAlPGm5obTJCEPTz/08KbC6o/Pk5hdgC1rkHslzBsBMrveMoFsFYyeccB
 UA6Sh9G9G6wPYLrC9bKj6FcmOjD8568eDU7uAbwY0LaPjbu5jKQslMT5I
 xdU3d14wQw7RIZzGJ87pkDpUkywrEigVaMrbK9XC234vPkP/UOr3tnz+U
 3W523VtJEhblMEslc8ZYjzCzKYuhfPL56b3OecOlpc05iYmmpuSWcng38
 zLAS0mQNoHEMDTywZSlGke4VCGOAYxZQuv4gWKBRHTWwWZSE9E0WJ6TZm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16420124"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16420124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 08:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="42522989"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 08:54:20 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/ttm: warn when resv objs are mixed in a bulk_move
Date: Tue, 12 Mar 2024 16:54:13 +0100
Message-ID: <20240312155413.7792-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

The BOs in a bulk move must share all the same reservation object
to make sure that we lock the whole bulk during eviction.

Actually document and enforce that with a warning.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 1 +
 include/drm/ttm/ttm_resource.h     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 65155f2013ca..be8d286513f9 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -105,6 +105,7 @@ static void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
 		pos->first = res;
 		pos->last = res;
 	} else {
+		WARN_ON(pos->first->bo->base.resv != res->bo->base.resv);
 		ttm_lru_bulk_move_pos_tail(pos, res);
 	}
 }
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 7561023db43d..69769355139f 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -251,6 +251,9 @@ struct ttm_lru_bulk_move_pos {
  *
  * Container for the current bulk move state. Should be used with
  * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
+ * All BOs in a bulk_move structure need to share the same reservation object to
+ * ensure that the bulk as a whole is locked for eviction even if only one BO of
+ * the bulk is evicted.
  */
 struct ttm_lru_bulk_move {
 	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
-- 
2.44.0

