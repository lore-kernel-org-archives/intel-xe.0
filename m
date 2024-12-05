Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23420E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32A310EF6A;
	Thu,  5 Dec 2024 18:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT+PgbBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E9E10EF6A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733423250; x=1764959250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ax2K5VumwCRN0EwU71G6uCruTDO+FmKCN+E+8gxlZkk=;
 b=cT+PgbBcquqUfBkQr7pFIyozE3T836WeAOZFOo+CJ5QdCvTcNJvmxzgH
 12rHnNFwLuV7CoOxRDCKzpHS0cB6s2REzWayW0dDZO2UdHErmvEBHbLHJ
 Lc8a8MLy6pkMXhGAZxaJvtgIqxAkiMkCHINV9XBLBVMMzPS+giW04n1K2
 ltDDzt22FUnTzFU8Tg8V/KD0Fz9wVil2mN/x3cadqCG4DhR7oTZ23QWzZ
 zSzPy/K+gsN+lvtv+DCkbRdfsNe02Y0oaOmgNf7a6LIhlzhnT/qtEHgHM
 dH2L7JnjC4t1BL/QHiCzfJFdhElmF+ReG5SEjrysY/suQezJdRhtswYoB w==;
X-CSE-ConnectionGUID: zk9wk9iIR4KfCTd1zyKNFg==
X-CSE-MsgGUID: Fph5jzKATcuZ6BLXTd+6GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45134312"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="45134312"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:27:30 -0800
X-CSE-ConnectionGUID: hWsfSGEQQNamCyCfQvlupw==
X-CSE-MsgGUID: tNKkrguuT4yKybfOyXNU9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94618193"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:27:27 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/vf: Don't apply Wa_22019338487 for VF
Date: Thu,  5 Dec 2024 18:18:14 +0000
Message-Id: <20241205181814.1484975-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
References: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
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

Don't use Wa_22019338487 for VF.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 05154f9de1a6..11aba2437818 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -238,7 +238,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (ggtt->size > GUC_GGTT_TOP)
 		ggtt->size = GUC_GGTT_TOP;
 
-	if (GRAPHICS_VERx100(xe) >= 1270)
+	if (GRAPHICS_VERx100(xe) >= 1270 && !IS_SRIOV_VF(xe))
 		ggtt->pt_ops = (ggtt->tile->media_gt &&
 			       XE_WA(ggtt->tile->media_gt, 22019338487)) ||
 			       XE_WA(ggtt->tile->primary_gt, 22019338487) ?
-- 
2.25.1

