Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024E2C3601E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 11:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9AE10E98F;
	Thu,  3 Apr 2025 11:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbs9TvnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42B710E142
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743681044; x=1775217044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AmBQrO1e5X62u/Sy++Jm4aZ6szKwsYORzl0Kd0W7uq8=;
 b=nbs9TvnM+FTZ42slwCckv+Y/5XIdzBR0XLlFFzalbQU2rL5FN0VmuUdV
 TxUu6qlhizmGyGXo6Pqdg5WJwT5/7Ekzh9jG/WaseegvF8jofWutFj5B8
 kLZCeJfKZhRnCenJj6qypd1g61Io33y89HaRZDBIWBI8eqHXufzwyT0eO
 /7npjQWobULvpvPKEbfEKUe51K81+Kcy34T03I2qzm7mf952r3+Gx15/I
 bkKA0ggxzfrqr9wimdu4HZ4gGELB/3GY8bS9WCykfGwpE6rCzz8Tm3W3Y
 /MhNRpPfkEkWgpBTKBQs0kCD8LBZjw7Kb/Lb8Oegm6vOyA9ZX8Bv1V9Xr g==;
X-CSE-ConnectionGUID: hFGXrBKuR6eVtEHcUsmsfw==
X-CSE-MsgGUID: khWDIfRBRl2kEsUhnfSJrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55754790"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55754790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 04:50:44 -0700
X-CSE-ConnectionGUID: 6NvI+9qHQkCNu1GmEszi7A==
X-CSE-MsgGUID: avMZY3dcS+u57eS6C2xiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126973785"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2025 04:50:42 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe: Introduce fault injection for guc mmio send/recv.
Date: Thu,  3 Apr 2025 17:36:40 +0530
Message-Id: <20250403120641.7258-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
References: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
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

Fault can be injected with below steps.

FAILTYPE=fail_function
FAILFUNC=xe_guc_mmio_send_recv

echo > /sys/kernel/debug/$FAILTYPE/inject
echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
printf %#x -5 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval

echo N > /sys/kernel/debug/$FAILTYPE/task-filter
echo 10 > /sys/kernel/debug/$FAILTYPE/probability
echo 0 > /sys/kernel/debug/$FAILTYPE/interval
echo -1 > /sys/kernel/debug/$FAILTYPE/times
echo 0 > /sys/kernel/debug/$FAILTYPE/space
echo 1 > /sys/kernel/debug/$FAILTYPE/verbose

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bc5714a5b36b..ca0823df252e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1393,6 +1393,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	/* Use data from the GuC response as our return value */
 	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
 }
+ALLOW_ERROR_INJECTION(xe_guc_mmio_send_recv, ERRNO);
 
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
 {
-- 
2.35.3

