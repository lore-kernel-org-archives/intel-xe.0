Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063F6CAC59F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 09:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDFC10E0F2;
	Thu, 18 Sep 2025 09:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCqpOhY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4848010E0F2
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 09:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758187349; x=1789723349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e5RR/OKv4hYdYLPkbnutnzkkDJv4YRSWp+xnxZXZLMo=;
 b=WCqpOhY9bjtVCzN2uGnvJo4EeJMp3glk+xcUXAcyySJ8P+lFdT35lbV3
 Ho27qJkyfkROIlmFtYix0a4c+U1Byg35SUP5ZaTMy97JUIsdCWUq1Dazd
 TG1rEJIud1cdr0M+05ghgoJdk51LxnRbJtozpkSOpJdH6yLebSrLA3Nj9
 pFT3UK8ng6IixzTs8//BZEyHdTUD1Zhqmgmko2mnESfxElZELQFQmBQ83
 UZMWwgixHS6CSbL0dsZQE5URs25zb4W+U/08FnC2GYNDE0D7eK6tRSocs
 XOui9wfNSZMU9dVsISE+JX9VYQePaS1rKs+uPyNWI+l5vU7jWuEu4lq2Y g==;
X-CSE-ConnectionGUID: mlfihC6pTge/xfQirmtMmQ==
X-CSE-MsgGUID: 5ySgra+uSSyFiEIrcKz7tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48081686"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="48081686"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:22:29 -0700
X-CSE-ConnectionGUID: NliVEKoSTbeXT6tENowjWA==
X-CSE-MsgGUID: VlFZB9v5TDuLYsOvnhHeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206284822"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.175])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:22:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 0/3] drm/xe: Allow pinning of VRAM dma-bufs
Date: Thu, 18 Sep 2025 11:22:04 +0200
Message-ID: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Three patches that together allow pinning of VRAM dma-bufs.

Patch 1 and 2 deals with backing those bos up on suspend,
Patch 3 implements the pinning and suggests a path to
a flexible cgroups accounting, on top of the cgroups
accounting we already have.

v2:
- Ensure content survives suspend and resume (Matt Auld)
- Update test comments (Niranjana)

Thomas Hellström (3):
  drm/xe: Don't copy pinned kernel bos twice on suspend
  drm/xe: Pre-allocate system memory for pinned external bos in the pm
    notfier
  drm/xe/dma-buf: Allow pinning of p2p dma-buf

 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 17 +++++++++--
 drivers/gpu/drm/xe/xe_bo_evict.c      | 13 +++++++--
 drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++----------
 3 files changed, 52 insertions(+), 19 deletions(-)

-- 
2.51.0

