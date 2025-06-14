Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714FCC71135
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 01:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D69610E5D9;
	Sat, 14 Jun 2025 01:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRu6kPCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB36B10E1EE
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Jun 2025 01:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749866150; x=1781402150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GNk9f4jk/nUjhGKQsmV/QTCJqhkmDazSRxt5QusLb+U=;
 b=WRu6kPCzlSrUwHV7H/r0dSE/4ET/rboKpapmfZBVOcyG0ElcEPLCRnFC
 j6bTVEIBfj8M8i6AyOjzMTGeexnbQNmj6p6gs6iGS5LhuNG1XfVw2NU4f
 HfWPXsPqzyaGXDSHH5F8NWOtny7qkloZy8tBooPfNVYGNBoOdpSDa7eUl
 ZYdupQ66YeqONXRubKn/kxftrARi/aU6kkRwAKhkZMp316RlPvzqEM+TX
 bYuFHoJE0GXlapt21BtL7g9ulBQRK9OK5wqR2ZlpwsRiiSMxzB5yipiD/
 BUoFc73s6gZ/XsCZM81L7BwpPaBDdrZX07KdeaEaSTKW/UUSxLW+CNvRw Q==;
X-CSE-ConnectionGUID: xxn+NPwcSkONFgrqqWY6OA==
X-CSE-MsgGUID: QRuAHiqoT2uzOImTP4qCPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77481404"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="77481404"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:55:46 -0700
X-CSE-ConnectionGUID: 75oTcZiiTTS6YmlZUJxRCw==
X-CSE-MsgGUID: wnc7LZg8RNylFk0FHuEKYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="148875032"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:55:46 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 0/7] drm/xe: Recommend GUC v70.45.2 for BMG, LNL, DG2
Date: Fri, 13 Jun 2025 18:55:04 -0700
Message-ID: <20250614015511.691610-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.49.0
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

Bump recommended GuC version to resolve some undisclosed bugfixes.

Note that PVC and PTL are not merged to upstream at present, the GuC
definitions for those only exist in the for-ci topic branch. So this
patch set reverts those patches, then adds the bump for the fully
upstream platforms, then re-adds the CI only platforms.

v2: Added revert/apply conflicting patches for clean merge (Daniele)

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Clint Taylor (1):
  drm/xe/ptl: Add GuC firmware definition

Daniele Ceraolo Spurio (1):
  drm/xe/ptl: Define HuC FW version for PTL

Julia Filipchuk (5):
  Revert "drm/xe/ptl: Define HuC FW version for PTL"
  Revert "drm/xe/ptl: Add GuC firmware definition"
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL, DG2
  drm/xe/pvc: Add GuC firmware definition

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.49.0

