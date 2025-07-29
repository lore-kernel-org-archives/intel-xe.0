Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F77C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A2510E12B;
	Tue, 29 Jul 2025 11:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYcknXRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5430B10E12B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789346; x=1785325346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kE3Yx02INxQIbpEOQ0YX8Orv5NlJdRRw++JwawYZHSo=;
 b=XYcknXRPaRjtThDsvMz331u4q5bmN7kcGbPxAuDPytRcDBDZipkhVIOQ
 knzyOSGWPMZFUVSaNAQdctRQDAOrLwfPvm7HsutmIR+kLDrCwmpHoSvto
 tRj5WnZIZDB+ZJc7tjXld7iRPVtmalHQDJYPA1ohin/F/Lwfcts0dDO62
 4lfpD3xyUg6G4kjp0c/iK9XainfVhK9Yrt8qtheJLxxvEP1x0MgKSHbgG
 9nzBaA6JXS8+XaSxjtFVsfvXQuMzX+3S0GxKbEyHXFMGejl8t3/MCOJ6o
 M6kDNPbRiBqs68zrrDSQG0O7Ji4rArmFc0YA/n2lKM01Ko3i6Bh9J7I6w Q==;
X-CSE-ConnectionGUID: GvfVDE4XSbKBjh5h4TnpVA==
X-CSE-MsgGUID: +YzMSIBYRp+mT/amN+tfoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755567"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:25 -0700
X-CSE-ConnectionGUID: 92tUPNMOTGyBJ0I8CaM6Mg==
X-CSE-MsgGUID: GFoNQyh1SwC8vtDwrX0Zug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946858"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 00/11] Updates for drm/xe/configfs
Date: Tue, 29 Jul 2025 13:42:04 +0200
Message-ID: <20250729114215.177586-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v4: https://patchwork.freedesktop.org/series/151773/#rev5
v5: separate mutex_destroy/pr_err changes (Rodrigo)
    drop use mutex from xe_configfs subsystem (Rodrigo)

Michal Wajdeczko (11):
  drm/xe: Simplify module initialization code
  drm/xe: Print module init abort code
  drm/xe/configfs: Destroy xe_configfs.su_mutex on exit/error
  drm/xe/configfs: Drop redundant init() error message
  drm/xe/configfs: Rename struct xe_config_device
  drm/xe/configfs: Rename configfs_find_group() helper
  drm/xe/configfs: Reintroduce struct xe_config_device
  drm/xe/configfs: Keep default device config settings together
  drm/xe/configfs: Check if device was preconfigured
  drm/xe/configfs: Only allow configurations for supported devices
  drm/xe/configfs: Allow adding configurations for future VFs

 drivers/gpu/drm/xe/xe_configfs.c | 140 ++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_configfs.h |   2 +
 drivers/gpu/drm/xe/xe_module.c   |  29 +++----
 drivers/gpu/drm/xe/xe_pci.c      |   3 +
 4 files changed, 125 insertions(+), 49 deletions(-)

-- 
2.47.1

