Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAC5C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 14:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B9D10E6B6;
	Fri,  9 Jun 2023 14:38:45 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E6B10E6B6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686321523; x=1717857523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2EvaRBRLmwyzHiySCydIAV93D/FfPSXRpHSQ5I2FJG4=;
 b=W2neSZcijrUASVdn+i1PmiahMTQTjrIOfJKIbi/KSwxEGmlF7UTWL5sx
 KA4hpcUAjBqAjQV9ZNQIzk9vT41c24yb7vpX9UmLsoH8gv88M4Rc5uQCq
 3AOblOVFCKV/YcZp/cbxfSILvMv8GoUq4SGl5RpsERW4WGUH6/+pWjCz/
 +eRriZ06ZE2NXx3+tA954jFH5C+b9xdJ1bJAwHfG1WO2O4seDPA6Utnzl
 LFIkLaohpagBs4zwfIPtaihQE9WdO0dqhQVsIzCLHb8ismUAVUp0yU7R6
 3gT2OIdV+JVuXxuOy5Cduq4X0xcpR3HUwmMyFghcF0V5TIktw9AlB/Lb3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360094457"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="360094457"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 07:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="957175714"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="957175714"
Received: from pdhernan-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.35.182])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 07:38:40 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 11:38:13 -0300
Message-Id: <20230609143815.302540-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe/reg_sr: Apply limit to register
 whitelisting
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
slots, then it makes sense to refuse going above it.

v2:
  - Add a patch for using a single parameter for xe_reg_sr_apply_whitelist().
  - Use xe_gt_err() instead of drm_err(). (Matt)

Gustavo Sousa (2):
  drm/xe/reg_sr: Use a single parameter for xe_reg_sr_apply_whitelist()
  drm/xe/reg_sr: Apply limit to register whitelisting

 drivers/gpu/drm/xe/xe_gt.c        |  3 +--
 drivers/gpu/drm/xe/xe_hw_engine.c |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c    | 14 ++++++++++++--
 drivers/gpu/drm/xe/xe_reg_sr.h    |  4 ++--
 4 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.40.1

