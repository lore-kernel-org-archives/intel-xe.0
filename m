Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BB3CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545F110E27D;
	Thu,  4 Sep 2025 19:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KehD14Gk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80D010E27D
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757015873; x=1788551873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vt7Gtsbd4qfOf3oJ4Fp1T5nVike5JMNNT3wF9TuyKf4=;
 b=KehD14GkHf5w1BD1N+1cE6ivy72f3I2LzNX94p0WxV7ceTn18RE6aQt5
 QZVIm9rLM8rH2Ilcege9sYjEtu+cQbRqGY5jhg5fF/tSsrazAzLbvKt81
 i9+is53EtYKKuMCBbsoFvaZXQejxuhGwIJjp/FRc2H0gnCjBHM1cqsTgG
 6D2Huv+Su3UkTeh5bgh5yJZjbXcUVYn9sZPpc6ZHcG2+OICiBVC8tlAL4
 utWYCLR0cagmmhoapex1ZTyctK7TJ2pWOXLhBo9tT3p5vNMcSavEqjR8y
 2Dkki/x7W1QfzI28bwl9b0HB+VZSovuSHXfKmt0adAQNuMNLdAB6Iu5aa A==;
X-CSE-ConnectionGUID: N5IU74PZRwC4faxiUNgf+w==
X-CSE-MsgGUID: /23Y66dtTgqRTPNJ+bpIeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="46941114"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="46941114"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:57:52 -0700
X-CSE-ConnectionGUID: wFqYZgEcQ2aCIj9Mmw3FTw==
X-CSE-MsgGUID: dD3My0WQSPym8zlENKmTKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="176328549"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 12:57:53 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] drm/xe/guc: Assorted clean ups - dodgy defines,
 erroneous errors
Date: Thu,  4 Sep 2025 12:57:49 -0700
Message-ID: <20250904195752.3846138-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Miscellaneous code cleanups.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Clean up of GuC 'CTL' defines
  drm/xe/guc: Fix badly worded error message

 drivers/gpu/drm/xe/xe_guc.c        | 21 ++++++---------------
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 28 +++++++++-------------------
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 3 files changed, 16 insertions(+), 35 deletions(-)

-- 
2.49.0

