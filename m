Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F40CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4F310EECC;
	Mon,  8 Jun 2026 08:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/eQ/uPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26EC10EEBC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780906047; x=1812442047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eFynkft3XOZwdJ/TKySSv1MKhAPdhF9NivnV7tbV5CY=;
 b=h/eQ/uPr+KVSgO1a6jhn2dmHWSXe8MZ99mTALV+aUuz7dCK0c6I0G3Bg
 F4fny3W+m83MlCM+RCiTjubNQynoNoBGEY6lrNETayq2fH8KaHkdRlJe5
 Zwki6aIjuMkrAg5zEWsd6wGYxLb9Q1eWeKqAAJojgE+j9iyuBLEMvlG7J
 wQgRsrqtE6ntYLF5Zr2vzjZYl5HGrddRHrMFijI/NexLcbdr6+x4XPEJY
 0nD4imSiC1e9ZL7CZxsPhRfo6LhY1y3K4WSYoSSN2ECJVUCiQQKFfw0UE
 NX8hpBbdJ9uy7IaUYwbeg07+vQKDflbqitdyU04B55w8t1Wryu77qILVX A==;
X-CSE-ConnectionGUID: xF/FrRvrTUadXg7y7BQYVw==
X-CSE-MsgGUID: WrztjOPWSR6l9bOil4Cwsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="92202454"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92202454"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:07:27 -0700
X-CSE-ConnectionGUID: oeUcy9kaSlWKobsW0IE7VA==
X-CSE-MsgGUID: WOnn987CQdmo4LnM8Dxx1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="249403841"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 08 Jun 2026 01:07:24 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 0/1] Hardware Error handling for Crescent Island
Date: Mon,  8 Jun 2026 13:33:20 +0530
Message-ID: <20260608080346.1135464-1-raag.jadav@intel.com>
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

Detailed description in commit message.

v2: Explain the usecase (Matt Roper)
    Allow hardware error routing through debugfs (Mallesh)

v3: Reorder macros (Riana)
    Squash debugfs patch with routing setup patch (Riana)
    Fix runtime survivability regression (Riana)

v4: Defeature hardware error handling with system controller 

Raag Jadav (1):
  drm/xe/hw_error: Defeature hardware error handling with system
    controller

 drivers/gpu/drm/xe/xe_hw_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

