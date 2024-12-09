Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892FFE77182
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 23:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457EF10E591;
	Mon,  9 Dec 2024 23:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFLFJuec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859210E58B
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 23:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733786882; x=1765322882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mV5Ta9/gk+jRTBpe9D77zt3qgtx8ztHagkoV4VWRsdY=;
 b=hFLFJuecXZmal899S7DnKnrpACy7gPlfcsE5JG+jFzD5IyGGHWS8Boe+
 oHOD1h9oDu5mYfCcq/FuI8nvSiM3BLEvyeL44BcWYxRo/uGwLFwrpnAaC
 WTmd3FMO9nxCy9tlOa+nina94AG6FTEpzpOUYSsVPQ8KDsc+AFnlEq6Xo
 nhWLBT2PP4OC6GdumnH05NhcqYXOJT2qqiHuIHbqSPZjWXPbIXPKB9FQy
 Y1mi4S7Zn0Xav990ytMvuFsyo53CxFrJ/1r7lBxNbbGC2nUmlFLL7DJmG
 qXCrXjbmG0/CD8xjCjQcshRo+agEtHuhneD9dGL8QdPEUcGNSkVAWGNlB g==;
X-CSE-ConnectionGUID: lPLHZSEVT/OS01EfHH7NzA==
X-CSE-MsgGUID: QKgLJzEGROCg544T5TbUfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44581853"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="44581853"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:01 -0800
X-CSE-ConnectionGUID: ClL7uhhESl6PiGWpaAuTJA==
X-CSE-MsgGUID: f1eB3tjeSJiA1WpFiuTKSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="100268961"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/5] drm/xe/reg_sr: Stop setting all whitelist slots
Date: Mon,  9 Dec 2024 15:27:38 -0800
Message-ID: <20241209232739.147417-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209232739.147417-1-lucas.demarchi@intel.com>
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
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

Currently xe_reg_sr_apply_whitelist() sets the unused values to a known
used value for no good reason: it could just leave it with the HW
default. The behavior is slightly different if there are no whitelist
registers for the engine as the function returns early. This is not
needed, so just drop the addition writes for the unused slots.

Later this will allow to reduce the amount of registers passed to GuC
for save/restore.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 080229e0fc15a..0a5c0e62d6e88 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -227,13 +227,6 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 		slot++;
 	}
 
-	/* And clear the rest just in case of garbage */
-	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
-		u32 addr = RING_NOPID(mmio_base).addr;
-
-		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
-	}
-
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return;
-- 
2.47.0

