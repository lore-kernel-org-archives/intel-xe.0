Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD23C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 17:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1BB10ED07;
	Wed, 29 Jul 2026 17:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXifCWom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605CA10ED1C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785344789; x=1816880789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tSHv+8iw5NWHKBm6vdXaJuwResSXX2bSutPJ9N8wQt0=;
 b=IXifCWomG6vTRb0hL9CYfTtPfm4IvGGJsgLO4nb7QGu52207VoXt+KNb
 kozP2CBoXIUTGN7uFW0rOL8+XpHgEfcvXvqy2mLCc5tCCW3a//bKCT5OZ
 6tzLyMF3QTz8Aev4PR6c6drgkIEWyf/LR7991W8scIZu/TbRVeUWhoa19
 xrduiZA+sihoVmD8DxW7fJzIDxOb4F3f7cHohguKFMilw2+BDKk37jAOp
 yrSfOzrxbcdRKpYEBoEdcWMSxct06MNREaUUeT7MNTgXjlbeJAZm/lSCR
 m6MLmBoOlgfrMFAF8+EzW6JyMqrKFpCIBSWYF2ChcTLodYO4p7A25hRcm Q==;
X-CSE-ConnectionGUID: f1WiCul8TKOSRLkd1fRLKA==
X-CSE-MsgGUID: IzAvurBvSTCUVeuKOpXELQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73494411"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="73494411"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 10:06:28 -0700
X-CSE-ConnectionGUID: ZIc5RcI3Ssqn9/uWVSzhnQ==
X-CSE-MsgGUID: 27cb2G+ZQTi/mx4g98DDuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="298284702"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 10:06:25 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 0/2] drm/xe: Increase timeout for hwmon power limit mailbox
 operations
Date: Wed, 29 Jul 2026 22:45:44 +0530
Message-Id: <20260729171546.3368457-1-karthik.poosa@intel.com>
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

This series addresses sporadic failures in the xe hwmon driver when
reading or writing power limits via the pcode mailbox interface.

Power limit mailbox commands (both reads and writes) can occasionally
exceed the current 1 ms timeout, causing transient -ETIMEDOUT errors
visible to user-space through the hwmon sysfs interface.

Patch 1 introduces xe_pcode_read_timeout(), a variant of xe_pcode_read()
that accepts a caller-specified timeout, mirroring the existing
xe_pcode_write_timeout() API. This provides a consistent pattern across
read and write operations.

Patch 2 uses the new API in the hwmon driver to raise the power limit
mailbox timeout from 1 ms to 10 ms for both read and write paths, and 
renames PL_WRITE_MBX_TIMEOUT_MS to PL_MBX_TIMEOUT_MS to reflect that it
now covers both directions.

Karthik Poosa (2):
  drm/xe/pcode: Introduce xe_pcode_read_timeout() API
  drm/xe/hwmon: Increase timeout for mailbox power limits

 drivers/gpu/drm/xe/xe_hwmon.c | 28 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pcode.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_pcode.h |  1 +
 3 files changed, 27 insertions(+), 13 deletions(-)

-- 
2.25.1

