Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B6BC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 17:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5715910FDB1;
	Mon, 18 Mar 2024 17:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5zNN1FO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B962810FD9F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710784292; x=1742320292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DVrEeNes4PkqHERXK/STAKie/v2Ab4VrWgCVSObL8Us=;
 b=l5zNN1FO8o+x6LC3Z6Pu6KdCwvBZH0xbbewEMutjUn3XfhHPlyuiTfSo
 3tYftBpQi0XkQNXO1QLOgcSEA13UzhyfLdQkwH4jz+x1fN2gH0d4ybMM9
 aNlzr5lLWlJljpHuA+qy8311po58unP92cvBnwQXHWD7Vskh3XWb1S6+C
 nd6lhaeebDY+VADd8K3DEl/a0h2ccClNyneHB/rZ8gm24d9SF79jhInDn
 apUVXP1kabE2CzSd227n2YY1E9NiSses7cmq3SeW/h3mAWZ1PghQ+363v
 s5MDtp2977ySSlab107iouevS+SlVO95hOZ5NW6P0sZc1ovtNtw0QO231 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5451807"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5451807"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 10:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="36675933"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 10:51:29 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/pt: Warn on 0 level before going to next lower level
Date: Mon, 18 Mar 2024 18:37:44 +0100
Message-ID: <20240318173744.6301-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

This should happen so add a warn_on to be more paranoid.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7f54bc3e389d..d6794f65d6c1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -731,6 +731,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	pgoff_t end_offset;
 
 	XE_WARN_ON(!*child);
+	XE_WARN_ON(!level);
 	XE_WARN_ON(!level && xe_child->is_compact);
 
 	/*
@@ -1396,6 +1397,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 
 	XE_WARN_ON(!*child);
+	XE_WARN_ON(!level);
 	XE_WARN_ON(!level && xe_child->is_compact);
 
 	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
-- 
2.42.0

