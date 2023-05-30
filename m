Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6029AC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4137A10E385;
	Tue, 30 May 2023 10:35:31 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A0E10E379
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442921; x=1716978921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wMdneRrKDR9DaGWyCIa9g2QYvoVrc4iaIM0anbWOzpE=;
 b=O03oqwInUZlALlgUoq9ziSAMfOQzFGO3nFFClSe7F55yyXrJ3GsUsvo0
 gTG5Lxmdd2aLjS3HHkg+EeokmEQgolr1MUZWNQCRYUSkBfrrFe4zRvuUn
 qJVmpMXz/SGxG1BipFjOFyav5LG6AANjbUgTJAP+IdtghaeYqccsSkKU9
 C0BJ1BXSB/cJXISLcIcXf1g+6V/an/SwA+o8hyPTMWZkUxAhS/+43NkHe
 QGrSH3guSCizFpuw/yLgCjr1S0FMLjVb25/6EELOkxybJvA1DXnYsTbXU
 UAOpL3GBaua7eXg332C8sdhr2HIY0YDmxZC01dDn5BFUVjSpQLu9wCIUc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352378099"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="352378099"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:35:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796226181"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="796226181"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:34:59 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:34:18 +0300
Message-Id: <20230530103420.2561722-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530103420.2561722-1-jouni.hogander@intel.com>
References: <20230530103420.2561722-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/9] drm/i915/fbc: Stolen initialize can be
 checked in plane check for i915 as well
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

There is no specific reason to differentiate i915 and Xe in stolen are
initialization status. We can check it in plane check for i915 as well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b6fc993e6caf..109f86bb19ef 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1064,12 +1064,10 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 	if (!fbc)
 		return 0;
 
-#ifndef I915
 	if (!i915_gem_stolen_initialized(i915)) {
 		plane_state->no_fbc_reason = "stolen memory not initialised";
 		return 0;
 	}
-#endif
 
 	if (intel_vgpu_active(i915)) {
 		plane_state->no_fbc_reason = "VGPU active";
@@ -1724,11 +1722,6 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
-#ifdef I915
-	if (!i915_gem_stolen_initialized(i915))
-		RUNTIME_INFO(i915)->fbc_mask = 0;
-#endif
-
 	if (need_fbc_vtd_wa(i915))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
 
-- 
2.34.1

