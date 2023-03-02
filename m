Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72529C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 01:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D01310E35A;
	Thu,  2 Mar 2023 01:35:01 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429D010E366
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677720899; x=1709256899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6qvmQ6IBq+/MeoqWDIPfWUo13XmORdeYm5hsbhA2ezM=;
 b=QRbJ4q6/Dd3/AImo3SrQ7WfsK4msDUhT8AjmE8hGgXFaR6DDrQmcOANk
 rfRP/IzLrCKGpavQc4qQcC4Yv4HqagRL8tDDSmYZDBCZw58Vs7//wSq8m
 DLskGg4XewXqcma+x6jnnBSoSebVNjalvj0kUc4tlojlAs8IbLWci4mkY
 APbVy3aIag2EkcaX6cWtzHsM+gXi6cknJ1Q60iIBeUwduS4e/HqC+Dve0
 w7SJg51eC5BMzBT2K/WB10Y/309VcEngCgoczHC8epMMrNQobUj7FOblx
 zMh2X6xkL1heZ/qkmKq4PWASVc7ztnXh8ICycB25Uo79LqQEov2+1icAt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397148698"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="397148698"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798635050"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="798635050"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 17:34:06 -0800
Message-Id: <20230302013411.3262608-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302013411.3262608-1-lucas.demarchi@intel.com>
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/7] drm/xe/display: Fix return code for deferred
 probing
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
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Return negative EPROBE_DEFER to be propagated up the stack for it to be
correctly handled.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 6e7b6cfce4d9..80fe181e5fd9 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -37,7 +37,7 @@ int xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver)
 
 	/* Detect if we need to wait for other drivers early on */
 	if (intel_modeset_probe_defer(pdev))
-		return EPROBE_DEFER;
+		return -EPROBE_DEFER;
 
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
 	driver->lastclose = intel_fbdev_restore_mode;
-- 
2.39.0

