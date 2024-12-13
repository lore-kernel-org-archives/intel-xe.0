Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4E1E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 23:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91BD10E277;
	Fri, 13 Dec 2024 23:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLRuA6HO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6650010E277
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 23:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734131556; x=1765667556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5XlSHU+XS8ncwR8KM3sbjUB0iowNJi54DrHFMSJeX8U=;
 b=KLRuA6HOzObTx+zXSC7uJtwoSGsYOoNarGpHC3UExLuHNZMtYhirSoOx
 ekVq56c9Y9qb33fFVAvc9ljVR0O5/7e/unNF+psL2y6nUScdzi28V0wqR
 3CSdv8rdcsabOGRYWOA68KmscCWA1XkxZcdV4VRPSMu1JNanvJ/BuDjbi
 935uk+kuEetlm5DonhLnZkCwfxaOEXUhE2eNtxyPJjgjdCUxwzeOMWdC0
 OFi9dHqz5qi4i6GbJ0RmfkR9yOh09U7VzyLkauHOXy4lIAzIOBKUAG68R
 cK5sGqwsB+TroD/fnUDKkw4eyyd0uF5UQ9gxiH75uuYw7cBbJoQpizj8K g==;
X-CSE-ConnectionGUID: gKLVpfE9RRWoEENw3xU5hw==
X-CSE-MsgGUID: Ggm/0lJuSsO90unwXByFpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34326273"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34326273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 15:12:36 -0800
X-CSE-ConnectionGUID: DRiyuRzCTt6v+CmZJG2KcA==
X-CSE-MsgGUID: eO7aCWRdRWmWJNLbFvOmRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="127463747"
Received: from dut4440lnl.fm.intel.com ([10.105.10.44])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 15:12:36 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] drm/i915/display: Do not report timeout on suspend
Date: Fri, 13 Dec 2024 23:12:34 +0000
Message-ID: <20241213231234.81647-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

In intel_dp_aux_wait_done, we call intel_de_wait_custom.  This call has
a 10ms timeout before reporting ETIMEDOUT.  However, if the display pm
runtime is suspended, then it would be expected for this call to time
out.  This may be the case, for example, during an engine reset.

Do not report ETIMEDOUT here when the pm runtime is suspended.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 04a7acd7f73c..25c37398f930 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -66,7 +66,7 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
 				   0,
 				   2, timeout_ms, &status);
 
-	if (ret == -ETIMEDOUT)
+	if (ret == -ETIMEDOUT && !pm_runtime_suspended(display->drm->dev))
 		drm_err(display->drm,
 			"%s: did not complete or timeout within %ums (status 0x%08x)\n",
 			intel_dp->aux.name, timeout_ms, status);
-- 
2.43.0

