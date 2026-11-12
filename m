Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A2B606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=leWqXf8g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8760710E4D9;
	Thu, 12 Nov 2026 06:07:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAB210E4C1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 06:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794463641; x=1825999641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yqupknwMwdkRA5XrqEP4Lj1TlV24dmIPxRymMlLwUjM=;
 b=leWqXf8g15+cyoYsXmTkPpsZ/UXKrsDXz+OVau1q4uge+Kl0Ls65h/w7
 uBXfdDjuBCg/1tIno+LMBPm5ZH6k9jZEzCMlpt36tMgvphEj0q2i8UQV2
 VfI5qaFiZ0a1PVY0VxQYZNckqRiFqJSR+VkAWkEeSaRNuQxGUX032C9qm
 FWgWgRS5m4p6PKGjOcq6MlfHTG7xZJggGuiWwGLvT5YKViiE5iILbXNq9
 WJJ1B7J2Yk0c7YrWWoUtIj6cAc2fZkLKoJMeZoXTwwWxCNEk4QXYW21dL
 jYBI+oILlVzCMaI3I4F7qT3nk4GgiLvXpFSOPEDyL2Y/2hWEg2pMjh/rB w==;
X-CSE-ConnectionGUID: agV5pmT3TYGOWMQ8/HZmyw==
X-CSE-MsgGUID: UfMJpQi1Q3iUNQnBkFnkCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3265003"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3265003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:21 -0800
X-CSE-ConnectionGUID: b8ziHJzpQ0+6mBOaJXufog==
X-CSE-MsgGUID: aJfVb/xIRKmt00gXA7OSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8576208"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:07:18 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v5 2/8] drm/xe/hw_error: Initialize hw_error_work per tile
Date: Thu, 12 Nov 2026 11:37:04 +0530
Message-ID: <20261112060701.3327125-12-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112060701.3327125-10-riana.tauro@intel.com>
References: <20261112060701.3327125-10-riana.tauro@intel.com>
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

From: Raag Jadav <raag.jadav@intel.com>

Since hw_error_work is now being reused generically, initialize it per tile
so that we don't hit uninitialized work for non-root tile. While at it,
disable hw_error_work on fini to prevent UAF during unwind.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add dgfx and sriov check (Sashiko)

v3: retain original patch and fix unload issue in later patches

v4: move dgfx and sriov check to later patch
---
 drivers/gpu/drm/xe/xe_hw_error.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index a934b649575c..ef41bd24ece0 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -537,6 +537,16 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+static void hw_error_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		disable_work_sync(&tile->hw_error_work);
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
@@ -546,12 +556,15 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_tile *tile;
+	u8 id;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->hw_error_work, hw_error_work);
+	for_each_tile(tile, xe, id)
+		INIT_WORK(&tile->hw_error_work, hw_error_work);
 
 	process_hw_errors(xe);
+	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
 }
-- 
2.47.1

