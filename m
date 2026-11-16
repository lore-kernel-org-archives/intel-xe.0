Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB6F606A332
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HSgjcefs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B0E10F3E4;
	Mon, 16 Nov 2026 19:22:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D4C10E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794856949; x=1826392949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5QdPeOqoklzftuMBe4FRul5cl+QIVkDkgBgDwjIClU=;
 b=HSgjcefs6jl/E9/ZS1YtX6ZnJyw0FLk1zdTBIGI7nIYllB2FPmjRHqWf
 UWRnoI/x6BMIT4EUtdhZagNtZHluDyGhr/LsXVLo8WTID6Gt6TOUBt8aR
 XZ1NqsCZR9Jxdh0LUJ/Hi+0Ld3vwGl1t4M9Rne6IrEHYSUtaEwUdPhASM
 Qk04KXLOt7DCKrfGlw24ukvEVKQDMQoZYa4HRDv5sWyhSDYg4qqRLrmew
 ePVLl6D3z1x/NqjVuC+w39KgVdFkju/YoTt42hHfYFbAN8QpZgvZkSrhL
 KpNUzSo1iKCTFvLb4ITHR4eSoiogGZhH3sUkZm38hk0SJ0BhBZOqFO9FO A==;
X-CSE-ConnectionGUID: eynPAXTZR6yGH5Dv9kFv6g==
X-CSE-MsgGUID: uiLW5ZypRdicfSrkmHMrhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3712966"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3712966"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 11:22:23 -0800
X-CSE-ConnectionGUID: GsaydmqJStmPkPgD+I+KgA==
X-CSE-MsgGUID: cYovFHWtTDaTvBO+VzBYcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9642933"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 11:22:24 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: Drop redundant error remap in
 send_tlb_inval_ggtt_full()
Date: Mon, 16 Nov 2026 11:22:20 -0800
Message-ID: <20261116192220.3872267-3-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116192220.3872267-1-zongyao.bai@intel.com>
References: <20261115225731.3073489-1-zongyao.bai@intel.com>
 <20261116192220.3872267-1-zongyao.bai@intel.com>
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

Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 1a15ff652589..7460e6b53193 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -121,19 +121,8 @@ static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
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

