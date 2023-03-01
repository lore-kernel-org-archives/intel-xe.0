Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EA8C7EE33
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 09:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41FE10E221;
	Wed,  1 Mar 2023 09:31:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9710E0B7
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677663107; x=1709199107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8MTq1lFE2GQt1jN5Ikd4tK+rn1I9A0UXOWvVKdrABLE=;
 b=NzKXaGp8gdbd011fIIrpnegDGod4rtITgWlCIgyaJIi7r9eiQ7wPCrEU
 /K657zuTBLKHXw+cZgD3TpsQH5GxJJhA2JJGtHUcUGS8oTvyY3jUOfM2F
 OvaefDUmxcbZJ7Agj0FMp8H1yO94OPwLrkJ3A0OpHLWCL8FS//Z2hUHJq
 89k3PrNWiNBneZq0JffRvtaiiiczs24s/3R8SqvIj1R0I6lKlAliXjZPP
 hE4L7FHlTgjZt4d1FvRFGIhDlhxLVy9fxiXqslgHc8E/aBRX0SCzhYx+L
 hVwoNiZCTy4ZHOgu7LwDyC1ZxwOFeXjyAwhIj/KTvedgTlbHEmcoHEcNn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="333091759"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="333091759"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003600503"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="1003600503"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 01:31:12 -0800
Message-Id: <20230301093112.2893689-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301093112.2893689-1-lucas.demarchi@intel.com>
References: <20230301093112.2893689-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/7] drm/xe/pvc: Remove A* steppings
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The PVC pre-production A* steppings are not going to be supported in xe
driver - the steppings are important for the WAs and since we are not
adding the pre-productions ones, there is no need to add the stepping.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 14f482f29ae4..ee927dfd3eb3 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -79,14 +79,12 @@ static const struct xe_step_info dg2_g12_revid_step_tbl[] = {
 };
 
 static const struct xe_step_info pvc_revid_step_tbl[] = {
-	[0x3] = { .graphics = STEP_A0 },
 	[0x5] = { .graphics = STEP_B0 },
 	[0x6] = { .graphics = STEP_B1 },
 	[0x7] = { .graphics = STEP_C0 },
 };
 
 static const int pvc_basedie_subids[] = {
-	[0x0] = STEP_A0,
 	[0x3] = STEP_B0,
 	[0x4] = STEP_B1,
 	[0x5] = STEP_B3,
-- 
2.39.0

