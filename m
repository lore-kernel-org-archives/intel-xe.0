Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D71EC46CD4
	for <intel-xe@archiver.kernel.org>; Sun, 17 Dec 2023 00:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF7910E3C9;
	Sun, 17 Dec 2023 00:50:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378ED10E0CD
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Dec 2023 00:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702774254; x=1734310254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9697CDSpq3QULLYy/NkLfnnpLqeGpnr0+08l8zpBYEI=;
 b=cgFgLTRzoX7agFECdrIVAqWfuaz3nrgh9vG8KKg69tjXPkTYGRhBerfE
 UfrKpHBAQmVm3kBBNbIcz8C1AoYs24A1SSb35uj/Lm0L9JZT6GQRmB2fQ
 K0CB5ml7YxvbWxyy6vD3DHIWPWcUCLHhbfgb4xmqWILzW4yt+uskh8mZ2
 nDQ6MRIzetBwTiP3Ym+Qf1PLk5JsYHAD1EDApSlUmivGA5NzDouWGdL3i
 cGVqaMAOAzaTZbPVbmIbZTfmFVtDXBPxKm4GryR9VIzWn/VlnTyU3mDhe
 WWVAr0IMrJnrStaSBo2JYMirSYK+Npvk0zeu1i3bl/GX6ngC5CzN96OhE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="14074770"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="14074770"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768387056"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="768387056"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:41:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/xe: CCS mode code cleanup
Date: Sat, 16 Dec 2023 13:41:15 -0800
Message-ID: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Refactor some of the CCS mode related code to make it compliant
with the coding guidelines and add kernel-doc section.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe: Cleanup CCS mode related code
  drm/xe: Rename num_slices to num_cslices
  drm/xe: Add kernel-doc for CCS mode selection

 Documentation/gpu/xe/index.rst       |  1 +
 Documentation/gpu/xe/xe_ccs_mode.rst | 14 +++++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +---
 drivers/gpu/drm/xe/xe_gt.c           |  4 +-
 drivers/gpu/drm/xe/xe_gt.h           |  2 -
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 91 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 12 +---
 drivers/gpu/drm/xe/xe_gt_types.h     |  7 +--
 8 files changed, 84 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_ccs_mode.rst

-- 
2.43.0

