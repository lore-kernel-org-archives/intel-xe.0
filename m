Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90123C54751
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B9510E168;
	Wed, 28 Aug 2024 08:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eE1aJOY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B49710E168
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724834206; x=1756370206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IWWK0lp8rsqZK+yrwUoagABWLpj2kPgxVKdWMV5GHTA=;
 b=eE1aJOY426J2ulQi7HQz+U5RRKzo2hgip2e82QB/IvlbHMgpWwPYqmk5
 pvcJPal+L5a/Lc6n9AdQx1O2zjPOdvMtMtQALH9M1+XnsEy9H5O20sNBO
 z7Pplr4cFf6iisxjdF7SMrqVsXBAALrN/f0ttGvCV2k+gnb0SmXxhgwMf
 ZH4exJJf9+qe0Kz4hHjkGKUVz/KBLpZKy5lib9xjsDuSWagyMnE5Tkyxv
 rRlu941C9PH05bLwCg7hmEzOyedXtd6SxBfsn+KvWkRx4EoYCGNZKE79/
 txTsN6XkRrwdgQnzikC8q1tPoBNr2QL3SJNyBkcgxnyeYF2ZxNvBICpWq A==;
X-CSE-ConnectionGUID: EMoW2+SrQra9Xxaxix27GA==
X-CSE-MsgGUID: cy32PFtCTTa6pOoAJRKH0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13256178"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="13256178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:36:46 -0700
X-CSE-ConnectionGUID: TM57zjZbRtGqf6Ozl+/q/w==
X-CSE-MsgGUID: vq83lJV+S0OpiUGoU2sTdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="67831502"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2024 01:36:45 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/1] drm/xe: Fix NPD in ggtt_node_remove()
Date: Wed, 28 Aug 2024 14:24:36 +0530
Message-Id: <20240828085436.3604257-1-himal.prasad.ghimiray@intel.com>
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

Make sure that ggtt_node_remove() is invoked only if both node and ggtt
are not null. Move the null checks to the caller function
xe_ggtt_node_remove().

Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for ggtt_remove_node")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 86fc6afa43bd..2fa8a22ebbf9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -286,9 +286,6 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 	bool bound;
 	int idx;
 
-	if (!node || !node->ggtt)
-		return;
-
 	bound = drm_dev_enter(&xe->drm, &idx);
 
 	mutex_lock(&ggtt->lock);
@@ -328,6 +325,9 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
  */
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
 {
+	if (!node || !node->ggtt)
+		return;
+
 	struct xe_ggtt *ggtt = node->ggtt;
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 
-- 
2.34.1

