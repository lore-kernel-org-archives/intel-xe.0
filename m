Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA87EF4613B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 15:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ABE10E06C;
	Mon, 23 Mar 2026 15:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eImvNpvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5B310E120
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774278444; x=1805814444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ROjxci1APnHEThybcT/JbNsAQ9aLW0Chy5bepPO7nns=;
 b=eImvNpvdEdEHmJUIy9E6/oAFwtXUgGlUzwEobtxmX3SQ8D9xaIN0i81u
 fMvDv9+UgHbGe3IRIkQ5lGpxUHAVJo8f8VvrUZWO2ULOdJjbzx258thii
 HWjHUD1M8UPVErbfVGhW9rycdJAjtfG0/STnbmH+yuUgNE6+VrQy9AAa9
 ULPEuusIsp54bV76acC+ZZxBPqgePBeYlsbrsKGF0ti02w9XxyfDCoRTd
 sxe8cjvMV3Amtr1oTSbHEGHDxboS6spzqPYEx6NOKmTVbxMs6/Q/k41xp
 rQeF/U1gOEu/JIM7kmWeWmoTEfPNcc4Po03CI0Fi5JBEWpZUVwHBScRz0 w==;
X-CSE-ConnectionGUID: GyBW+NImTGebPKtoXatgDw==
X-CSE-MsgGUID: eid4+ETMTFijF0acFPegtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75299999"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75299999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 08:07:23 -0700
X-CSE-ConnectionGUID: h8WkVcMdR3KqhN5Y/o+6vA==
X-CSE-MsgGUID: 1/6BGKttS4ydSJGDOEi2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254539520"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 08:07:21 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 0/2] drm/xe/debugfs: Add a debugfs for pcode information
Date: Mon, 23 Mar 2026 20:43:29 +0530
Message-Id: <20260323151331.4043749-1-karthik.poosa@intel.com>
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

Introduce a pcode_info debugfs entry to report pcode details.
This initial implementation exposes the pcode version which is got from PMT
telemetry.
This can aid debugging when the pcode version is needed

Karthik Poosa (2):
  drm/xe/pcode: Add support to get pcode version from PMT
  drm/xe/debugfs: Add debugfs for pcode information

 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_debugfs.c  | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
 4 files changed, 46 insertions(+)

-- 
2.25.1

