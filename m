Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E76CFA0C20
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 03:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA5A10E670;
	Wed, 15 Apr 2026 03:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apKE3XO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0774610E66E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 03:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776224137; x=1807760137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLAiZFqt6uwWWAXS4oOoctTWgtk3TfUW8+MAD1onYfw=;
 b=apKE3XO6pn5dU+fdvaoo9PgB95YOkE6+3yyTEm/RsWSTxBVDkOaAGIja
 C6PZbwS1jzcyQpt71ZK1FMiIKPWT+pJI9DMQNL/aFu4zln2wYVzsKO0P8
 4qR6KuCpP7XTrc1v2Bt7MrCUb18eU/yIpPVzOWsG0sHTRnjCi3jHjUvHN
 a6gGNGLvZo0MDsoZjYmq6frYeETkFp73pMGrhvCrZLbcypwdQSbBuppEg
 a2LExhHEXM7cukfRxze2l4TLELMbDx/iMd+t6BNOgyblnq3XE1dR9Oyx8
 nlH2NNixcQJWbjgkQaj8p+ofeg63CofltzGYrgRRq7zECU2TpiScigu9u Q==;
X-CSE-ConnectionGUID: jT/q2lbbQyuTxLOdQMakHg==
X-CSE-MsgGUID: cnZEXnwZR4eiKVKKJ2j3dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76225344"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76225344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 20:35:36 -0700
X-CSE-ConnectionGUID: IswDt/7/T6C7J4tzUIMaPw==
X-CSE-MsgGUID: FG14qVRAQreBBVHmhhsjGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="232033290"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 20:35:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/3] drm/xe/oa: Don't whitelist OA head pointer registers
Date: Tue, 14 Apr 2026 20:35:31 -0700
Message-ID: <20260415033532.789954-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260415033532.789954-1-ashutosh.dixit@intel.com>
References: <20260415033532.789954-1-ashutosh.dixit@intel.com>
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

OA head pointer registers are not used by UMD's and do not need to be
whitelisted. Only MMIO trigger, tail pointer and OA buffer registers need
to be whitelisted. OA head pointer is sometimes provided to the
WHITELIST_OA_MMIO_TRG to have the correct register offset alignment for
RING_FORCE_TO_NONPRIV_RANGE_4.

Fixes: ed455775c5a6 ("drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index a4124f00c467f..09dcb6a422797 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -90,9 +90,9 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
 	},
 
-#define WHITELIST_OA_MMIO_TRG(trg, head) \
+#define WHITELIST_OA_MMIO_TRG(trg, tail_buf) \
 	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
+	WHITELIST(tail_buf, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
 
 #define WHITELIST_OAG_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OAHEADPTR)
-- 
2.48.1

