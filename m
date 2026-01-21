Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5663BC44536
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130DE10E8A0;
	Wed, 21 Jan 2026 23:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVYJF+eY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB0210E8A0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 23:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769039970; x=1800575970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8qBN0dqM9wf9bYHlgPWlZZE0+kjEU+Qw80yzQYInnFk=;
 b=AVYJF+eYab0vfkFi8ev2OpOvRDsdArqOGGHs41GjApLQJosl6gw9Awe9
 tdwnXhZ3Ausyk4V9WUPKG0jtmqEQ5Ixm64t9foBsLexuy5lPZMzXuJw1g
 pEDbPVYIfwirKqeQwONgNJtSeambjKUBNj+s+TAJ7892Sr9zzhrYRea0d
 mDI8KfWeBF4z4aItZbBqYWO0ZenOtDX+3nnG8Mh+c7X557ejSOxSQ+xWo
 vcFImZwi55pPfNVJtxATWQYy9FPmRfWq4zcIBa2ZB88eGKdGQ7GFtcZ7T
 wUUvZ3ERIyulb+Sb6jrFTAkbPlxX8IUx+wVLBrN/nQnrXy4U9qCeN37CF A==;
X-CSE-ConnectionGUID: 16eulJ/lRgWbxDK0p/BSJA==
X-CSE-MsgGUID: 5+HzL3JaRA6llGgN2JMWYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57839575"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="57839575"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 15:59:30 -0800
X-CSE-ConnectionGUID: 87+MLClgQhmHVmNH+Y87sA==
X-CSE-MsgGUID: W03ce+IrRSeLfDyPKPMBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="207017434"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 21 Jan 2026 15:59:29 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] Misc refine for xe_module
Date: Wed, 21 Jan 2026 23:56:19 +0000
Message-ID: <20260121235618.3138251-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Shuicheng Lin (2):
  drm/xe: Make xe_modparam.force_vram_bar_size signed
  drm/xe: Log module init failure as error

 drivers/gpu/drm/xe/xe_module.c | 6 +++---
 drivers/gpu/drm/xe/xe_module.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.50.1

