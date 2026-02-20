Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECFAC5ACD3
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C2410E3AE;
	Fri, 20 Feb 2026 17:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyEyQJXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D429710E3AE
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771606915; x=1803142915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IvcXMmxs9VJgYmpCWVYm1U1bxnqHRm9Oe5NgFp+hqQ4=;
 b=TyEyQJXJN3KIHumke9+5aA4bIhaU/nGtf74Ptc3J63LSgcrbd/CqWdg0
 rGK9mxsZtk0yGmGxPMdgQ14mQEF22xCoDD90ZzOwHTkp6XputAqObFjN6
 AmxpmyiDq5yVhqVO2pEiD7IPMnLPKAYxf9KAl4NQuxgLJiKJIg9MUPXu+
 i/NhE3BggwxC0h4dBBOYLRf+CRZZ5qY5DThl1u2UJIRPKKOeHlnPDLT9c
 vqKEEgG9yI2jqSV+eulpy/UUea4VUYwur3COJw0zRDrU1fMiJHxJCPg3D
 p6eKkXkhG74YhIbX0L61f5iG1ng6//UehjhX47/TLDw+7fDgNyr9ItNK8 Q==;
X-CSE-ConnectionGUID: CFAiDkCNSMKdeK1QjHNfIQ==
X-CSE-MsgGUID: 6n+iVE3fRmyM+2iJO3EFkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="98163594"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="98163594"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:01:54 -0800
X-CSE-ConnectionGUID: v17Tehl+Q2W7CPRj4anTIQ==
X-CSE-MsgGUID: 4webkEg7Re2rf9NS96wU1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="237860773"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:01:54 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v6 0/3] drm/xe: Enable Wa_14025515070,
 Enable indirect ring state for XE2+
Date: Fri, 20 Feb 2026 09:01:36 -0800
Message-ID: <20260220170137.328131-5-julia.filipchuk@intel.com>
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
v6: Check against submit guc version. Formatting. (Daniele)

CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>


Julia INTEL (3):
  drm/xe: Enable Wa_14025515070
  Reapply "drm/xe/xe2: Enable Indirect Ring State support for Xe2"
  Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc"

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc.c           | 6 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
 drivers/gpu/drm/xe/xe_pci.c           | 2 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
 6 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.51.0

