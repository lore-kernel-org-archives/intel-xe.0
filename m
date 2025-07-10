Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC42FC83F20
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912EA10E95B;
	Thu, 10 Jul 2025 20:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9Nf1WKn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6238510E053
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752179725; x=1783715725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9XGwe3pLGFPM/qJkGr6MpDBijIY8a+M0ueaaoi0hes=;
 b=S9Nf1WKn+UgrH+POyYyDWl3YvjY57OUnZGs81Di8lN9Eh67eV+3ADkH3
 GEadjBEwEWM11LpQRMjVmfjIWTdW1ZIl0CB4E9jGsKi4fj+dfwvjU/Nz+
 bT3f3vml3qwvFyoLj6qBBdVlFdC14UO9UdVIWAIVfgbfiFBDa1f0Q71d/
 r9M/P92banf8E9XBLSNKIBDYSsw4KE0fUE23bb6ComgeYDMCMns8TcwQV
 BPTPWE1KLq4LTpGRek9eG1aYIBhGQe70QJXZnrktLJJ00mna05EnnbKhE
 l0uL9b+33j3rd5Dro8RKWxDiCYFfZB3YGgCCG01tE+qQa5NVnumTNZ+3s A==;
X-CSE-ConnectionGUID: xPIdE+XUTYW0sWsUGjzX3Q==
X-CSE-MsgGUID: TOL5CMoqTSON1AiykldPSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79908475"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="79908475"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:25 -0700
X-CSE-ConnectionGUID: 0bcTJ1aUR5SEV0OBDDhOBQ==
X-CSE-MsgGUID: 40Y39VYXRvChbut5FGEBoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156744252"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 4/7] drm/xe/lrc: Add table with LRC layout
Date: Thu, 10 Jul 2025 13:33:49 -0700
Message-ID: <20250710-lrc-refactors-v2-4-a5e2ca03f6bd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
References: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
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

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
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

