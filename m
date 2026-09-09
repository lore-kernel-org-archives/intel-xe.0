Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4617C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBA510E113;
	Wed,  9 Sep 2026 06:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nN5TARcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91A810E315
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788934752; x=1820470752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EHnHhgOJ/uqfEGx+y7aLkBws6shBq+9YjEw/Utop9Jg=;
 b=nN5TARcUuVZxrbEdlImvQu/mYUpuCWqb33Isnfb13+oEA8BzTc5FysLi
 jdWG99lVWcuPby8NQOS5C0WIS/QL9lfsy6U2uz/So+yjAlynQ1c2FYmbd
 SOvCmlYocu26zEhcLGyxa+AIg1AbAaJ0sTv3S74q/SUfNvzfCtZi1kfB1
 h7gDjRqfUAkFMTrCqxYuujlLO3A/JV7da1BYh4EJ9445kKyH2uf8ikWWY
 Y6dzZp1Bi+n0+cdPEVzW7Tv6XERafi69Jc1O5hpbZXB3KHLShYhPpsDub
 sZun+KVGJwbUq8YHl8FnWDYKIzweIOalZqbYCsKGl7oBm9h5YneuCenS2 g==;
X-CSE-ConnectionGUID: I2fejsIKQDuM8c0haKZsJA==
X-CSE-MsgGUID: u6Q+2omcQ+KHKzlSe2PQDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89220583"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89220583"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:19:10 -0700
X-CSE-ConnectionGUID: kjNP6HshStG4RlHlqCqg3w==
X-CSE-MsgGUID: eINdVuCRTUaIgcUJccTSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270733918"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:19:08 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v3 2/4] drm/xe/xe_migrate: Fix page tracking in access_memory
Date: Wed,  9 Sep 2026 08:18:43 +0200
Message-ID: <20260909061845.4048047-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909061845.4048047-1-jan.maslak@intel.com>
References: <20260909061845.4048047-1-jan.maslak@intel.com>
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
index 2e5827aaf99d..c40e0cc7499e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2588,7 +2588,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 
 		buf += current_bytes;
 		offset += current_bytes;
-		current_page = (int)(buf - orig_buf) / PAGE_SIZE;
+		current_page = (int)(buf - orig_buf + page_offset) / PAGE_SIZE;
 		bytes_left -= current_bytes;
 		if (bytes_left)
 			xe_res_next(&cursor, current_bytes);
-- 
2.43.0

