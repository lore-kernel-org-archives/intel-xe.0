Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671B8C00A94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 21:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE4910F4F6;
	Fri, 12 Apr 2024 21:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlsywURq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300AF10F4F6;
 Fri, 12 Apr 2024 21:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712957668; x=1744493668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PPs7la64fRnEcHtPXF2VBqVV8X4NHEU53jvV8+5+A7A=;
 b=jlsywURqs0E87cN/KK+3RjJIgryeVD2pNJBxO5tznlPrkL15a4931+It
 lWJeCP3MoQkZtnL/P667GSpUiRvqGgRw9JSPQJVuXcbPGRtTd2BrajC9R
 h9wur0prQ2pVgZMft5BmN/9j/HO02ZXfzqTm41YWAYEswif86z8N9h6OR
 ooaUAAxXKOwd4aNT6vq2oLcRmEUowPXUNY8AmLh3YFQg4xcN1PLRukKYS
 s55I7+KIOiaRv5YFTR7URqI7EH5UReZ5ZKD51q2TduIa+GbWkOxXh/EOF
 XVjVGxEqWRRae8pNO6b1K1u1hoqrgYP6mOy/FWFNv1DlGioHeV0TrjC3Y g==;
X-CSE-ConnectionGUID: XUHQC5x1SVWtGf31I/1ZtQ==
X-CSE-MsgGUID: BM+3VxSeRlu21K7seIzyRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8290829"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8290829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 14:34:27 -0700
X-CSE-ConnectionGUID: QzcQYFK4SaK1N2NLOUJswQ==
X-CSE-MsgGUID: n7q5AU6ZSJSRwM7IX4Hnhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="52517093"
Received: from fcorbetx-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.252.42.182])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 14:34:25 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v1] drm/xe: no need to call fixup_initial_plane_config in XE
Date: Sat, 13 Apr 2024 00:33:42 +0300
Message-Id: <20240412213342.181465-1-vinod.govindapillai@intel.com>
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

In XE, the updated fb mapping is already done and updated as
part of intel_find_initial_plane_obj(). So no need to invoke
fixup_initial_plane_config() again as it would basically write
the same data to "PLAN_SURF" again.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 9693c56d386b..51eb80729cfb 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -297,9 +297,6 @@ void intel_initial_plane_config(struct drm_i915_private *i915)
 		 */
 		intel_find_initial_plane_obj(crtc, plane_configs);
 
-		if (i915->display.funcs.display->fixup_initial_plane_config(crtc, plane_config))
-			intel_crtc_wait_for_next_vblank(crtc);
-
 		plane_config_fini(plane_config);
 	}
 }
-- 
2.34.1

