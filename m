Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFE6C5B549
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 08:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC7D10E0A9;
	Fri, 30 May 2025 08:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVkBf6wN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBBD10E0A9
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748593373; x=1780129373;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=epffNMXtsvskBznb6FK/1roWClxHTtrwMTIsKB2TfzE=;
 b=eVkBf6wN4u0os4TpNvn/qbHbiqhl4qcOz6VPiecYUsNnOi0Em/IxPgqA
 VWvQEfMUrmaAPW/NJAzuJ6sawK7xH+k2omjtBDeNI1zbYFLXoLPDklu5P
 ZAX8mmoMmLA+rNtJzfajw4GuZysH6McTlbmWlUgrsJMdzK0hWpRFYE/ea
 owmfeUTsEUZ5y0/U8X1K/DX8CHApVg4YPpAgCPalPWPpdlq6GxWWf9Gu6
 RdYCNBEtb3emqV2bpm+AtAAY1qw5mYIjKDPonrXZNGcutvdTG83aS6x9L
 G0AWb/c5axC1wgAWNzhn2Cm/wkiwDh2CzjRAgPJx/GjYsBtmNAoVtHb61 Q==;
X-CSE-ConnectionGUID: s0JN17KzT+aN7KrXcBTLbA==
X-CSE-MsgGUID: QRurhb1dTfis6BMxL6+muA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50825022"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50825022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 01:22:53 -0700
X-CSE-ConnectionGUID: EDPyVuMLTqCc2xqY0x6mAw==
X-CSE-MsgGUID: R1eZYvdfQ6KYKflRp7SKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143772803"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa010.jf.intel.com with ESMTP; 30 May 2025 01:22:52 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] drm/xe/bmg: Update some WAs
Date: Fri, 30 May 2025 01:20:44 -0700
Message-Id: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Additional changes related to existing WAs.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/xe/bmg: Update Wa_14022085890
  drm/xe/bmg: Update Wa_22019338487
  drm/xe/bmg: Update Wa_16023588340

 drivers/gpu/drm/xe/xe_device.c     | 11 ++++-
 drivers/gpu/drm/xe/xe_gt.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c     | 77 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h     |  2 +
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 5 files changed, 88 insertions(+), 5 deletions(-)

-- 
2.38.1

