Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB93C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 14:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CF610E1F6;
	Wed, 29 Nov 2023 14:10:42 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 14:10:41 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F6410E1F6
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701267042; x=1732803042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V025QGRVfV9pm53e/1z1De0+teg6bIGhvayYlbaHok0=;
 b=SvBu02i91YVn+KqgbZeIlxPq1mbQ5vCcqfrnTqtjxz/P7Yni9pPiZXzS
 f2xOOGat5Y3AURTgqX4N+LclTWYvebOZvBtnYNR/N470QDM2ToL7V2s3J
 mXp8hTjtzGz8UbQrZT6yOhHopNBqGxGE8OkuDK+8pFNYCS+UWueSsmGRO
 GC0gIbUJPU654EcbQU7TkDBh3wJzOVNMnvs/wKeSb10RktMlyQc++nr4A
 Pccsu4K6lioPR90dsPVKdGnx/onFlclvnTVgLpItxbrTDyY+nmxVRelZY
 cMN0tWQn8r7t+ak9SAthO6DKkyjfsxWt48uoyyZdEg//TF3qISKAkgHMF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="52655"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="52655"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745269621"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="745269621"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 06:03:34 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Nov 2023 19:20:48 +0530
Message-Id: <20231129135054.564076-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 0/6] DSB refactoring
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

DSB refactoring for xe after cherry-picking DSB implementation of i915.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (3):
  Revert "FIXME: drm/i915/dsb: xe changes for dsb"
  drm/i915/dsb: DSB code refactoring
  drm/xe/dsb: DSB implementation for xe

Ville Syrjälä (3):
  drm/i915/dsb: Allocate command buffer from local memory
  drm/i915/dsb: Correct DSB command buffer cache coherency settings
  drm/i915/dsb: Re-instate DSB for LUT updates

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_color.c    |   3 -
 drivers/gpu/drm/i915/display/intel_dsb.c      | 153 ++++--------------
 .../gpu/drm/i915/display/intel_dsb_buffer.c   |  82 ++++++++++
 .../gpu/drm/i915/display/intel_dsb_buffer.h   |  29 ++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  70 ++++++++
 7 files changed, 218 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c

-- 
2.29.0

