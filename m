Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76DACCA476
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6935210E0D1;
	Mon,  6 Oct 2025 15:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJgUkBpy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EC610E0D1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759763272; x=1791299272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5UzHTsC1SiA9l14SVIgYJ7iURPdXvJ2R3hdx927wTvY=;
 b=ZJgUkBpyQ93zCMd9kcRLcZQnk+p/lofnHob+ewW4J1ZGe+lhSLkSP1Y1
 GQhKe3tWKh0NHo09WcTSqyhw7CUx/0QEjRM0upn93lznAvCMrfm6eYbGo
 TjExtCi4M1A/WPpZy1M1kdUTJuIrZ5ZCR/b8PmWf4VMYs/B0POJLOgdoM
 HgvuOYBx1uKrxOgkdewrAzScgzwXqQTWENGDFGDKhv8ywLOFNp8aTLp9H
 qTeA5mxR9iFnKwGeSY2AL4kIpIx24x2WMwA1pcoSZpPOnZg06831Lvyr9
 Bl7LcpRneIvnjVOIUOmPJJrqNPqKB33YFHgAFkczvgFgVHwoiA/HsjSWk A==;
X-CSE-ConnectionGUID: g+nW0pVdQGeT0opKw7M6ZQ==
X-CSE-MsgGUID: f/ywRAwzQ3aoQ2h6ScB4WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65769464"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65769464"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:07:51 -0700
X-CSE-ConnectionGUID: eFesERP+SCWsN4XetzyB1A==
X-CSE-MsgGUID: eUtQHqGDRSu6Dk4zXvoeEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="216985391"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2025 08:07:49 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 2/3] drm/xe/migrate: Make emit_pte() header write atomic
Date: Mon,  6 Oct 2025 20:54:46 +0530
Message-ID: <20251006152443.12269-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
References: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
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

The MI_STORE_DATA_IMM instruction header is quad dword in size. If the
vCPU halts during save/restore while this sequence is being programmed,
partial writes may trigger page faults when saving IGPU CCS metadata.
Update instruction header atomically.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
V3 -> V4:
- New commit added.

V2 -> V3:
- None

V1 -> V2:
- None
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b960fdcecd88..4c575be45a76 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -606,9 +606,14 @@ static void emit_pte(struct xe_migrate *m,
 
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
+		u32 dw[SZ_2], i = 0;
+
+		dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
+		dw[i++] = ofs;
+
+		WRITE_ONCE(*(u64 *)&bb->cs[bb->len], READ_ONCE(*(u64 *)dw));
+		bb->len += i;
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
-		bb->cs[bb->len++] = ofs;
 		bb->cs[bb->len++] = 0;
 
 		cur_ofs = ofs;
-- 
2.51.0

