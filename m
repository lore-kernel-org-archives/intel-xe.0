Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819B9C48BC4
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 11:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A211E10E603;
	Wed, 14 Feb 2024 11:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0+pT6DK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C51E10E4C2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707911889; x=1739447889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nbFi5fvcCnLqp9pM8x0q/DwcZNC4G462Yr/KGSNvfmw=;
 b=X0+pT6DKTdIkHiAlpmpXc0wLSmAx2o64hbmAhMf46QsQh4eyykY6TBMI
 cMc/zkCi/j8jtgGdnT0IZMYCpAetqG3EUlbejpXUKb0Llq1zw3PJfnDkM
 28ePVj+BB7mMhgbRAFIfg1o4Em+5qDh+pzDG1k+2e2ky/sExJ19p8riEE
 G+BTRx4iMh7cIC/vBtOqjS9e6DVfWPvspxIE+dObA5lt+EolRk+l6Oly6
 AYPAOgwVSauqVh5LQybQmf/PZlIEK/bKO7dmr2mLX3zoHTtzcoefLR1q6
 9uLxx5ZElFNDRbu8rQGo7vkPCANWd92wvp/cLl2T+tOS6WS+j5aJO7BB0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2090343"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2090343"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3529145"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.138.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:58:07 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] Refactor GT debugfs
Date: Wed, 14 Feb 2024 12:57:53 +0100
Message-Id: <20240214115756.1525-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Many of our debugfs files are GT specific and require a pointer to
struct xe_gt to correctly show its content.  Our initial approach
to use drm_info_list.data field to pass pointer not only requires
extra steps (like copying template per each GT) but also abuses
the rule that this data field should not be device specific.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Michal Wajdeczko (3):
  drm/xe: Store pointer to struct xe_gt in gt/ debugfs directory
  drm/xe: Define helper for GT specific debugfs files
  drm/xe: Refactor GT debugfs

 drivers/gpu/drm/xe/xe_gt_debugfs.c | 206 ++++++++++++++---------------
 drivers/gpu/drm/xe/xe_gt_debugfs.h |   2 +
 2 files changed, 105 insertions(+), 103 deletions(-)

-- 
2.43.0

