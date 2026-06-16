Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D189CD98F3
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164ED10EB50;
	Tue, 16 Jun 2026 12:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zy5YCJ0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4DB10EB4D;
 Tue, 16 Jun 2026 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613965; x=1813149965;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5rznq9EXAqzc9VppiHbKqUT1xdqMKZI4Uwmn1qtCFZk=;
 b=Zy5YCJ0WqEJesZHQ2mAVCEf2Vxn5V2QpO9LYwRgLuplWBjUXPeoEkxSF
 RoIO75YKkpkDa59FavyCdoXNB1xW5Lg3ihBMqAid8mA/SD51kN/bEOHrL
 AtcS7a5nyHkM/yXr00ZIWXDoEhjI8I+y6gl+q5+SR/BmZcwBWvD3a9wpf
 i5vzmvjK8f2u5yCOQarplwb1zeNbvrlz4KIYjzU289cFD9BDQ5fqLYsoj
 3Ia9fFQwgt9rujNPlQcF/6i4q/sGTd10TyXbyYODihFxJRuVD5cUWvQvN
 /Agn8v3rNBU3qlIeJNBs3oVVaS0JvlLUVJ7X1EQMYtKzeunwwiKkUw00P w==;
X-CSE-ConnectionGUID: pOKGrwjTR/OCgwS7DrUF9Q==
X-CSE-MsgGUID: XzkJ223vQuGCd+xTzHJcxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513296"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513296"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:46:04 -0700
X-CSE-ConnectionGUID: kBC/kEBvSXmHRtkpTIf46Q==
X-CSE-MsgGUID: V6kjjT8NTwytxkr42k5b4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876405"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:46:03 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 37/39] drm/i915/display: Guard CMTG function calls
Date: Tue, 16 Jun 2026 18:14:13 +0530
Message-ID: <20260616124416.2442161-38-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
MIME-Version: 1.0
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

Check if DC3CO is allowed before calling CMTG
functions in intel_atomic_commit_tail() as CMTG is only used
by DC3CO DC state.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ddcf2d2054b7..3b17ce669ac5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7579,10 +7579,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* FIXME probably need to sequence this properly */
 	intel_program_dpkgc_latency(state);
 
-	/*
-	 * TODO: DC3co entry condition need to be checked before calling CMTG functions.
-	 */
-	intel_cmtg_program(state);
+	if (intel_display_power_dc3co_allowed(display))
+		intel_cmtg_program(state);
 
 	intel_wait_for_vblank_workers(state);
 
-- 
2.43.0

