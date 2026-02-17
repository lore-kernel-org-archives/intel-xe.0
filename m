Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB85E8384C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 05:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBD410E1E9;
	Tue, 17 Feb 2026 05:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGIgzkj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E2610E1E9;
 Tue, 17 Feb 2026 05:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771307715; x=1802843715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZJolwOohIGuEpTCS8hg3yVk9Roa/lTw7g+uHKmlSyU0=;
 b=UGIgzkj4Uzt5RAvcm2WMsMFH1cfnp8rb40Vw/6ZggBIpvzxs6PRVxiXy
 arVSh0Gb+hr2SxegVdHCldglfhE/5hoN2oO9PPPsx08zz5KHob0KvAvRc
 EhIIVXGc2ZzwHfSI2vBXBuq8geZDjPv1jhI74DFzuYMTlcT7vm5Ebk2Tx
 MFohnw3T7DMaJxijIzRVSlJdFJ5C3FpNbQd+vc/sxrCLrIg0fnqzCJHUl
 txzBSFWYhKRZdZfovaiCMHmYvx8cOlFC7kfoE5HP/hGj/MR/kJbWM5W1N
 +EUFP/jhwI6jQugDwhtpXqczZX6B4wR7Mw/QnqN1ANjfB53NnLNT8lTq3 A==;
X-CSE-ConnectionGUID: XAv/YvisRWebA5JHdZEpUg==
X-CSE-MsgGUID: ELS+ujXjTUyaZwvWyehLTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83473757"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="83473757"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 21:55:14 -0800
X-CSE-ConnectionGUID: VSGu/7y9R6+hrVusPUjnEA==
X-CSE-MsgGUID: +KypM3gnTLGRp77nDGyPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="218321290"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by orviesa004.jf.intel.com with ESMTP; 16 Feb 2026 21:55:12 -0800
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] drm/displayid: reduce DisplayID checksum error logging to
 debug
Date: Tue, 17 Feb 2026 11:20:01 +0530
Message-ID: <20260217055002.245099-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
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

The patch "drm/displayid: add quirk to ignore DisplayID
checksum errors" introduced a mechanism to bypass checksum validation
for certain panels. However, even when ignoring the error, the code
continues to log a DRM_NOTE.

On affected hardware, this results in persistent "DisplayID checksum
invalid" messages in the system log. This noise often misleads users
into thinking there is a critical hardware failure or a functional
regression, despite the quirk successfully handling the issue.

Downgrade the log level from DRM_NOTE to DRM_DEBUG_KMS. This keeps
the diagnostic information available for kernel developers while
silencing the unnecessary warning for end-users.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 58d0bb6d2676..1f6d78fe29f2 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -69,7 +69,7 @@ validate_displayid(const u8 *displayid, int length, int idx, bool ignore_checksu
 	for (i = 0; i < dispid_length; i++)
 		csum += displayid[idx + i];
 	if (csum) {
-		DRM_NOTE("DisplayID checksum invalid, remainder is %d%s\n", csum,
+		DRM_DEBUG_KMS("DisplayID checksum invalid, remainder is %d%s\n", csum,
 			 ignore_checksum ? " (ignoring)" : "");
 
 		if (!ignore_checksum)
-- 
2.45.2

