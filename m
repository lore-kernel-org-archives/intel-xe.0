Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56491CA5FE2
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9E410E9EF;
	Mon,  5 Oct 2026 05:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qw2HsDB0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C1310E70C
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 05:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791178127; x=1822714127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=et2PxRj1wxxbWPCVaU9sYbQmGKG37LTngjl0NJjj22I=;
 b=Qw2HsDB0vBQ/Azdkhmbc2E5IdOgzS6JBQlrbFv4mdk8oF1O6HoDG5e0N
 rJNqUUdX+aWYkCMNUvO5Z+CwxtHtJevPcE7FKyRBqqh5Q6dzjTvvghhIL
 wmtD+jar1oAeQnx/RauU9yoFQcWc6UPsMnIRFLan0BKKCQtGm5LdgjtPa
 o5ogtmlyty/W/UtGzKy7lO/inLEa7rqH95fQKvEaVei4RjYBCd2vFKvmM
 odJDbaP+U+b+l+AqQpAc6C7SJXopUOBs6D95hoW0SKvPsnuIweNbASrtL
 mBlF/voOhMDDjEEr3uZiWOaWKsrFNGHd+qMonQgRKY6H6nwG3ZpB0+rPC Q==;
X-CSE-ConnectionGUID: 1JyBBHhZR1+xR4nLoMT/cw==
X-CSE-MsgGUID: B/xjYdD5ToG6wc5IwyKghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94330086"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="94330086"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 22:28:47 -0700
X-CSE-ConnectionGUID: VzNx1VkVSwS6T+z+wWMMIA==
X-CSE-MsgGUID: eYDOnw+wTa+LS3kp6sTBhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="274526332"
Received: from gfx-coremm-kmd02.iind.intel.com ([10.190.238.86])
 by orviesa006.jf.intel.com with ESMTP; 04 Oct 2026 22:28:47 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH 0/1]  drm/xe/oa: Zero OA buffer at allocation
Date: Mon,  5 Oct 2026 11:10:10 +0530
Message-ID: <20261005054011.2542699-1-krishnaiah.bommu@intel.com>
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

Zero the OA buffer immediately after allocation because kernel BO pages
are not guaranteed to be initialized. This prevents stale data exposure
through mmap and fixes the xe_oa tail-address-wrap test.

Bommu Krishnaiah (1):
  drm/xe/oa: Zero OA buffer at allocation

 drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.43.0

