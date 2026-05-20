Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BBFCD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 08:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA7A10E099;
	Wed, 20 May 2026 08:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIF3ZQFV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C4E10E099;
 Wed, 20 May 2026 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779264172; x=1810800172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TMcbJNaOrRQrABb/eath6rQoxo0Sm7FgaQKlGgD94cQ=;
 b=IIF3ZQFVtO46eoRBKyo6lN9aVKGMpoITzaYoiNyNPoUmdH085Wek7eP+
 65ZV1b77MtuTofCBkYa/sPqLZP4rbaxVs3TQggoVKaKfAkrHV9leWLPzO
 S3FTbCVbVHgqdmgs/tstHmMq1MK/kfdTW7KGtTKv99ZO7vvg6yMT4ZMMX
 mlD0tlq5EK8JXFAMHdqUUgBLs9gIi3elGQ20Cok05KN/lGbEUuWKnDTTv
 chAb8GhxAROpsjQsQzVpwE2RqalkDr0NQcuAZeIo4lbF7aD9/GVzCkQ97
 WGqJneeCILhRxFzO26RQwhdDJkBQ+fwz1Pc+/g1OMdKroxBkOBLeJeKsS w==;
X-CSE-ConnectionGUID: Zxw6tg+oTiqwecNlqeXL3w==
X-CSE-MsgGUID: HB62RMcxRmaLlFaIzSa/3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91260565"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91260565"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 01:02:51 -0700
X-CSE-ConnectionGUID: xPe1E07JSjON10NdFRF1dQ==
X-CSE-MsgGUID: YyXcIBZyR6ClG6z2VwJdww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263583897"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 01:02:49 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com
Subject: [CI 0/6] drm/atomic: track individual colorop updates
Date: Wed, 20 May 2026 13:08:21 +0530
Message-Id: <20260520073827.3395745-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

For CI results of

https://patchwork.freedesktop.org/series/166080/


Alex Hung (1):
  drm/colorop: Remove read-only comments from interpolation fields

Melissa Wen (5):
  drm/atomic: only add colorop state from active color pipeline
  drm/atomic: reject colorop update from inactive color pipeline
  drm/colorop: make lut(1/3)d_interpolation mutable
  drm/atomic: track individual colorop updates
  drm/amd/display: use plane color_mgmt_changed to track colorop changes

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
 drivers/gpu/drm/drm_atomic.c                  | 82 ++++++++++++++-----
 drivers/gpu/drm/drm_atomic_helper.c           |  9 +-
 drivers/gpu/drm/drm_atomic_uapi.c             | 68 +++++++++++----
 drivers/gpu/drm/drm_colorop.c                 | 16 +++-
 include/drm/drm_atomic.h                      |  2 +-
 include/drm/drm_atomic_uapi.h                 |  4 +-
 include/drm/drm_colorop.h                     | 34 ++++----
 8 files changed, 155 insertions(+), 66 deletions(-)

-- 
2.25.1

