Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A86C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 06:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6A810E480;
	Wed, 31 May 2023 06:19:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D593B10E480
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 06:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685513975; x=1717049975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sPuaEWJxxr52oeMH5NP+Ipc6aN5Tg2BEXseHzMvBJuU=;
 b=SuFWJGFJ5uyfndLnHcIEyhBxffHEfFc5T14U1n0VHPHQrVakD1CD2GxB
 ISd3MCXeM0J0avaI5vXKeDm4NGlt+wZOgIA9lepNjS1yGMLE8ULh8ZE0M
 KBfNatKaabTZGPiKLo/FeO8xOx2wlZ4WUfg4FOclJS99dxua8MD/bb/1B
 iFrJjfSLIGRM9ronShSuXUFkEo/jgDrQn8zQWdzin93q7g8+S63HkLUDt
 JbqCRwSjtHIVTY3u/Gm0chfha5KRk+1yr0VOXPsCO02iYoAsqXuyux9eF
 AexBOeKJEkJQOaq+1v6hOVhLSpg4fw2DcpadZeY24CD7e1zFgWB0tzVJo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344655347"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="344655347"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 23:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="709932383"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="709932383"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 23:19:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 23:19:02 -0700
Message-Id: <20230531061902.389333-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
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
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drm/xe/sr: Fix too many kfree() on reallocation

When re-allocating the array, the previous location shouldn't be freed.
The issue can be more easily reproduced by reducing
XE_REG_SR_GROW_STEP_DEFAULT. This was crashing kunit during cleanup
on semi-random places depending on the number of save-restore entries.

Jointly debugged with Matt Roper.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 24d9c73ef279..434133444d74 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -57,7 +57,6 @@ static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
 		if (!arr)
 			return NULL;
 
-		kfree(sr->pool.arr);
 		sr->pool.arr = arr;
 		sr->pool.allocated += sr->pool.grow_step;
 	}
-- 
2.40.1

