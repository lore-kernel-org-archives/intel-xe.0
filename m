Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72965CC6B0E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 16:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1F210F7F4;
	Tue, 13 Oct 2026 16:12:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4814C10E8BA;
 Tue, 13 Oct 2026 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907948; x=1823443948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ag90Y1nRaG5PQmGgv8phjx3aMVszYntfOozua1eOltM=;
 b=mi2h52enn6j86Wj9QhgpuxAeXLpuGd3LQ622uwGZf4+NoCLWnh/Xew6K
 WaZ6AnjIhZGaeSBCtkBZI7rXVq2+KkLPOdEutTV5BK7mwuomXN4M5aIsJ
 K4KU4ulcdqRHQ6vx+2QjJYELe1nmA4V1HxWHrxnyXCT5koIUh5DGsxm0X
 THVXzhNFSW6KVA34L7TIrt1DTKovTq5IMhhuR37XkmfDDqkmmv1tVvGg8
 VfcVxXpPKbR6Rw/Cfe4IgtEIvfbpXcr0+xGDn1o/RbU5CF5LvQ7GPCg2a
 YeuM9qxSvZh7ZMPLnicnU7MMyqI3krtdzqQfb7eMBuTbDpvop/GbIjVnA g==;
X-CSE-ConnectionGUID: GbBPHzP/RLieOJAo7wznmA==
X-CSE-MsgGUID: +y19xpXVR9G94e9ZQ3QmGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="534504"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="534504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:12:27 -0700
X-CSE-ConnectionGUID: k59l1sgrSGi8F39TiOn2ZQ==
X-CSE-MsgGUID: ILWVW8UqRBaUdd2x5KXPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1205076"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:12:26 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	imre.deak@intel.com
Subject: [PATCH 0/2] drm/i915: Reduce overhead in DC3CO transitions
Date: Tue, 13 Oct 2026 21:41:32 +0530
Message-ID: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
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

This series reduces logging and workqueue overhead in the display
DC3CO path, reducing latency during DC state transitions.

Dibin Moolakadan Subrahmanian (2):
  drm/i915/display: avoid logging DC3CO transitions
  drm/i915/dmc_wl: Avoid blocking on delayed wakelock release

 drivers/gpu/drm/i915/display/intel_display_power.c |  6 ++++++
 .../drm/i915/display/intel_display_power_well.c    | 14 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |  2 +-
 3 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.43.0

