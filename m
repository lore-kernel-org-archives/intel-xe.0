Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF08CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 11:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B9410E084;
	Fri, 29 Aug 2025 11:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYIX2XMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FA610E20F
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756467262; x=1788003262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6t63MVWM7PP7hFi6xb6dN+zD+HgmK9rRIDwpIjUn3dY=;
 b=JYIX2XMc1esJ/dEA1ZZm/AbBITyWuU4MgAx/93GQtYb8Wn3z+o/v2YAK
 3EwJhEIdvzwfUB9OcVE28l3q6qFMlmt0iqP32R+Emz6+Cs3zHBLOmsGu4
 dWddEuNx4ZHvVYn+O8QVINEuokDfm5xsfFkBTRTW3p3I8gZ50OKU0sTOH
 JLVwexlfYTiYKUyFwfcoQnOeIRPlmsHPWt9Bg+EwVMhqHrBZ7dgALJ3jc
 VfVqLrHASa7A/Y2nG0xN1jHOzADQVyuLmxaKcV4M2GxJgS+/MKgaXu2+Z
 +ztkNZAzU+wqEjOMJ+I8cZ7DwBqUvZfBVLnBlZ0F6omRhcgwtzYeRxlOK Q==;
X-CSE-ConnectionGUID: 6lwWtcB/SbKcp/LubvARwg==
X-CSE-MsgGUID: YnhkDzyZRziJglRcmCPauA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69025632"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69025632"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:34:22 -0700
X-CSE-ConnectionGUID: YAZRFuGzQNWQIJmAKtYbyA==
X-CSE-MsgGUID: EUe5zdRzQMyPybpSEtlo+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170748266"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.245])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:34:20 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/3] drm/xe: Fixes around eviction and suspend
Date: Fri, 29 Aug 2025 13:33:47 +0200
Message-ID: <20250829113350.40959-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Fixes to make evicted bos that are allowed both in VRAM and TT re-validated
into VRAM after eviction and suspend.

Also a fix to improve on a race where the pm notifier races with active
tasks when evicting bos for suspend.

Thomas Hellström (3):
  drm/xe: Attempt to bring bos back to VRAM after eviction
  drm/xe: Allow the pm notifier to continue on failure
  drm/xe: Block exec and rebind worker while evicting for suspend /
    hibernate

 drivers/gpu/drm/xe/tests/xe_bo.c      |  2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 10 +---------
 drivers/gpu/drm/xe/xe_bo.c            | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h            |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_dma_buf.c       |  2 +-
 drivers/gpu/drm/xe/xe_exec.c          |  9 +++++++++
 drivers/gpu/drm/xe/xe_pm.c            | 18 ++++++++----------
 drivers/gpu/drm/xe/xe_vm.c            | 14 ++++++++++++++
 9 files changed, 49 insertions(+), 26 deletions(-)

-- 
2.50.1

