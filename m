Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BA4EFB7F1
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D0310E49B;
	Tue, 24 Feb 2026 03:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kafez3U3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD78610E49A;
 Tue, 24 Feb 2026 03:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771904731; x=1803440731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WD0sSj6ItF8usOSlNlmfE6zIVM0FEauJUHDs4tpZBp4=;
 b=Kafez3U3IxZ8jo9XkUUIyJNghMMlL/37p6mCBFwQNHSSgFvMdWgIaghd
 6QQ9Gs9rd2wQZJ7/hTVpVyHd+qqgNnD9/p8H7pId6aFLgRshoHXhuCrGm
 gcNsNzWSebL71X5s9ryFmLiYrdqhvnkhtDOy4yDYIsUc9fDJFdHuzydzU
 QuZufDALkstXSIxgK8nD3IrcHR7r+dZTcQMRAFheCUQUcVoWDjKx1FYbS
 W3luS3TKmdeo/1Xd21q7ShPN62EmSS2adyvFzNqt2P4QYPZvxAvVEcsU3
 cdAlEggwTJzkz7lxnNokyFcU4c6F0ktsIvHETg2CRvpGYdrlVq13KozmH g==;
X-CSE-ConnectionGUID: 1Ct34PPBTU6gApllA/Lm5w==
X-CSE-MsgGUID: ytJOtQ8rR6yvmI0+GW5wjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72817848"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72817848"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:45:30 -0800
X-CSE-ConnectionGUID: 2K/2l+7yTnGIvkekDoV2hw==
X-CSE-MsgGUID: jld4lhOlTJ2VfjN4gaOQdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215010613"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 19:45:29 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 0/8] Fixes and updates when using AUX backlight using
 Luminance 
Date: Tue, 24 Feb 2026 09:15:18 +0530
Message-Id: <20260224034526.2730130-1-suraj.kandpal@intel.com>
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
- Do not allow 0 brightness  by default which makes the screen go blank
leaving user with no way to see the screen and increase brightness.
- Take into account luminance_set variable when we decide which funcs
need to be enabled
- Update debug logs to make them more concise and help debug which
code path was taken

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (8):
  drm/i915/backlight: Use default/max brightness for VESA AUX backlight
    init
  drm/i915/backlight: Use intel_panel variable instead of
    intel_connector
  drm/i915/backlight: Take luminance_set into account for VESA backlight
  drm/i915/backlight: Check luminance_set when disabling PWM via AUX
    VESA backlight
  drm/i915/backlight: Short circuit intel_dp_aux_supports_hdr_backlight
  drm/i915/backlight: Update debug log during backlight setup
  drm/i915/backlight: Provide clear description on how backlight level
    is controlled
  drm/i915/backlight: Use default/max brightness for INTEL AUX HDR
    backlight init

 .../drm/i915/display/intel_dp_aux_backlight.c | 40 ++++++++++++++-----
 1 file changed, 29 insertions(+), 11 deletions(-)

-- 
2.34.1

