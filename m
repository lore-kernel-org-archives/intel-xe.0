Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877E5FEC119
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 21:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE9F10E166;
	Tue, 24 Mar 2026 21:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmXd2uXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D579D10E166
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 21:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774387431; x=1805923431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=szIXG0bJJHNWn1AOJcwVV0Pn8RmlbjPBp9wIq2naTbU=;
 b=jmXd2uXmsv8vu56RyqKzuHOWgVJbm+jYn6KMwSZZjZ482jcECPXw8mt0
 qLPjGjlJFGbTJeCVEikFJnYpVsDf09/UFcL3LYnRNe3fW0Dt+b/hyk5RD
 pat2k8rdLhOyy7rGRQz5YMmUycfDx2HB8zp3XgmIl3x8coRz4V49dxUfs
 kmm8uihZk/TybCqtOkwMQF7SMDcgLpm4hl6Q+4ClB/rRwZxQALRz3XpIG
 EasV5alpk0xvxsIlSzM7sx3FheZCOAIHQZvmGie3CGBmTunqcWzLCCBC+
 ihCgDdIgPUeGUjcR7NjyvYDAFit4sQOHNgpnqgFk6dfTLoK+1Wq8DBFVJ A==;
X-CSE-ConnectionGUID: 00Wi+AsWRRiEtDwjvTf8kQ==
X-CSE-MsgGUID: +ZCHFnYWTd6gXM2h1KYINg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="92800657"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="92800657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 14:23:51 -0700
X-CSE-ConnectionGUID: 2j+aL7ZQRYOtFRXZZxYnNA==
X-CSE-MsgGUID: pluBSSR0RZylCdAIuk7Jbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="226110417"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2026 14:23:50 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH] drm/xe: expose multi_lrc_mask in debugfs info
Date: Tue, 24 Mar 2026 14:23:48 -0700
Message-ID: <20260324212348.4142888-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add multi_lrc_mask to the per-device info printed via debugfs
(/sys/kernel/debug/dri/<N>/info). This value indicates which engine
classes support multi-LRC submission and varies across platforms.

Exposing it through debugfs allows userspace tools like IGT to query
the actual kernel configuration rather than hardcoding platform-specific
values in test code. This avoids duplicating KMD logic in IGT and makes
tests automatically adapt to platform differences.

Cc: Daniel Charles <daniel.charles@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..32f03b2777d5 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -88,6 +88,7 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
+	drm_printf(&p, "multi_lrc_mask 0x%x\n", xe->info.multi_lrc_mask);
 	for_each_gt(gt, xe, id) {
 		drm_printf(&p, "gt%d force wake %d\n", id,
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
-- 
2.43.0

