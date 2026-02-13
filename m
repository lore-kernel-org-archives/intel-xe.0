Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FEEF48F9
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57E010E7BD;
	Fri, 13 Feb 2026 09:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bA7jw7nD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29A10E096;
 Fri, 13 Feb 2026 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974226; x=1802510226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tWRUeyGxt+4EOnEWioaXcwyHgvAthovTsHSgUCfw2xU=;
 b=bA7jw7nDe452Tcy2CWerEES7t73Iszzfb231Ll4M3J+MPRouf4oKP9iJ
 oWz/gqKtsIXSBASXaBlZ93HN+olNw0XjH09rnGrliKqUghg1PM0MFrOVm
 n40BmKcdVWA3Y9eD/TtdT7Gr2KLOlA8rXMbx6BfOZ04Km+oLbjaD+U92V
 N9hVpopwbzHkG01nV4o/1mSqVRvTETu+SoHtTQ0W5lRnBsyZPX9xy/5bG
 07iwHke5pgVnoRnZoRiMk4/PhlXBpCBqjJfC79Yvb7qVOcnmGql9mYSAb
 I4SItuTdv/nzkJICbHHnPpjVVYyj1XQwbGv2EQtp4ydZSFlI3GuMKT/cy g==;
X-CSE-ConnectionGUID: Rd1+H02EST277Bax/HLFTQ==
X-CSE-MsgGUID: nCkrH3mYRRS67uvs04VSuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72146672"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72146672"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:17:05 -0800
X-CSE-ConnectionGUID: nfwn/bx7Sz6PnuSsR5NO2Q==
X-CSE-MsgGUID: ISuoNX3KRDaHXeLS7obU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211778825"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 01:17:03 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/8] Fixes and updates when using AUX backlight using
 Luminance 
Date: Fri, 13 Feb 2026 14:46:45 +0530
Message-Id: <20260213091653.2250887-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series aims to fix/update some code with respect to AUX backlight
via luminance values for both VESA and INTEL HDR codepaths.
The below are the major changes made in this series.
- Do not allow 0 brightness which makes the screen go blank leaving
user with no way to see the screen and increase brightness.
- Take into account luminance_set variable when we decide which funcs
need to be enabled
- Update debug logs to make them more concise and help debug which
code path was taken

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (8):
  drm/i915/backlight: Avoid 0 brightness for VESA AUX backlight
  drm/i915/backlight: Use intel_panel variable instead of
    intel_connector
  drm/i915/backlight: Take luminance_set into account for VESA backlight
  drm/i915/backlight: Check luminance_set when disabling PWM via AUX
    VESA backlight
  drm/i915/backlight: Short circuit intel_dp_aux_supports_hdr_backlight
  drm/i915/backlight: Update debug log during backlight setup
  drm/i915/backlight: Provide clear description on how backlight level
    is controlled
  drm/i915/backlight: Avoid 0 brightness for INTEL AUX HDR backlight

 .../drm/i915/display/intel_dp_aux_backlight.c | 60 +++++++++++++------
 1 file changed, 43 insertions(+), 17 deletions(-)

-- 
2.34.1

