Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD65E606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K8wXeDpx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4F510EC6D;
	Mon, 23 Nov 2026 17:01:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7098A10EC4B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795453275; x=1826989275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AycRqfIhbG/KWt7pLsESJxed+ISXmu5exQQZC38Df4I=;
 b=K8wXeDpxcFPQRw816H/VN8lP7GuYp6gVqp/sJQcay9uGpwdeZ4owoOUM
 ysP8xo+ZWTWkkIyAipksBrIkYLfJ7BgQjWjqGEGgk+UNixiE50I6dQ5LY
 N1k0fqlMY86VOz8zO7NTQd+cOvBOpMcIpAnrcNXAUz1er03UM/MyQf/AX
 P5g8jSIpuXHTB8V89QIXQyBVin30rzisih2818mYjV/r7K9jXEpbiv6gs
 6mZjeKw0phr/k9l+TzEZtuhaIinZo+8PpdQZA33Ryd36WR0+lsbFbz0Zs
 2hpLaqL4McldE3VFXOw2dj0kLcevsdFVnHvEJzPs2Q5Mzpn4aj3ecCgf0 w==;
X-CSE-ConnectionGUID: 8DHf0Vv3QwutcYe2CFNhsQ==
X-CSE-MsgGUID: 6nwENRPGT8WXcV9tqaiELw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4284040"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4284040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 09:01:15 -0800
X-CSE-ConnectionGUID: vJ0k0UFnTPK1pOGwuJYQ1A==
X-CSE-MsgGUID: xN0AG3zdRGe/O0g4MJzCXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11677333"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 09:01:11 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/2] Expose power1_cap_max
Date: Mon, 23 Nov 2026 22:32:57 +0530
Message-Id: <20261123170259.394360-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds a power<i>_cap_max attribute and improves how mailbox
power limits are handled when a boot-time limit read fails.

Patch 1 adds a read-only power<i>_cap_max attribute for the card and
package channels. It reports the PL2 limit that firmware sets at boot,
which is the highest value userspace can write to power<i>_cap.

Patch 2 always sets the mailbox power, energy and time units. Before,
they stayed 0 if any boot-time limit read failed, so power was reported
incorrectly. It also bases power_max/power_cap visibility on the boot
limits. That way, an attribute whose boot read failed can no longer be
written, which would have set a 0 limit.

v1: https://patchwork.freedesktop.org/series/179047/

v2:
- Update KernelVersion to 7.5 in Xe hwmon documentation. (Rodrigo)
- Add patch 2 to address review comments from Sashiko.

Karthik Poosa (2):
  drm/xe/hwmon: Expose powerX_cap_max
  drm/xe/hwmon: Improve mailbox power limit init and visibility

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 27 +++++++++++++------
 2 files changed, 43 insertions(+), 8 deletions(-)

-- 
2.34.1

