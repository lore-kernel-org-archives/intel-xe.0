Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D300F109878D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 14:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD7C10EB04;
	Fri, 20 Mar 2026 14:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dze5LHMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED0B10EB04
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774018337; x=1805554337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p8eBrg3v45Arn20lBUBBi+aeQjxQV6uckfhkEBTP6GU=;
 b=dze5LHMJ+Be+TR7ZVdEqCPxBezGAnR/21DdaTXEIJgpXoOLGYBxfJ3eR
 5ze2yWywlcTCHodc+vs8Dts6kYPF/NvUCMwyZLMV0tBAK1MKha4XiyW6W
 iqEingpnV/gpM0HlhfUlEi0KpwWlyhXCD7FZAlmMa3JZ57QD1mml0CfBG
 3E2h8hnFLfKZBw4cgDGTS3tzVita8Ul6PFKEC6wGmJrSa1MG+eg8ep4tf
 n48aGn+RpgwQ+hvT0JJCufgIktBPYPQZbK77a0DhkdgHz4SH+8HHOT4vy
 PPwEp6S2rQ++Efl0xHP065rNkH6WgW9JzhwGB+ns1ltcRomgvTcbCBFcY Q==;
X-CSE-ConnectionGUID: HK/u7nLJTqyAqzVNJzsShA==
X-CSE-MsgGUID: rfanx/NBRRaHYSop3qIANg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75222247"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75222247"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 07:52:16 -0700
X-CSE-ConnectionGUID: JHzQLNb7QSCvWL3a6d00ow==
X-CSE-MsgGUID: 8Wj8oaicRK6K6pxYnSJ5Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227429366"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa003.jf.intel.com with ESMTP; 20 Mar 2026 07:52:15 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Raag Jadav <raag.jadav@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v1] drm/xe: Fix confusion with locals on context creation
Date: Fri, 20 Mar 2026 15:57:33 +0100
Message-Id: <20260320145733.1337682-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

After setting a local variable, check that local value rather that
checking destination at which the value will be stored later.

This fixes the obvious mistake in error path; without it,
allocation fail would lead to NULL dereference during context
creation.

Fixes: 89340099c6a4 ("drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c5cfd8f75a94..77cd57788837 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1607,8 +1607,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
 				       ttm_bo_type_kernel,
 				       bo_flags, false);
-	if (IS_ERR(lrc->bo))
-		return PTR_ERR(lrc->bo);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
 
 	lrc->bo = bo;
 
-- 
2.25.1

