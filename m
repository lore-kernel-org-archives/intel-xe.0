Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3963BCDB470
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 10:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0050E10E5FE;
	Mon, 22 Jun 2026 10:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJ3boE6k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B0C89220
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782124519; x=1813660519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PIZuf7bxGrTSjkeG67xU9KQ3mn0FtV2JQ83W+7Txibk=;
 b=MJ3boE6kEQymAlcqqx8y7RnosyRjqEz4CSFdUWHxUZQ5wIeSdz3JDES5
 N2fUrVj04TKFTxuSmfXA95fmVSCrUrbt1iNM7+9McOJllCtKiEg8RBekz
 P1H6NNpPIjtmKXFSVU5Pds5yjYgnqOGZQRzvBOKCq2b1mXBqpnskmRQ/r
 lQEpezQGm0PXKjh62rBIKv4oTvZ/l7h2WV5cgoMQgyoM2i1IVNAnIGXsm
 7Y+/Az83wW9YvkBpXISa/brS6BE6TVVxuk28sHeHA8XQid0BALcVRRgGg
 hqEkRriSIwyzxUkdlF0eUAnvj26tqChx7lGNeTMPFoa5lCpkfwvtx62yl A==;
X-CSE-ConnectionGUID: A1ERLKc8SRKhzIW8cULUDA==
X-CSE-MsgGUID: IMB12LLxS3iEZyhNBsgJSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70365440"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="70365440"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:19 -0700
X-CSE-ConnectionGUID: SofGGtRRSvKFeKtJnApX+Q==
X-CSE-MsgGUID: uZgjbbHOTzyBo0aoNwfKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248046783"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:17 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 2/4] drm/xe/xe_migrate: Fix page tracking in access_memory
Date: Mon, 22 Jun 2026 12:34:47 +0200
Message-ID: <20260622103449.3335928-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622103449.3335928-1-jan.maslak@intel.com>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
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
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9218eba31d45..135d59f6e100 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2569,7 +2569,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 
 		buf += current_bytes;
 		offset += current_bytes;
-		current_page = (int)(buf - orig_buf) / PAGE_SIZE;
+		current_page = (int)(buf - orig_buf + page_offset) / PAGE_SIZE;
 		bytes_left -= current_bytes;
 		if (bytes_left)
 			xe_res_next(&cursor, current_bytes);
-- 
2.43.0

