Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CF8E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129BA10EF6A;
	Thu,  5 Dec 2024 18:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ed97GBcI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB2610EF68
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733422983; x=1764958983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bdez3MPHj/EHkGLOE9I8VgfAzE7AYSW4+xSjl2zmb4k=;
 b=Ed97GBcINc31xNx11mHb9Unc2g2mJetTB8Nn+q0BEm5m6Ccpj0bOTsS2
 mmkidR2DrC1wb3f+UFI/4XPKfloxs9ICmVSTNDR642x6nAVItoPB7oO9x
 M3waFJv4IHEgK6mUU+RK12B75hbGNvXa+avj5MZWgbYMaOmWUQaXvLTNh
 v6Qs6CRd+H5SRN/82NCMRDtHMVOUMUg4PEGho0tlgwiyOiFuwAPGk9fk/
 kLtusXQqTdsRqGnJQuoyr2IuIAync/0N068jfxhEAgv81LM/ogC6QBPBw
 3EOGt+sJnaiq2zisCYibD0dSX5VEiP1xLZWhDYVYjCs+qRiyK+EAFPrGE A==;
X-CSE-ConnectionGUID: vydPWqcfShibm8HTvaqP+g==
X-CSE-MsgGUID: 7rA2vZGyRDqkjD4zUSHEHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33083525"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33083525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:23:03 -0800
X-CSE-ConnectionGUID: faNFx7AwTnKfzOjVt8rpCg==
X-CSE-MsgGUID: PigEh8YORNaEfHkgMYhuCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94375117"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:23:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/5] drm/xe/reg_sr: Write all whitelist slots
Date: Thu,  5 Dec 2024 10:22:37 -0800
Message-ID: <20241205182240.3463027-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205182240.3463027-1-lucas.demarchi@intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
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

Currently if there's 1 whitelisted register in the engine, on slot is
written with that register and all the others are written to a sane
value. For the free slots, there's no reason to change the behavior
if there are 0, 1 or slots occupied. If the default value from HW is not
trusted, all values should be written to.

Also, later on all values are passed to GuC via ADS to be restored on
engine reset, so make sure they are also written to when probing the
device.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index c13123008e903..f982c1cdb369c 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -204,9 +204,6 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	unsigned int slot = 0;
 	unsigned int fw_ref;
 
-	if (xa_empty(&sr->xa))
-		return;
-
 	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-- 
2.47.0

