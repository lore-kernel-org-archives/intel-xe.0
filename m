Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0354C7618D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 23:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A72610E57F;
	Wed,  5 Apr 2023 23:34:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD2410EA7A
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 23:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680737642; x=1712273642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iXb60lETCqdcHiko+8OHFo4/53oaUXbq7ExdLt0vVeM=;
 b=EF2NjOqmekfYxC1K+X/6NJ7FMByMqWi//ec68FzqiNyQYDhFNNir2cJU
 TfAlCu7GoqRktmE3SRyspyF3ws7I0XRa0FQwBR2HfafSD6J+8evtJEFX9
 rHsiPv0xMLr1LEm4KLIdGUYnFmC/KaGmJ398Cv4ZF+8SXKxkCu2FpuI4T
 lk8h60eUIuUmI/jOo1n7yWss9pgKy504DabA4AdFgY23VOugpQzj26vE6
 2qi3WvwDjFFYdTnqiK6L/MHuYj7HHodFBZx7EzoBPjrinmzxi0F/H8ABm
 6yj6bxDy4zcoN3/TUhCe54MVijtDT60pKUsTNQ5DWAuPFqTgrOrEQFEoj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326632204"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="326632204"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756165809"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="756165809"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:33:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  5 Apr 2023 16:34:01 -0700
Message-Id: <20230405233403.151088-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Try to fix driver load (again)
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

Two different issues detailed in link below. Tested on TGL + DG2.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232

Matthew Brost (2):
  drm/xe: Always write GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE for CCS
    engines
  drm/xe: Drop coalescing of GGTT invalidations

 drivers/gpu/drm/xe/xe_bo.c         |  1 -
 drivers/gpu/drm/xe/xe_bo_types.h   |  2 --
 drivers/gpu/drm/xe/xe_ggtt.c       | 25 +------------------------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
 drivers/gpu/drm/xe/xe_hw_engine.c  |  2 +-
 5 files changed, 2 insertions(+), 30 deletions(-)

-- 
2.34.1

