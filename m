Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C773C0219E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DF010EBC2;
	Fri,  7 Feb 2025 22:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVlxDQTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A190510EBB5
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738966803; x=1770502803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OEAQitLxnrZsGtSh81B0Y5IappmToOghWSKO6W2ogJY=;
 b=KVlxDQThzht9FSolhHZYNqtXLTTvbNxBEzA3TBEohR2cp11A9PTWFqNi
 A54zPxikocd+MTyDHRWbjLqKDgTPQMXh5jTadMHs3pk1GjcmyGafMgcah
 hjCrxdWfFh5uUAEogCOJB2NBya0z42rbP5tYxPleO6O5Nwjj43ryzC+EW
 iC7FaUKpzi8VITdXtE9C1fg5ik8aSzyy75qHHMENyjKcEz5MMGTTRBu5h
 XTdSb4Gy6RxsAmTaIRkPZ0HsWCTFR0BcS3Qm8H6sUUjEoAe2xBri1BFxV
 mA6YWq9N4JK0SUBoyDMMJXZ5aTLTgy+4eZ/bn23Ip8M9TZ/f21AvjiMZY g==;
X-CSE-ConnectionGUID: VRm5pB93S+S5nEcs4rp1Gg==
X-CSE-MsgGUID: 10VaBK1CQ82Br5TJTeOb5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51050693"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51050693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:03 -0800
X-CSE-ConnectionGUID: CuQAcQAtSGi27p4hP/2rCg==
X-CSE-MsgGUID: nDntv8K9ToqbpTNSS7BKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112158435"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3 12/13] drm/xe/pmu: Fail probe if xe_pmu_register() fails
Date: Fri,  7 Feb 2025 14:19:44 -0800
Message-ID: <20250207221945.2878241-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207221945.2878241-1-lucas.demarchi@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
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

