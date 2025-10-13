Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F5CCA476
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 08:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B98C10E3F2;
	Mon, 13 Oct 2025 08:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXfu4piV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E35710E02F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760342947; x=1791878947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=omdVBjkhNcPjzgjLNtsgzVRe/MowfXoiNnpYmQCZ4Y8=;
 b=aXfu4piV26P2xfePfmUwhz8+UCfqOxcroN0gIlTv68FfhGczu9jRG1Q2
 2BIGdjED/3Nhf/rX2fbayUDrScAlXgM0D3zpVkCD1TxFRGMSEqC7tHpU7
 9xOMoiMJ0ss8ASzvPjuI/tC/Zd7Jg4xwTfVnkehAT/T+5b3zv+9mqeJLo
 vGwoclpoOpMdvjYyFujzpMYQSrmA363dMEpgNxATBlkRv1dRhLPbYanHq
 Dsfe+rZ84fcLTLtsqxjYRU0e8aSHfJAE/ZuObCsSZtkLUGtUx0hrlkIYn
 3rxu7OAmom32ZFBSDa/t/51C4Z0YQuX3CERO6ku27JE9iPVB6NfXdNbvT Q==;
X-CSE-ConnectionGUID: VP3u5YVGQIKVts8EeGLpFw==
X-CSE-MsgGUID: /7qhJ3gMQe+xgE8MqFj7Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="87935135"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="87935135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:09:07 -0700
X-CSE-ConnectionGUID: yPAPSwewRKKCUpI6C1aQcw==
X-CSE-MsgGUID: tySu/EIfTBSlDMmKqxIp1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181965893"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:09:05 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Date: Mon, 13 Oct 2025 13:39:03 +0530
Message-ID: <20251013080900.1507609-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013080900.1507609-4-balasubramani.vivekanandan@intel.com>
References: <20251013080900.1507609-4-balasubramani.vivekanandan@intel.com>
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

Fixes: d2c5a5a926f4 ("drm/xe/guc: Dead CT helper")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 47079ab9922c..d1a994c5ad02 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -197,6 +197,9 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
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

