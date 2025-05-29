Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9951C54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 18:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8FA10E0CB;
	Thu, 29 May 2025 18:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liZOBdiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EAB10E0BC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 18:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748541786; x=1780077786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZYNB1IWcvT5C/ovjR7z27FOZ81K4Ptt9GjWErNOhYoE=;
 b=liZOBdiI475Zx0eIes4RihekrC0oO8y35zwGHIxieFr1UppMKwyTqrHd
 RkjRTuaC6H5EeAbbCB28EaxR8DL2DboLwHXL7cIzwG0//Tq5zO5eo9ql5
 w1jSFPFQ9K2DGXi2NFibyZWMulfbFwUUKhEiXz1aDU2HvPBwrAUuxO6S2
 jsEWvsib/Xrzt9v6fNnBAR1l3hpMB6r1Qpf2jdRTqaTR7dN0IsDkxqoPI
 R/zeQhUoOfNevqYWPNmKQUbvF4mbj/Vj3oSI8TvbLd2tukzVfC8fZEagd
 XG+3pJ46Pw4ucvKJDK1N7TEBGkzfx2C1Kwfteuf95hcYuVCjsX0Msl61H Q==;
X-CSE-ConnectionGUID: YhNjxCotTMyx/OrfdKn2rw==
X-CSE-MsgGUID: jHH8Bi5HTDmfo1n4v7OKuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50542940"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50542940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:03:06 -0700
X-CSE-ConnectionGUID: cvw+sxk7QxeX2lMtq3ve7g==
X-CSE-MsgGUID: 3A+lbxuSRuKi8hHYpoMDcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143661797"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 11:03:03 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 0/3] Add debugfs to expose G2, G6, G8,
 G10 and ModS residency
Date: Thu, 29 May 2025 23:27:49 +0530
Message-Id: <20250529175752.1222913-1-soham.purkait@intel.com>
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

     The changes in the first patch is taken from
https://patchwork.freedesktop.org/series/149026/
Thay are  added only for compilation and does not
require review.

    This patch exposes G2, G6, G8, G10 and ModS residency counter value through
debugfs.

Soham Purkait (3):
  Utility function and macro for telemetry reading
  drm/xe/xe_debugfs: Exposure of G-State residency counter through
    debugfs
  drm/xe/regs/xe_pmt: Macros for G-State residency offset

 drivers/gpu/drm/xe/regs/xe_pmt.h | 11 ++++++
 drivers/gpu/drm/xe/xe_debugfs.c  | 61 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.c     |  2 +-
 drivers/gpu/drm/xe/xe_vsec.h     |  5 +++
 4 files changed, 78 insertions(+), 1 deletion(-)

-- 
2.34.1

