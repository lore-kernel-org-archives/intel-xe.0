Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870EDC677C4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 21:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDBA10E312;
	Tue, 10 Jun 2025 21:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZV+aPVyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236A910E312
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749589956; x=1781125956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5ZFA5lgkwdHhxgubRG9+PlfzQ/dNcOFYK5396NqK+nA=;
 b=ZV+aPVydAa2v2SSLj1c5m134lghL7A8jGjEpDfJ3Y4LTSs+c0W1r6rpV
 pmAC1GpTaRxo3KsuJmDFYmjpZTmGM2Jn2apbpMdKEhhrjRueY0dUFswPI
 x0D6/7OdcEsX2jg4VJmIkeXdpT+BlnTTPupaHuz72KRwp1Egwjf0JzWIC
 TRI39fUA8zQLZ8MCmvhaP2CA46Ec3ex6UA964Yb3SpO0SigxkFBcMLN7r
 jUX100w56Rc8LqGeH/pr9ITvKAHqS1lu3PjwS+xOomENDgF1p4BK/kMcW
 taqZYQWwLkGt/H4O3Ww9J/YkpKp13FyPTTm4yifmg5X0aVB8AM6MW1py8 Q==;
X-CSE-ConnectionGUID: aRK7YqhqTiKgzMq1Vn4TqA==
X-CSE-MsgGUID: 16UU7nwNQGCToTsNicIN+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816871"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="51816871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:12:35 -0700
X-CSE-ConnectionGUID: BITiKN11T4eKnyvUYN+7oQ==
X-CSE-MsgGUID: KujN/xWpTdq3vHhL2X5/Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="146939654"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.88])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:12:32 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v4 00/10] Crashlog Type1 Version2 support
Date: Tue, 10 Jun 2025 17:12:15 -0400
Message-ID: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
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
v4:
 - added pcidev to intel_pmt_entry to address null issue
 - dropped endpoint update patches
 - patch cleanup and address review comments

Michael J. Ruhl (10):
  platform/x86/intel/pmt: fix a crashlog NULL pointer access
  drm/xe: Correct BMG VSEC header sizing
  platform/x86/intel/pmt: white space cleanup
  platform/x86/intel/pmt: use guard(mutex)
  platform/x86/intel/pmt: re-order trigger logic
  platform/x86/intel/pmt: correct types
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: add register access helpers
  platform/x86/intel/pmt: use a version struct
  platform/x86/intel/pmt: support BMG crashlog

 drivers/gpu/drm/xe/xe_vsec.c              |  20 +-
 drivers/platform/x86/intel/pmt/class.c    |  15 +-
 drivers/platform/x86/intel/pmt/class.h    |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c | 469 +++++++++++++++++-----
 4 files changed, 392 insertions(+), 115 deletions(-)

-- 
2.49.0

