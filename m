Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA65C53209
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC1B10E780;
	Fri, 20 Feb 2026 05:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdZTuYQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAD410E14E;
 Fri, 20 Feb 2026 05:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771563746; x=1803099746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BtEagZKU+QXXci5oy2dHo8Jz9pJZQ74RqwTjnS7RCrk=;
 b=XdZTuYQXJ0/QVuonODnNTIySr5NenUYhcVkycOJB/F7v6vG65kyBAOmS
 1d2rAczn/liuMjiXCLIAuRiihenXDj/eJLhetDyZ0Ie7t4/5xSjBMablo
 CNhu3b15Y3WQqkLdNQII0GeGJYs3tLV3Xgzhjo5I59E347Sooo0K6dnDC
 9fG3Sm6+OsGk1W51vhzCpnfUTxSerJU5LnJPQmlkfIWHuwc9mIOrIrl4F
 +nOAE3ahSfIeCFKX8f9ZiAbOvsFjTtlBzS8WXJzafpAsENW4jGB1BTyvT
 Hsa8YbRjOa5/YNmm2LVBraH9Dsi0KINdwmRMBKhsLHv0yuPkKvt4YqnoF g==;
X-CSE-ConnectionGUID: KRhIYnyRTni6iNzpj8rflg==
X-CSE-MsgGUID: df4joTQpT76qYENgMBUu8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72758217"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72758217"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:02:26 -0800
X-CSE-ConnectionGUID: MAwfHomFRv+XyZNS0S9EFA==
X-CSE-MsgGUID: zLyPBES4R8WyLeF9MfFxxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218894625"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 21:02:24 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/8] Fixes and updates when using AUX backlight using
 Luminance 
Date: Fri, 20 Feb 2026 10:32:09 +0530
Message-Id: <20260220050217.2453681-1-suraj.kandpal@intel.com>
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
  drm/i915/backlight: Avoid 0 brightness for VESA AUX backlight by
    default
  drm/i915/backlight: Use intel_panel variable instead of
    intel_connector
  drm/i915/backlight: Take luminance_set into account for VESA backlight
  drm/i915/backlight: Check luminance_set when disabling PWM via AUX
    VESA backlight
  drm/i915/backlight: Short circuit intel_dp_aux_supports_hdr_backlight
  drm/i915/backlight: Update debug log during backlight setup
  drm/i915/backlight: Provide clear description on how backlight level
    is controlled
  drm/i915/backlight: Avoid 0 brightness for INTEL AUX HDR backlight by
    default

 .../drm/i915/display/intel_dp_aux_backlight.c | 40 ++++++++++++++-----
 1 file changed, 29 insertions(+), 11 deletions(-)

-- 
2.34.1

