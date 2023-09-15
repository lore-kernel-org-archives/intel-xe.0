Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F811EE645D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45C110E632;
	Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FED10E62B;
 Fri, 15 Sep 2023 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784218; x=1726320218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZpUGQnCGcfzNIYQ6/Qibr1TChonAz3/FFWDCchuOEo=;
 b=FIOvhn5bogXnhp9JjxoPPWmVvWDWnUXaJe9P6AmQyxdHOBicbTheYUZF
 XmbdcYzMk6WSUQFHR/VFPGkR1i+IfifKHWerO7oBzi5SSz7Oci03/HzLL
 CyZzyak8T88pveyroeMxVq9NhQ7zVTMKEVnaDsn5VEr4He7tlawfT1bQq
 u0M6P7Nk5gf1/zFAFEy1HbG4Hc/25O/5oSkltU8V9FkprB+GYgfN6cpzM
 GjtoIVFPLFpQAws6rz9Zq5jf2q6+ngJ+J8wclNNHF20tj1p9o2ph8mJ6r
 xmNrpkaKMXBIpVVuu8onzP+/CPagS054o7xwhCe1naVfUlv9S83WpNBQe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292134"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292134"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515421"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515421"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:35 -0700
Message-Id: <20230915132346.1845909-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 03/14] lib/gpu_cmds: Reorder if/else ladder
 according to IP version
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make it easier to follow the flow by following the convention of "latest
platform earlier".

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/gpu_cmds.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 648451f74..0fd8f8213 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -270,17 +270,15 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 	binding_table = intel_bb_ptr(ibb);
 	intel_bb_ptr_add(ibb, 64);
 
-	if (IS_GEN7(devid))
-		binding_table[0] = gen7_fill_surface_state(ibb, buf,
-							   SURFACEFORMAT_R8_UNORM, 1);
-
-	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
 		binding_table[0] = xehp_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-
-	else
+	else if (intel_graphics_ver(devid) >= IP_VER(8, 0))
 		binding_table[0] = gen8_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
+	else
+		binding_table[0] = gen7_fill_surface_state(ibb, buf,
+							   SURFACEFORMAT_R8_UNORM, 1);
 
 	return binding_table_offset;
 }
-- 
2.40.1

