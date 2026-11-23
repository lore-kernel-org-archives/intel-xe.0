Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172A606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G4DcMBzl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429C10E342;
	Mon, 23 Nov 2026 06:57:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E18710E342
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795417057; x=1826953057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=30d4iQZqnj+mFy/Y61qtdQNGsLD7IFreB37pU7FY+v0=;
 b=G4DcMBzlNwFhz1+LCjm+VBc15reaH1Mex/50SPWji6HJtEq/r1h+1NPW
 gzV6SpMiCbfsfpc7D/MhZy2MTHLmg78nLzlSr4ThMuI9h1+NjjZ07iGae
 68fwKa0VpNE9mse2ph7cJ4Gl5vxHIcLYmud0jdcmmkuLMxE0/UJQEqmUg
 ZDjUNhaQUXh4WOp7Z+xoOZ/vy9FUlo+WudVfG5j3lCoVY5JrJumgyQlBM
 yNoIuSM9JJ/28CAscWl1+jfIgCd/sXax1o8LO083YK/fmg5sLyFVVVZwo
 /7a3bYWoL/+GLfiQWM7uhBkLDuB9kAlIxLf97OQKVQHV86a3wNDJwXbOX A==;
X-CSE-ConnectionGUID: WWa35w0UTZav5qkri5QuGg==
X-CSE-MsgGUID: mimI5vASRI244WlkCLgyIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4112282"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4112282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:57:37 -0800
X-CSE-ConnectionGUID: VcEG29xPTEaCstbP7zvmMg==
X-CSE-MsgGUID: 9zZlMMy/R0uA2ftMTZjjQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11364979"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:57:34 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, raag.jadav@intel.com,
 anshuman.gupta@intel.com, mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2] drm/xe/xe_ras: Skip gpu_health sysfs commands when wedged
Date: Mon, 23 Nov 2026 12:27:19 +0530
Message-Id: <20261123065719.1782607-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
References: <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
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
controller. Add a guard to skip the command when the device is wedged.

Do not skip when the wedge mode is XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET,
as this mode is intended for debugging hangs.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
V2:
  - Added support for not skipping when wedged in
    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET mode (Riana)
  - Removed xe_device_is_in_reset() from the guard (Riana)
  - Removed log message from the guard (sashiko, Mallesh and Riana)
---
 drivers/gpu/drm/xe/xe_ras.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb891d00b36..3c563ef67614 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1134,6 +1134,9 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
 	size_t rlen;
 	int ret;
 
+	if (xe_wedged(xe) && xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+		return -ECANCELED;
+
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
 				  &request, sizeof(request), &response, sizeof(response));
 	guard(xe_pm_runtime)(xe);
@@ -1177,6 +1180,9 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
 	if (state < 0)
 		return -EINVAL;
 
+	if (xe_wedged(xe) && xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+		return -ECANCELED;
+
 	request.health = state;
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
-- 
2.34.1

