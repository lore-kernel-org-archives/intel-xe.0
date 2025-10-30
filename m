Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAA5CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776AE10E9DA;
	Thu, 30 Oct 2025 15:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjQXS90o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F79410E9DA
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761837071; x=1793373071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dbDlcOFlmXtEx0RHLQTN5p1+KfS5QOUCyuXAmZy0nvw=;
 b=QjQXS90o7DgaTF0utdAc5toMhc4NHLf5XYqBtZGCJ21DLQkxx2p8943p
 PRImiKEiCWIKQelgA552H663I+jNVDATU+WrWE2IFy6zuX1Q0ujm5605l
 V53iQLvt7exmQ5p/psTazBbbQrnocqfHezuPE+04No7gIrXjcwK9ja2P/
 XhzJtEK5wRL7lPvYO7ghQdT71OcP+mxRAZv7KBvbJwQ/iNWZ+1w3GazWH
 VnzdLipwj2MPRLNUJHyh+2Nz+6s5hl0qy9IvDSQzZ8ivnLWSykyQoY7B+
 nBrvRX+lwbfcGfVset2aoLaZChy9N/VOYumoK0BR2aCL28BOIVrCxk/RC g==;
X-CSE-ConnectionGUID: I2quXdUxRBWpdB0YIrcV2g==
X-CSE-MsgGUID: 0XKGNazyTzWnOKkeTxOh1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89448435"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="89448435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:11:11 -0700
X-CSE-ConnectionGUID: kCzBasDjSsyXFWhYgyH/mg==
X-CSE-MsgGUID: 0+RJU6OvRIaHKgjeFMwj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185639004"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:11:10 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Date: Thu, 30 Oct 2025 20:41:25 +0530
Message-ID: <20251030151122.3021436-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
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

