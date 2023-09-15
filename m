Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38113EE6455
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 10:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0810E61F;
	Fri, 15 Sep 2023 10:57:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B32B10E61B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694775457; x=1726311457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYJi9Og8zfeMUd2sWBNs95xpnhaDEdAjZ19XsnuAx5U=;
 b=YzASwRuLNVSnJHdlZqpebBVTl3VaPDZJWppNICR3S289IyjiY4Bfmn05
 lV8Rai+qDv+cvCMvUrjCXO1bqrcjpmEAo6+2/stWB/cBxlB1KxDXyr333
 z7u/R66a6GdwiLIzOrvlivtt8FZGDc7loVfwsPQAt6VfTfk5yA2Rx+bfb
 Uc6zP3erFq7US0Eg71Q6OiK1jw0D8Bxj+PPTlb+dMeERWabu3QEWFakTC
 Z6ezP4KpSP8c8Gi1h7LWrTX03QLSJynLWfw2IVkup27FoLSRVNQ8Fk4zr
 8KB8lJXOiPFERz5Hq887vcMEd097OXuTA5CdpHluyDaIvgHaSThc33Kh5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379140080"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="379140080"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="835171631"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="835171631"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:35 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 13:57:19 +0300
Message-Id: <20230915105724.1025509-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915105724.1025509-1-jouni.hogander@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit c3e942a06433e8c538108f24b4fe78a0927e2aea.

We are about to backport upstream changes that is taking care of including
intel_frontbuffer.h as necessary.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4d01c7ae4485..2ded1bcce754 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -16,7 +16,6 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
-#include "intel_frontbuffer.h"
 #include "intel_psr.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
-- 
2.34.1

