Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D2FD21274
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 10:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F81610E7EC;
	Thu, 17 Oct 2024 10:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XO5Le9W+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6478C10E7EC
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729162429; x=1760698429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jTfHcesjihzQ/GFtpqrxM0B1x0l1ChrJ4XU6Fs7qY08=;
 b=XO5Le9W+pv67DZbng+nxLXGCLgknjhaoXTwQnJ29XdP/z8WVg5i7NWvO
 52v3x6+Y9kMDrNWbxJ7IYpuWPAxh1UbbjTPlQG0oDgk40WY2f4xAKS5LQ
 F1YOR3rgX5pRgmy7N+g9wwrAYGMA2ofFjDl4wbWQWNp6ln1t+j2POZ+4L
 ivIe4yAVw5lRkzYhIttLjoyRNqkBjxDnAN+sR4jsT/7ZCnMIjJmsOpdJT
 anxrru9Pqs29hxCzw7sf81E9bXNAgUtMjF4T3BoqdY9s+QL3hwBnLMBWK
 vZpJjqZbM8ePu4UsDauqXRYbRkegJm/vK3fILr2xhRlS3lc1v9VTH7jDR w==;
X-CSE-ConnectionGUID: 9ndHWjb0QbmHAGZK7x58yA==
X-CSE-MsgGUID: H0vHFZjXSRqFg0Dbd6M0ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="32571635"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="32571635"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 03:53:38 -0700
X-CSE-ConnectionGUID: IZQgKE8mSw6x8Mshf44d9A==
X-CSE-MsgGUID: aZoYqtuhRAWDzvfi5pCu9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78168765"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 03:53:35 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.auld@intel.com
Subject: [PATCH v3 0/1] Workaround to handle G2H timeout
Date: Thu, 17 Oct 2024 16:44:09 +0530
Message-Id: <20241017111410.2553784-1-badal.nilawar@intel.com>
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

Patches in this series are for temporary workaround to handle 
G2H timeout seen due to delays in workqueue scheduling on Lunarlake
platform.

Issue can be seen while running xe_pm tests and xe_freq_freq@freq_reset_multiple test
in continuous loop

Badal Nilawar (1):
  drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout

 drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.34.1

