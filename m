Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF94D3F079
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 14:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914B410E6E0;
	Wed, 28 Jan 2026 14:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7LySltt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7382210E6E0;
 Wed, 28 Jan 2026 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769612379; x=1801148379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fEdqgvYFPvWJpsa3pJucaOQlS15fp708qTz479n7NCs=;
 b=H7LySltt/h6jUNDAdShNPobGVTC/3HZmK4X77BA+5ErvNRQLLX9KlSpH
 cj+qzzzNqTy4MDFGVnS99XysPBYNu1+N4csEXCEyrSQGlzQkY/Qek7iaH
 Ehd0luTGbT5T0pxkJ4xkZtFIRzxFDnVuGMkvgutx2fYAXS34ZswLURJOG
 sRpjs9BTtgKcLmn6RswcKf2IpdNR/IxImd7ZnumLAPbbGGtogGzZ73Pe6
 YkPv2pH2EE3B79h1yjXfR/JCQaXcvnjHnETNWN9EoO1hxUnbPoz/I6g80
 zRqC9yD2poKisNTBj6XnAUZLTbZiO1A/Bm2FiiPn6WN99+9PYeEgG09Nf A==;
X-CSE-ConnectionGUID: 20q1ZJj9QCuqBUoVTsAyNQ==
X-CSE-MsgGUID: LlMXU17nTZuu3VsZdbze0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70728175"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70728175"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:59:38 -0800
X-CSE-ConnectionGUID: YM8RVOnKQNWBxllIhlbgqg==
X-CSE-MsgGUID: axgBXTF+TnShPR435SxPkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="212845177"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:59:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 4/4] drm/i915/gvt: drop unnecessary include of intel_display.h
Date: Wed, 28 Jan 2026 16:59:10 +0200
Message-ID: <32359d5d5feb777ecc7c983d970823218851035f.1769612208.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769612208.git.jani.nikula@intel.com>
References: <cover.1769612208.git.jani.nikula@intel.com>
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

This does not appear to be needed at all.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 21341842c0a9..c026526c39f6 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -39,7 +39,6 @@
 #include "display/i9xx_plane_regs.h"
 #include "display/intel_crt_regs.h"
 #include "display/intel_cursor_regs.h"
-#include "display/intel_display.h"
 #include "display/intel_display_regs.h"
 #include "display/intel_dpio_phy.h"
 #include "display/intel_dpll_mgr.h"
-- 
2.47.3

