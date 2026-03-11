Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4871E1125847
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 15:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D3310E034;
	Wed, 11 Mar 2026 15:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OU2CaN4o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BBE10E034
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773244364; x=1804780364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QV9l/jbo5Wuf9OfxBWgX6huR/xGfn765GI9XMsb6wsY=;
 b=OU2CaN4oV8GTNB1LgbCS0gkcvPyXaytett6hxpLR/UZu95vPPJsYgkCv
 X8zYDxY+LXyBY7DGwuYRsLdx634t96HV5s28Hfb28AJO4LDxUPTGhlw23
 TX6DMMw/DC4YfKekMINgsLwatbyiQX/8z27hD+2sXPtjgJC0XbgyUbOBb
 p/X13sIijbOe2UW/pokqOafGo9w9v6Vr0iosOMTtT6M2E5AsokeNR2gDp
 z0BHj32hn6S5PVbBxRxva6uSp8bh4FxUcQdhMQWnXEVJYz6oKJO1ZVlCJ
 kPBhL9sVwNlIkCfZdY4dzjPxNsC+pHSJW6mLYJTM9DzIQZMbVyNkmNND0 w==;
X-CSE-ConnectionGUID: mEA3o8v+R0iUf7nXFicGWA==
X-CSE-MsgGUID: ZWeVbsrFSJakoexX4jG4MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74398167"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74398167"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 08:52:43 -0700
X-CSE-ConnectionGUID: s7qhjGSPT1irjUAmyQiR6Q==
X-CSE-MsgGUID: Lxwzt+TbS0CFONOX61b3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="246064338"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 08:52:42 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/3] Scan all holes when fences are disabled in SA
Date: Wed, 11 Mar 2026 15:52:34 +0000
Message-ID: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

The suballocator algorithm tracks a hole cursor at the last allocation
and tries to allocate after it. This is optimized for fence-ordered
progress, where older allocations are expected to become reusable first.

In fence-enabled mode, that ordering assumption holds. In fence-disabled
mode, allocations may be freed in arbitrary order, so limiting allocation
to the current hole window can miss valid free space and fail allocations
despite sufficient total space.

Update the fence-disabled path to walk through all holes and select any
fitting range, while keeping the existing fence-based behavior unchanged.

Satyanarayana K V P (3):
  drm/sa: Scan all holes when fences are disabled
  drm/xe/vf: Disable fences while initializing CCS read/write sub-allocs
  drm/tests: Add KUnit test for suballocator allocation

 drivers/gpu/drm/Kconfig.debug             |  1 +
 drivers/gpu/drm/drm_suballoc.c            | 90 +++++++++++++++++++++++
 drivers/gpu/drm/tests/.kunitconfig        |  1 +
 drivers/gpu/drm/tests/Makefile            |  1 +
 drivers/gpu/drm/tests/drm_suballoc_test.c | 79 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sa.c                | 20 +++++
 drivers/gpu/drm/xe/xe_sa.h                |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c      |  3 +-
 include/drm/drm_suballoc.h                |  5 ++
 9 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_suballoc_test.c

-- 
2.43.0

