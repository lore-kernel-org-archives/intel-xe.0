Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E68C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 21:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DFF10EA70;
	Mon, 29 Jun 2026 21:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkfcgjQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ABA10EA70
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 21:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782769969; x=1814305969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N/0gBs3E6q6mhadnX+8Ztz8+RVBE+yLfO5+w2M8N2kA=;
 b=bkfcgjQ46OBJqoEFivusYhUpebGOBwbvObQTmvUqBeXoiXJI59DXJADe
 4SMFqwVwuo7pFpK1KDZDvx0o5iXDdmUjwO2y9eXUrLa1YbBAWCaVsGmhB
 MuzZBre1b+6YBrHZ9gCeiLvWKcCdbkXe2exfpsC/tZOPBMb37q61lboGU
 6NV0W+osxx+stFiWT/VeCL0763qh7F/lus5UVlfD/gmsH/nETS4xHDo02
 dbbNNYfVEbRyRrYqFIr5C5AkCNdltOqotzAcRf+rae/j5OvEVqnCL5p5V
 /m98DeyxUBiKxJN2nxGsHUhp/xnHFmO7V0xVgEYRXdFpgKE5p35WdyQfQ w==;
X-CSE-ConnectionGUID: vhSt4jlsQkK4wLrwm/eg4Q==
X-CSE-MsgGUID: GzyYkFMJRAKAtsJaoLvoRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83531289"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="83531289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 14:52:49 -0700
X-CSE-ConnectionGUID: s9czekCYT0m/KFP1QEjX9A==
X-CSE-MsgGUID: 9t8o5ewkR/K8RTnrXkZmvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="256012720"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 14:52:48 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [for-ci-only] drm/xe/nvl/guc: Check GuC firmware 70.71.0 for NVL-S
Date: Mon, 29 Jun 2026 14:52:13 -0700
Message-ID: <20260629215238.3844518-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Use new mmp versioned firmware for NVL-S.

Patch is intended for testing purposes only.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c0c02ecacf8e..83b766c140a1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,7 +118,7 @@ struct fw_blobs_by_type {
 	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 68, 0))	\
 	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 68, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 68, 0))	\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 68, 0))	\
+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

