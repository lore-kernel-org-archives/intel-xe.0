Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661ACC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 10:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184C010E16E;
	Wed, 16 Sep 2026 10:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6fsGLmA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A697D10E16E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789553235; x=1821089235;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=of+skbis5d4HoLtbU4/PML0klzUo0XEgeZjePZkiWm4=;
 b=F6fsGLmAaHgNBWRLWgJVtEB5z4Iv6Rluj5ZwaFEEx0+R2JEk4Ip3uCjQ
 ufnbH+wwvaZVk9iP15MRs0sDA45wBDGwpVf33GrnKtNzqQpb6BbgBQxhz
 MCD4Jzhk4z4TGrdbt5xES/CnuqMrUn8/5BeE+9EHPLohlPmXMFWVeO45m
 zh3C5XWWAwi93rFisTHFMMicJuQCKLVNM9jCfIWgv9QNNx1tpUnIhLcRu
 PLLU+PcBZieQrzXiTOmIs4CnYF3/20Wd0vrqPCm9nCjE3HWBQ0Q8Cvkgt
 Xhd09aE8o2wSGdVP4Mjq0erphHJW3Afgo5HHaX5iRqRJA2lt6rLmokVxO Q==;
X-CSE-ConnectionGUID: 17GswW73RNGXPMCPaW5+dQ==
X-CSE-MsgGUID: Ly9Yo4o/T36RPPrnp1CT9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="430901"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="430901"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:07:15 -0700
X-CSE-ConnectionGUID: +/tqJNwHRROPueNve8GV+w==
X-CSE-MsgGUID: 4EK8GX03S+KeqTFiphg4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272820140"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa008.jf.intel.com with ESMTP; 16 Sep 2026 03:07:13 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 shuicheng.lin@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Date: Wed, 16 Sep 2026 15:35:43 +0530
Message-ID: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

This series adds Wa_14025941587 (minimum IDLEDLY floor) for Xe2, Xe3 and
Xe3p and hardens the shared adjust_idledly() helper it builds on.

Patch 1 fixes three pre-existing corner cases in adjust_idledly() that
can panic or misprogram RING_IDLEDLY.
(timestamp_base == 0 divide-by-zero, IDLE_WAIT_TIME == 0 underflow, and
u32 overflow in the tick<->ns conversions).

Patch 2 applies Wa_14025941587 on top of the hardened helper.

Patch1 v2:
Avoid redundant warn for unknown crystal clock.

Patch1 v3:
Field-mask the RING_IDLEDLY write with REG_FIELD_PREP(IDLE_DELAY, ...)
instead of writing the raw tick count, which could clobber
INHIBIT_SWITCH_UNTIL_PREEMPTED and reserved bits. Split the
inhibit-switch clear from the maxcnt clamp so a set inhibit bit no
longer forces a needless delay overwrite when the delay itself is
already valid. Use gt_to_xe(gt) instead of gt_to_xe(hwe->gt).

Patch2 v8:
Round up (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion instead,
so the tick-quantized delay cannot round back below 5 us.

Patch2 v9:
Evaluate the Wa_16023105232 xe_gt_WARN_ON() against the value
read from hardware instead of the Wa_14025941587-bumped value,
so it no longer fires on the driver's own floor. Re-check the      
rounded-up tick value against maxcnt and floor it if tick
quantization pushed it back to/above maxcnt, logging via
xe_gt_dbg since this is the driver's own value, not a hardware
anomaly.

Tangudu Tilak Tirumalesh (2):
  drm/xe: harden adjust_idledly() against divide-by-zero and overflow
  drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 96 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
 3 files changed, 88 insertions(+), 12 deletions(-)

-- 
2.46.0

