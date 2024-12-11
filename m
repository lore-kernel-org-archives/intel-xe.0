Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B68E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 06:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106810E3C6;
	Wed, 11 Dec 2024 06:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="As+uxhzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D779B10E3C6
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 06:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733899347; x=1765435347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1J5tbUuMRR615IHC7TAg5mUhd3lbZoG0JM9XZkyDsZc=;
 b=As+uxhzDTOjQ5GF5n7XIIeFgqru4dAR5sj+/eOcKL8gAw6wlSc/nu71S
 8S81kUxyci6DB/B1xKzMYYgzzGsqKLTBdHcKY2s/XPG8oVM6PNf3M9aSm
 UIiB3NWSTXhxQ0QsPXVK0CTF3905WgYA7hRciWwZVlivw8QMhnqjuGqsM
 SqiCxKYGKB+ftCtuW/4rcMC05DFWtAx1qAJ7ZUNiD+1c4V4hBXCZ3fg+C
 IT62SGGl9bSpZqkjIYguxEa9GBPSoaJBS9X55vqAsB3o6oboEOKhY5qgs
 nt98KhOVwkMxFW9phhfBAruYyv9TaZ2XJFz1eVFXBn+qW6QZYCTPpJ8kd g==;
X-CSE-ConnectionGUID: tx4zOmCRQwOSjurCIL1uWw==
X-CSE-MsgGUID: IS0GZm1RT22UzavuLhCiUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44739295"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44739295"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 22:42:27 -0800
X-CSE-ConnectionGUID: JkCXEBIyQuOdPMOl2KNs2w==
X-CSE-MsgGUID: tnkNrzY3QEuXVfbQVYvqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126606000"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 22:42:24 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/3] drm/xe/vf: Don't check has flat ccs in bios on VF
Date: Wed, 11 Dec 2024 07:42:09 +0100
Message-Id: <20241211064211.781820-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
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

From: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Don't check for flat ccs from VF-level as VF does not have direct
access to the register.

If the BIOS disables FlatCCS support (a use-case that will nearly never
be used) and the has_flat_ccs flag is set, there shouldn't be
any functional impact. The hardware will drop writes to the CCS region,
and reads from the CCS region will always return 0.
For the native case, the flag is disabled if the BIOS disables
it to avoid unnecessary overhead in buffer object (BO) creation
and migration.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 56d4ffb650da..ec0ea9c914b4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -604,7 +604,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 	u32 reg;
 
 	/* Always enabled/disabled, no runtime check to do */
-	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
+	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs || IS_SRIOV_VF(xe))
 		return 0;
 
 	gt = xe_root_mmio_gt(xe);
-- 
2.31.1

