Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B53C83F05
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A9110E916;
	Thu,  3 Jul 2025 22:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7HAtkyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AE910E912
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751582488; x=1783118488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uow4XtHfZ+f9bXt1oiwefUKLzKc6JvlGZT7lPJNrz+E=;
 b=E7HAtkyhMYsczNU8QAqCbEqeytb18HBmNzfLWvkcRKDdbUT5pq4ohT5M
 levqyLasdi23eESZ6kFoLKIA+YzS6cbCaoHyHsCRi3amRS+rpNrs4k+6a
 uMYV9xYWDGPjyMtKJ6PThS0xn647hCnShoZKaACPKjPIamAg0EC/SpIXn
 DwsvxI/eFrCijqD346Tr+4C3qVkwWF7tVmw4c3Jy6coZ9RGoz40J58Amy
 4KW6DRa9Q3k0qjYEUYaD1U7VOfAEQ+ROE2NlnOGrruqDvcSUgEqpYEh/p
 16ySaFjTTX2YN+Me2DhNY3+23hA/1tGhyauwtRbE2iuwnaqhHyOJxz5ZG Q==;
X-CSE-ConnectionGUID: dZSAmD4BQgyY5C/bqyJ6Ow==
X-CSE-MsgGUID: bV38EjhFR0ekoS2AxtxOeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76468784"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="76468784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
X-CSE-ConnectionGUID: QwH1mz7SRPy8dzAFfaqxfg==
X-CSE-MsgGUID: FyZXzvJWTxW4yF/LzmEmtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159048803"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 4/7] drm/xe/lrc: Add table with LRC layout
Date: Thu,  3 Jul 2025 15:41:13 -0700
Message-ID: <20250703-lrc-refactors-v1-4-6aa22f174041@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

Add a table to document the LRC's BO layout to make it easier to
visualize how each region stacks on top of each other.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 7cde827ddbec9..75f4678cb090a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -42,6 +42,27 @@
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
 #define LRC_WA_BB_SIZE				SZ_4K
 
+/*
+ * Layout of the LRC and associated data allocated as
+ * lrc->bo:
+ *
+ *   Region                       Size
+ *  +============================+=================+ <- __xe_lrc_ring_offset()
+ *  | Ring                       | ring_size, see  |
+ *  |                            | xe_lrc_init()   |
+ *  +============================+=================+ <- __xe_lrc_pphwsp_offset()
+ *  | PPHWSP (includes SW state) | 4K              |
+ *  +----------------------------+-----------------+ <- __xe_lrc_ring_offset()
+ *  | Engine Context Image       | n * 4K, see     |
+ *  |                            | xe_gt_lrc_size()|
+ *  +----------------------------+-----------------+ <- __xe_lrc_indirect_ring_offset()
+ *  | Indirect Ring State Page   | 0 or 4k, see    |
+ *  |                            | xe_gt_lrc_size()|
+ *  +============================+=================+ <- __xe_lrc_wa_bb_offset()
+ *  | WA BB Per Ctx              | 4k              |
+ *  +============================+=================+ <- xe_bo_size(lrc->bo)
+ */
+
 static struct xe_device *
 lrc_to_xe(struct xe_lrc *lrc)
 {

-- 
2.49.0

