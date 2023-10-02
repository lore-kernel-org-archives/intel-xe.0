Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3C7E784AE
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 06:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D671510E174;
	Mon,  2 Oct 2023 06:58:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13AC10E184
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696229897; x=1727765897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=69U0IlUndR5VUcTIVZd821QyCmBruyt9dqnTm5AHJwk=;
 b=XfgJeE38hJr2G1RgylI3Qr4IwT1H/VySk2nTUfwG4xdsf7aXbQXq4trO
 a+iZ4yFDlZd2WbJDRdBdItcaFhBhLkD1bWWOBb3Hvn3szURE9e3SBSY81
 nbzFjH67q/udMlD7v+/DOBWwgiSFZZgfnZgBIcoMMFpiOKmw8IFQTi0y5
 I3qj2tRGphYnKQTgMt+vckUoLpAVpR3eivjm9fX4FjS4C7Rdj96AiIJu8
 kbDajFtAdIjp5Pz3MRwhtA7qkPWDHPIqEmKSqcc1+xuwo2QILhT4v+SbU
 8JSdHOgmmDJdh5JDKe96EDy3wB3Lh4/aVern+GslI9/HJhFicbFS59S1E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="372942729"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="372942729"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2023 23:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="1431348"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2023 23:57:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 09:58:01 +0300
Message-Id: <20231002065802.3609656-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002065802.3609656-1-jouni.hogander@intel.com>
References: <20231002065802.3609656-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] Revert "drm/i915/display: Include
 i915_active header"
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

This reverts commit 6ca0e8966a68524d292d1b5448963454a0878a01.

Next patch will backport similar patch from upstream.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index b80cf8fb1c97..58bd80989e4b 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -56,7 +56,6 @@
  */
 
 #include "gem/i915_gem_object_frontbuffer.h"
-#include "i915_active.h"
 #include "i915_drv.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
-- 
2.34.1

