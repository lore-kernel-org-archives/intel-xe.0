Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB85D149F5
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 21:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259E610E121;
	Fri, 25 Oct 2024 21:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R//duCtm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657B610E06F
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 21:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729892584; x=1761428584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ld1ypf1j2urnAEMZNPKswfWX25wiRLnL0RCCSFu//M=;
 b=R//duCtm8nEYH8B+q7u4D768nh82JbPHRY6Hcs5r5M2FBDWKImEC4Jp5
 ByB5zsFUppHr5+sZRjbwnrGi/xhpWjvCWNpW35kyoGKkWU/Kj49HlldCN
 PlvTRX8GGBFMiSFjcq0qYM3DkpNXdZpLuFlBgxUa2Qgfe0VuQB1WVMIbm
 zcYtbfkOAOzmaVzhjw0gbd+/l5A8VOaRTwiD3ZjaXk/M5IOcagAzJyauo
 tEuByRclLDZomOEkpWOwAhdr6L3WQpWFPr1TKNHG2TbS24NHuOfqbYjZl
 ZxIX8JXPO2FY8eFI4Zu7mYnkMcV9jEOVIBzzgImnKM3XJHFl+AuU/xTLF w==;
X-CSE-ConnectionGUID: 1AwnJjp2T9qunSrAUZq2YQ==
X-CSE-MsgGUID: Jdh8gfFoR9CYxE5smar1fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33377855"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="33377855"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:43:04 -0700
X-CSE-ConnectionGUID: GuN4EAlxQ3inF/W+Pcs/NA==
X-CSE-MsgGUID: jbXfmPTgR4SLI7jj3wWRQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="81189345"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:43:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Subject: [PATCH v4 0/2] Tweak job timeout debug messages
Date: Fri, 25 Oct 2024 14:43:28 -0700
Message-Id: <20241025214330.2010521-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Let's make sure users / CI catch various job timeout scenarios.

Matt

Matthew Brost (2):
  drm/xe: Don't short circuit TDR on jobs not started
  drm/xe: Upgrade job timeout message to warn

 drivers/gpu/drm/xe/xe_guc_submit.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.34.1

