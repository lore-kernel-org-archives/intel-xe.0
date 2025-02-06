Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB0CC02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F53310E9BF;
	Thu,  6 Feb 2025 23:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBqh/HRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6996710E9BD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884237; x=1770420237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OEAQitLxnrZsGtSh81B0Y5IappmToOghWSKO6W2ogJY=;
 b=BBqh/HRFxQhv5/ctlNPh6yn+0C50yYlZl3eB+RTpd1vIh+bsMmxYTia2
 7kJrEXO6vMkp8uwtUaz1Jqtd1h9jl6pBWTUyDy9nh5FTRW5p74fCFXuKl
 M9IbSWfZv7R6XGg2FnCP2kXLSYOYR9eDJgsKY/4q0TIe9yYfcij6KCQxp
 xX/jQ9M/XTg502gqNDBhHNcB69xApWddGyC1uJCoz7xj+Uiu+05bhoa6C
 fx5XgnIdcWltIhH0FiU5bUVuadQV+BZznSfGbk9EGa+Its+yUpu7o/WaP
 ifds4mvMYtEMNQVN593ePCgWyB7aM2++FQK39xjdyoQrF4i4nIIzobqoq Q==;
X-CSE-ConnectionGUID: 3oPu+EJaRKmEA5kK42tlQg==
X-CSE-MsgGUID: LQeOhhF5SfuxozwGA9NxxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61993732"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="61993732"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:57 -0800
X-CSE-ConnectionGUID: 1gOHAPcDR1CNJ/AtTM+lvw==
X-CSE-MsgGUID: wA/UIv6kQX+hybEHMt61Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134594817"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2 12/14] drm/xe: Fail probe if xe_pmu_register() fails
Date: Thu,  6 Feb 2025 15:23:30 -0800
Message-ID: <20250206232333.2660325-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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

Now that previous callers in xe_device_probe() are handling the errors,
that can be done for xe_pmu_register() as well.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6f90d74330524..002e066f5f288 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -883,7 +883,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	xe_pmu_register(&xe->pmu);
+	err = xe_pmu_register(&xe->pmu);
+	if (err)
+		goto err_unregister_display;
 
 	xe_debugfs_register(xe);
 
-- 
2.48.1

