Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2D810FCAEA
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 21:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB5210ED74;
	Wed,  1 Apr 2026 21:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hk3Baq/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3664E10E105
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 21:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775078803; x=1806614803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xyJiojosWhiRZ3ySd+6Q6FBKjcrffqHjOV8mjhPnuEk=;
 b=Hk3Baq/zsYU2uE5gtzjPJqld8KyCuWrRm9yVifIuiHakUSboCm2eQAMn
 7yXeFCP/AGzENj42H98Kc3EaLlxttm6njk2yAIW4UkZPFVVrORfntGglq
 S9s5KnRqM+G4Es+IMJoyjT/BhaGqQa7fsr4Pm6SVRzzY6gJ1wqovKvK//
 NdWUBYwq91XJX+ORQCo8Cnk/M9fDBxKaye8Yoj9zBW+ZPel8+hA9aVoCy
 yIv/3UjrScb7xBsaZQOi3wykAKIQHxVT9x3n8uRZrXh/XLc5a0tfV4/0m
 jyRglpMR6FAb6fT43Wh5WGlfUd4lt3yZkurNLN1tVwqKO3kJIjr/8UOWL Q==;
X-CSE-ConnectionGUID: OjsBDb7+R66hwj/EQh+NVw==
X-CSE-MsgGUID: dui+lqKWTdumuUAsHlkvGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93520491"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="93520491"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:26:42 -0700
X-CSE-ConnectionGUID: ix5yHRD1RR2m4PwwDebZnw==
X-CSE-MsgGUID: qxp5Q4M5Rd+EVxzQdgTg1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223498624"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa007.fm.intel.com with ESMTP; 01 Apr 2026 14:26:41 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v4 2/2] drm/xe: expose multi-lrc engine classes in debugfs info
Date: Wed,  1 Apr 2026 14:26:37 -0700
Message-ID: <20260401212637.732424-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401212637.732424-1-x.wang@intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
 <20260401212637.732424-1-x.wang@intel.com>
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

Expose multi_lrc_engine_classes in the info debugfs output so
userspace can inspect the multi-LRC class capability directly.

Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 9986a0310c36..b5f7233da360 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -118,6 +118,8 @@ static int info(struct seq_file *m, void *data)
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

