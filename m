Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C5AC54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 10:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109C310E618;
	Thu, 21 Mar 2024 10:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKyOuPUb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3318A10E618
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 10:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711017386; x=1742553386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o3GzJtg7/E+MDz2BecTimxP1ljwEFgTrtkz3EMs/TMg=;
 b=XKyOuPUbf/Pi13fFOS0IfPmKnROLOK6U3wz3sD9gw90lXgKg4Jdss9M6
 f0azSGVNGixBpKagVzNt2rkfJ6Fq1F4YofoN2Ctx66EBTeGJZ56TWe9/K
 qj9dP0G+rN35RcMYs7jUf5vtWfPdo17I2ZlIWgyWTz8jOGbxqIRfOrH7f
 ZT9ZozQ0UcmTQpWZx3LlHhHx387apeFuW5PRNdwYiEQLQREdtF4GmSjpt
 Cg+kvvI1m87z9tFSn6QNorANkXVIgeBH8XCOxWnwrCfRdC6gtC5nQzU7Q
 EpNSPE82nJCSxtYaEfV0Oo8BcY8Pbkw2yOzBRxhfklnkkVEJXBbS/wnlC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16543195"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="16543195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14523750"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:36:24 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 0/2] drm/xe: Fix issues reported by static analysis tool
Date: Thu, 21 Mar 2024 16:16:22 +0530
Message-Id: <20240321104624.2205317-1-karthik.poosa@intel.com>
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

Add fixes for issues reported by static analysis in xe hwmon and xe_pm.

Karthik Poosa (2):
  drm/xe/hwmon: Fix static analysis tool reported issues
  drm/xe: Fix static analysis tool reported errors

 drivers/gpu/drm/xe/xe_hwmon.c | 18 +++++++++---------
 drivers/gpu/drm/xe/xe_pm.c    |  3 +++
 2 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.25.1

