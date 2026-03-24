Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDE4F54ACD
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 15:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8247410E713;
	Tue, 24 Mar 2026 15:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ts7ibsvM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A839E10E713
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774366651; x=1805902651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GxnMquy1r8YPYZbWJbaFxbp8JdXcYbAdisFuFivPCNE=;
 b=Ts7ibsvMs40r3RldD1M13MX9LyrCzZi/PXxRWVrKPZDTtbm+TzFeCfOK
 82o0VU9fSeUo7AQdc2EQRl+T53bgp5uymuqN5ej1pMOKjuudBEwd0Ne5T
 k3q4H29qImZ0VOtkDsZ9rkb3cTv/WxvcuIBTgHK9FWSVK497NM5TEE8p+
 HOhoDvJGI2LI8FfxAFa8VDoT81b+8zx8+mSk7vTbDkO2GL+i3OlZbEiby
 sS+K3Cqcf2Jxw2xfaDZcdYhwItS7KVEF0WJDV1sRvmogAm1VDCs/4hP6J
 JtHlhyZwxRBbRkyb+FiWIaok1RArlJXOe+/UEdKA3xUR9qmb55vv+DWao A==;
X-CSE-ConnectionGUID: diNdC0XlTImkLr6eZzm8Hg==
X-CSE-MsgGUID: h04JaZBLSoyljngHjDCuNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75102388"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75102388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:31 -0700
X-CSE-ConnectionGUID: V3xJksbmRTWZL85ixZDTzQ==
X-CSE-MsgGUID: 56gN4IB4SIexx1ot54F8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228863570"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:30 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 0/4] drm/xe: PXP fixes
Date: Tue, 24 Mar 2026 08:37:19 -0700
Message-ID: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
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

The first 2 patches are minor fixes for issues that were
visually spotted when updating/reviewing the code. I am
not aware of them ever actually being hit in the wild.

The last patch stops PXP usage with older GSC FW due to a
critical bug in those FW images that can cause the GSC to
crash and disable MC6.

v2: add one more fix, replace mitigation with blocking
PXP on older GSC FW.

Daniele Ceraolo Spurio (4):
  drm/xe/pxp: Clean up termination status on failure
  drm/xe/pxp: Remove incorrect handling of impossible state during
    suspend
  drm/xe/pxp: Clear restart flag in pxp_start after jumoing back
  drm/xe/pxp: Don't allow PXP on older PTL GSC FWs

 drivers/gpu/drm/xe/xe_pxp.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

-- 
2.43.0

