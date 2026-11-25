Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B3606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gdKnwmni
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8B510FA5E;
	Wed, 25 Nov 2026 08:56:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DAE10FA5E
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795596985; x=1827132985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ykeLYonJqFEt8MjbEEnuKYWnSRh/JENd9xfDb1uwXS8=;
 b=gdKnwmnimEUxEbBMteKZl2yq0uF8yfJWvC2mJMwL4uRkzznFhs9YlffX
 5fnk+xDNxshgJFWuKh2j45tYP5dZB2/LfqCtyNsuX4YoJjQu70CXV/njL
 ij1QHXlmDFkoeKkPN6Mqr1RkzQXHeZPpvpEBBaUkxEnsG4cthdFMEb+qE
 hU338VJwgUjRoUSx7CLBaS2kLEKJlDQbaDEHUkPMpgxxi/h2l0Am6usrh
 2aEXhthQNj1rKB5UxMUL8/5ztLDL1veXAOxOV9iH6rPe0PmluWLVKqOx6
 jFPp7wYH8YvlNXNyuJgbCe45l3k2onMlcmMSOLAHliy8pKs6nZbof1ClX A==;
X-CSE-ConnectionGUID: UYDmpd4JReOmQIRweyW1xA==
X-CSE-MsgGUID: O2PP3+cyQ6qhmPFgGaavng==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4456553"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4456553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:56:24 -0800
X-CSE-ConnectionGUID: MsFpUD+jTre4fa8F/RP1Yg==
X-CSE-MsgGUID: Di0tbZJ5Td6JTEMIgo2MTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12122291"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:56:22 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, raag.jadav@intel.com,
 anshuman.gupta@intel.com, mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v4] drm/xe/xe_ras: Skip gpu_health sysfs commands when wedged
Date: Wed, 25 Nov 2026 14:26:10 +0530
Message-Id: <20261125085610.2002508-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
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

Accessing the gpu_health sysfs attribute sends a command to the system
controller. Add a guard to skip the command when the device is wedged
and not in XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET mode.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
V3: 
  - Replaced the wedge mode no reset condition with xe_wedge_mode_is_no_reset()
    in the guard
V2:
  - Added support for not skipping when wedged in
    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET mode (Riana)
  - Removed xe_device_is_in_reset() from the guard (Riana)
  - Removed log message from the guard (sashiko, Mallesh and Riana)
---
 drivers/gpu/drm/xe/xe_ras.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 9b04be3405ca..0c3238cbe446 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1298,6 +1298,9 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
 	size_t rlen;
 	int ret;
 
+	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
+		return -ECANCELED;
+
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
 				  &request, sizeof(request), &response, sizeof(response));
 	guard(xe_pm_runtime)(xe);
@@ -1341,6 +1344,9 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
 	if (state < 0)
 		return -EINVAL;
 
+	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
+		return -ECANCELED;
+
 	request.health = state;
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
-- 
2.34.1

