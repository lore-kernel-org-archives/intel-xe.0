Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29333606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EnGbGWN2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E701989DA9;
	Mon, 23 Nov 2026 14:07:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC6989C5E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 14:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795442824; x=1826978824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RMpJcS+kbvuFcfZC7yTm/KRGKUOIeWCw1WCkkvM+8CE=;
 b=EnGbGWN2gYY7XJq4vZvseQpvyplh4XcsJWuXAX+MDu4IzqkGEoMhlwLV
 0FQu+ThO2e97t1nlP8ui98JPSuJf7VyGv6XfgzWv+jw1GklnmYro8H9Ab
 OURpNutKvpw8NerhAMUXg7ghjoSxyfupmcfOVXf6pmXxuSNvDmXfdQuB2
 vVLwdrpqYgQNmreSP9lmVZ3a429RlIEUX66ZKItz2sfTp0D21uyx8nKx0
 iOmpO2wp5YYQK1e9/hTyU//dvczpvFylsJ0teQctbD4cFpXHqqGMhyNnz
 p+YxOWOVvVSmkcrlTHMG16QR3Q4OHKtHU76n1aUt2YP0UIp3TwcOzQLju A==;
X-CSE-ConnectionGUID: /CzVL7e2Q+a0Ia+Kl2UfFA==
X-CSE-MsgGUID: 8v3A7c5dTVe/d+ppwR5BZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4261506"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4261506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:07:04 -0800
X-CSE-ConnectionGUID: JbxBmBx+QIiblRWn1g/7Fw==
X-CSE-MsgGUID: v5ElwNZOSpWFH/WWnzmyIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11416390"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:07:00 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/2] Expose power1_cap_max
Date: Mon, 23 Nov 2026 19:38:45 +0530
Message-Id: <20261123140847.338842-1-karthik.poosa@intel.com>
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

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 21 +++++++++++-----
 2 files changed, 39 insertions(+), 6 deletions(-)

-- 
2.34.1

