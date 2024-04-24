Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA9DC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 04:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEF010F528;
	Wed, 24 Apr 2024 04:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJecXxBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEF910F26B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 04:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713932711; x=1745468711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ku1CPTy/6LhBIT3CjJsJK3ok96KmPZ1psY0EBbx8mic=;
 b=PJecXxBDCxiIeNL69F+Y2s0ygM/6dU81iS7HjBiF56eKXJ401hfwAcVK
 AAVS3Uw3ZmOP6MNefuFlPZg+q9bXG9fN1Ddibh2ayG3t0UUpFNcPb+BKY
 E/XH1XnQrlCUAG8PqWsRW0Pk6bYwrLczbvp5GsRJJelVTk6lgpHdo8Nh4
 flE5feU5M4A6UP8j81qzGt6Y3Ub2o6Qc+rJ7ym7GZ5gmIX+ThaAjFEx7k
 FWZ/7YKCnumWY/3+ctMZGtfdwsnvF5Dw4+1igW63LJg4MvjCDehTfq/nz
 wLGdau03/Q65UwBPZqh/OoCqK3upunlGS9bTbNhb3ethUuGKhpwyHTgt0 Q==;
X-CSE-ConnectionGUID: HCc74HeLSlSdGA95Ec/jgw==
X-CSE-MsgGUID: d0v9maGgTJW6WeY7MF2B2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13334204"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="13334204"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 21:25:10 -0700
X-CSE-ConnectionGUID: l7a35+SoQI63HSteSKhOzw==
X-CSE-MsgGUID: 9V9Y6zidS7aZrD1gbGCvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29222117"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa003.jf.intel.com with ESMTP; 23 Apr 2024 21:25:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCHi v3 0/2] Use the helpers for locking/unlocking resv object
Date: Wed, 24 Apr 2024 10:09:08 +0530
Message-Id: <20240424043910.2190376-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Use the helpers for locking/unlocking resv object

Himal Prasad Ghimiray (2):
  drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
  drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers

 drivers/gpu/drm/xe/xe_lrc.c |  4 ++--
 drivers/gpu/drm/xe/xe_vm.c  | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1

