Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C443C77B7D
	for <intel-xe@archiver.kernel.org>; Sat, 13 May 2023 06:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C8410E03C;
	Sat, 13 May 2023 06:27:10 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF07E10E03C
 for <intel-xe@lists.freedesktop.org>; Sat, 13 May 2023 06:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683959227; x=1715495227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EJvDgUPsJQxOFEZha89OKZkj3LeLmcm0vmBsb5tYpgA=;
 b=CP6iGg/BUYeE93rHp9Z3a9CHws46SJBmOe2aeABh7coXEHAy3hTWoY+3
 qvCJ6Kxin6RvXOzhuHQzrXFCfmjQu/PaWM2QcPu6fmdhDOkeWgxKwBQ6Q
 oLzMc7TJdena0TGwRnY6AWWZE7d73kapmfuI3W6h4OHw5JA6pG8bEw/jG
 spCKRhlixUfFo7hMEyb0Mxpej0Tj+KlblF4v5NLmSFvhfmy4L+inZY0Po
 kAaClCiHYPQoPgYsrX80vybUHOob/blelO6JRMkRY11RIhm2wUs7IhJak
 Stf9dI52uIQzeakChIqO7ktD7RSETAWl/QjTZWEo05DSAyZotJq/6hiQL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414311160"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="414311160"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 23:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="677903377"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="677903377"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 23:27:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 23:26:32 -0700
Message-Id: <20230513062632.3258063-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/display: Consider has_display to
 enable it
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It should check CONFIG_DRM_XE_DISPLAY not the non-existent
CONFIG_DRM_DISPLAY. Thanks Christopher Snowhill for finding the bug.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 18d58d916fff..03bd74f5347e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -538,7 +538,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_DISPLAY) && \
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) && \
 				  enable_display && \
 				  desc->has_display;
 	/*
-- 
2.40.1

