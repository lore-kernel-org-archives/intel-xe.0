Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466EBE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 19:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031D710E172;
	Wed, 18 Feb 2026 19:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SX3yj6oT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914F410E172
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 19:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771442215; x=1802978215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7ufFGs1Jl/gidWKXhdzR+w2ppAAlgKafihltU8q43RQ=;
 b=SX3yj6oTZeSSfIlLezzF818d3QLYzD4uDyJEDxwVQT0Thf6fEPEWWpT/
 KgCczn31Y/5M+DQxKRpLGmHjGfpSqlsH8UAqj2RaLdCpPAAwdODBpum64
 DU5HrrbNKut6i6MtOIpWJ05lP/p8LOuafG63ct6jSyQuEROfvELOSQQke
 T94HB9U2xjMpmHb9A8yM/ln/5hz4qRpFuUqcvzqzBLkrpQEwSawMx8aUK
 JjDWuYqvEUOYNqEZ6VLZY9VROceh2PARynrkgUOXC7AVyEmmSQxwhyvOM
 ZGl0PbEsnHczs8ufwing4+vMJ4YQagxLBP2f352A1R4oG6oUJeIx97kWD Q==;
X-CSE-ConnectionGUID: kolz3c1TTiSEOdZt4k+ZsQ==
X-CSE-MsgGUID: ixlN4HqrQO+7TcUo8YCseA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83629839"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83629839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:16:55 -0800
X-CSE-ConnectionGUID: jDEB1LfCRPK+WKFtCkoM0g==
X-CSE-MsgGUID: OBzs7ETTRWyd7mVlVoAt9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="212603349"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 11:16:55 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v5 0/3] drm/xe: Enable Wa_14025515070,
 Enable indirect ring state for XE2+
Date: Wed, 18 Feb 2026 11:15:46 -0800
Message-ID: <20260218191643.4130621-5-julia.filipchuk@intel.com>
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
v5: Remove extra lines.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>


Julia INTEL (3):
  drm/xe: Enable Wa_14025515070
  Reapply "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
  Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc"

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc.c           | 6 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
 drivers/gpu/drm/xe/xe_pci.c           | 2 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
 6 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.51.0

