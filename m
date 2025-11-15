Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0EBCEB2DD
	for <intel-xe@archiver.kernel.org>; Sat, 15 Nov 2025 15:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840948918D;
	Sat, 15 Nov 2025 15:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axqNMZPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770F88918D
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Nov 2025 15:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763219616; x=1794755616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4GFzHdUaBB5uCtoIhYPYeSIljQxGCHS9j1lxxjx9gmg=;
 b=axqNMZPD+rEBgbhFrAi5OCwd40iA37tU7nFHVLuWWs50piicrNNr3UOi
 BCN8vs8xqeXGHzCAcxGKzC3qdrn6Z49JasfPXn8xj1VGDpmboa8c0vuHC
 MmF2Zj8BQHTFrDxWZKFoTbr+RBullIl16edGuMETZqzgime7SQJvYpVdL
 K+3vpuxc9806vTp09m44PUIEwF3mORoaPi3q0yVPEVoukr2zPhFED1b/r
 byHucpo/cqQlajsMzTxQN3QUtaEPcLZMWq+mhjGSFzTDhdJM7peiMGJSL
 Xi0fIHKN7SnLB+X64AvaGlta3/d2W0tAONFwyPzeQzUvEqg5Wrq3GTiZy g==;
X-CSE-ConnectionGUID: YnNRkOppQMupnU+iDLQwnA==
X-CSE-MsgGUID: 5IiRHIzlSGOOd8VTbnTsDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="65322574"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; d="scan'208";a="65322574"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2025 07:13:36 -0800
X-CSE-ConnectionGUID: Pxqd5iPnR4yrgZVb0z2KLQ==
X-CSE-MsgGUID: XKavV/JxQMCrLc29QPVTpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; d="scan'208";a="189856874"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2025 07:13:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 kernel test robot <lkp@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/pf: Use div_u64 when calculating GGTT profile
Date: Sat, 15 Nov 2025 16:13:22 +0100
Message-ID: <20251115151323.10828-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This will fix the following error seen on some 32-bit config:

"ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!"

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511150929.3vUi6PEJ-lkp@intel.com/
Fixes: e448372e8a8e ("drm/xe/pf: Use migration-friendly GGTT auto-provisioning")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 62f6cc45a764..59c5c6b4d994 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -711,7 +711,7 @@ static u64 pf_profile_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
 	if (num_vfs > 56)
 		return SZ_64M - SZ_8M;
 
-	return rounddown_pow_of_two(shareable / num_vfs);
+	return rounddown_pow_of_two(div_u64(shareable, num_vfs));
 }
 
 /**
-- 
2.47.1

