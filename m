Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FE3C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3336110EB93;
	Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCDc5UKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B052710EB8B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739474976; x=1771010976;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dRVSbBE0HiyOFRi1AgMHchN2T0Ucga98X8C9bYxNYOY=;
 b=jCDc5UKy8mJBpdJ8hESiqIp1FeBdXmrn6I9m2mcEmZ1XvT5OYgwKixv3
 Fr8htyOXj4b+S5IDNQ+Aex5TO7BdILht3DCAP9c5Zxn66q2XKjm1HN1mj
 D8VfI08a9KqY3V6Rul9eh2cOpaVhZTPcEQkRUK2V1Dv+Ex5GZA/gLOGcF
 wWMQEH1xIz2RjhqlfwLRwlQSylYaK/vuWc5oGTFkIXCMIAU36kKjNk8nh
 Cs0vri67noVqDWoL7Xiz7GjyoIG0ZmxtpuJPu0lh4kaEk3IAyisPZaa6J
 uVIV5IExL05YR8qwHIW45Wi3bZtSzdJMl2dqnloqewojaDxgw4UeD+SI/ g==;
X-CSE-ConnectionGUID: IHWdys9yRqu+oeTy4W2qHw==
X-CSE-MsgGUID: S3erVv7nQy+FGQIxXGQY2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40127931"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40127931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
X-CSE-ConnectionGUID: hAR6AdujRUCrNR6xRRyVLA==
X-CSE-MsgGUID: WNmIrXjWSwuRf19nKzDd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150416884"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 10/13] drm/xe: Move drm_dev_unplug() out of display function
Date: Thu, 13 Feb 2025 11:29:06 -0800
Message-ID: <20250213192909.996148-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213192909.996148-1-lucas.demarchi@intel.com>
References: <20250213192909.996148-1-lucas.demarchi@intel.com>
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

This is not really display-related and needed for any sequence on driver
removal that has to interact with drm_dev_enter()/drm_dev_exit().
Just remove xe_device_remove_display() and inline it in the single
caller to make clear this is not done only for display.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 028cad5f396b3..db9545b29a356 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -963,20 +963,16 @@ int xe_device_add_action_or_reset(struct xe_device *xe,
 	return 0;
 }
 
-static void xe_device_remove_display(struct xe_device *xe)
+void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+
 	xe_display_driver_remove(xe);
-}
 
-void xe_device_remove(struct xe_device *xe)
-{
 	xe_oa_unregister(xe);
 
-	xe_device_remove_display(xe);
-
 	xe_heci_gsc_fini(xe);
 
 	xe_device_call_remove_actions(xe);
-- 
2.48.1

