Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B925C6FD1C
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 08:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B0610E190;
	Tue, 14 Mar 2023 08:59:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A0610E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678784347; x=1710320347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ee7ST0sXwYdwPUHZI3CGMp06ja63owyYUN1Y6Ws4Jdk=;
 b=QXfBTgNlZ8K8MHDSqauQyzDJZT67cjTnfOvk7Fn3ZG7EFjqgzwsQEtRQ
 9uvmIXRa9+ePB2vRzmsPflFKCcTioDxfsiQ0ea1jg2a9p2Y2hvfEWx9Nm
 UE67k+mN5XZbPNNuJxcZoA3MzvZcFL5bTeISviTrM8DYTFWLeVgoslDFS
 euaZLgMifiKM2v4iVfTskfWsAOlP69V4CYV28aF7dYC7E0D8EEau8PGba
 NXsqcFV3v3eG1psscQfB8ENp6AVRgQIdP9UXRE6RlCHtZoMNpAYiuyGOm
 nLxs8/iI9WWv1zfDGwwgNH2VplMa6ieHvl8eMLcWdEl9BmpquRUL7wqde w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317756231"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="317756231"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747922684"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="747922684"
Received: from tlambe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.230])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:59:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Mar 2023 08:58:37 +0000
Message-Id: <20230314085842.134239-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314085842.134239-1-matthew.auld@intel.com>
References: <20230314085842.134239-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/6] drm/xe: one more s/lmem/vram/
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Looks to have been introduced in some very recent changes, in-between
merging the driver wide s/lmem/vram/.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 1116e217ebc2..27cc31f022a5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -90,9 +90,9 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
-	 * of lmem which is not part of the DSM. Such reserved memory portion is
+	 * of vram which is not part of the DSM. Such reserved memory portion is
 	 * always less then DSM granularity so align down the stolen_size to DSM
-	 * granularity to accommodate such reserve lmem portion.
+	 * granularity to accommodate such reserve vram portion.
 	 */
 	return ALIGN_DOWN(stolen_size, SZ_1M);
 }
-- 
2.39.2

