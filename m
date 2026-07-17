Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4A5C44515
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D75910E493;
	Fri, 17 Jul 2026 15:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFTl15ob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C1910E493;
 Fri, 17 Jul 2026 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784302967; x=1815838967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BaE1WrfihNp+lq8joKY0I4vu/XcFi56MutJ63JSEjio=;
 b=dFTl15obZuJYIQzvwO7OLJims6IM6De8mqzjGqrJfx0Qsu6Y3Hg8H2I0
 4WR3s3u37v8SD9GdUY3fR6ILLCQL3iYMEUHOQOmmISIt/+qeE+FBgR90G
 Tm/9/dk2Rwa82oihQo2dADEZgr93mLldinyGZBjDomdPm4Se+hI6gQorg
 f37NkQHq37zi/6EnZxVt9d2lZxykIe55G2qpkA6JloMz16kXZLEUjLQmp
 K0fnSbVuGjSCsTIt5r25q1HLREYdH9Y687ncOVPL9Yhu1sPILkJZLaICA
 DjEIjkaSbnZ+ni3CDpETKLa4DtwfGqhydNhtIBnoM1+kmhNAyuWBbop0g Q==;
X-CSE-ConnectionGUID: 6LpOU18XTI+KkAlC5Hsqow==
X-CSE-MsgGUID: FkNCMB4ARJOsARmTeZQV6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88652116"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88652116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:47 -0700
X-CSE-ConnectionGUID: yhWeKOlHSHODt5yngih8tw==
X-CSE-MsgGUID: B5cwXhdWRsSbaRpwZuN6mw==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:45 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915: Clear plane_config->fb pointer when done
Date: Fri, 17 Jul 2026 18:42:32 +0300
Message-ID: <20260717154238.10792-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
References: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
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

Clear the pointer after we unref/free plane_config->fb. The plane_config
struct will persist after this while we repeat the readout for other
pipes, so having a stale pointer hanging around is a bit dangerous.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index 7427f41e4d7e..4c7e5de924cf 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -198,6 +198,8 @@ static void plane_config_fini(struct intel_display *display,
 			drm_framebuffer_put(fb);
 		else
 			kfree(fb);
+
+		plane_config->fb = NULL;
 	}
 
 	display->parent->initial_plane->config_fini(plane_config);
-- 
2.54.0

