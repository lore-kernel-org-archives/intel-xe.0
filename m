Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FC1D6AAF0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 16:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400ED10E123;
	Thu,  2 Apr 2026 16:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bs6u11aF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B8410E123
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775147402; x=1806683402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UvsOd+ChoXvbVxzQ1xpLfTTyd9Bfslk9blSN1zYnC+I=;
 b=Bs6u11aFYQY+Ouq3GdL1B3Wz8rS8nzmcG3g7++sp1g/2aXsgxGE0FrlX
 93nYac2NiiBMEY9p9iIui7x5Svnm6tcvetY2kYUJ+PHsgMBqWqaTsjw2L
 j4Jk1lIEnWLIWfMEU5qFo8Hzd75VTWA7OgCnh8iTXefe4CtV2pX6gZuge
 hvGMXQ+J98M8OJ7vrEagIuljRKKeivTH5DfwqDG/ZoJ/Wsi/ZMTt5x9UT
 /eOhPlh0SmNPiivZ8AZO5HsdldvaT/DHi2MkKStx4ZBWFwgUz4bbXwdkP
 N9ZMukjUN9U+tIR81nxjAhmmcvoMSQ64xQWutjK9ETXu5c+OMMPVrpBLx w==;
X-CSE-ConnectionGUID: hg20If4rRK25kUF3juWifQ==
X-CSE-MsgGUID: 45GPU7CSR+2PlJGbyjZ48g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93605230"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93605230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:30:01 -0700
X-CSE-ConnectionGUID: jNwEPxCQQym0UPOHkkWBBQ==
X-CSE-MsgGUID: XwROro2MQAWeijhsjvhloQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226975427"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa008.jf.intel.com with ESMTP; 02 Apr 2026 09:30:00 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v5 2/2] drm/xe: expose multi-lrc engine classes in debugfs info
Date: Thu,  2 Apr 2026 09:29:58 -0700
Message-ID: <20260402162958.16924-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402162958.16924-1-x.wang@intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
 <20260402162958.16924-1-x.wang@intel.com>
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

Expose multi_lrc_engine_classes in the info debugfs output as a
useful extra piece of information for debugging.

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 490d7ef7e812..c9d4484821af 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -121,6 +121,8 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	drm_printf(&p, "has_usm %s\n", str_yes_no(xe->info.has_usm));
 	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe->info.skip_guc_pc));
+	drm_printf(&p, "multi_lrc_engine_classes");
+	print_engine_class_mask(&p, xe->info.multi_lrc_mask);
 	for_each_gt(gt, xe, id) {
 		drm_printf(&p, "gt%d force wake %d\n", id,
 			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
-- 
2.43.0

