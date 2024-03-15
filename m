Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A51AC54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 11:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C4211200A;
	Fri, 15 Mar 2024 11:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I39VGSqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA15911200A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710500884; x=1742036884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gxu3epwNqewLRg8nc7PC32ha0o5lmXh41644YrtXf/g=;
 b=I39VGSqsE3sa4EGs5r8tEgwZYJSdAbA+zYW7rK0g79q+oF9ObHnxLsKw
 CN0p0qe29lEPLleTmtyn18Ecwm2aKMrJqbb3iSiXwFxZd0rbS7xK7swSl
 blD6mBvPVgWolo7ReT//7nsTywW4fwcmPQnLh+wvF9QCMgGCKTqndUk7i
 dNnt8zDdmKobzrGPhbp28z4AyD5WvU9fvjxyEJmlKO9RDLaEqKpWnIC55
 2e5VWr8RXGdpvJFW30SLsWjvDf+0S7dfcMHz6rwZbZzhOEvvg97CR11Dy
 DSn4dpoEmuWAWWcf6du6mHHIWmxO5d3fn8q6d4tFEFFL4okkKyKBIQ1E0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5229475"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5229475"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 04:08:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17340722"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 04:08:01 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com
Subject: [PATCH 0/2] Add support for Wa KLVs
Date: Fri, 15 Mar 2024 16:51:45 +0530
Message-Id: <20240315112147.2460691-1-badal.nilawar@intel.com>
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

Add infra to opt-in GuC Wa via KLV interface. 
Enable Wa_14019882105 for LNL A step

Badal Nilawar (2):
  drm/xe/guc: Add support for w/a KLVs
  drm/xe/lnl: Enable GuC Wa_14019882105

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 91 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 5 files changed, 103 insertions(+), 3 deletions(-)

-- 
2.25.1

