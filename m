Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3692CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 08:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8555110E8DF;
	Thu, 30 Oct 2025 08:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Be91W5MR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBCF10E8D8
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761812784; x=1793348784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dbDlcOFlmXtEx0RHLQTN5p1+KfS5QOUCyuXAmZy0nvw=;
 b=Be91W5MRodj2HEjoiLSknRmG63HIGv/hTm2N2BkTq0iKdHzUXFByluhl
 rJNuHBupGrFr4RNf2uNueQ0HRdE0lQuwqRyKrCimgK0r/4gsA+P85Q4O5
 Hrr86Mirtfssn/OUEqcV0XSoW+WVV0fSQUOyUuicJZmeYOJC0RpY62IHE
 5w0ZphSmZTfhoE0Y7nnmudK7mN2EJtmfDKrzxYWu8ZA47/AxAI8W7KkOy
 UPEk4pMPUsF3rOiex2KGh/h6coRmiYAV66bWHueIs12N8rJAm64w7vjyR
 NHn7EIKVx+cAgPjjsAF8KPJiL6K/vdBGKgCjrpNlvAPqXH69S4oGyS03a g==;
X-CSE-ConnectionGUID: DbzStkpMQR+xBrtV6HJZrQ==
X-CSE-MsgGUID: swGuZG1ZSbWrN5EzYO9jrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63832129"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63832129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:26:24 -0700
X-CSE-ConnectionGUID: 4pyz/lZsTO61iZ76yqVweQ==
X-CSE-MsgGUID: YwZpIgz6QbySmu8HIuPzpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185981861"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:26:23 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Date: Thu, 30 Oct 2025 13:56:41 +0530
Message-ID: <20251030082638.3019345-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030082638.3019345-4-balasubramani.vivekanandan@intel.com>
References: <20251030082638.3019345-4-balasubramani.vivekanandan@intel.com>
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

