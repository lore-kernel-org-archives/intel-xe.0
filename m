Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B150CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 22:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113F610E9F1;
	Wed, 10 Sep 2025 22:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XO8XsbB/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DF910E19E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757543090; x=1789079090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ceHsIN4oFz18GIFoYbFsLXo3yBVbI0k1FStBYcWn/Go=;
 b=XO8XsbB/u1SXXs/kmGF7pmKKjgAJjWxmV+tQyB/naaI8Cbpz2O2kQ9rp
 QJLli/gW3X/f64e+Kz1YiLm7T0u50rYHZ2zl11kkJIoxasGi6wTZ3XCOb
 sfrCWhiFxp8B6hD+v/qNszpsHCtQuDvJhZOzEkVf9GyZn2M5AaRQfcwwV
 j2aXMhilo94XJA9/pzVDAxnPju5o7mqTMqeaLu5WvMfLcQqMh0NMTTOZK
 eOY3soxwxtvkDTq53iLRBe07Kzum1Mti/yH+gVmcn43ywlI0wCd61eour
 yEoyZJILsfRtI722QIljLA6pMCZysPot78eijEXQW4gSkuqcbP6Wju18V A==;
X-CSE-ConnectionGUID: IiiYp49sTbOj8c98h1kVYw==
X-CSE-MsgGUID: yywpBaG0S2iIhbqqhxqXxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59089417"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="59089417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 15:24:49 -0700
X-CSE-ConnectionGUID: lgVuhjmDQSqxRecieP2sQw==
X-CSE-MsgGUID: A7l+sH07Rym0vQp6LIdZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="177818091"
Received: from darose-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 15:24:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation
Date: Thu, 11 Sep 2025 00:24:39 +0200
Message-ID: <20250910222439.32869-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

This effectively reverts commit 4c3fe5eae46b ("drm/xe/pf: Limit
fair VF LMEM provisioning") since we don't need it any more after
non-contig VRAM allocations were fixed. This allows larger LMEM
auto-provisioning for VFs, so instead:

 [ ] GT0: PF: LMEM available(14096M) fair(1 x 8192M)
 [ ] GT0: PF: VF1 provisioned with 8589934592 (8.00 GiB) LMEM
or
 [ ] GT0: PF: LMEM available(14096M) fair(2 x 4096M)
 [ ] GT0: PF: VF1..VF2 provisioned with 4294967296 (4.00 GiB) LMEM

we may get:

 [ ] GT0: PF: LMEM available(14096M) fair(1 x 14096M)
 [ ] GT0: PF: VF1 provisioned with 14780727296 (13.8 GiB) LMEM
and
 [ ] GT0: PF: LMEM available(14096M) fair(2 x 7048M)
 [ ] GT0: PF: VF1..VF2 provisioned with 7390363648 (6.88 GiB) LMEM

Fixes: 1e32ffbc9dc8 ("drm/xe/sriov: support non-contig VRAM provisioning")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6a9a752fe24a..6344b5205c08 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1629,7 +1629,6 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 	u64 fair;
 
 	fair = div_u64(available, num_vfs);
-	fair = rounddown_pow_of_two(fair);	/* XXX: ttm_vram_mgr & drm_buddy limitation */
 	fair = ALIGN_DOWN(fair, alignment);
 #ifdef MAX_FAIR_LMEM
 	fair = min_t(u64, MAX_FAIR_LMEM, fair);
-- 
2.47.1

