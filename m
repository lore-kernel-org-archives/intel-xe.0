Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02739E6BF3C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 21:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ADE10E93B;
	Fri, 30 Jan 2026 21:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUpstYRY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D9D10E93B
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 21:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769806894; x=1801342894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GbRiTodZSqdU8PzVJCDyStpmJY96HwgoEyU1Ypn8X20=;
 b=QUpstYRYBYJV6MSe9MLIk2Qy44X7zaFXZa+LJE1295bA8u5l29eLZTTT
 rx/4B1XBSnstauGo7IikvdYI0MJqmIHB35qe52CKK4FI7DB8PnUiYLeUh
 phOiadLU/Pj9HpFnZrvagHCbDInDr2NBDvS4/4ATT9GnM3KNsumwtfaqo
 uXldaiSvOoIcwu9jNzdNFMNxjGxJcnl6MEvw1o6aN+yBM4goqEBLMJusy
 yzYx8ZH9Kr/IvEsbEIZyLJ2ixGdJ2S0N7dlAEeCSnEkOW0A22sYdDZj+4
 x4wZNTTKU1VT0aN6rZe+UvqL8Ki9zlziXfZmr8hjsQVWKazWpbusHun/r A==;
X-CSE-ConnectionGUID: KMiW3brKS4OwyRytaki3NA==
X-CSE-MsgGUID: DiDsfn4VTdOEnNluOeHRAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71041328"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71041328"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:34 -0800
X-CSE-ConnectionGUID: hgCm3Dj8T3u+uqnhTBJzbA==
X-CSE-MsgGUID: T8szyZffSJ62gx/AQ6cjIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208064928"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:34 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 0/3] drm/xe: Enable Wa_14025515070,
 Enable indirect ring state for XE2+
Date: Fri, 30 Jan 2026 12:50:32 -0800
Message-ID: <20260130210120.2682085-5-julia.filipchuk@intel.com>
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

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>


Julia INTEL (3):
  drm/xe: Enable Wa_14025515070
  Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc"
  Reapply "drm/xe/xe2: Enable Indirect Ring State support for Xe2"

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_pci.c           |  2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  5 +++++
 4 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.51.0

