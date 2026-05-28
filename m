Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B54CD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 10:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F5710EFBB;
	Thu, 28 May 2026 10:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSIJi0BJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF1D10EFBB;
 Thu, 28 May 2026 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779964508; x=1811500508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FO5PgDtAqxhnpRjX5vBzDxLUpqz4TErkjfeZ25m5Kr4=;
 b=DSIJi0BJW55BKWTfcrU/17a0Xwfah3HAbVQRDJwBsgKxypqR/2VfA7D7
 vwG+uUaC+iLRaXAd4Xy/qefYpJdLEG5D56Jm1LEYJqCrnZZHEng78NAll
 LtBGzU8xZXmf8EHd3OXrF4+EmvfDaPcHnj9p6vRbS/q/1l2aXWXUcF1ML
 TTgei0RompEakeJ08FlJHX+hns9ckt/t4L2VNPAQvP1ITO8k5NEgw4B57
 ezqTwVM/K1jMOS4GLa3GblOSJ8+2ZiwiG5tyPcuXFRA9WI2sOxsGL0EKI
 RkuZ6jnYghtZxDvpybqbLHsZ0krvoqiTP3RbOmdg9PTKP7K7168VpxQgN A==;
X-CSE-ConnectionGUID: xgVstZtTRpepksDhHbMhKw==
X-CSE-MsgGUID: gxWW6dePRfSxcGRySl5qjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98221210"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="98221210"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:07 -0700
X-CSE-ConnectionGUID: jqY3aQ7fQ0mmiE4Y9MZuPg==
X-CSE-MsgGUID: jmAsoP4cR4aDOfkxC/ki/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="241682300"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:07 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/11] drm/i915/bw: Don't memcpy() pointlessly
Date: Thu, 28 May 2026 13:34:48 +0300
Message-ID: <20260528103458.18069-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
References: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Structs can be copied with a simple assingment. Eliminate
the pointless memcpy().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index dc5a5b639d87..d0ceffc93f36 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -758,8 +758,7 @@ static int xe2_hpd_get_bw_info(struct intel_display *display,
 	display->bw.max[0].num_planes = 1;
 	display->bw.max[0].num_qgv_points = qi.num_points;
 	for (i = 1; i < ARRAY_SIZE(display->bw.max); i++)
-		memcpy(&display->bw.max[i], &display->bw.max[0],
-		       sizeof(display->bw.max[0]));
+		display->bw.max[i] = display->bw.max[0];
 
 	/*
 	 * Xe2_HPD should always have exactly two QGV points representing
-- 
2.53.0

