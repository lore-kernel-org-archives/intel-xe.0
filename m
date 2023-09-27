Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1B8E82CC9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 19:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443B510E5A5;
	Wed, 27 Sep 2023 19:39:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A127B10E5A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695843538; x=1727379538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KUNyUCrrMUDQGEWMQsE/P1MiApYT0gGnmPkmAbR9mpY=;
 b=C16vamb/0lqlEb9LMRYDi7wxxWojxyDP/aOIsYSkcFlVzAeLRpV22W1d
 BK32/Zxc8DyZJjRJ3fPx+zjK/xfxNnomp6P4qWD6ErrPAuqCkFHU8rR5j
 GX+tYK2lq0nP2eF96hwQfddaqFU3ZFw4L9GKjZHfrr6rlliNfeOw96v+X
 oPzu74QGkubEuyUT3Z41zvQOMDt0eLUPxYWiolSzYLY/P2BaIyFM+QXFc
 /ZpSN76eHZJSK9DSSrE7BT/eDWsLeN6wI6HGBNrr1mRqQakj4sCwCrerC
 xS+oC34+vxakKqtXW7sxmBr85Qo1utJHvONs9T4mrRZqzNlmDeCvrUiFg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381817982"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="381817982"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 12:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="742826492"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="742826492"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 12:38:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 12:38:57 -0700
Message-Id: <20230927193902.2849159-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927193902.2849159-1-lucas.demarchi@intel.com>
References: <20230927193902.2849159-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 06/11] drm/xe/dg2: Fix using wrong PAT table
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DG2 should use the MCR variant to program the PAT registers, like PVC,
but shouldn't use the same table as PVC.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 28f401c500d8..a4bebdedbbd9 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -108,10 +108,18 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.ops = &mtl_pat_ops;
 		xe->pat.table = mtl_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
-	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
+	} else if (xe->info.platform == XE_PVC) {
 		xe->pat.ops = &dg2_pat_ops;
 		xe->pat.table = pvc_pat_table;
 		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
+	} else if (xe->info.platform == XE_DG2) {
+		/*
+		 * Table is the same as previous platforms, but programming
+		 * method has changed.
+		 */
+		xe->pat.ops = &dg2_pat_ops;
+		xe->pat.table = tgl_pat_table;
+		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
 		xe->pat.ops = &tgl_pat_ops;
 		xe->pat.table = tgl_pat_table;
-- 
2.40.1

