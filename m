Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6073CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 12:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790AB10E3C8;
	Mon,  3 Nov 2025 12:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldWM6SRO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A77C10E3C8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762173086; x=1793709086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1LLeIaLU8eEwM/WAxsx8MVMqSyPC3JhzeA8ZYM/mWOc=;
 b=ldWM6SROlVx27kffs64g8+KFFTwcoX+SnchiTPTVIzAeTuY+AVG1Lru8
 6SgdEF6YzyBZDw4UwCxR19Txv9R9pfwG64TPaSCg9rs/LLRuuVkNjY7hq
 RKYYbEvHXWfnJLH/e+75UqT85zHMVMVuZoe14/QcRLI/pG4oJhKOrUxQb
 f6Q67v2aQ/hJ81BmO4H2PIiNn+KMy+4zsRFWSv9uFaLw8NUgbVidRxb4Z
 OXNvgJ+NxOxyoC2n1zUM7/VwPHu1lV+xPKZDxyPuLkuTtHmmeWenAbClo
 xQF6TTzFpBdg5Xr1QWrNHGSaDQS3Vwe1UR+izMFgjgUkKlW/dPC2nKasZ w==;
X-CSE-ConnectionGUID: lZKDEjkSSZCXFByn8aLyTg==
X-CSE-MsgGUID: +XBXsbWdSraDcUwwGDHmTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64397365"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64397365"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 04:31:26 -0800
X-CSE-ConnectionGUID: UibZPIcYRsSy33fgGfRwMw==
X-CSE-MsgGUID: wH5u55XDTReYoiR1tsB/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187171977"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 04:31:24 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v3 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Date: Mon,  3 Nov 2025 18:01:47 +0530
Message-ID: <20251103123144.3231829-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
References: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
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

Cancel and wait for any Dead CT worker to complete before continuing
with device unbinding. Else the worker will end up using resources freed
by the undind operation.

Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Fixes: d2c5a5a926f4 ("drm/xe/guc: Dead CT helper")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e68953ef3a00..536433b061fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -199,6 +199,9 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	cancel_work_sync(&ct->dead.worker);
+#endif
 	ct_exit_safe_mode(ct);
 	destroy_workqueue(ct->g2h_wq);
 	xa_destroy(&ct->fence_lookup);
-- 
2.43.0

