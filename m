Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D33C021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 23:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA69E10E9F5;
	Thu, 20 Feb 2025 23:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXNApzPC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501FA10E9F5
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 23:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740095098; x=1771631098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uoieDgRJ3ZVwt93dtwcg46hMD44LjL1PhB+LXXQ5TdE=;
 b=hXNApzPC+Daso5exN1XiD1n1fRjSOcqEntCrL3f2pRf6xREcdPErGkM3
 Yvh4wQHAKAQXaQtjEvH9r+dtHmp3AEhgnkGCn/SLyEOt046GZOf32LuLw
 0Y31IBLiQx+lqjejFRKbObtiQ/1AvrwUFPProETT81mIIMZ3lYNgvzfhF
 ZOI4HMQ2wJNu6zfWxBmFdbLiKx4eYfaelF3sjnraKxIkFfX9GLMVzzxr8
 1/JNAg9Y6sXFVw96jT4MfdNDn3xf+8WtgEnecJktDE5AoM3LGT+DkFzZB
 OoD0rLllEx4RYbqUEYD4Wk3xMQHZ54RRbG9HOSkGdzW+pP4wH1fBXLqm3 Q==;
X-CSE-ConnectionGUID: 3hY373tYQOW/oBWf8C8b5g==
X-CSE-MsgGUID: b0u2WlNRTwmUA4kw0/IrJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44817001"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="44817001"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 15:44:57 -0800
X-CSE-ConnectionGUID: VLCUYuPOS4uZfEvjxZnMQQ==
X-CSE-MsgGUID: zmA3xhR8SzqiQTlVhCzb7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115855805"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 15:44:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH 0/2] Userptr fixes
Date: Thu, 20 Feb 2025 15:45:55 -0800
Message-Id: <20250220234557.2613010-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Tested with below tests on BMG + CONFIG_DRM_XE_USERPTR_INVAL_INJECT
xe_exec_basic; xe_exec_compute_mode; xe_exec_fault_mode; xe_vm; xe_exec_threads

Including a patch from Matt Auld as it required for above test case to pass.

Matt

Matthew Auld (1):
  drm/xe/userptr: fix EFAULT handling

Matthew Brost (1):
  drm/xe: Userptr invalidation race with binds fixes

 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
 drivers/gpu/drm/xe/xe_pt.c            | 86 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_pt_types.h      |  1 -
 drivers/gpu/drm/xe/xe_vm.c            | 16 ++++-
 4 files changed, 76 insertions(+), 28 deletions(-)

-- 
2.34.1

