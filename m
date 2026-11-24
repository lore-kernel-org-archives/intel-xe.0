Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A87606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TQjXDaa2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020F710E110;
	Tue, 24 Nov 2026 06:04:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47A210E110
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 06:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795500267; x=1827036267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7DsfLru9W9CPp1Zaslb+MATg8DwpewEGu08f+nRZ3s=;
 b=TQjXDaa2nSdBT0CYkAlsHYjE553kLHsHqN6W0oLBjeFtNHHVZ7oh0Oda
 pjW/dH2DwG6IJ6BTCBGIjAmJMjuhzCqKSnGiMtFeOTmSSeyGG+n0UHxix
 5BGncsgRURJlwtkFb8GfmqZkGt13VAlDS1lGiVTjaeWApGDl2IzQhmV8S
 8qygImKhm4yZCp0Iv6i+5hK/jZd6I6iTFmE1Trve6WEYj8iQjdr8V5ZT7
 R+NjxGa1N9tATqXirtOdxpqTm9aXUFjbewwwOxyzVU6aLhFcFY3u77G8U
 a4B2r+TSQ6j81V7/Ahft1rz9pr2UbQpe5fuDIN+7rM9g1QjqS8cicCgra A==;
X-CSE-ConnectionGUID: ZihtNjotQNOEHIVO96Fd9w==
X-CSE-MsgGUID: IPemBcR8R6i1FdyFtARa/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4377154"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4377154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:04:27 -0800
X-CSE-ConnectionGUID: EnOm22YKRfyiMb5Dr0pKPA==
X-CSE-MsgGUID: FSkcPTpjSuWuQ1E8QeBR0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11568709"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:04:25 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, raag.jadav@intel.com,
 anshuman.gupta@intel.com, mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3] drm/xe/xe_ras: Skip gpu_health sysfs commands when wedged
Date: Tue, 24 Nov 2026 11:34:07 +0530
Message-Id: <20261124060407.1973645-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com>
References: <20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com>
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

