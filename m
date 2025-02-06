Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A8C0219F
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9310E9C5;
	Thu,  6 Feb 2025 23:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiD9eg6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1217510E9BD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884237; x=1770420237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4+YR5F/G+mTnZdfweroyskaDwT1zXlFMqhwNAKeVX8w=;
 b=JiD9eg6nPbbOAKM50mNBnkxit1sUjQgN1p9ZJVCIk3fLVkOOTSbMWiR/
 oJahf/sHmQxpsAKuTNyoDRrszNrrDxe8UY7ZIcNbPBw0X0onAewdmLjAb
 sQ+neEonWe94BPUy0OyXZCWjMjl7aQKY/77hYnW2t0r7b3QTV1w1Ywx6C
 hoX972VcuoBiY1JUmH0ZHg9PSiZw9vIT85Qw3CZDkqEmAJmG54Gfi48Ej
 NzwVx6TDQiy78606blPyYSEkTzI4vdnAQGlovtAHjQHCFwvvapc0iM9dv
 f34fjjPUtgxlTQXZr4WN9OWdtXYA25egtfIWF+nGm8ut9sWC58cDS/lt1 Q==;
X-CSE-ConnectionGUID: lO23vOXtQZqiXP5zFdQ6sA==
X-CSE-MsgGUID: x7cpCVb9TeixuifJ5W2WwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61993728"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="61993728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:57 -0800
X-CSE-ConnectionGUID: PXVQbPxkSEqMPwLEOXm7dA==
X-CSE-MsgGUID: nXccFWipRF6SI4Rnjg9R2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134594811"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:55 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 10/14] drm/xe: Move drm_dev_unplug() out of display function
Date: Thu,  6 Feb 2025 15:23:28 -0800
Message-ID: <20250206232333.2660325-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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

This is not really display-related and needed for any sequence on driver
removal that has to interact with drm_dev_enter()/drm_dev_exit().
Just remove xe_device_remove_display() and inline it in the single
caller to make clear this is not done only for display.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 944a40a1e0174..5e4c50a70df35 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -954,20 +954,16 @@ void xe_device_add_remove_action(struct xe_device *xe,
 	list_add(&ra->node, &xe->remove_action_list);
 }
 
-static void xe_device_remove_display(struct xe_device *xe)
+void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+
 	xe_display_driver_remove(xe);
-}
 
-void xe_device_remove(struct xe_device *xe)
-{
 	xe_oa_unregister(xe);
 
-	xe_device_remove_display(xe);
-
 	xe_heci_gsc_fini(xe);
 
 	xe_device_call_remove_actions(xe);
-- 
2.48.1

