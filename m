Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F5CC76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 16:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36C310EC63;
	Thu,  6 Apr 2023 16:28:53 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBA310EC63
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680798531; x=1712334531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfWZ8CIr+OEh6EITWX6Ni24LeC34Lyx+xdpEXe4H1lE=;
 b=GKNLBo0/WOT0I7/eAxwZI3ZzwWejKP7Bn1hPNY7ePCh2l++Ag4FR6ZuD
 YTkhN+uONSpZqTwS5kenD39/aYhCh3Fxxa8jsdPCc/mOPQcx3o1wlgv1q
 aeZIr/pGibnKdQXIjsK9wLOTDw32OkafSbrpYuIVfwV0shGiJ7/2n3+xQ
 EhC8AvDlqhmAGMT6MPaKC5V65vno09Pte/rZBFLee45C3U/ePXCVQ0JtF
 tGwwa9UDs8ueuP6Qe1ps+ZTpNdS4TYnaqeHy1MiERDpoHL4kTpfgMKS+i
 4nuC8cCwEiWRm4BXhlq7t4hMw1SRSz3Ub9WPsMWCpLO3O3Tm6+Bg9cuyv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340272341"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="340272341"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 09:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664529887"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="664529887"
Received: from tpyra-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.243])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 09:28:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 17:26:25 +0100
Message-Id: <20230406162625.320387-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406162625.320387-1-matthew.auld@intel.com>
References: <20230406162625.320387-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/lrc: give start_seqno a better default
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

If looking at the initial engine dump we should expect this to match
XE_FENCE_INITIAL_SEQNO - 1.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index fb8c6f7d6528..ae605e7805de 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -700,6 +700,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
+	map = __xe_lrc_start_seqno_map(lrc);
+	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
+
 	return 0;
 
 err_lrc_finish:
-- 
2.39.2

