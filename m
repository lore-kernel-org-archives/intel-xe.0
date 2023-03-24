Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD4C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 05:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129010E4D6;
	Fri, 24 Mar 2023 05:19:56 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2186010E4B5;
 Fri, 24 Mar 2023 05:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679635191; x=1711171191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CZF3AtT40YCR7Ww9/ERL63ym7qOEo70rJCtCIIKezis=;
 b=N1zI06W5az/Qu6waayFSvbTtp98niLwV7PTINGq8A5+iH4jBx2tfYWFl
 AeLlLjDoSN9sjVuU/ki1NmE3siC72to11FPUMnh05K5wFIvct1fpEyUl1
 VyxQ+ADr6VyXWIFXDhUmAj3LOXDNlD+BxfYcT5W1nDZ8ArjmpDr3y5En/
 dGpttufzPuBKNMwkYY/9xYKHazvkmgUONDJXV8C/mttx41wF5C3SIr/LS
 d6lG5WqQgdPHHpfCD3+taM24eJ9ag9238icHnCx/QfwaLquWUff/mj3/c
 1AD+tPBTnWCUlvN6LLpnVtJzALiZ+XpLPy7nctzb4yAT7vl3eoUQAoAPc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="341262582"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="341262582"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806523068"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="806523068"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:19:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 22:17:53 -0700
Message-Id: <20230324051754.1346390-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230324051754.1346390-1-lucas.demarchi@intel.com>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Fix platform order
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Platform order is important when looping through the list of guc
firmware blobs since we use it to prevent loading a blob for a newer
platform onto an older one. Move PVC after ADL.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_platform_types.h | 3 +--
 drivers/gpu/drm/xe/xe_uc_fw.c          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 72612c832e88..10367f6cc75a 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -9,14 +9,13 @@
 /* Keep in gen based order, and chronological order within a gen */
 enum xe_platform {
 	XE_PLATFORM_UNINITIALIZED = 0,
-	/* gen12 */
 	XE_TIGERLAKE,
 	XE_ROCKETLAKE,
 	XE_DG1,
 	XE_DG2,
-	XE_PVC,
 	XE_ALDERLAKE_S,
 	XE_ALDERLAKE_P,
+	XE_PVC,
 	XE_METEORLAKE,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e2c982b37e87..174c42873ebb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -43,9 +43,9 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
  */
 #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
 	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
+	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
 	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
 	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
-	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
 	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
 	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
 	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
-- 
2.39.0

