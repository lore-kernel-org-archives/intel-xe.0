Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7814606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 05:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jcPkhWdk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA70410E1E6;
	Thu, 26 Nov 2026 05:53:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800AF10F4ED
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 05:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795672432; x=1827208432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7OU/nABE0jriHxaFEAaXqey0kYaZzM7rPY4X+NWzlUs=;
 b=jcPkhWdk4HW1FReJXtZ9oygV8/QVxVji4tdzgXXvvbKkNGrP/PLiOKrf
 rhoGGDDFcsguM17me5eS0R/wunQejehp/M7Ixb/Xyi04/1aQSTT4zZvrM
 E1WysNYLtU8xkQz0giLygbZ9Hx88nT8Yg6z4V+PZC4CQmpy9NFg4FhisZ
 t4NexLEQpFslBqtHbqPurj0NQgLFxF/AGXtlvUXyEpPCcqL3W1N16T/vJ
 JQiEsPdBELeK6P5wG7ofv1rfZJGRHByv3chXwRwCZYliwSyZTAyZUQAyq
 b3kYuPE0+Q+XAqM3cQfZX3p3CLnioHDlWdCrez8ugAJMEiV+x8m6MsGl5 A==;
X-CSE-ConnectionGUID: RkRt2Zc2QmSn8evaBg+OlQ==
X-CSE-MsgGUID: bKP18LlJSLCRZ1hPx7wUqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4557924"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4557924"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 21:53:51 -0800
X-CSE-ConnectionGUID: qn4poYgxSri3NtgYdLtspQ==
X-CSE-MsgGUID: f1XBgkqSSIu0t7ht0f6gnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12130335"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 21:53:49 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 0/2] Expose power1_cap_max
Date: Thu, 26 Nov 2026 11:25:28 +0530
Message-Id: <20261126055530.1629019-1-karthik.poosa@intel.com>
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

v3:
 - Address minor nit comment from Mallesh.
 - Make patch 2 as first patch in series. (Rodrigo)

Karthik Poosa (2):
  drm/xe/hwmon: Improve mailbox power limit init and visibility
  drm/xe/hwmon: Expose powerX_cap_max

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 25 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 27 +++++++++++++------
 2 files changed, 44 insertions(+), 8 deletions(-)

-- 
2.34.1

