Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC06C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 04:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0318B10E099;
	Thu,  9 May 2024 04:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qq+/Updm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B3510E099
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 04:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715227890; x=1746763890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q64u4zOi/AjG/6xBfSPEG3uRr6UqYnXaF4CVywAuFNk=;
 b=Qq+/UpdmtulE8JMe/dxcYbQoQ6Q7EhhboicH8SHCNv5pVgA1xWgFBE8w
 fhL9TLHvvsCKzHMu7QOlqFKoCUvkYmTOaA9W+klOswwu0rNzPdYqPL7qf
 pt1GMuol6ljP4t5gwPJ3P79Uo/IVJ4SN9m841OueBArTqF7yHa9l50wtk
 dbvw4lB6/OjW5R4+SI/C1wGdP+4WO4iBP/skWYVPEeuPm4HmwWGA8xy2g
 Jsn6wcD7MQ8HJhJ7PHqgme1RV7pW/gago5HngxOTOR55ER56wUxF8/Egu
 o8Vpb00da0pDg1G3FqRuZzhUC61gLgUl2XY693Vi/GkP5DTRRsMGGlYYf A==;
X-CSE-ConnectionGUID: c958rzGWSO2kbeqDtQ9ZJg==
X-CSE-MsgGUID: tginlqQrQ3mV/yf64bMPqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11249894"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11249894"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
X-CSE-ConnectionGUID: 5hsYFz/rQjCiy8hNSk7WAg==
X-CSE-MsgGUID: pGxntnzFT+6F5gDfJ7qPZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33915535"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:11:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [CI 3/5] drm/xe: Move xe_gt_init_early() where it belongs
Date: Wed,  8 May 2024 21:12:23 -0700
Message-ID: <20240509041225.610636-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509041225.610636-1-lucas.demarchi@intel.com>
References: <20240509041225.610636-1-lucas.demarchi@intel.com>
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

Early shall be early enough, stop doing other things with gt before it.
Now that xe_gt_init_early() doesn't need forcewake and doesn't depend on
the fake engine_mask initialization, move it where it belongs: it
doesn't need to be after hwconfig config anymore.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f8eb477f359d..ef9231675e67 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -567,6 +567,12 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_early(gt);
+		if (err)
+			return err;
+	}
+
 	for_each_gt(gt, xe, id)
 		xe_force_wake_init_gt(gt, gt_to_fw(gt));
 
@@ -605,12 +611,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_init_early(gt);
-		if (err)
-			goto err_irq_shutdown;
-	}
-
 	err = xe_device_set_has_flat_ccs(xe);
 	if (err)
 		goto err_irq_shutdown;
-- 
2.43.0

