Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4842BC83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0874510E919;
	Thu,  3 Jul 2025 22:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcHR5PFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E29510E914
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751582488; x=1783118488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JL+tdaN8BsHq4H6mpGy7vsB83NLgxkI8i1tKu9J562o=;
 b=HcHR5PFI45bgJ50lUePM03rXK7e43U4GtKpyhKw/OG9hkB/X79ZM+LNt
 HPgMa03KkvrqQVuBoZBvMBWX95uIuT9A4PhqvHbA31qRDuZ7kFMPFwJwd
 SLCbYAfaQzVGXIDpp+DhPOGwuApSmo6Sp34RCXLzyWfklceWzImZVcBcd
 I/WidM0vIXlUC9j+3/J4XQ0VyTR36T1dElFOZlToW7unwWkXMDXI8eewc
 LC9tfWzjwG1hh+SdreeMg6gFeQp6w+qmV5sPe/b4ce/+M8SOtsDEvS/oD
 U5fm2DNGqsv3JOJUPT44BU/AhNJ3jC3Q6rlPpWvqVz57Yq9ooJ8APWOVo A==;
X-CSE-ConnectionGUID: VClXZzkTTNiMbJUQeEzY9g==
X-CSE-MsgGUID: xCwIBq/LTL+I515Ae0ogJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76468786"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="76468786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
X-CSE-ConnectionGUID: 40saagRFTcWCU6U6XDa77g==
X-CSE-MsgGUID: AOlfFkgoT4O9m33LPD9/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159048806"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 5/7] drm/xe/lrc: Remove leftover TODO
Date: Thu,  3 Jul 2025 15:41:14 -0700
Message-ID: <20250703-lrc-refactors-v1-5-6aa22f174041@intel.com>
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

There isn't anything to set for CTX_TIMESTAMP handling in the empty
LRC, that is set on every LRC init since it should always start from 0
rather than the value saved in the image after first submission.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 75f4678cb090a..2c735b3679f86 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -603,8 +603,6 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 	if (xe_gt_has_indirect_ring_state(hwe->gt))
 		regs[CTX_CONTEXT_CONTROL] |=
 			_MASKED_BIT_ENABLE(CTX_CTRL_INDIRECT_RING_STATE_ENABLE);
-
-	/* TODO: Timestamp */
 }
 
 static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)

-- 
2.49.0

