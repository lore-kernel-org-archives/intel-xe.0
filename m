Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58ACC98305
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 21:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6611D10E00E;
	Fri, 16 Jan 2026 21:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5yFPGOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E55610E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768599856; x=1800135856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IRVkkUm0hHiCKL+YnutG6VAVneLIh4Sqdllfg8gtTYc=;
 b=b5yFPGOWYo05vYQQGRnWfZQLH0jwHTHgZRkIhQiQy2BKSYoRv1iUKAC4
 UKUJsniV0lzMSyyVmI/j1jtW3GMbUm4XNFup1LjMP15O9ybo5hU6LGWxk
 v0ZeIOW+DccHeArRcmkUNyPSbxBXAtcFLU6B6Dq4uraxpKcVl8hZuxddF
 cGWzK+sSXAP9p5anMoiCMhBSwsySsfF6E4ol5IZ5RUecZLMuyCk2d5ZkY
 d2aN9n/qVWqXDpHP3iy5mqdpZF1qlAaQTKBwRIB2BpoEYEocoPYp8IB+w
 3sT/z6FACFHgiAHEW1UI+vcrNjC3nQVdVJ/eyBd50OXULD/4c/x8Dunc6 A==;
X-CSE-ConnectionGUID: 2sViNMxaQEu7SGQggUpCWA==
X-CSE-MsgGUID: 3/yPb75cQBuvqXqWWTMq+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87334964"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="87334964"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:44:15 -0800
X-CSE-ConnectionGUID: tXId6cVUSZWArAeOHXNz/g==
X-CSE-MsgGUID: GhaEF8XXSuuii5STqbEj9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="209475625"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 16 Jan 2026 13:44:14 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2]  Fix nvm aux resource cleanup
Date: Fri, 16 Jan 2026 21:40:56 +0000
Message-ID: <20260116214055.2882338-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260109220026.2468067-2-shuicheng.lin@intel.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
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
  drm/xe/nvm: Manage nvm aux cleanup with devres
  drm/xe/nvm: Fix double-free on aux add failure

 drivers/gpu/drm/xe/xe_device.c             |  2 -
 drivers/gpu/drm/xe/xe_nvm.c                | 45 +++++++++++-----------
 drivers/gpu/drm/xe/xe_nvm.h                |  2 -
 drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
 4 files changed, 23 insertions(+), 30 deletions(-)

-- 
2.50.1

