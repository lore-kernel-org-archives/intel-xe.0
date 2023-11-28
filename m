Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD86C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD47E10E56A;
	Tue, 28 Nov 2023 15:04:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B3610E563
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701183858; x=1732719858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=16r5O3k/KkfN0O7rIMbsCiLB/dSqhXGrhXE83Xy/tgw=;
 b=AyuC3if+/Z9f0fcdMuDvL5dMf1G1m/Lwx5ZGETUfy92dRUnMqggA3fPg
 cd34/U4hAG0MhQNEGknTtPRcz8Rqd5mWR7ouT1FT+OgyHKye3IjwJTO+t
 TZJZ5NrIKMooKvocMKSINRkqSYivjuemFqhUwQDQF75qdLtBytwvZ8JZN
 X65wqdCAGPZ45eqhwSdXCqYPGYkl34tIDXlF6TodI5CN3/J/P0a+82ezk
 WVhsMXiIdSt3qD4GnyCMfyHYKjcWQpPDF/Xg9ffqep8iYaqB8TLq9Z6Cx
 a+uKUnM6qF1mPGtkn3R5pi8v+Ugcjsq8Pqb8iCS6k3SgjTgKJcpDOhTmB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="395757867"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="395757867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:04:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892096576"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892096576"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga004.jf.intel.com with ESMTP; 28 Nov 2023 07:04:11 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 20:43:30 +0530
Message-Id: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 0/3] Report ATS-M Unique device id
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

This series provides support to specific customer for reading
ATS-M device unique ids which are calculated by CSC firmware.

Only ATSM has a this way to report UID through CSC firmware 
calculation.

As part of this series we are adding has_csc_uid capability flag and
a sysfs entry to be read by sysman and its end users. We are also
reordering device sysfs init to bring it out of pm init sequence.

Tejas Upadhyay (3):
  drm/xe: Track if platform has csc uid
  drm/xe/ats-m: Expose uid for ATS-M via sysfs
  drm/xe: Move device sysfs init out of xe_pm_init

 drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
 drivers/gpu/drm/xe/xe_device.c       | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_pci.c          |  3 +++
 drivers/gpu/drm/xe/xe_pm.c           |  5 +----
 6 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.25.1

