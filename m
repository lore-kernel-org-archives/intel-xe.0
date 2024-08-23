Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F78BC531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 11:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F94510E44A;
	Fri, 23 Aug 2024 11:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geROMDgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C8710E4AB
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724412129; x=1755948129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f9iMgOmU/VbKCQjq+ofrtAnkxVtjEf+tqf5f2lhfojY=;
 b=geROMDgPpIeSKsO+O2UYG+gfI537+Mu2RX+HbaIaIbiFym+qJX4LlAd8
 wzCoOyaWQsMlYm6MKsASXeCi+GBW4DZiBqwgbzs3pbZAdwLs/8DfSVHbI
 RjwWXKCQYLOpZmOe0dNoNVI+h3V9EKLOYhKiACw9X1YZ86f36oE6OsGZZ
 YpTvmgX+pjEYERxTF15T2u+yozDIyOFlaHkynLuLGjzjq9BFDS2m9IM71
 HEWYP+Hft/btDLmSaBjnhrrgld3P4wgZF5Rdfz+MwbT7CtV2DfVVjWYOT
 c6VY4EssbpY80EsqVEl3Vm/k6VeHuxiBUwtqXNm7RZxZS4vuZVhvOBXxK A==;
X-CSE-ConnectionGUID: dWiq0SQ+TFWr3/Rjzw9nFA==
X-CSE-MsgGUID: aMtgyMI9SGuLHDIzWPWFOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23000473"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23000473"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:22:09 -0700
X-CSE-ConnectionGUID: 8bpnhSOGRTWv5NUeFRPFPw==
X-CSE-MsgGUID: C6/iT6DsQHuTX/jdo6Ji3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="61473811"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.4])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:22:06 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, rodrigo.vivi@intel.com, uma.shankar@intel.com,
 ville.syrjala@intel.com
Subject: [PATCH v4 0/3] handle HPD polling on display pm runtime s/r
Date: Fri, 23 Aug 2024 14:21:45 +0300
Message-Id: <20240823112148.327015-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Switch to HPD polling on display pm runtime suspend to enable
HPDs on runtime suspend scenario.

While xe_display_pm_suspend/resume() performs steps during runtime
suspend/resume that shouldn't happen, like suspending MST and they are
missing other steps like enabling DC9, this patchset is meant to keep
the current behavior wrt. these, leaving the corresponding updates for
a follow-up

v4: Rebased

Imre Deak (2):
  drm/xe: Suspend/resume user access only during system s/r
  drm/xe: Handle polling only for system s/r in
    xe_display_pm_suspend/resume()

Vinod Govindapillai (1):
  drm/xe/display: handle HPD polling in display runtime suspend/resume

 drivers/gpu/drm/xe/display/xe_display.c | 39 ++++++++++++++++++-------
 drivers/gpu/drm/xe/display/xe_display.h |  4 +++
 drivers/gpu/drm/xe/xe_pm.c              |  8 +++--
 3 files changed, 38 insertions(+), 13 deletions(-)

-- 
2.34.1

