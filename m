Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A60ECCD190
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8A110E52E;
	Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFpvhDpf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD7B10E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412329; x=1791948329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sdVZwHn95DzDvcUq5RV/qHtaEwrOk80nE+0mg4C0a6g=;
 b=mFpvhDpfcoOKknmDmnKFL2tOQyDQ7rhCOHNNTe/9529As0oXFk3i6stq
 TZIAgPSOwHkE0E9BhJK8NofnAT4KGjx99pE5qT74CDGm7uw3BB0dqtVuA
 un1uRHG1R2PBHXoHGOjfaR7SG4L77doQwKcnBx+EjXoC5pPBpUuPKuiaC
 GO4wUfiJNuLyUVfbz2YDeVwgIu4628wOEzQIg/4XxmNtsy8hynVOZ3bIi
 K4uZcHaQgu3pYKEsj1lFm9tsBbIfb4FcOhy0CtKg3VwmOcACGX9DvTYae
 FFe33Sse3OP6OAVrf6pTHi2WSj7xKII07B21eKJcDFOKrd/kU0rcj6E0j Q==;
X-CSE-ConnectionGUID: 3pHVfNUVRq+/LnAqFBz1rQ==
X-CSE-MsgGUID: v7a+mAU7TBKlOsg73GlWMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414870"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: auVfT225SNaY/sWVz3vEpw==
X-CSE-MsgGUID: RPmiNvZZToKh9ppiHzUHQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567283"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 07/23] drm/xe/xe3p_lpm: Handle MCR steering
Date: Mon, 13 Oct 2025 20:24:39 -0700
Message-ID: <20251013-xe3p-v1-7-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe3p_LPM's MCR steering has the same ranges and behavior as Xe3_LPM.
However one register range that was reserved on Xe3_LPM has now become a
unicast range (0x384200-0x38427F), so we need to stop consolidating the
adjacent MCR ranges into a single table entry in the table.  With this
change to the Xe3_LPM table, we can continue to use the same table for
both IP families.

While we're touching this table, take the opportunity to fix a
whitespace mistake and clarify that one of the other consolidated range
entries includes a reserved range.

Bspec: 76445
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 8fb1cae917244..e1a2b38fc2a86 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -236,12 +236,13 @@ static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
 };
 
 static const struct xe_mmio_range xe3lpm_instance0_steering_table[] = {
-	{ 0x384000, 0x3847DF },         /* GAM, rsvd, GAM */
+	{ 0x384000, 0x3841FF },         /* GAM */
+	{ 0x384400, 0x3847DF },         /* GAM */
 	{ 0x384900, 0x384AFF },         /* GAM */
 	{ 0x389560, 0x3895FF },         /* MEDIAINF */
 	{ 0x38B600, 0x38B8FF },         /* L3BANK */
 	{ 0x38C800, 0x38D07F },         /* GAM, MEDIAINF */
-	{ 0x38D0D0, 0x38F0FF },		/* MEDIAINF, GAM */
+	{ 0x38D0D0, 0x38F0FF },         /* MEDIAINF, rsvd, GAM */
 	{ 0x393C00, 0x393C7F },         /* MEDIAINF */
 	{},
 };

-- 
2.51.0

