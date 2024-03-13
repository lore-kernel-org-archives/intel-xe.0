Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0F7C54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 10:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D649210E276;
	Wed, 13 Mar 2024 10:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ii4eGJ1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0010E276
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710326509; x=1741862509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I107e5lX3RKHHi6n/JpAMHtAhSBBVdX/s7lHwUXocaY=;
 b=ii4eGJ1uCCTXCU/lN6cApeyU7bpdjg5ebWzTT6ZYvVS0cpRtP2OPnVsM
 TgtMVCD0wHj89d/61aPy9/8FDUD/65ZUYeC7C9EE2yqAQ9r+PypMwz5UV
 ac/JcSWHhKDaNvwT67PqHLmSieLpAWA8Kz5+Axc2TiY3rLfagWbaXNjXA
 W7GwdDZaUNiXAuxbgdvLZEznArmhe8p+3HVUCuZcT9SHoWKDUyZd/FUBt
 R10BqCfVlYxi90CfrU8tATNlLDwsW3roPXlKzJ1W9EvToewm6NMVZauuy
 Fv2QMnDyhfSm48XbF+0c8afGU+x6TbcJSuvNqd8G06O9qTI1oLMFHZQhK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8025284"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8025284"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11798976"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:41:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/3] LMTT improvements
Date: Wed, 13 Mar 2024 11:41:29 +0100
Message-Id: <20240313104132.1045-1-michal.wajdeczko@intel.com>
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

Force 64K alignment of the LMTT PD to match hardware requirement and
make multi-level LMTT as default for the all future platforms.

v2: prefer GRAPHICS_VERx100 over PLATFORM (Rodrigo)

Michal Wajdeczko (3):
  drm/xe: Allow VRAM BO allocations aligned to 64K
  drm/xe/pf: Request 64K aligned allocations for LMTT PD
  drm/xe/pf: Always select Multi-Level LMTT for platforms 12.60+

 drivers/gpu/drm/xe/xe_bo.c   | 3 ++-
 drivers/gpu/drm/xe/xe_bo.h   | 1 +
 drivers/gpu/drm/xe/xe_lmtt.c | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.43.0

