Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F31FE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 19:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA75F10E30B;
	Wed, 18 Feb 2026 19:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkbZWw2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AF610E30B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771441400; x=1802977400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3DTYXOPUERqgJmK5GKpO8Ke37zGQWehrAq6jL4Uyw5c=;
 b=mkbZWw2C6s9xJCfRNO7MmhTMq0nROznUenltP8OkVil4gd00mC58IrYM
 6mAaPGxaahLWH1wUZKGwR/+nwQGfVvGsLVn+OFql8FSrBhP8mkJdfHCxD
 SSf50YrcH6CmugyyrNGTtj9RIt9ble5tryzGj+fjEAxNO61/jyCpdzYcM
 d2YMsu14s7MT2QfzBaXjZ/OoQlliHgZ/bgFoxMJCdMKGKZihl+xQz6wbU
 PAjw7qypb7FxmcbH1qfyI/I4RV/9MUewzePIrDuIUmgqv/+aOmGvLkA7u
 Elh/cFxiuruXYMwi89VLoCU6OuiDYLDCoF5ct8pMjW8xPHW8jfoIBD9Hk A==;
X-CSE-ConnectionGUID: AcHXORqVSUC5jRCpRhaCjA==
X-CSE-MsgGUID: 7dvUuwsfReeTPp0+jNLJ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72592356"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72592356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:03:20 -0800
X-CSE-ConnectionGUID: zhAi4dUYRzi13ol8HR1VbA==
X-CSE-MsgGUID: jX3TvYtQQNimqbOltabyaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="237264300"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:03:20 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 0/3] drm/xe: Enable Wa_14025515070,
 Enable indirect ring state for XE2+
Date: Wed, 18 Feb 2026 11:02:59 -0800
Message-ID: <20260218190308.4124010-5-julia.filipchuk@intel.com>
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
v4: Move indirect_ring_state disable earlier in init cycle. (Daniele)

CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>


Julia INTEL (3):
  drm/xe: Enable Wa_14025515070
  Reapply "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
  Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc"

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc.c           | 6 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
 drivers/gpu/drm/xe/xe_pci.c           | 2 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h   | 4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
 6 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.51.0

