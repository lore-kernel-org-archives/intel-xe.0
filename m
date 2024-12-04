Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ECCE7716D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 21:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D285210E2C1;
	Wed,  4 Dec 2024 21:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNk6IDqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E577310E2C1
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733348835; x=1764884835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jA5LHzErPwAfWK7eyxNlm68vjWtVI89o3vDkO3V6Li4=;
 b=kNk6IDqkxNjiu4bknTDBFQP0XJLVopE6OvVwIPzwooaaQ+XIBhkPgUOC
 XQcI/yMDhYiVY5qTr/vXgn28hsnyZzZgmyuysm4XIFgCREf5OXjOzbztp
 C0Vgms6H7F5yaP9rPCzBvHqKE0IAsjMJmVehcEbb6T/JlID5BV+WttVuu
 n4SKbNiNuv4E/emN06fE4XrHUL5qpisphLsrMFhMEZiSFLV4egoLPbVmL
 KKhkWQsuoiFqbVOxo7qZ+MtnL+nPqeQBoMlwk+wfM1oncjvRDHVPSm/4v
 Zfo1VQPZlqk+8SS1i1XHV86R93eRRpMlZs5pT4nhIRSS53BFuLqQZDhN6 Q==;
X-CSE-ConnectionGUID: whckPHSxRMCdWqcMCBwTZw==
X-CSE-MsgGUID: IVoUemYGQHeEz+z+K8sOJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33558003"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="33558003"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 13:47:14 -0800
X-CSE-ConnectionGUID: 4qDg6l5uSzq/56AkIrDmWQ==
X-CSE-MsgGUID: TYo1ktk4QIGAa5PwTk9WCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="93967203"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 13:47:12 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: Wait for migration job before unmapping pages
Date: Wed,  4 Dec 2024 23:06:05 +0100
Message-ID: <20241204220605.1786340-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

There could be still migration job going on while doing
xe_tt_unmap_sg() which could trigger GPU page faults. Fix this by
waiting for the migration job to finish.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 73689dd7d672..40c5c74e9306 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 out:
 	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
-	    ttm_bo->ttm)
+	    ttm_bo->ttm) {
+		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
+						     DMA_RESV_USAGE_BOOKKEEP,
+						     true,
+						     MAX_SCHEDULE_TIMEOUT);
+		if (timeout < 0)
+			ret = timeout;
+
 		xe_tt_unmap_sg(ttm_bo->ttm);
+	}
 
 	return ret;
 }
-- 
2.46.0

