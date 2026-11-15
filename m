Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0FB606A323
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 22:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBwgkEEZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E11210E031;
	Sun, 15 Nov 2026 22:57:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7910E031
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 22:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794783460; x=1826319460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8ZGKj9KetaU2SFiwgCBWnNOaPoVhcBw/i5HhNlS+78=;
 b=NBwgkEEZXP0Y9eUzQgqkDklfYVyxvkAKR2Gkj5pu9D6Vt9uxUlCTbLzi
 WAv6zYpbCvccBlwMkgK+a1j1RV7C9TYN7BU3zEDJJbwjdX0a5MAvGSncI
 sKUXjTdQJ5LmDGK5rX7sxe3svCGT8HI3cs/wWd35VGc9fkn5Scouyz3p4
 XyGJCYI8aIzYkh54I3zJovPyFgwdfBzNnlbHu092NzZsXy7/HYm5qzfLt
 TiKdgBGX5KnIdDLwf9EOHWT2YaMHEhWd7qgDtrzhISW1/uRAmNWcSD/Gj
 oQVqZXXVSjkzZ92FiJIr5UXqQinfQnsx+NKl8O4lpqRNon/Y67PBfmvLF A==;
X-CSE-ConnectionGUID: jHr7VGISTumSQbKsITxBHQ==
X-CSE-MsgGUID: S5+G+9qwSgOuYxnKUWAseQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3432830"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3432830"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 14:57:34 -0800
X-CSE-ConnectionGUID: K/SYzUrPSJ+IoAq9bhQ7Vw==
X-CSE-MsgGUID: vfpUWKI5RTi/ybvvLKAOOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; d="scan'208";a="11298877"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa013.fm.intel.com with ESMTP; 15 Nov 2026 14:57:35 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Drop redundant error remap in
 send_tlb_inval_ggtt_full()
Date: Sun, 15 Nov 2026 14:57:31 -0800
Message-ID: <20261115225731.3073489-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115225731.3073489-1-zongyao.bai@intel.com>
References: <20261115225731.3073489-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

send_tlb_inval_ggtt_full() remaps -ENODEV and -ENOTRECOVERABLE to
-ECANCELED. With the previous patch both cases are handled elsewhere:

 - -ENODEV (CT disabled) is mapped to -ECANCELED in send_tlb_inval(),
   which is shared by all GuC TLB invalidation flavours.
 - -ENOTRECOVERABLE (wedged device) is treated as "undelivered, report
   done" by xe_tlb_inval_issue() since commit af14e3705345
   ("drm/xe/tlb_inval: Treat wedged-device invalidations as complete").

Drop the special case and return the result of send_tlb_inval()
directly. No functional change intended.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index aa7436a1d1db..066ba585ace6 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -131,19 +131,8 @@ static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
 		seqno,
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
 	};
-	int ret;
-
-	ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
-
-	/*
-	 * send_tlb_inval() may return -ENODEV (CT disabled at cold boot) or
-	 * -ENOTRECOVERABLE (device wedged); nothing runs on the engines in
-	 * either case, so treat as cancelled.
-	 */
-	if (ret == -ENODEV || ret == -ENOTRECOVERABLE)
-		return -ECANCELED;
 
-	return ret;
+	return send_tlb_inval(guc, action, ARRAY_SIZE(action));
 }
 
 static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
-- 
2.43.0

