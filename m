Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17412C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 09:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74C510E33E;
	Wed,  1 Jul 2026 09:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnhqPJIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051DB10E333;
 Wed,  1 Jul 2026 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782897310; x=1814433310;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tg9ixTP/Z/t+D/V+nvG7wFmVr4YnPYfApJYX8uqoqsM=;
 b=BnhqPJIrQ5N8QDI17VROD06Lp8PU4S6SIqNCkNRwUDVTEb9YC1RRIoyp
 nGxxNYTFl5ePGY5FhhQaNbxhFP7O8enjOg9pNA8EIGC+qVtDOZm+NrQCL
 HWSydzQ6YUPx2PCRJCqFNXnk879Y0q3ws/9unzfAJK3yk3x6FMG9iLt/7
 eY9kxXGyjOYur39nPPAhZz1WqvdAwKe+PuOC3Cr7i6/6dxSiwoTvQbb50
 aa60Rv3kQSqWd0quvvfSE6FtRyQCuJVQ7ZCraDjo2+aRoq1YdpcGLFeI8
 r2RuT6dFLyhfm53QSY38NL7sLSqfSNSKPNApMnEO1c/ylymxqTmq8zd50 g==;
X-CSE-ConnectionGUID: Lk/wEDHVTUObjVayEc2hKg==
X-CSE-MsgGUID: tN+H/pTPRcaEeCd821Axcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83679050"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83679050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 02:15:09 -0700
X-CSE-ConnectionGUID: 6N72IKUKTtqwErI784943A==
X-CSE-MsgGUID: E3issZjpRjePwI41JXx8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="275735714"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 02:15:08 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 0/2] Fix LT PHY related SSC writes
Date: Wed,  1 Jul 2026 14:45:01 +0530
Message-Id: <20260701091503.1302226-1-suraj.kandpal@intel.com>
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

Xe3P onwards we only write on SSC Enable PLLA on PORT
CLOCK CTL. Fix this register write. Along with that add
ssc_enabled readout.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/i915/ltphy: Readout ssc_enabled for LT PHY
  drm/i915/ltphy: Fix SSC Enablement bit in PORT_CLOCK_CTL

 drivers/gpu/drm/i915/display/intel_lt_phy.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.34.1

