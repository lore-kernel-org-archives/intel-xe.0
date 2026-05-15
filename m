Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D16CCD4F3C
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 19:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC01610E0FE;
	Fri, 15 May 2026 19:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/IIsBst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B472710E0FE
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 19:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778874993; x=1810410993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LQ4CYaL8J6Une/3owXf7DhDM9RDXbqb/dAWtMkagCIc=;
 b=D/IIsBst2AJDzoVhAut/72/wC4AUURDaxUgv/Ds8ayLPNDO/+b4ttbZk
 AxV6w0u/Dh6vzEhHLNDL4bRWRQF+Gi335pFWTv99H8gtD13MqEs54dr20
 VVT7zFalckypRDHV8BXFPh6I2Irj5yRpwQgUJxEQw2EMPo9TnLjTh3x+s
 KrC4iehSd8PiwZThrVUnBRW28CIu77rnyzN/+AdXBeBew4xgkXOQwcNEq
 0R2yau0irqKTKUPWTqlJNlctaVWyPP+dBHIwaTdEK/TKaYyh7kMOOzYUp
 S1eiNl5Tm7vIEa+OAn5pwK3YdF0/qjw1XtcB/qi3WdNPUCviSUjZhLg8+ A==;
X-CSE-ConnectionGUID: HpJRoiqsQUCBVU9trfF5+w==
X-CSE-MsgGUID: +ihchpM0Sgq77GeJqx96aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90145536"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90145536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 12:56:33 -0700
X-CSE-ConnectionGUID: VSNOBfyrRP2rWe7T/czywA==
X-CSE-MsgGUID: NziM4vVGRrab88tlvbN6KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="243117368"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 15 May 2026 12:56:31 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH] drm/xe/late_bind: Release firmware on parse_lb_layout()
 failure
Date: Fri, 15 May 2026 19:56:02 +0000
Message-Id: <20260515195602.890981-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

When parse_lb_layout() fails, the function returns the error without
calling release_firmware(fw). The previously-allocated firmware buffer
is leaked.

Release the firmware on the error path before returning.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 1fb4960b3e28..f5ceee0ffada 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -340,8 +340,10 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	}
 
 	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
-	if (ret)
+	if (ret) {
+		release_firmware(fw);
 		return ret;
+	}
 
 	lb_fw->payload_size = fw->size;
 	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
-- 
2.43.0

