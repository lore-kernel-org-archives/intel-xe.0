Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0794DC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5D110EE2C;
	Wed, 26 Aug 2026 22:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JawbRqkr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0049D10EE20;
 Wed, 26 Aug 2026 22:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787784850; x=1819320850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jalXI3WtrzBu+66HnKYV+P1XjzcS493Q8a/iTn4VO7o=;
 b=JawbRqkrr01baDnRt2a/T/D1dCKIu1PEYEN8tadoRq1hswpfol++kC16
 hp/ZEhthAQHdgzQzwlDLAZMUqOUcEezMbyAKTZT27vdn2kyesQJbDurH6
 0wZvLQWCVcz0vrpIXnfIzRrb7SqGSxT2TrrL7OP7sYcqL67J+7YQZHeZZ
 2Z9TXBvc0OGBiq9SzG2p2hP+6LgqklacgJQyHMRRgaMd+Dl9npIgTC9cv
 9GSWHuk3cYdWejYtf/+p4pxEaVjTgy8/O4fn7d1ar+flfWQK35L36fBjV
 SavMOqgjKqAV4GKX0k45VJCxBb7m17OzcrkrbXzFcZ9DyK0WTJb8srw2Y g==;
X-CSE-ConnectionGUID: 9HdkVKrGR2GRn022RQzx1A==
X-CSE-MsgGUID: NRXvDEGbRI2QsJkOdd8qoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87223505"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="87223505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:54:10 -0700
X-CSE-ConnectionGUID: 9YDObM4dSTaYE5+yw3fJBA==
X-CSE-MsgGUID: Q88v94nnQpKGP6q7A4gkag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="272946075"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 15:54:07 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com, pranay.samala@intel.com
Subject: [PATCH 4/4] drm/i915/display: Avoid HPD polling if the device is PME
 capable
Date: Thu, 27 Aug 2026 01:53:37 +0300
Message-ID: <20260826225338.804902-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826225338.804902-1-vinod.govindapillai@intel.com>
References: <20260826225338.804902-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Do not start HPD polling for devices capable of PME wakeup.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index ba494827c9cb..b29209f06e92 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -932,7 +932,8 @@ void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display,
 		intel_opregion_notify_adapter(display, PCI_D1);
 	}
 
-	if (!display->platform.valleyview && !display->platform.cherryview)
+	if (!display->platform.valleyview && !display->platform.cherryview &&
+	    !pme_capable)
 		intel_hpd_poll_enable(display);
 }
 
-- 
2.43.0

