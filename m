Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AC7C3ABD8
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 08:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5FC10E54D;
	Tue, 13 May 2025 08:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgvdqTi3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9876F10E54C;
 Tue, 13 May 2025 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747125479; x=1778661479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=je/Kyb9+seyTL1EFArd77g8aGFD9XIAf3Vf8olDVHWo=;
 b=KgvdqTi38ot3bgsI2cWYV793da874qgekvNdWCGXSwPZwziUbKP5D6rV
 myq4huYuEvZmhi6cgcuNzjxCSbbOaSPZkDdK2jgqQDW5A6zzvmLOie0Bi
 pyPIUSAzJXG0dqZFs2sfUZo/WsXUtCf316KiFHJBTKbGBNwuiy07kMV7f
 CdrLI9YBZt0GEqMTzgHUdst02DxN3T5bm+v1CnF8ix7qhOPo5r0nR80+G
 OYcJoU2H9FxzOmvc/gu+256KBIuDcro9xR5I0hbzIUWl+5qavOc35qGLX
 kVRGz+GxjVvSsKFh2kGpsbzjyq4LRMtyI8olF4gH7+IpkaTU2X8XZvtZ/ A==;
X-CSE-ConnectionGUID: ftyfLtO8SEaCVO9PFbxL6g==
X-CSE-MsgGUID: vN3Z5lTmSnmetcdCUn/VNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36581991"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="36581991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 01:37:58 -0700
X-CSE-ConnectionGUID: uF/B6EO5T/+DtHswsiM3/Q==
X-CSE-MsgGUID: wuaNypBeRku2wvuXqWFzhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="168738834"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 01:37:57 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com
Subject: [PATCH 0/2] Fix u32 overflow issues for SNPS PHY HDMI PLL
Date: Tue, 13 May 2025 14:08:01 +0530
Message-ID: <20250513083803.2596286-1-dibin.moolakadan.subrahmanian@intel.com>
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

Address u32 overflow issues in intel_snps_hdmi_pll.c.


Dibin Moolakadan Subrahmanian (2):
  drm/i915/display: Fix get_ana_cp_int_prop() argument type
  drm/i915/display: Fix intel_snps_hdmi_pll.c overflow issues

 .../gpu/drm/i915/display/intel_snps_hdmi_pll.c   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

