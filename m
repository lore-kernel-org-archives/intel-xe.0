Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E058C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 15:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D154489452;
	Wed, 26 Aug 2026 15:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfQxwmOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D9789452
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787757809; x=1819293809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6hYzF2Ab/Aud0rZT7coWa4ewv1ym/UTdQsmKZo0Zoo8=;
 b=AfQxwmOqnSum/NL6+P9DAE8vK5j1mZaghn7VKYQBWGsqmXr+30c6bFgn
 WfUjHgGijNf4+Fm8IS9chcLZsEzMJG9ztRbOs4RUtfB/1BFzep78IxNyy
 5t3lkUXXBp6iRjWbonOmAPXo8LDRQ9LWNFn4r1aXJyUvoXaREhSDab9Uz
 1wUVm71loLIozi4WeTLEqNxj8LaH69UQo5G3iwTZs8YZD5WFd3OFCm47N
 mVPeCu6wIVaB5NqyOvEIs+LvXIWU7tm6uHb+bz1MVqVugxxAuewTqDzYp
 PrJ5Ivx41eTA0Ikc7iJkCseu7NJ0E3ObmpkPdZhrkvZw4AWuNiCOtbIw/ Q==;
X-CSE-ConnectionGUID: f9edfsdJSdqmmtN85DvZ3w==
X-CSE-MsgGUID: 4i0JEDuqSQm9gRIPVAWYUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88297392"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88297392"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:23:28 -0700
X-CSE-ConnectionGUID: wMGZh2qZSAKtpp4y3TQ+1w==
X-CSE-MsgGUID: voHs2DrNR/exulGcOufQ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271105068"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:23:27 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v1 0/2] drm/i915/hdmi: Add debugfs knob to force EDID reads
 over GPIO
Date: Wed, 26 Aug 2026 20:53:33 +0530
Message-ID: <20260826152335.2822798-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a per-connector debugfs file that forces EDID reads to use GPIO
bit-banging.

Naladala Ramanaidu (2):
  drm/i915/hdmi: Add debugfs support to force EDID reads over GPIO
  drm/i915/hdmi: Read EDID over GPIO when the debugfs flag is set

 .../drm/i915/display/intel_display_debugfs.c  |  1 +
 .../drm/i915/display/intel_display_types.h    |  3 +
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 63 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.h     |  2 +
 4 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.43.0

