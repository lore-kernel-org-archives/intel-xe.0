Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C2EEE49B2
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 17:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDAF10E4C8;
	Wed, 23 Aug 2023 17:09:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D466610E47D;
 Wed, 23 Aug 2023 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692810559; x=1724346559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dat62kzLzk+4OPlWdO0fNFkOg8fvttNOvR/MEPHsRCs=;
 b=WBoWYQgl4TMRCxxiM2+qBxEWlASDEHmYwk0PPzTpWS/gFS9TSy3mNJkA
 BgP/ZJFzWRRQ3f70pi6ca1u6bzN+i8js5sr28pQ9pph7TjIdmcZqr14zK
 joAxPpxgT4GE0WR9rdvr2nwUYeucE78TLLJgLY/1yJ/s8dHO+Uc4kh7a/
 lRM1zxDSe6GZu4gr34gLqpl/hVJ7gE5p8mwEwnwX7Jee+3GGrmM9hLbG5
 1S4TRG47HaXJi+EmKNbkDJUD83NA0059w5iRBbiid1/neiYeVTtKIDHzL
 1G6PAfc1e2M8uOcJT9sji4EPRO5WCXopat8fZYmut3EHqaZm8pArpZbt7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438147486"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="438147486"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802204824"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="802204824"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:09:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Wed, 23 Aug 2023 10:07:18 -0700
Message-Id: <20230823170740.1180212-21-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823170740.1180212-1-lucas.demarchi@intel.com>
References: <20230823170740.1180212-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 20/42] drm/i915/xe2lpd: Register DE_RRMR has been
 removed
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
Cc: Clint Taylor <clinton.a.taylor@intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Clint Taylor <clinton.a.taylor@intel.com>

Do not read DE_RRMR register after display version 20. This register
contains display state information during GFX state dumps.

Bspec: 69456
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 4749f99e6320..fe2fa6f966f2 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1755,7 +1755,7 @@ static void gt_record_display_regs(struct intel_gt_coredump *gt)
 	struct intel_uncore *uncore = gt->_gt->uncore;
 	struct drm_i915_private *i915 = uncore->i915;
 
-	if (GRAPHICS_VER(i915) >= 6)
+	if (DISPLAY_VER(i915) >= 6 && DISPLAY_VER(i915) < 20)
 		gt->derrmr = intel_uncore_read(uncore, DERRMR);
 
 	if (GRAPHICS_VER(i915) >= 8)
-- 
2.40.1

