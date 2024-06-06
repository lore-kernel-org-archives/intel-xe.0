Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0297C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 09:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA6410E8B6;
	Thu,  6 Jun 2024 09:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpH8HbAX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BCE10E8C2
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717667521; x=1749203521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nHa5HSOPLKSmLp25GiIEx+7Vkp5tnGRIyc4Fn2OD11Q=;
 b=ZpH8HbAXWkKVHwxi8uVGUuRz1MuRWMkRLzxOVhMsb8ZPKAtZOep5Szw/
 YKxKf1Ta1HDd6+lLJn3tpZHcIZ5lnS3ykGUbs4mBqDRLsdRPGgzBGOWQy
 8bn67UUOtbyAZinm6pBI8swwn/pWImaRUNO9dt+WCEUK8jI2cZ+vlnAQ0
 9yYRLGySt7Kl7gxoj9Ra6KwX/hNeJ7saT9PFSg1WPBxgA8WKpNFLQsa6u
 jLZKOTlkjAzgVzm+GLyPzUGH5osKtrqP9lXpg6U2l+txCVrEV8YMnKz9E
 /CC9A9c+VkvZpIUXalj1IgWxQVzQwjJnJBEX7ef+5pz2o2tJO9Zq+X/OO w==;
X-CSE-ConnectionGUID: 8goGDV7PSx6SuWM2ABTULg==
X-CSE-MsgGUID: 3dfQKL3STP2hy0LvqDA5AQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39728378"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="39728378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 02:52:00 -0700
X-CSE-ConnectionGUID: BV/lIGGUTHO2XlV9HmOHVg==
X-CSE-MsgGUID: zoGZKKMBRIKbmKlQwYG8XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="43003549"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 02:51:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/3] Assert for multiple or undefined forcewake domains
Date: Thu,  6 Jun 2024 15:38:01 +0530
Message-Id: <20240606100804.1346992-1-himal.prasad.ghimiray@intel.com>
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

Below functions expect enum xe_force_wake_domains as inputs, but doesn't
support multiple domains (XE_FORCEWAKE_ALL). Assert if caller passes
XE_FORCEWAKE_ALL or any other undefined values.

Himal Prasad Ghimiray (2):
  drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
  drm/xe: Check valid domain is passed in xe_force_wake_ref

Riana Tauro (1):
  drm/xe/xe_gt_idle: use GT forcewake domain assertion

 drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
 drivers/gpu/drm/xe/xe_gt_idle.c    | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1

