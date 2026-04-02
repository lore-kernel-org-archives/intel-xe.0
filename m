Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82867D6AAEC
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 18:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4178E10F09A;
	Thu,  2 Apr 2026 18:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyCwIeue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A12010F064
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775153165; x=1806689165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UvsOd+ChoXvbVxzQ1xpLfTTyd9Bfslk9blSN1zYnC+I=;
 b=VyCwIeueM+SO0xrxWLyQJdGitet1cdAJICYOtxZUKevJg60vGdJ6Sw/V
 dJsV7hMDMnr0lapOD5mOfYSWpAYcg/irh0eM0tRM2yEEtG1++c1CZnP9V
 2q79crM8m/vjnuBqFLBY4Hu1oEFuPjN90sHXP8lvJT3CFTXuT/90erXYt
 0mP9liTnpP4CXyFjz05Xv2tEo6RYc7HgGvnBEX97zZT/s0g6lunVxI+Bc
 v6mvy9zNNjNaxk8dIRLCg1Y50TjxJnToSDJVY/MttxMZ/N2N6CEqxwx+g
 lY2k1lX5vgPlRi+ZjxdWRpG/vDRp2niUuCku15uTU1oSXEsP5u2qRG5YQ g==;
X-CSE-ConnectionGUID: Zgl4V7vTQIipa/n/DLkx/A==
X-CSE-MsgGUID: NViMMImdSNCBlWPri04e3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76100740"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76100740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 11:05:57 -0700
X-CSE-ConnectionGUID: fyrxR6iyQLm+q2q0M8jzqw==
X-CSE-MsgGUID: dVbmNVIvRZSLoHfMq0eIOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="257527206"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa002.jf.intel.com with ESMTP; 02 Apr 2026 11:05:56 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v5 2/2] drm/xe: expose multi-lrc engine classes in debugfs info
Date: Thu,  2 Apr 2026 11:05:51 -0700
Message-ID: <20260402180552.24121-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402180552.24121-1-x.wang@intel.com>
References: <20260402180552.24121-1-x.wang@intel.com>
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

