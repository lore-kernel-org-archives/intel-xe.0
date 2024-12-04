Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8274E7716D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 16:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EFA10E030;
	Wed,  4 Dec 2024 16:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IM3TWKD+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1848010E030
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 16:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733330980; x=1764866980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fYfdVmTEIr5lO2Uzk8avOW2qO8xqqq8KpJVRZhbKaS0=;
 b=IM3TWKD+WA2PSuW4TeSzsJttPUnNaPsx0U95w4avMFfYefVot6Ck8AZH
 Jd9J1mipPaue3S/YinF6DfG8OnWkIqUvhNbulrwQBmMWcASyQxH9Wo95R
 SdZ+XdMKQfYV87n2n83oPipzhE4JoZstG5GSgpAkoi/dxZD9E+PhX5k7t
 MlBO64kDs6v1jxWjco5MiIGg+wInYAf1l3TIrBf6UuTcL3WlaxWuAtecR
 jARrPHx717nmznMF1ycEyogN1iWts/VqbzJZOBw4QDIiAR94Bmo+lV8pA
 gnWIvOeTtqcWHR3YFNE2xhd/mfOm5MTf4qVLbUeXrB6KDT8BRlPgmP9oj w==;
X-CSE-ConnectionGUID: gmFlgsTxQzaVU1KCuq60DQ==
X-CSE-MsgGUID: p5GPtUORSAuWM7kyk9o4Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44273637"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44273637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 08:49:39 -0800
X-CSE-ConnectionGUID: BPNrDynkQPCI+5gLfUh+uw==
X-CSE-MsgGUID: s9BSt0W4TGWDj3kIDsPmTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98840529"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 08:49:37 -0800
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
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH] drm/xe/vf: Don't apply Wa_22019338487 for VF
Date: Wed,  4 Dec 2024 16:40:58 +0000
Message-Id: <20241204164059.1366627-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
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
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 3d85899b9d41..d163f479f05d 100644
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

