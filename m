Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0E4CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653E710E462;
	Wed, 14 Oct 2026 14:27:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D6010EEA0
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791988043; x=1823524043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B6fgQ96JvYH0ZLlBFlZEy268kXTFYWwiVdnUwLDkABY=;
 b=Dqe4yfJAgw4/It2VuJCAK0gzViP+ckxYWXZUvKTOQQmjrSjwvuzrNRbL
 Ot+zfO+hlMhTjrqNmLKxUrhxgPpWv82CZ6SJCdaOj6J0yjY2OPsm48mZF
 kXrT70YTRSiHElf7rzrpo2EacPY1Qd8WJpAPuTxifceXAsVnPBWTyf7yq
 +Jjh+CAlVQg5nLEDou+BLEgGHf+z5ZKlMRSYPUIck30H5wqi0C3FAz4QK
 cgke39M+FyZhCf0f+pEahi0nX3YJmBgeFA4bUbNwLiAKHQ2DgSfClwnx+
 BogSA7Tj8iJSFIoF0GEusnXbsLhvOlAE4DGe9snVKQlDy8zo/+IqR2suy w==;
X-CSE-ConnectionGUID: SHP4cRoiQj6dyVMNS9GJyA==
X-CSE-MsgGUID: noGC1l/BSuK6dfYlKWrjQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="738964"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="738964"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:27:23 -0700
X-CSE-ConnectionGUID: GZmlHeaKRG+2IQ0NlP0PaQ==
X-CSE-MsgGUID: o/QKP8+GT9WsUUjo0ge+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3203435"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:27:20 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v5 1/4] drm/xe/xe_migrate: Fix page tracking in access_memory
Date: Wed, 14 Oct 2026 16:27:03 +0200
Message-ID: <20261014142706.598490-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014142706.598490-1-jan.maslak@intel.com>
References: <20261014142706.598490-1-jan.maslak@intel.com>
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

