Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBC0D358CC
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 07:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B62010E7D7;
	Thu, 29 Jan 2026 07:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoFs5+1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB81210E7D7
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769671636; x=1801207636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t9m3w9+hAmoxiG5reRYAvdtiRZK9TiUNYhNdFEfY4w8=;
 b=IoFs5+1CfWSeX62bsIsZBHtXggm9sYSlmlW8qHXeQdnOEORfWep5xlEc
 nHFHTBk0lsJL7Cg/9QjeS6twONiFnAlqt/qHWv9HXBBLFDwBNUy8L4DUv
 KJXVyhcBIDer+kq6sjK2qsQNyC+UNuxQ0GCUcFfGqzrkh89qDJGkt3WBn
 klVQ7IuhEJrljCa2MZss481ubeB4QugwmzAayBOMLVLUy/I+T5Ba+a7ly
 oBab/vMOjjmaUvYad+mFHlex8bWKJatVGPOZGUv3zWubvzOe6O8GdFkTX
 ZR4D6GD62httB8k1gjSGq4ARwlTOdia1GNSDmU5fXevC+4LNyGq1m8R4S g==;
X-CSE-ConnectionGUID: p+SXSURXRDCx1OyOWZZyyw==
X-CSE-MsgGUID: X7SahMVoSGep15nNIQcADA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93561858"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="93561858"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:27:16 -0800
X-CSE-ConnectionGUID: CdOKz5D9TFKQaJBtDLKnqg==
X-CSE-MsgGUID: jVlDu06TQKueare/OUg65w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="212579484"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:27:16 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/3] drm/xe: Enable Wa_14025515070,
 Enable indirect ring state for XE2+
Date: Wed, 28 Jan 2026 23:26:58 -0800
Message-ID: <20260129072706.2587551-5-julia.filipchuk@intel.com>
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

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>


Julia INTEL (3):
  drm/xe: Enable Wa_14025515070
  Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc"
  Reapply "drm/xe/xe2: Enable Indirect Ring State support for Xe2"

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_pci.c           |  2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  6 ++++++
 4 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.51.0

