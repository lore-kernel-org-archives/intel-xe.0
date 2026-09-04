Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1709EC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC62A10E55D;
	Fri,  4 Sep 2026 17:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUybUgpX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4146A10E55D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788541543; x=1820077543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Jcv2rwmEh4YIISqPaeiOVIaX0zfHb5NVeSd7XfC2qU=;
 b=cUybUgpX72pfivXfXNIoMNskkuw3LAcqoMYb6OhDAH62qdhLrB7BIGxA
 uuL3o93V3oz4/WB7f+eoc7x85JSXw1pxNU+1z0vysMBZoUw/qaUwtcSVi
 MJ2/YfTDxZRAcrK1MZbWm3x+70zkUrsD9O/oWWR1ah/L30eDrYR7tp5gW
 R544QoPF1r+MMllULCKCSgnxcDZnowXxd9RZRDA3gbfQ/1gLpy8J0xqSH
 bnvnZVGcB2j4IA3e6MrYT9x5WSZe26cEClJyT28KA+YSej1q3BSKTy+Qy
 uCOVSlHJ7VxUS1QqWWgI034M5ZAGvt7yKFLoxD0lUd7VrTm0yeswkuW0e w==;
X-CSE-ConnectionGUID: 1KxvhaVVSXiG/K0YQOCsUA==
X-CSE-MsgGUID: UGn/RsSpTym+LMaqXMkwTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89082198"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89082198"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:43 -0700
X-CSE-ConnectionGUID: pQ6+NGJVRiOuiYnRcwU35A==
X-CSE-MsgGUID: JefJ7XDHQ7W2IYH9KT99CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273882652"
Received: from johndonn-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 0/6] drm/xe/log: Relax location ID recognition
Date: Fri,  4 Sep 2026 19:05:24 +0200
Message-ID: <20260904170531.516-1-michal.wajdeczko@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some errors reported by the VF during early probe may have improper
format as provided GT location is not correctly recognized:

 [ ] xe 0000:00:02.1: [drm] Running in SR-IOV VF mode
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request 0x5507: no reply 0x5507
 [ ] xe 0000:00:02.1: [drm] *ERROR* VF: Tile0: GT0: Failed to reset GuC state (-ETIMEDOUT)
 [ ] xe 0000:00:02.1: [drm] *ERROR* SIGID=101 FATAL (-ETIMEDOUT) PROBE: driver loading failed for device 'b082'

Steps to reproduce:

 $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/sriov/vf1/tile0/ggtt_quota
 $ echo 1 | sudo tee /sys/bus/pci/devices/0000:00:02.0/sriov_numvfs

Fixes: 1151b9f6f465 ("drm/xe/log: Add component/location decorations to dmesg")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Michal Wajdeczko (6):
  drm/xe: Drop unused parameter from xe_info_init
  drm/xe: Keep reference to device descriptor
  drm/xe: Drop redundant parameters from xe_info_init_early
  drm/xe: Drop redundant parameter from xe_probe_info_early
  drm/xe: Drop redundant parameter from xe_probe_info and friends
  drm/xe/log: Relax location ID recognition

 drivers/gpu/drm/xe/tests/xe_pci.c    | 11 +++++---
 drivers/gpu/drm/xe/xe_device_types.h |  6 +++++
 drivers/gpu/drm/xe/xe_log.c          | 40 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pci.c          | 29 ++++++++++----------
 4 files changed, 53 insertions(+), 33 deletions(-)

-- 
2.47.1

