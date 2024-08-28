Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5137EC54754
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 09:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC2F10E4DB;
	Wed, 28 Aug 2024 09:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XudBGlnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B16B10E4DB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 09:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724835879; x=1756371879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GFxYyoI9ybTqJoNDOvP4VhY2GLdA+KJr1CkN7SGjwOc=;
 b=XudBGlnwPpphm/qbyVndU44PZXT8h+F5WHFMP4Psal8jXthw0th4DQS0
 9uHX+qjhVFYgaihapRpnGUQmnOveBHF+v2mzYJMxI0ioP3HmVze98LqQ2
 yb7KqKpWp5vSV1xDt7yhM9sGzdYy6Ccy/kwtb/8CC0Ek9ntcBmCIsuCAu
 WzpmPH0lDffjMUfyMBOyvnJ+TBhB77k6EOQ1GPm9DXnf+xzZCNPzIvBYm
 qeuwXbMiCep0DKzFmtyiHPwDA2jUznuZlC0FC03EMXEHZDxIfTvcEpEYR
 3IJZWxo/avsRtpz2kfjkU6EFyozaSXsD216OvVYznDUB8KC/ZMsm83X25 w==;
X-CSE-ConnectionGUID: +WbRZogGTceITHnVrkWypw==
X-CSE-MsgGUID: LXfAkERSSDWVtVNsIBP3Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23533939"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23533939"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:04:38 -0700
X-CSE-ConnectionGUID: Fa/yScm0QnKfvDIg5eGNOg==
X-CSE-MsgGUID: hXM55XiWT8+rLYmKWMtoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="68043537"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 28 Aug 2024 02:04:37 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2] drm/xe: Fix NPD in ggtt_node_remove()
Date: Wed, 28 Aug 2024 14:52:29 +0530
Message-Id: <20240828092229.3606503-1-himal.prasad.ghimiray@intel.com>
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

v2: Move null check below declarations (Tejas)

Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for ggtt_remove_node")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 86fc6afa43bd..f3fca5565d32 100644
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
@@ -328,8 +325,14 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
  */
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
 {
-	struct xe_ggtt *ggtt = node->ggtt;
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct xe_ggtt *ggtt;
+	struct xe_device *xe;
+
+	if (!node || !node->ggtt)
+		return;
+
+	ggtt = node->ggtt;
+	xe = tile_to_xe(ggtt->tile);
 
 	node->invalidate_on_remove = invalidate;
 
-- 
2.34.1

