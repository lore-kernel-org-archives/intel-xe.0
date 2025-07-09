Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C39EC83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 18:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AA710E07D;
	Wed,  9 Jul 2025 18:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dyk7xvUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4510E096
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752086715; x=1783622715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4yg9zS1GLugV1I7PNA8tudWxeOtehVNHEoMkPVtbFwU=;
 b=Dyk7xvUV3XDd07+uf4nSD0jHHEgcE8zJU42X+Me9Ieg292MOJ+1YQoiI
 DmXWFW93SEd8lLLdYKiw4bqTDRBgdwqJEVeBeDq1VG493ezMpn5wVEMPH
 lG7rfGwcBCTnqqCQUJhG9+8jqLKLQlH9GyxS48wJr9TeKa0Y/5Q0R2S3z
 Hp7o3/xzv4PLzp3lHo/S4Des//CRxg1GPcsPv5lSQtVGlEjVI69KxRXcq
 TXN0RoHl056g7/kDJPUhFZmZoPB0slNm1mctGmpNLaSREr1bRvB4Smedy
 JvCwke6uD7H/4MZIBvnPf85GdWSSsXBtDrnlbnwcMINOwQvjuNPacYjzM w==;
X-CSE-ConnectionGUID: bfkj1WExRDC0+RwmJQIlig==
X-CSE-MsgGUID: Gw2JijKPQYaC7TIVtzuZeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451002"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54451002"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:45:15 -0700
X-CSE-ConnectionGUID: 4Xn9772mTFKpbLvzmJL09Q==
X-CSE-MsgGUID: KVHJkegZTfmlbWlHN292dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="161404823"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.221.121])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:45:14 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v7 00/12] Crashlog Type1 Version2 support
Date: Wed,  9 Jul 2025 14:44:46 -0400
Message-ID: <20250709184458.298283-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
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
v5:
 - renamed helpers to avoid namespace issues
 - separate mutex cleanup from gaurd usage
 - refactor base paramters to a separate patch (from version struct)
 - add r/b reviewed patches
v6:
 - use correct fixes tag for NULL pointer patch
 - added ack to Xe driver patch
 - bug fix for access helpers patch
v7:
 - added r/b to mutex clean up, refactor, and version struct patches
 - removed redundant comments
 - cleaned up and improved some commit message text
 - include attr_grp in crashlog info

Michael J. Ruhl (12):
  platform/x86/intel/pmt: fix a crashlog NULL pointer access
  drm/xe: Correct BMG VSEC header sizing
  platform/x86/intel/pmt: white space cleanup
  platform/x86/intel/pmt: mutex clean up
  platform/x86/intel/pmt: use guard(mutex)
  platform/x86/intel/pmt: re-order trigger logic
  platform/x86/intel/pmt: correct types
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: add register access helpers
  platform/x86/intel/pmt: refactor base parameter
  platform/x86/intel/pmt: use a version struct
  platform/x86/intel/pmt: support BMG crashlog

 drivers/gpu/drm/xe/xe_vsec.c              |  20 +-
 drivers/platform/x86/intel/pmt/class.c    |  15 +-
 drivers/platform/x86/intel/pmt/class.h    |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c | 459 +++++++++++++++++-----
 4 files changed, 386 insertions(+), 111 deletions(-)

-- 
2.50.0

