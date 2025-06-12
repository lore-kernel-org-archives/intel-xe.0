Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1CAC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 17:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C84110E0AD;
	Thu, 12 Jun 2025 17:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pw8nw0gh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADF010E0AD
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749749237; x=1781285237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1WV7m2w1YbMqytdwAe3swjfaE40bLQhYd+dTjxSusOI=;
 b=Pw8nw0ghGijzpDDRDgcR2ag1ZYURdM8ORX0YgP+7OxJiYPAmxdZvm5Ju
 KpP+mAjP6WyFb4J9eqeiGLKs3txEmh+b+Wpl0he/isW64kRzK0e28btML
 b4oA4Y9q1CmfIZYbeSjlhtJyL9e4mGPm7J1dGRl75wmM3l/RiJuEiv9A/
 ioGYTceATKR/PllhiTURWMaRK7STCzPZUHFtFcu9dIZwmH+xGt/8pRrwc
 dHF0dSr/1kOqts7Ox2i3W4o9IEZMGfYEVFxXyG4NOPwBFYeMaNpeL+FVi
 zKqdMApSX7c5/sHhTLa2jEkYYddUUzITlglERcnwghl/WYWZnAWaCbZvk A==;
X-CSE-ConnectionGUID: gDMhv9kzSDCiksah7PordA==
X-CSE-MsgGUID: dQeHlYv9SC+6NAzKFMf6WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51930486"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51930486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:27:16 -0700
X-CSE-ConnectionGUID: VWQNW4+HTY2fOJFk6guPfQ==
X-CSE-MsgGUID: lEmpFjyvStCB+1xcZzVq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147475187"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:27:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	umesh.nerlige.ramappa@intel.com
Subject: [PATCH] drm/xe: Move LRC_ENGINE_ID_PPHWSP_OFFSET outside of parallel
 offset
Date: Thu, 12 Jun 2025 10:28:50 -0700
Message-Id: <20250612172850.4170428-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The parallel scratch layout spans 2k and LRC_ENGINE_ID_PPHWSP_OFFSET
lands within than space. This happens to be ok as the offset lands in
reserved part of guc_sched_wq_desc, but for future safety move
LRC_ENGINE_ID_PPHWSP_OFFSET to the unused offset of 1024 below parallel
scratch layout.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 529c6a972a55..6fb2a2ca4e78 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -654,8 +654,8 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define LRC_SEQNO_PPHWSP_OFFSET 512
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
+#define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
-#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
 
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
 {
-- 
2.34.1

