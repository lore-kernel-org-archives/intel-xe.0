Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625F6CCD194
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F20D10E672;
	Tue, 14 Oct 2025 16:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNaL2VBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4413110E203
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460482; x=1791996482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g/N7yMqjG59uBVmUHxVU5WGp5wVH9BYL9vzza3YHw8w=;
 b=HNaL2VBQ2p1/yVwxIYo1EqXCVpUSw21xOLhDfGuJVdZOEyoXWwkdjByM
 E4bVpqIww2qxLASMyTvu/CID1gvRrvajj9ESYYqR0T0znsFxTCyZlZXBO
 njifXOKYjsVJGQ+H0HxRUIFmRdRNwgoauaLB7xNj0D4ENnLArMo91eYMB
 sV+A/WcaTgkqoj7vfUX+kSaDr40zPPIoPYXX75QHrXDS9wJBApX8ouf7b
 P7w82EJkKq+JALJEH/xMzMUA6qd+bXkjAtYs3clt6EngzeUgBoWnIa6s3
 VzZop9T/Zpzo6KHw1YVIHv6cPzs37okeK7lsLaY6IP6POf0WbZqegi48q w==;
X-CSE-ConnectionGUID: 40tg08oERoWlFk82RBRwwg==
X-CSE-MsgGUID: JvTMHpLwQVatklTjm6vIVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80063048"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80063048"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:02 -0700
X-CSE-ConnectionGUID: yGq0em32T/yVmBiSHn/F2A==
X-CSE-MsgGUID: PXFdwFYAScG9UTAhrLMG1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186184696"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3 6/7] drm/xe: Guard against NULL GT in xe_guc.c
Date: Tue, 14 Oct 2025 16:48:05 +0000
Message-ID: <20251014164758.125598-15-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014164758.125598-9-jonathan.cavitt@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_lookup_gt is theoretically able to return NULL in some cases,
but several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Use xe_device_get_gt in places where this is an issue.

v2: xe_assert root_gt is not NULL (Michal, Matt)

v3: Just use xe_device_get_gt

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f0535fd82062..d94490979adc 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -466,7 +466,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 		return 0;
 
 	if (gt->info.id != 0) {
-		struct xe_gt *root_gt = xe_device_lookup_gt(xe, 0);
+		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
 		struct xe_guc *root_guc = &root_gt->uc.guc;
 		struct xe_bo *bo;
 
-- 
2.43.0

