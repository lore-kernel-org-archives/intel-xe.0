Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE61C2BD05
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B798810E355;
	Wed, 19 Jun 2024 21:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlsKimQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F2510E29B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833591; x=1750369591;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gMA6m13Z+PvsWmiXGu/S45ZcHmn08ULh50YbqUlUwYQ=;
 b=WlsKimQgmG8vxLVgsw6G5b9CfE13eE15Y6WOyDX+G4MNaLfC8T236/4C
 SOMDvBuXvsWISANn8pOi6nEXwEMxW0Z2cu+BYc6genK5WvonyQfOn0VVO
 F5C9zlwYi3Sl+0K99NfOsJOCezrpX6iJ3UdTStrDcYRTwRnk20Z10G/wk
 Kjc9A8AAyUoJjeHP++QxAyLcmxA+/XjlglPIjDhok+sBWd/OgOU108uad
 TOYU1Rgkc1M4CTgx5uWCSw0wJ9YtRjV3/ZKa/FYTAR5aCmdpe18p78Gtw
 XsHIf4POrqPsSw7nNqpbqdAPaCjXwfjxPLbSrXihyt/+TSvuAwx/KDs/d w==;
X-CSE-ConnectionGUID: qy3j7GvFRnS3Eigsul1yfw==
X-CSE-MsgGUID: kc6UI+zTQMeEL2lrcefdaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662980"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662980"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:31 -0700
X-CSE-ConnectionGUID: E3Y3MRXgTbKvZGgX/HvO3g==
X-CSE-MsgGUID: KuUvUeJ/QI+LEjAQpyZHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157807"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/9] drm/xe/vf: Don't change hwe IRQ masks if using memory IRQs
Date: Wed, 19 Jun 2024 23:45:52 +0200
Message-Id: <20240619214557.905-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

We currently do not support changing the engine interrupt enable
mask on the per-engine basis when using memory based interrupts.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 8ee3c300c5e4..ab3d5b7a1e8c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -134,6 +134,9 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	u32 gsc_mask = 0;
 	u32 heci_mask = 0;
 
+	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
+		return;
+
 	if (xe_device_uc_enabled(xe)) {
 		irqs = GT_RENDER_USER_INTERRUPT |
 			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
-- 
2.43.0

