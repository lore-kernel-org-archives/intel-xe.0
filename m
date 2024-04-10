Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29706CD1296
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 08:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A707810E2CE;
	Wed, 10 Apr 2024 08:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URoiuWKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ADD10E2CE
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 08:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712738342; x=1744274342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZKpqEV08MCRV1Y69mjoVremW7HyqRbzHIWDnl/OSs+I=;
 b=URoiuWKUK0FuSz+Kh3rLhvESg8ytvaVLLob2rota1DCFODv7L/WD7YDs
 YBS70dLenRW7CqRQTGDljqKBN0RULj3sv1GRbu5MoT5hnntRmI4HdY73F
 LrNe3BfaUAf2zYVJOvASd0bY+3g6+3T/Bn94IUWMTFF3IgTYIi7OCpo5o
 SCA9d3xJt+S9ITDDwJAanKVUBYXNSe4xRyOWEHIFCq/UZ8o5y17o4y5r6
 Z6NY+JFQBne2cqELbfScWspNB+zvVz7KLsK8gyI6K4lmZmRSlqE63mO59
 OJb9FrGTmzFkMFm0/Umy/vPGR8iSHU0h7Q25NirqWC5WnRFuDL04TBH3Q w==;
X-CSE-ConnectionGUID: 27LUKSh0SX2e7nX5/320CA==
X-CSE-MsgGUID: Trv9zalbS4+Mbql/jVdtKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11877653"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11877653"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:39:01 -0700
X-CSE-ConnectionGUID: x0sOzVS1QAutCoRLMq0jVw==
X-CSE-MsgGUID: tSPSfA+lRNuJSglHPAv6fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20556250"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:39:00 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com
Subject: [CI 0/2] Pcode init status and lmem check
Date: Wed, 10 Apr 2024 14:20:03 +0530
Message-Id: <20240410085005.1126343-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Check pcode init status on root gt of root tile and
reorder lmem init to be after pcode init check.

Rev2: change function names for pcode init check
      fix review comments
      add fault injection for LMEM check

Rev3: drop the fault injection patch. This will
      be added in a different series with a different
      approach.
      No functional changes to the first two patches.

Rev4: Rebase

Rev5: Rebase

Riana Tauro (2):
  drm/xe: check pcode init status only on root gt of root tile
  drm/xe: re-order lmem init check and wait for initialization to
    complete

 drivers/gpu/drm/xe/xe_device.c |  79 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_mmio.c   |  24 -------
 drivers/gpu/drm/xe/xe_mmio.h   |   1 -
 drivers/gpu/drm/xe/xe_pcode.c  | 115 ++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pcode.h  |   6 +-
 drivers/gpu/drm/xe/xe_pm.c     |  16 ++---
 6 files changed, 151 insertions(+), 90 deletions(-)

-- 
2.40.0

