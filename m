Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19B9C021AF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876A410EB95;
	Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ns3dd/Po";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C715010EB88
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739474976; x=1771010976;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1R8BopvsPuOzvRZOqGtuoByGgBOxSS+XbeCEumyboWU=;
 b=ns3dd/PonjCj5oS3PeovWmz4YU83lcIwHR5fbb7Dl2kQJUkTxxKq9SKT
 MoFgW7hZmTBNJ0lOnKIkeBHiaxnX1QVk7+oTqRj4De8UkFezjQ9NTuCTO
 bS+Aapes+KUqGz5k8fw/Jezqc2PoCoWdDAxs9zCG0X9amnLFBMTJLtxrk
 5QxzMxM91ivlIuxgaslJMmQbZvCDYkWtQwhNeciq7Pq/UjyCRw4JwG/9Z
 vYj42VmfzONonfGNI0teZD+LkEX7ItcTY3Ujh8S8sLx+7x04v/IuY0ZiO
 6uYBHircs6xrKWosfybxab3jUnYG0HmB47T61ftb3AMheT6hLyNa1kVRc Q==;
X-CSE-ConnectionGUID: VjEwvV9SR3miPYehy8SHWg==
X-CSE-MsgGUID: LP7TWaIiRCeDzI+KEFP1qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40127933"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40127933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
X-CSE-ConnectionGUID: SccIp8UXQweqjQxG/KEv2g==
X-CSE-MsgGUID: cGNzstXgQVGl8SVKC25rcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150416890"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 12/13] drm/xe/pmu: Fail probe if xe_pmu_register() fails
Date: Thu, 13 Feb 2025 11:29:08 -0800
Message-ID: <20250213192909.996148-12-lucas.demarchi@intel.com>
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

Now that previous callers in xe_device_probe() are handling the errors,
that can be done for xe_pmu_register() as well.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86f3fd399f9ba..44471604142fc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -889,7 +889,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	xe_pmu_register(&xe->pmu);
+	err = xe_pmu_register(&xe->pmu);
+	if (err)
+		goto err_unregister_display;
 
 	xe_debugfs_register(xe);
 
-- 
2.48.1

