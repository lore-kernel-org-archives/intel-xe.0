Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D30CC6B2A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 13:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E77D10FF2B;
	Wed, 14 Oct 2026 13:46:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5210FF21
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791985607; x=1823521607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B6fgQ96JvYH0ZLlBFlZEy268kXTFYWwiVdnUwLDkABY=;
 b=jOfpoVyYRNoUaA+3eAL7slvismdNbcx2sJBIPg+gdoc+jakhQOCL4/5d
 jdUjAyCkwyQjupmxi0Yo5kX4haWI7FXyry79Er4pt1KhwpxLaWPXFBKPh
 W5Yy0JeEAF2NvH852x32167Rq3q8KGQwM/acVff3+vXpIHYkCJrH0uHEp
 TU5Sl7v7oM084ek6SADCF7JNSPBObKc3/T+1wqKqRlFjcG3YLHqxH6MFJ
 puxW23+CSoAvr5nmDQoSUQBGXEDFcLImudnnbsnuhiXM/KsTovOmIQe/w
 dxLAiS7ejVdToZGjViEJ+S7fR61fOJrAV2EdLWgwvDF9fjd0pv/id/Zfk w==;
X-CSE-ConnectionGUID: Zjsrx7ROQKSNMm/7ZCNUcw==
X-CSE-MsgGUID: 3IJWOT9vSNOsmPqg3gDVeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="617463"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="617463"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:46:46 -0700
X-CSE-ConnectionGUID: J9bUDUoZS6WGB4gi4C2DKg==
X-CSE-MsgGUID: ORvPMWuqQCiSiW/cBpb7YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1539991"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:46:44 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v4 1/4] drm/xe/xe_migrate: Fix page tracking in access_memory
Date: Wed, 14 Oct 2026 15:46:31 +0200
Message-ID: <20261014134634.582314-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014134634.582314-1-jan.maslak@intel.com>
References: <20261014134634.582314-1-jan.maslak@intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

xe_migrate_access_memory() advances the pagemap cursor based on the
current page in the CPU buffer.

Include the initial page offset when recalculating current_page so
subsequent iterations continue to index the mapped pages correctly.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index fffb3eb6c76e..3711d4542ad3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2563,7 +2563,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 
 		buf += current_bytes;
 		offset += current_bytes;
-		current_page = (int)(buf - orig_buf) / PAGE_SIZE;
+		current_page = (int)(buf - orig_buf + page_offset) / PAGE_SIZE;
 		bytes_left -= current_bytes;
 		if (bytes_left)
 			xe_res_next(&cursor, current_bytes);
-- 
2.43.0

