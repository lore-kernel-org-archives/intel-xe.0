Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796D3CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344C710FF82;
	Wed,  3 Jun 2026 15:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K78eWkmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300D310FF82;
 Wed,  3 Jun 2026 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780499681; x=1812035681;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BLqCl781aGMSIvLHXopftwVefnFeWECJZ8M+NSHVfO8=;
 b=K78eWkmVYp1oXhF4FDPH5eDJybtNg1IH5MoFATTxeqd0Y38mpZufQsWW
 YrvXgcXa5kPICDVQL96zPgSrJawvIOqV01Ul8alIxDbO9GlodBQde+Fqo
 tvM6B9CKU0CqMnoj7l8ycP/RygEtrlxkp693apAk7YGHOkjPdGiXCSL0t
 Jqy4uljUEQa9C18dH/oUYMpZXefd5MIwMYIngcTHoj5hFbTK6C080jkVP
 uAPf/IsQOcpHolGxPbupv7YOzKGlpdT7CHXXr3WOcPnSGC5wTLI96KTK6
 SrKw8ml0hkgtJ3ZjI45W9lER3GYr8IoCdjQEfb1Ca47AT45Hv2m+TOx+K w==;
X-CSE-ConnectionGUID: AQJaaPNfRrKbNM6mGk0gsA==
X-CSE-MsgGUID: AR0lQmcpRwCYCEJBbO8H9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92421172"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="92421172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:14:40 -0700
X-CSE-ConnectionGUID: 9ZQMnV8eTRiDe6178zXzFg==
X-CSE-MsgGUID: lfoXHvXNS/i921lMquiquw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244380730"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:14:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/8] drm/i915/color: cleanup plane pre/post csc lut code
Date: Wed,  3 Jun 2026 18:14:27 +0300
Message-ID: <cover.1780499355.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

While reviewing some patches I noticed the
xelpd_program_plane_pre_csc_lut() and xelpd_program_plane_post_csc_lut()
functions were a bit convoluted. Reduce the number of loops in each from
four to one, among other things.

BR,
Jani.


Jani Nikula (8):
  drm/i915/color: clean up variables in
    xelpd_program_plane_pre_csc_lut()
  drm/i915/color: clean up variables in
    xelpd_program_plane_post_csc_lut()
  drm/i915/color: reduce indent in xelpd_program_plane_pre_csc_lut()
  drm/i915/color: reduce indent in xelpd_program_plane_post_csc_lut()
  drm/i915/color: join loops in xelpd_program_plane_pre_csc_lut()
  drm/i915/color: join loops in xelpd_program_plane_post_csc_lut()
  drm/i915/color: deduplicate loops in xelpd_program_plane_pre_csc_lut()
  drm/i915/color: deduplicate loops in
    xelpd_program_plane_post_csc_lut()

 drivers/gpu/drm/i915/display/intel_color.c | 117 ++++++++-------------
 1 file changed, 45 insertions(+), 72 deletions(-)

-- 
2.47.3

