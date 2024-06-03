Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ABFC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 08:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC6910E31A;
	Mon,  3 Jun 2024 08:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBzNCMxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915F610E30D
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717404350; x=1748940350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNURTX1Cpmqm10yCvKqWtjLxmzVa8nLvtZ9kqeegKtU=;
 b=UBzNCMxjYvHqTE/5vsRjNvIw8jQaIfikOeqn3QkSVsoc0j25fhgKFBiF
 gFiox2eKfAlIl41/GYZD+rWKmub5r6il/0BB+NerSXXzGSLjTe7z7a/wH
 Eza6yM6LdlZM4+2jB3Wk/zYNtM4flYlN7Rpd1/kDSfxD6fxdzIxzlqX9x
 9cAm36QW6AhBpCZ7yK1LCwAAh1YKgwObjL1UqqpG5u09qWYd037W7jZEv
 k3kgH24ZRNzd6SkfxtvHAF2pzn72sN2iTo3h9xkBdj2C68xSlDbM+FX5B
 pnH/RBVgp/vCA1PNg1f/lYGPXyMLzewnCowPn/iI7CDcsWARmXxR0Piww A==;
X-CSE-ConnectionGUID: 8fpNI5QGS/q9TzRjbO+0AA==
X-CSE-MsgGUID: OeTzSHAqRnmZ78RznaT6Rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14008675"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="14008675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:45:50 -0700
X-CSE-ConnectionGUID: CYGs3ZTfSAyTw6QO/ZFPfw==
X-CSE-MsgGUID: l/V7yr64Rg6IYuAX9qXeQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="41745461"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 03 Jun 2024 01:45:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Date: Mon,  3 Jun 2024 14:31:47 +0530
Message-Id: <20240603090147.1098639-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
References: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_assert_held is designed to trigger an assertion if the
provided domain is not awake, which works correctly for individual
domains. However, the assertion condition becomes incorrect for
XE_FORCEWAKE_ALL.

For instance, if we assume all domains are in sleep mode, invoking
xe_force_wake_get(fw, XE_FORCEWAKE_GT) will only awaken the "gt" domain.
Subsequently, another function needs that all domains are awake and
utilizes xe_force_wake_assert_held(fw, XE_FORCEWAKE_ALL).
In this scenario, the condition will inaccurately return success because
fw->awake_domains (0x1) & XE_FORCEWAKE_ALL (0xFF) will still be 0x1 and
Ideally it should have asserted.

Make sure that the assertion condition covers the wakefulness of all
initialized domains for XE_FORCEWAKE_ALL.

v2:
- %s/supported/initialized/
- update commit message (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..a9b01d7ede44 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -32,7 +32,12 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
-	xe_gt_assert(fw->gt, fw->awake_domains & domain);
+	enum xe_force_wake_domains is_awake;
+
+	is_awake = (domain == XE_FORCEWAKE_ALL) ?
+		    fw->initialized_domains : domain;
+
+	xe_gt_assert(fw->gt, (fw->awake_domains & is_awake) == is_awake);
 }
 
 #endif
-- 
2.25.1

