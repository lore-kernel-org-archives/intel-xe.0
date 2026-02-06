Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6335CEE6B68
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 22:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1153510E956;
	Fri,  6 Feb 2026 22:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="he7M39Vj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E6610E956
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 22:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770418595; x=1801954595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iVL0l0A4zIswIXG4odwzxB5OsfTz1/yQ4oEYK3DA6PM=;
 b=he7M39VjU0ECs7LwBKGf2j488p+n/FxfhNXXKvc8w4yrNhDgKDmkLzon
 14T9LEYx6MbqVh+6dt1k1u8yQJzBSyBD0RblHFMHLmAF7qxD8zaqhUr3M
 CH8ns0trZNefaTKvxmMuWooLyEWg97aXEvbZmbPNyY3OnREvjWc+cfwm9
 pU1aV/0WkCI9aKTUYFruGCtATfGff7EV8UbJ2bxJpiHZoPhXHwd/BpD5Y
 OzeGv5PyFv3LuD6o0bOHl/HPN3fW3JZmTGd6s/mlVGwRTmP9JCWdK6zbP
 8x5kXwTxs9Y78AZgWr3WgjlV6qaWh2Ebj7Gjto5cECMi8cQXTi6Vvj8w/ w==;
X-CSE-ConnectionGUID: isZlrwjjSi2RI2uQOXmYyw==
X-CSE-MsgGUID: GO7NKU2/SdqgDcYV8BUliA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71351661"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="71351661"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:56:34 -0800
X-CSE-ConnectionGUID: mRp7Sos3Rv2C/w9IiiOEVw==
X-CSE-MsgGUID: Cud2GdKcTIafri9Kt7v7IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="210762197"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:56:34 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 0/3] drm/xe: Enable Wa_14025515070,
 Enable indirect ring state for XE2+
Date: Fri,  6 Feb 2026 14:55:21 -0800
Message-ID: <20260206225610.3232909-5-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Enable workaround 14025515070 to fix idle command streamer state on
context register. This allows user of indirect ring state on XE2+
platforms. Previously this default was reverted, then added separately
for XE3+ GTs. This patch Reverts and restores those previous patches
after enabling the new workaround.

indirect_ring_state will now be enabled by default for XE2+ platforms.
When this workaround is not present indirect_ring_state will show as
disabled with a notification.

v2: Enable for GT 20.04. Use range for media versions.
v3: Shorten KVL name, notice. Correct versions for WA. (Daniele)
    Reorder revert and applies for correct bisect. Added explanations.
    Add additional macros for XE_RTP_PASTE longer expansion.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>


Julia INTEL (3):
  drm/xe: Enable Wa_14025515070
  Reapply "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
  Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc"

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_pci.c           |  2 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h   |  4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  7 +++++++
 5 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.51.0

