Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56968D5B85E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0337710E4DD;
	Mon, 15 Dec 2025 17:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEFGeM1G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3685F10E4DD
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765820789; x=1797356789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FZFZijaPycfKYudsja9nCzog7FXu2CcsRn0RKP2Vluk=;
 b=CEFGeM1GXKa/bi/GiYPWXEuAq75cvdvVefx/Gv16gK6PPc9IXVJN0bIK
 60715AU7RFVNJcmWkwWGOgLJkiesU8kCl23kMoUUuKoUerfj6WAOLnd1H
 UCJTM1EkV41TjWoG6T3jmN9pLqekQA2rIAjsfUAIDYZR1t+fHBqldniHK
 GwPUF5gfqsCRW9NinNw/O1ZJkQMU8CHnti71Z+58AZrfOorckONp3GQji
 ngYG1XFzg45UUz2mmCeExqlgEvcGgIqVIVuQI1M9W3hk9LrSo+slfJcus
 P0cNcUbYDk+C84OOUfdX0z6Jj71y9A+r0ft5he+pOTvdicPC29o/R1VMS Q==;
X-CSE-ConnectionGUID: z5iDQqxeQpeZjWwi2ZW9Qg==
X-CSE-MsgGUID: MEeHqMaqRgCPjiwDWb/qOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67612357"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67612357"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:29 -0800
X-CSE-ConnectionGUID: knmlNtUZRQG2YDp0jFyloQ==
X-CSE-MsgGUID: wm0dBXp4SEaS5bmQ6dOFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="198610955"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:28 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v11 3/4] drm/xe/vf: Disallow setting wedged mode to
 upon-any-hang
Date: Mon, 15 Dec 2025 18:46:12 +0100
Message-Id: <20251215174613.3701-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251215174613.3701-1-lukasz.laguna@intel.com>
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
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

In upon-any-hang (2) wedged mode, engine resets need to be disabled,
which requires changing the GuC reset policy. VFs are not permitted to
do that.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 492446fdc4dc..15470e0558cb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1366,6 +1366,11 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
+			mode, xe_wedged_mode_to_string(mode),
+			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
 	}
 
 	return 0;
-- 
2.40.0

