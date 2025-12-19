Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FB8D767C4
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 10:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A722810E9F4;
	Fri, 19 Dec 2025 10:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3kjj4aK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA1910E9F4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766139785; x=1797675785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u05jqlQ/yKO0qruJSPIV/pNtJi/gjMh+jYvEGIf3q2c=;
 b=a3kjj4aKGY+pvEqiG+kEKSahZtEU7cVVZar6nkrUNJEDqdJ3Kd1m5R+w
 pkYBTPcGr2ptIn8FK01LhubdVU9toam2wfBTYYP6o0lVdjY2K8J3PbLfK
 fmZb5eWF/ApM4wTR05TiCZTL7Zlzo6bj0PlXFe4BR2mfDd7ROaqvkzhUz
 XMSvSUB839NX5Y/U2PxqmJIqhlvonQTbaF8yD3p5nh/8/cls0sDJ7ayC6
 Q+2+bx03J/ssl52M9VBk9AdKNezyVmVKqyFXO4fKYcrDoKa2A+nyoqoKZ
 cu2Kl3M/HZ1ecKLzK4dI0yrfs6IGhpxlCJvqHW0YJlxUDEb+MY7+r0wGR g==;
X-CSE-ConnectionGUID: QECgY/ypR/6mjgvDggM8YQ==
X-CSE-MsgGUID: Uc+SglkhSZu152wh1yIl/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67995794"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="67995794"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:23:04 -0800
X-CSE-ConnectionGUID: LcDuv2k9ScOQ+8VSOGXSbw==
X-CSE-MsgGUID: PZiwrkzGRSGPabTf7MpyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199647388"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:23:02 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH v3 0/2] Survivability mode fixes
Date: Fri, 19 Dec 2025 16:22:25 +0530
Message-ID: <20251219105224.871930-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Fix sparse warnings and static analysis tool reported warnings

Riana Tauro (2):
  drm/xe/xe_survivability: Use static for survivability info attributes
  drm/xe/xe_survivability: Add max check for array overflow

 drivers/gpu/drm/xe/xe_survivability_mode.c | 28 ++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

-- 
2.47.1

