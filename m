Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B7C5DF70
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 09:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D165F10E6FC;
	Mon, 17 Aug 2026 09:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZD+9kP76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BAB10E6FD;
 Mon, 17 Aug 2026 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786958971; x=1818494971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=roLJoPtKRfW4V/tDa9JYQdVqNVg88H3jLoAksLmym7M=;
 b=ZD+9kP76uBmTk2kEW8EK2WSMjOhSSfDsax/T1Ma1/kg1/o66d+we5+4a
 2ZAizr2K1ohl2FcpOAsZNTn8GHXNCZDhqfGttwQqa+255z3vRcBswb/hq
 pO18HAfaQwmxvKS3TzliQ42nsigSwlP+pBqp6jUuO4VPbdIvHStCmxH01
 yshAcUmcUzKLerFOHIdxRbhCILROng4q4YH+nRR6VSid1VNHXED901MGn
 6BqCAATPWI5dktPZ49l8ENG3Udwpg5PBGjQEH9V+1cQHh7WGLibat1Ugw
 Eb/zL6z6ImPMWUVOvq3/b4YwCkG5sNDrU7sq0K1lDNAfRzv/fp73jO4g/ A==;
X-CSE-ConnectionGUID: lKJx+AEzQfu3G+dGsi+9SQ==
X-CSE-MsgGUID: PHcA6qisShSlEcPGJ1PUXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87189998"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87189998"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:29:31 -0700
X-CSE-ConnectionGUID: LWQ2n527S5akZ2dQhiPhPQ==
X-CSE-MsgGUID: a35JfjHaRBaZEb3BzZqeRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="268348875"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.136])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:29:29 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v3 3/5] drm/i915/display: remove unnecessary clock_gating
 include from intel_display.c
Date: Mon, 17 Aug 2026 12:26:22 +0300
Message-ID: <20260817092911.342072-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817092911.342072-1-luciano.coelho@intel.com>
References: <20260817092911.342072-1-luciano.coelho@intel.com>
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

We don't use any of the functions inclued in intel_clock_gating.h in
the intel_display.c code anymore.  Remove the respective include.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 553c60d452dd..fc30a455bed3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -60,7 +60,6 @@
 #include "intel_bo.h"
 #include "intel_bw.h"
 #include "intel_cdclk.h"
-#include "intel_clock_gating.h"
 #include "intel_cmtg.h"
 #include "intel_color.h"
 #include "intel_crt.h"
-- 
2.53.0

