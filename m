Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F731C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 05:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A0910E165;
	Thu,  6 Jun 2024 05:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gn5TmBlB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB8610E165
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717652511; x=1749188511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J4PN+VlFPm2rMlF7/86UBMb3EPJqbbZwYYgFR6+tcoE=;
 b=gn5TmBlB6ZBCeLeXDbG23vUvN6Z0fPQlkHyuaPDy8c9KrYAJ4zrAev/Y
 ixmZ59vaWPfXdkXfYLwJS1RBmgb3g4hax3tevPHrlp8l0NEtvfApv3K8q
 uBDmJNSOzrx00Mo+RiIrFTRwNaObUTzYwgXTK9BMQ46r1rFpKEMl8OPp9
 pCLKQ7ZdaqJlnsRSLLfQH1c8Yq4w/10FYCPEabHIWnQE9UK8CJWTaihHY
 u0PcUMltDO+OX+UuI2TB2G4Z4KP73aQFSSWs4DkYDyXKWol1nDKbLHBSw
 goulbde14Bv8w50cx056AywPu+2Ov2XJEJlfCHTfceeTM7FR0wzzffdpG A==;
X-CSE-ConnectionGUID: 69cDQlR5Skmem1pryacl0w==
X-CSE-MsgGUID: /hrOlomfR/i6sdH2HhTi3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25407034"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="25407034"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:41:50 -0700
X-CSE-ConnectionGUID: xPLk+qPYTF2quKDHVX4kug==
X-CSE-MsgGUID: aPYjyaSYTYaq1SKfWRqfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37855083"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:41:48 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v2 0/2] xe_gt_idle fixes
Date: Thu,  6 Jun 2024 11:23:59 +0530
Message-Id: <20240606055401.934750-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Use GT forcewake domain while disabling c6
Move disable c6 call from GuC Pc to gt_idle

Rev2: rebase

Riana Tauro (2):
  drm/xe/xe_gt_idle: use GT forcewake domain assertion
  drm/xe: move disable_c6 call

 drivers/gpu/drm/xe/xe_gt_idle.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 5 -----
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.40.0

