Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA4606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DwV2eP8P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF46910FA97;
	Wed, 25 Nov 2026 09:50:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9110FA84
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795600226; x=1827136226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=siGPMQqeBJEwSvL2zSe+ia1tvwEjjeJnDayHj/twPug=;
 b=DwV2eP8PPU2aLd9AreZToFAjtrNGx/Q/E1Xldn++9J5oyDGwRQ4PKpSo
 eNTGanSxXI7EwhSkhX8xQUeMDiC0KnvttYigfSecSY6nViRUAkst3Fapx
 6OBImXivKImlsIdig6PLREK/ooHSp+FmMX27vwW/63fOWDKqrVKYXYgRQ
 N5w6H0cctA6c2BO4XWNWE8IsADKD0Ac6PF+9UpTUfXkNpJNqSfKBgHpF2
 kJczyeCCwb02gRNqslec/d38F/jJGdg3CymhmOXk9yTuJzmyEX78eV0tc
 DT61+BtqCvnyY1mDyBiqjUNaLbXwhht2oZw/vlsK0wjmCJiDVOQcxiJ3Z g==;
X-CSE-ConnectionGUID: rb6cQbQfRdOlKNW+O5fw4w==
X-CSE-MsgGUID: CXch/xKvTW6csXeOjP5gag==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4448657"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4448657"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:49:19 -0800
X-CSE-ConnectionGUID: 95AjQ1DgT3+7ArQop2NFdQ==
X-CSE-MsgGUID: 6CKqNV0wSrGLDT9gjde6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="13493823"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:49:12 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, hiresh.kumar.yadav@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3] drm/xe/survivability: Fix infinite loop in aux info
 traversal
Date: Wed, 25 Nov 2026 15:02:53 +0530
Message-ID: <20261125093252.4188423-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AUX info register traversal can loop indefinitely when a register
points back to itself. Avoid revisiting registers by reading each
register once and collecting the entries that contain data.

v2: Add fixes (Riana)
    Modify loop (Riana)
v3: Remove non-zero check (Riana)

Fixes: 5e940312a2ac ("drm/xe: Add functions and sysfs for boot survivability")
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 91a0680e449b..2787ed952d2b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -168,11 +168,9 @@ static void populate_survivability_info(struct xe_device *xe)
 			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
 	}
 
-	/* Traverse the linked list of aux info registers */
+	/* Read all aux info registers */
 	if (reg_value & AUXINFO_SUPPORT) {
-		for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
-		     id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
-		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
+		for (id = AUX_INFO0; id < MAX_SCRATCH_REG; id++)
 			set_survivability_info(mmio, info, id);
 	}
 }
-- 
2.43.0

