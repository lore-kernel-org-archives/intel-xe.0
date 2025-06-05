Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA746C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 18:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F46610E314;
	Thu,  5 Jun 2025 18:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgBdmi14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539E410E30D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749149115; x=1780685115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7rwPpLw0SheicDklStm9qNsxPp3vZKCENvPajTfBhyo=;
 b=VgBdmi14JZE20xI4jUJVy5JU8ZZ5p+Z0HH2UCRJoxnSx4DtANeN/Xeon
 4efR4UD63Ude2NYjMU/cVEuURf2HjMnpt5wWE6Bax18+kkl/a6YCQGFTr
 y2d8zGDwj/8MoJ5JuVzmsGSZzCo1STpnpJ42+GoVvU0yRfGrxjCuAs4yz
 rA37SX7ooC1p+Ooq28+pQoLEtNe9hD6RnTSf8tOWgICRpBV8O2XrGAY6w
 Uykjn/CTc7Zn790Tu+R+8ZFScc1HLzW7lxPEaocX+v7v58QvW4vX2Afzg
 vkKUsienzvjQtpIN0HVxATHLdOw7CIjX/fKKySYTBPFjP9RAd1PArwbFs w==;
X-CSE-ConnectionGUID: ImcbMkkxTam00QK7nRvzjg==
X-CSE-MsgGUID: NmRCzcM1QYi3kH2KxjzgNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916569"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="38916569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:45:14 -0700
X-CSE-ConnectionGUID: xC6G3ZGxScCRORcAM+xE2Q==
X-CSE-MsgGUID: VUffQyUDQDKcqd6+yrYMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="182782413"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.222.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:45:13 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v3 00/11] Crashlog Type1 Version2 support
Date: Thu,  5 Jun 2025 14:44:33 -0400
Message-ID: <20250605184444.515556-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
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

The Intel BMG GPU device supports the crashlog feature, which was
exposed in an Xe driver patch (drm/xe/vsec: Support BMG devices),
however the version of crashlog used by the BMG GPU does not have
a supporing PMT driver.

Update the PMT crashlog driver to support the BMG crashlog feature.

v2:
 - fix a misconfig for the crashlog DVSEC info in the xe driver
 - address review comments
v3:
 - re-order bug fix patches for stable
 - added re-order trigger logic patch
 - added helper patch to address repeated code patterns
 - address review comments

Michael J. Ruhl (11):
  platform/x86/intel: refactor endpoint usage
  platform/x86/intel/pmt: crashlog binary file endpoint
  drm/xe: Correct BMG VSEC header sizing
  platform/x86/intel/pmt: white space cleanup
  platform/x86/intel/pmt: use guard(mutex)
  platform/x86/intel/pmt: re-order trigger logic
  platform/x86/intel/pmt: correct types
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: add register access helpers
  platform/x86/intel/pmt: use a version struct
  platform/x86/intel/pmt: support BMG crashlog

 drivers/gpu/drm/xe/xe_vsec.c                |  20 +-
 drivers/platform/x86/intel/pmc/core.c       |   3 +-
 drivers/platform/x86/intel/pmc/core.h       |   4 +-
 drivers/platform/x86/intel/pmc/core_ssram.c |   2 +-
 drivers/platform/x86/intel/pmt/class.c      |  57 ++-
 drivers/platform/x86/intel/pmt/class.h      |  23 +-
 drivers/platform/x86/intel/pmt/crashlog.c   | 477 ++++++++++++++++----
 drivers/platform/x86/intel/pmt/telemetry.c  |  51 +--
 drivers/platform/x86/intel/pmt/telemetry.h  |  23 +-
 9 files changed, 483 insertions(+), 177 deletions(-)

-- 
2.49.0

