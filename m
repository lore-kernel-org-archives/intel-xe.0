Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15F9C88CB2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4F610E652;
	Fri, 25 Aug 2023 09:39:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6809010E652
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956374; x=1724492374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2SbmUxXKB/mpHXv/vi7U83DuwSXz8D4iDW4T6VEDHPw=;
 b=cQmvL1+2Q4SjhGTQgevNVDKTkEtnUsqkhkxeXm5GdUgBb/fO43KfutAp
 LFym5GtjtDOKiyM7UUoB9/CFDphQ2a8vEJJPLC3+CGhmUwOhBZ0BJmFwS
 7XW+TrsXJwBH9KIq8/wwvmjPfraGVBAAZaOSNwqPkhS/pZB9mvaIjXBvf
 E/TFhNvVfBlMzQ6ipSM5zDPCk0TuMWwYaADL+IwLe/Jhsb/4hl6qMz3ZZ
 Sh2SUxIfS7X2+QkZ39HhJdGMfaeplO86NDtVcLVpQ1tQn/VMEGU43VuFV
 RQ4ogF7nmmUBDoa7yqrE0MI5gaI6Br6bi/UgJjKQ/yKIRlzp2F+O7BktQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037133"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037133"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246850"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246850"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:33 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:39:01 +0300
Message-Id: <20230825093904.1230143-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/12] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

Fixups related to "drm/xe: Add empty define for i915_ggtt_clear_scanout".

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 92e027fb52b7..48f5b2fc8bf3 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -230,9 +230,7 @@ static void frontbuffer_release(struct kref *ref)
 
 	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
 
-#ifdef I915
 	i915_ggtt_clear_scanout(obj);
-#endif
 	i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
-- 
2.34.1

