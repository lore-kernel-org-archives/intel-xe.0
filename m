Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43151C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 13:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0033D10E2D5;
	Fri, 25 Apr 2025 13:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJXEwa6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757C710E2AD;
 Fri, 25 Apr 2025 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745588656; x=1777124656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/OJB8qkTcvfUUEe3I9ibsi+57PjJd+lRSp6q8UZg+eI=;
 b=VJXEwa6XJl3W5hXP4oid60pCdKr0RlWu3099+zcauzzF+aeoA4ONWZ5l
 jKyzRtONpEXba3n+NqQT/Ec7OFxIkCYv+nePhd00y+IaaJu5IrruXXzU7
 2OHOgAzX1osG7R/GF+56pISlmqwQInr035x1nkdKd3T/3YoWyCRmZ8e05
 zbVW5lK1hujLKdLMOe5wwDYeNEof0o+0VoiPualGWXPSn2lQx+ttYzb9t
 Fj6ZRUK3KGkuwzqu0kyrFs1BxnqdfhgyJKCcuCuYEOaw1fm1i8XdiD9sl
 G0oqmq+wJm8WV37nHxHi89PzHzrkC5/bGzgbCvjFQK18rMqwkXZ4Z1o5o w==;
X-CSE-ConnectionGUID: y5f9EupsT4SYj9DgJajrnQ==
X-CSE-MsgGUID: IE7JTyfpSRqsfHqTXKk55g==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47378287"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47378287"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 06:44:15 -0700
X-CSE-ConnectionGUID: DGm+yn9JRZOCHemuwKKO1A==
X-CSE-MsgGUID: 2uvAWTnNQwymtBZeIsvqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132826233"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 25 Apr 2025 06:44:14 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH] drm/i915/alpm: Check for alpm support before accessing alpm
 register
Date: Fri, 25 Apr 2025 18:51:07 +0530
Message-Id: <20250425132107.2926759-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

Currently as EDP only support alpm and check for alpm support will
prevent DP connector to access alpm register.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 482dd192d47d..1bf08b80c23f 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -556,7 +556,7 @@ void intel_alpm_disable(struct intel_dp *intel_dp)
 	struct intel_display *display = to_intel_display(intel_dp);
 	enum transcoder cpu_transcoder = intel_dp->alpm_parameters.transcoder;
 
-	if (DISPLAY_VER(display) < 20)
+	if (DISPLAY_VER(display) < 20 || !intel_dp->alpm_dpcd)
 		return;
 
 	mutex_lock(&intel_dp->alpm_parameters.lock);
-- 
2.29.0

