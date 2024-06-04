Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7A9C27C50
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B5010E461;
	Tue,  4 Jun 2024 11:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADo6PRRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBF510E46A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499848; x=1749035848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MgyclBiUxtjaBKg+caMDYuJ3MvwjE//qkZQd7gM2eVE=;
 b=ADo6PRRFOiY1NRfa8jjGGt4iRk2JTST/O8M6Qpopj9Vz8ihlC1bZqde0
 0H4lTMHK/Nkn7DfPHepupHcjqcjzckPvdRhPBa2RfSHe2SDjYsn686yNF
 ZOBAt/ZnfabQIDfE18ryQtY8SdhpCVVX24BLekPiQ7lJIZ9SFMXKGQRz6
 hfLzNbf7lhGlE6ZW5RRxpiKazEdX2bztM4JkNyf9N4Syo/KolPShcLQsy
 y9u8mFn/ByLZm5Y+o/UgOJhNMmgVYI6JGzgbP/fM1CbySQ9d+KPYXpVyJ
 xJ/2yHSCGBxDykO52rBxEKu3c3HJ+RLrmH2Xq3bow/37DIihUESo/dx+n g==;
X-CSE-ConnectionGUID: AiwFaDi+Ttekyui4dhfBnQ==
X-CSE-MsgGUID: yZQxIgXbTmOzbHOa3aGogA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701861"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:28 -0700
X-CSE-ConnectionGUID: GZO0JQDkRq6b5hAcygsmQA==
X-CSE-MsgGUID: Iu94omtzS52loxCo0bqGAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669721"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:26 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 8/9] drm/xe/client: Check return value of xe_force_wake_get
Date: Tue,  4 Jun 2024 13:02:24 +0200
Message-ID: <20240604110225.29495-9-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
MIME-Version: 1.0
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

xe_force_wake_get() can return error so check it's return value
before reading gpu_timestamp value.

v3: Do not skip xe_force_wake_put(Himal)
v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
    Add a warn on for xe_force_wake_put(Himal)

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..0d6c7b813af4 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -264,9 +264,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
+			hwe = NULL;
+
+		if (hwe)
+			gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
+
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 		break;
 	}
 
-- 
2.42.0

