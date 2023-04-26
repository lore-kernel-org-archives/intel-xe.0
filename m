Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD618C77B78
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 16:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804CA892F2;
	Wed, 26 Apr 2023 16:48:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B36892F2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682527725; x=1714063725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5OH5FhHQrli3oJ+i8m132Fz+2Dqe5T2mq1Vsf1bq6zA=;
 b=MZq6JSjcWA7/j6kSSw6IKUKwgMOhDeClmfV93oMaa0o6Nb0HVCJwuFPQ
 ptmWCYWbjmBxkE1KriN1bPAkTpnVK9wruj12xnAtslokY0418lNkyaDOk
 BgoU8HeWYASwY8jMYsTPsytaC8mvqZXwNT+Xx7Ebm7hYH3XH2WaaEUXsG
 C6L/xWTsbzIAkPvVQWjmK4dhQ3dC8N4rrYzTU9INehZlAtfljnPaM359i
 1m/nE8OH0pKuA/HqABwR58FpckP5UYXRXCkhTyTr6sMLgJf7jf1XhjEE4
 NOWhc2JngfzTHWfxTF0NimeW3zZ0xdPu2bs1BrT8cliMBzhdb+edZSaSL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="345928811"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="345928811"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644317930"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="644317930"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:44:19 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 09:44:10 -0700
Message-Id: <20230426164410.48171-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Limit system memory size of half of
 system memory
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

ttm_global_init() imposes this limitation.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 5b0674bbb8ed0..3e1fa0c832cab 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -105,7 +105,10 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	u64 gtt_size;
 
 	si_meminfo(&si);
-	gtt_size = (u64)si.totalram * si.mem_unit * 3/4;
+	gtt_size = (u64)si.totalram * si.mem_unit;
+	/* TTM limits allocation of all TTM devices by 50% of system memory */
+	gtt_size /= 2;
+
 	man->use_tt = true;
 	man->func = &xe_ttm_sys_mgr_func;
 	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
-- 
2.40.0

