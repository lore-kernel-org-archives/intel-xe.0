Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6FFC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 13:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF7110E721;
	Wed,  6 Dec 2023 13:25:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333F410E704
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701869141; x=1733405141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=77AuWTf6oSXGrCWmYfxX9+rezPLx+Tb5URxO8QHlMu8=;
 b=T1HBCInNJrRnfF7pYVt987XpUd0izHYUBtJwXWcpNLiy51zfU/JPfPGB
 XP5MtZsX6cYiz5n+i+4+m8jYSBlJTHRxDOlbVULLIRc8mVX7yyR9bJDBj
 UWN5hA1oQku78su4+iuntnssqm/QfnuemqZ3LnxrLm50a0Gnef+dvaBgs
 k55iaJwtXFFr6oe9Z1XbRQ6NuLjmh24vM7AkqVn5fjV2DGV+XLYHe8fG1
 3j7eU+cYlbEAEA/fdgPUD08Ww8NPLeDXddGdlNLVI53jLpRTOhTdvzOV8
 vSw8va3uqBE1ctxpQ0E+O3bs6op3BwS4iPyHT+wA9DtpnKGGJr8OkUQ5T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12773271"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="12773271"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 05:25:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771303831"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="771303831"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 05:25:38 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 19:04:19 +0530
Message-Id: <20231206133421.3295163-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Handle mmap with D3
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
Cc: matthew.auld@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Handle mmap with D3 for headed and headless cards.

Badal Nilawar (2):
  drm/xe/dgfx: Block rpm for active mmap mappings
  drm/xe/dgfx: Release mmap mappings on rpm suspend

 drivers/gpu/drm/xe/xe_bo.c           | 93 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h           |  2 +
 drivers/gpu/drm/xe/xe_bo_types.h     |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h | 20 ++++++
 drivers/gpu/drm/xe/xe_pm.c           |  7 +++
 5 files changed, 124 insertions(+), 3 deletions(-)

-- 
2.25.1

