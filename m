Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6E4CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 13:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C633310E1D3;
	Tue,  2 Sep 2025 13:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vhg2ni3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB8610E1D3
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756819074; x=1788355074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i/3NRdnjPC7Ei9eUYM1iCvCbtGGNILbIgrPvivXKqmU=;
 b=Vhg2ni3oy88/O+F19q0hqZq+ZRX+6MxRJymzOeALQmZIjQEbaLDAcNlX
 jW4lX2yZP2mddu/d0lPV6fyVhipELXEq6g57RNLS33bPFgQbUgIfmntOh
 UTetkyd58XQxP+vC0TN5yR3DplUzauWX24xN3VEN/2hCIOG7ehHBUjxOl
 4dUEitaz7yrrOI+YrIouBFZJZFq9ZtGUca4Hv9QYTdEPEHynmU+PNFy2x
 WYHrqprOdrXivUX3cMGnSjBCGegrPaNYF1bE3ZkfBKQyCuy23KV9DIvG1
 3+iWF1ApyDprnPV5g14aHKJV0x70U67RAxsw198SFSmFWDWefmgc94n6e g==;
X-CSE-ConnectionGUID: MUhtnnmEQY2yjaIEMfstEQ==
X-CSE-MsgGUID: ZE2lvd7UQCqQba9EGR8PTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76535157"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="76535157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:17:54 -0700
X-CSE-ConnectionGUID: z+6nnTQMRk+znr48SlYI9g==
X-CSE-MsgGUID: OBCXuAajRDK06QPloyq0tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175642807"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:17:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Allow to filter-out some configfs attrs
Date: Tue,  2 Sep 2025 15:17:41 +0200
Message-ID: <20250902131744.5076-1-michal.wajdeczko@intel.com>
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

Begin with survivability_mode which is not always applicable.

Michal Wajdeczko (3):
  drm/xe/configfs: Don't touch survivability_mode on fini
  drm/xe/configfs: Prepare to filter-out configfs attributes
  drm/xe/configfs: Don't expose survivability_mode if not applicable

 drivers/gpu/drm/xe/xe_configfs.c           | 42 ++++++++++++----------
 drivers/gpu/drm/xe/xe_configfs.h           |  2 --
 drivers/gpu/drm/xe/xe_survivability_mode.c | 12 +------
 3 files changed, 24 insertions(+), 32 deletions(-)

-- 
2.47.1

