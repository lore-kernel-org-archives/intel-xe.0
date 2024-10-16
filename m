Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA82D1AD43
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 11:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FB710E079;
	Wed, 16 Oct 2024 11:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMCufNtV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAE210E079
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729078345; x=1760614345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=teI4tczVN3VSRRF6Tu5+IfBL2krVWC4r+aKmSjuEXGQ=;
 b=lMCufNtV62nF9OmSwkUN+GSKnD9DMjQgXrf45MKWQdjOzmodVPSnze+q
 ImQw7PQgeDwa5SY0HDQkfGm4Qg83LWY0I1he5dBlubfvQhG7ih/KhClsc
 eOEuQIwqmQuJLCRQdiD5Zc9Ibfp9/0fhCxnsZhPjToAL47vbBwedVW6c9
 +fM2oQOPsr1kC8zZWb0reW1IhiVnUfycwtFD42NlFBxxIG+MCbA8sUCzX
 c8VeW0+BKooZf5L3tfbIC/7tyMIVV1Jkp7XbEp7RgJhjFRBvdHcQ0ltD4
 MiPjMhTKxjO+RHYfwF8wUo8tXSqMnOGMhDSNhtNLRtH8AcHVZd59M5yfM w==;
X-CSE-ConnectionGUID: uCDvlD4aRDSMmGmwGTvVYg==
X-CSE-MsgGUID: 7TppZA9cTI6xeD2dqtfXXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28472508"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28472508"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:32:24 -0700
X-CSE-ConnectionGUID: sGHjbp9YSM2PUJna+MRzWQ==
X-CSE-MsgGUID: ZLojcQcGRLOgGGAl0fh8fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="108941588"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:32:22 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 0/2] Workaround to handle G2H timeout
Date: Wed, 16 Oct 2024 17:22:54 +0530
Message-Id: <20241016115256.349791-1-badal.nilawar@intel.com>
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

Badal Nilawar (2):
  drm/xe/guc/ct: Increase wait timeout for g2h response
  drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout

 drivers/gpu/drm/xe/xe_guc_ct.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

-- 
2.34.1

