Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020E7CFD65A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 15:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A734210E602;
	Wed,  7 Jan 2026 15:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZFJDbLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D6E10E602
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767801258; x=1799337258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NrtWWTteTvx0XhwMCCOPgMPyz92XuHqA1N9gnRs9v60=;
 b=UZFJDbLYXm3T8cIctWp1zOUkTOgiKmg+/y9FDEtLkIPV/3iA1uehA+B4
 3XA71qGjVKdiccLUzx62T+E5Ijk6h588wCDmPT8gXgoQPL3E3HpGfqgJP
 x+qGIixEwG2d7tG4xtRAFxlSM7NoTPM5yDlf7sXdzR3rCtUwhKBUPDbH5
 cF7k11pGppI749kCiYHB3iwDt5HnYprZ2qo6B9n1CukUdwVV3bqo86Ud7
 ISs/6+W9hivZEJbnVYBqzA8IkaD/XWV5ssM0ajPNhbm+xCrmelx8mGf8z
 KkJXr5vlnO5Me/TvxOX8Bu3gPaNap+mLWSyVnyhW02o7fL+pGmtzh98pf Q==;
X-CSE-ConnectionGUID: z7oONaaXSXKobACJ7aXJcQ==
X-CSE-MsgGUID: jFRKUEu5TlqUmOeMOOrXHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56734577"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="56734577"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:17 -0800
X-CSE-ConnectionGUID: gpvrS5HNT7iCL7YEQJsCOw==
X-CSE-MsgGUID: XctEc0SlT46fHLDJvqUjbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207109274"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 2/5] drm/xe/vf: fix struct xe_gt_sriov_vf_migration kernel-doc
Date: Wed,  7 Jan 2026 17:53:58 +0200
Message-ID: <20260107155401.2379127-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107155401.2379127-1-jani.nikula@intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Fix kernel-doc warnings on struct xe_gt_sriov_vf_migration:

Warning: ../drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h:47 cannot
  understand function prototype: 'struct xe_gt_sriov_vf_migration'

Fixes: e1d2e2d878bf ("drm/xe/vf: Add xe_gt_recovery_pending helper")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 9a6b5672d569..4ef881b9b662 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -43,10 +43,10 @@ struct xe_gt_sriov_vf_runtime {
 };
 
 /**
- * xe_gt_sriov_vf_migration - VF migration data.
+ * struct xe_gt_sriov_vf_migration - VF migration data.
  */
 struct xe_gt_sriov_vf_migration {
-	/** @migration: VF migration recovery worker */
+	/** @worker: VF migration recovery worker */
 	struct work_struct worker;
 	/** @lock: Protects recovery_queued, teardown */
 	spinlock_t lock;
-- 
2.47.3

