Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D985C3DA42
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jul 2024 14:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E2710E10B;
	Sat, 13 Jul 2024 14:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4B22+zx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A2A10E013
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jul 2024 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720880819; x=1752416819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9H2AWV5xoROFfd5//ZESXavYErToFK7bCz6DZ9xXk6s=;
 b=l4B22+zxjEBMrrMZTQk6yZTQql5W9p5fHT02VTejXB/PbhHPYgogzEE4
 ZpAtIJ3O9SKHhPO9HwuyiE5l3haeg1r9C80gAglX0dkgXyScR1rE1aCdf
 hA+kfZsNObMRW291HgBurGbFuq63gbok2PwdsjH6uyFRzg5ruCOPaTtB9
 bRlWZ7Hyhx0SCfrJcXjgo8IwfMzaSb075oZ2Ox8etJ4WrF9qTIck3PYHE
 rcovbGDK0FiQetzlK6lAlN22b/NO52nuCyoKj9GUPAU+V/JiW1BAsAxTo
 AvXOhn1i3NJsjZiZj0hKGaHZWVBO5D0esSXZTFQ8jPgmyhObiSmZuX0Ry Q==;
X-CSE-ConnectionGUID: TVLF//WeQhSVMiL84Y+BLw==
X-CSE-MsgGUID: aNZtqQMXQRaMi8p8nuay6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18127058"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; d="scan'208";a="18127058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 07:26:59 -0700
X-CSE-ConnectionGUID: KgD06c17SKCdngzcg37TfA==
X-CSE-MsgGUID: tFT4XdPjSAWQEvDke88zAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; d="scan'208";a="49947463"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.27.12])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 07:26:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 0/1] drm/xe/vf: Track writes to inaccessible registers from
 VF
Date: Sat, 13 Jul 2024 16:26:42 +0200
Message-Id: <20240713142643.1242-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: https://patchwork.freedesktop.org/series/135295/#rev2
v3: drop HAX (xe-for-ci)
    drop case for SOFTWARE_FLAGS_SPR33 (xe)
    improve function description, add comment (Piotr)
    
Michal Wajdeczko (1):
  drm/xe/vf: Track writes to inaccessible registers from VF

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.43.0

