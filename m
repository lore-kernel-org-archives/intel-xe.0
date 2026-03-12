Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F407105A596
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 13:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C62E10E9EA;
	Thu, 12 Mar 2026 13:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSJLFlyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A94C10E9E8;
 Thu, 12 Mar 2026 13:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773321925; x=1804857925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vR6201sbq7VY4vnrVz5I+wDiDUkSvc1Ew4S1mHLrGqE=;
 b=jSJLFlyMB0yIwfDG9ozVX3qokN9/4JTLT/1Ub81SkybXbyqV5FFGWiVg
 cJiQSQdWk+SuFWG0x2CGijodzCF+Fz9SwoqIlUtE8qa+CcqPUPIBFZkEs
 8lOafDxlGqNx3YsoAwCqHNiaxdjGlWitVoDC4Cuo5dH796bFDnr83Gfsz
 wfEir6jjurSQG6b7BESEaeGdGW6GSqPFPvC6w4AQv+KXftRS9aiHR3qlr
 usRITKMqG2gUd1AQhRFckV2RTtZet+aQhoP5Zzg9lWEZ0hWC0Gm/gfTf7
 LQpUU2+6m04fiYmi23RHXWTO/Mq84H1HtY0kGtzEviZqYBa1sUK9X9YAs Q==;
X-CSE-ConnectionGUID: bA7brQBDTs6urpsv407suA==
X-CSE-MsgGUID: w0iAX4WGRk6FJIZOlL6U/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74524913"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74524913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:25:24 -0700
X-CSE-ConnectionGUID: J/U7AyAdRzmVWXjWZHU1ug==
X-CSE-MsgGUID: Gc2DDdDpSguFEDjF5bZ5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225794531"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:25:22 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com, suraj.kandpal@intel.com
Subject: [PATCH v3 0/2] drm/i915/dmc: Update PIPEDMC interrupt mask/
Date: Thu, 12 Mar 2026 18:56:52 +0530
Message-ID: <20260312132654.2614433-1-dibin.moolakadan.subrahmanian@intel.com>
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

On display version 35+ the PIPEDMC_ATS_FAULT and
PIPEDMC_GTT_FAULT interrupt bits are no longer defined.
Update the interrupt mask accordingly and enable the
PIPEDMC_ERROR interrupt.

Changes in v2:
- Move PIPEDMC_ERROR interrupt enable to a separate patch (Ville Syrjala)  
Changes in v3:
- Add Bspec reference (Suraj Kandpal)

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Remove invalid PIPEDMC interrupt bits
  drm/i915/dmc: Enable PIPEDMC_ERROR interrupt

 drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

