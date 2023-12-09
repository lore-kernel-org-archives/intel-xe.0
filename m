Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283D5C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 14:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DDC10E1A4;
	Sat,  9 Dec 2023 14:49:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEE510E19F
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702133376; x=1733669376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EgxzQXhqqugamTA8LwkHElHkx3HvNpyCUg++d12FWEc=;
 b=npifeU4XpvWSfVLVC4iQdwPct7uqj2DRNK5knJUOog9NVl+qP4wVEoFW
 3FL4f0qXNOVo9lJU1zF2K8FhIpXlC4xPskQez3tBuR/VxNvg8wIvrkDPm
 KwZpCLIwuOnSP2Az+yNdbaIK+Hd0iaD1IzVhi5XhM2LjeB76FAtOsxnhs
 3cavLEW932t+lVH5D6ietJvH8kEvSOR97r411OcmsRQX4L705yfVvMrrx
 WwWlX7Z4hsLbEMFRRXnAGxvYA0EbrrFr3XTrNuSYf55JY3u4a4DTMnLyZ
 nezSYdjmIULu2oR5/aQ4a1uTOw9GyAzjOUfEGhn/sTLgAhBD2a3ilWusI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="7838168"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="7838168"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 06:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="748661367"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; d="scan'208";a="748661367"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.23])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 06:49:33 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Use DRM_GPUVM helpers for the vm evict and exobj listss
Date: Sat,  9 Dec 2023 15:49:15 +0100
Message-ID: <20231209144917.4459-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

The first patch replaces our driver-specific code with calls to DRM_GPUVM,
and selects to use the DRM_GPUVM fine-grained locking.

The second patch sets a flag that makes DRM_GPUVM assume dma_resv locking
instead, that we've previously using in the Xe driver.

Thomas Hellström (2):
  drm/xe: Use DRM GPUVM helpers for external- and evicted objects
  drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm

 drivers/gpu/drm/xe/xe_bo.c       |  63 +++----
 drivers/gpu/drm/xe/xe_exec.c     |  72 ++------
 drivers/gpu/drm/xe/xe_vm.c       | 296 ++++++++-----------------------
 drivers/gpu/drm/xe/xe_vm.h       |  13 +-
 drivers/gpu/drm/xe/xe_vm_types.h |  67 ++-----
 5 files changed, 122 insertions(+), 389 deletions(-)

-- 
2.42.0

