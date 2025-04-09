Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8862BC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 14:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD9310E8DE;
	Wed,  9 Apr 2025 14:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzGKmlb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5797E10E8DE;
 Wed,  9 Apr 2025 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744208639; x=1775744639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=24+QjO2vjEJ/xvW9tS4ZtHZNeZLrwh4AB0ClE8jnhQE=;
 b=CzGKmlb5xtVs8MQlIRtml84pQdcpJpaKqxHEt2b1uZhHbTXZg1EtVmhH
 raKTpyGXd8qEi25LxMqECJ+4lVz78k+YyPbtBDZlreZnUiBLx3AxFbl1C
 AXXujAhLFR3xpL0SFf3xrmDNn9Iq0IVXOu/TMuEdkXy9Gg2PvwlNeFpRN
 MaugLBhO1EbtzxeTvcUM5HO63nXCIKTQIOKc4dWu8P18ENBDws5dlOWYx
 OpTM58U9UFq5fqXhN5zhCM1KpNtW8D4BjhQFfucFO89Fin03f0tRC54r8
 VQJfwtgRpusU/X0lS8BbvtadclJFjWFuWRbBG3/K91aZzhaavX7++z5CC w==;
X-CSE-ConnectionGUID: cP4tsV4qTraHCRYK70Jd1w==
X-CSE-MsgGUID: GRSJQf0oTkyQsUmFNR/kTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49534304"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="49534304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 07:23:59 -0700
X-CSE-ConnectionGUID: rcXcxsYHRLOwFAeHPtqJ1g==
X-CSE-MsgGUID: FtDaE7jGQVOCfE9xuDuFZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133591061"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.201])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 07:23:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 1/5] drm/i915: use 32-bit access for gen2 irq registers
Date: Wed,  9 Apr 2025 17:23:43 +0300
Message-Id: <274bcad720011919be268846e7791fc5a9766753.1744208554.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744208554.git.jani.nikula@intel.com>
References: <cover.1744208554.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We've previously switched from 16-bit to 32-bit access for gen2 irq
registers, but one was left behind. Fix it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index a6613eed3398..cf31e8fecd8d 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1782,8 +1782,6 @@ static void gt_record_display_regs(struct intel_gt_coredump *gt)
 		gt->ier = intel_uncore_read(uncore, VLV_IER);
 	else if (HAS_PCH_SPLIT(i915))
 		gt->ier = intel_uncore_read(uncore, DEIER);
-	else if (GRAPHICS_VER(i915) == 2)
-		gt->ier = intel_uncore_read16(uncore, GEN2_IER);
 	else
 		gt->ier = intel_uncore_read(uncore, GEN2_IER);
 }
-- 
2.39.5

