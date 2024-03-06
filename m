Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49500C54E58
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 05:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC45010F1BC;
	Wed,  6 Mar 2024 05:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIno0zJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692EA10EAD4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 05:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709702396; x=1741238396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UCoagTLLlGNHK+xetw0IKfbCEkK5IgoP/ZaW+zlSVrc=;
 b=RIno0zJ7UuQCgDss7SAs76y9yRCAVrumRIzBTOuaOqy5q2TqBAirNpMs
 PXFcPltRUEvqu6SphxRJX1/1pPsv3olksf70H6vD1rKXmFKXomQTYur5g
 IxAD3K9VHbPAL04bViEICLPNxx/2IeL7osB64+agNWDauRQjQzWeI0kW0
 hf+U/vI8cOLC+ZPuFpfvY37KeZbexyImFN53wbq5anzzseOR4RfTWBduZ
 C4Kfdexm0+vCZNSRCGG3pUWsBvTNhBJALfXT8iC/latae5+JNQ+QaagV2
 2AYE4D1fUaLkPrbCXKQ1fRyri/w/nfS9f4dd0rLwKPhW0wgzfWk5WqW4R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4415010"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4415010"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="32789801"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: rodrigo.vivi@intel.com,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/4] Spin of Reduce GGTT display pinning latency.
Date: Tue,  5 Mar 2024 21:19:58 -0800
Message-Id: <20240306052002.311196-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Verison of [1] with changes discussed in reviews, mainly the addition of
XE_BO_GGTT_INVALIDATE_BIT.

[1] https://patchwork.freedesktop.org/series/130739/

Maarten Lankhorst (2):
  drm/xe: Fix NULL check in xe_ggtt_init()
  drm/xe: Move xe_ggtt_invalidate out from ggtt->lock

Matthew Brost (2):
  drm/xe: Drop ggtt invalidate from display code
  drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag

 drivers/gpu/drm/xe/display/xe_fb_pin.c |  5 ++---
 drivers/gpu/drm/xe/xe_bo.c             |  2 +-
 drivers/gpu/drm/xe/xe_bo.h             |  1 +
 drivers/gpu/drm/xe/xe_ggtt.c           | 25 +++++++++++++++----------
 drivers/gpu/drm/xe/xe_ggtt.h           |  4 ++--
 drivers/gpu/drm/xe/xe_guc_ads.c        |  3 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c         |  3 ++-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c   |  3 ++-
 drivers/gpu/drm/xe/xe_guc_log.c        |  3 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c         |  3 ++-
 drivers/gpu/drm/xe/xe_hw_engine.c      |  3 ++-
 drivers/gpu/drm/xe/xe_lrc.c            |  3 ++-
 drivers/gpu/drm/xe/xe_memirq.c         |  1 +
 drivers/gpu/drm/xe/xe_sa.c             |  3 ++-
 drivers/gpu/drm/xe/xe_uc_fw.c          |  3 ++-
 15 files changed, 40 insertions(+), 25 deletions(-)

-- 
2.34.1

