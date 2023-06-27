Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6486EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 11:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6991D10E0C2;
	Tue, 27 Jun 2023 11:58:20 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2A910E0C2
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 11:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687867099; x=1719403099;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3MLHnggWOvTbTsgN8CN3vUO+4NfU0NcpYiff9Oh7Icc=;
 b=VsPw5YqSkP3bSLp0ipuGFp3sUrI+49FRitpz1Fy+D1ZBeVPAMwbXQjBP
 GTiCH+C5LtUEjz1UpWHom6jhBq7pXRcWYgrhFKylscJ8/60OWmbA90XXQ
 1yaqwFZAWIUXC29HFce0Mn0TLKEbRQ/+h6cH01/NCCNTEF8NsK49ywPUy
 79usIn8smuqRbL0E1C0facRgQmU0fovFbmF7YXmbjENl6Ax8roWlta0ll
 kO5jMkFyf1BvNYrF8jdU99FtcwgEvl1gX03VnG0kednyu1n3yXq2aCif5
 aB+CxbDiBIv3SrNT/fiQB13uvmooOsff3HUcNEFXny9KTLmqPyN8LVA+v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="351333992"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="351333992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 04:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890668115"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="890668115"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 04:58:15 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:26:37 +0530
Message-Id: <20230627115642.2087251-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/5] D3Cold Policy
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding Xe d3cold policy support.

Anshuman Gupta (5):
  drm/xe/pm: Add pci d3cold_capable support
  drm/xe/pm: Refactor xe_pm_runtime_init
  drm/xe/pm: Add vram_d3cold_threshold Sysfs
  xe/drm/pm: Toggle d3cold_allowed using vram_usages
  drm/xe/pm: Init pcode and restore vram on power lost

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c |  85 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h |  13 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  23 +++++-
 drivers/gpu/drm/xe/xe_guc.c          |  17 +++++
 drivers/gpu/drm/xe/xe_guc.h          |   1 +
 drivers/gpu/drm/xe/xe_pci.c          |  53 ++++++++++----
 drivers/gpu/drm/xe/xe_pm.c           | 100 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h           |   6 +-
 9 files changed, 276 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h

-- 
2.38.0

