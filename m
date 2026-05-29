Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBC6CD6E43
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101E710FD28;
	Fri, 29 May 2026 11:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvI4809i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532B510FD22;
 Fri, 29 May 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052685; x=1811588685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OSBmgubsgnHv+DN89HxpuvBoLZnii19fHSBWfEMqlCA=;
 b=KvI4809iKeFePK8lvAWOyg4ELszgZc+JFh8cmsrNXKAPkGZSMxdbplOe
 eCrq9RsbknmVnsRbNxEHiX1jEWh6wkI2qNTIbIKvNoURzl7dgZTrX88wy
 6wf9sPlDIdReZ5qS94t5wcCzlnWRJw5j/ooU+6ckiWEXEMEzUhJ+KGz6S
 yDUsPWPMZt0VMPuDtFGnD0WHR5PZk33ehItrlpAVxgu72ng3tLi40ChbF
 k1OGgMXzNFrTUnZm6cG1HDSiT9m73Yx1aQCUgHey4SQ6H/0hGxpVi9AqC
 YWRh0wN9if1oBWainLx2WvumyMmSdYIdOtiy6HeOzSyqkXWxYPPgAmylD A==;
X-CSE-ConnectionGUID: pfxShsDwTc+7Iam5ZCz+Wg==
X-CSE-MsgGUID: k4aAcQa6TSCvx/E4fjqDMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92377775"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92377775"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:45 -0700
X-CSE-ConnectionGUID: h5YoBOO/TTiBh9XYp8zCaA==
X-CSE-MsgGUID: DOMdsnYQR0On6n7EyCLcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="246840884"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 05/24] drm/xe/display: drop duplicate intel_dp_mst_suspend()
 call
Date: Fri, 29 May 2026 14:03:49 +0300
Message-ID: <fdb44e0cc7503e19703aa787ba382147e2df598b.1780051905.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051905.git.jani.nikula@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

intel_display_driver_suspend() already calls
intel_dp_mst_suspend(). Remove the duplicate call.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 6e82dc70ca89..8d55e7a37d6d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -342,7 +342,6 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 		intel_display_driver_suspend(display);
 	}
 
-	intel_dp_mst_suspend(display);
 	intel_encoder_block_all_hpds(display);
 	intel_hpd_cancel_work(display);
 
-- 
2.47.3

