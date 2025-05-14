Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75001C3ABD9
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 09:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FDD10E5FD;
	Wed, 14 May 2025 09:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzJncnXr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153A410E5FD
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747214719; x=1778750719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7aro3X/+CwOEfvq4j2xOBmdE61S+x16TqNmqjALtpmo=;
 b=lzJncnXrhpulNhZzAk0dxWkuhtZTWeThMd4umf4P67DAraTlboJCizlD
 Snrb2DaaUXeE3fkwGFwHtcjN+z3z+eueJuSRPgggbtl0sKgGRFDLNYq1y
 yQmdK04JjFFZdlD4NYe2g3ONLRr/2kmuSzE4h3n/fq6XHIGznkbiucsn6
 SChd0/BGG7UKAU0bJLpd7SS1zjLvikacROmj3VsMc2v4tMvjlPLMISFwq
 MoakYS5wyZ4f9/rtD/UhGA6CN5dNYCJRpDQWVtdXqYMVs873BzIU0UuAs
 yQQRQ+AJXI2ffhy1IwSzmcuy4DpOAX6a00qN3GHoZnomU9O15Bwd1get3 Q==;
X-CSE-ConnectionGUID: SqscZa6BSsKU9UEmw3z81w==
X-CSE-MsgGUID: RJWszFy3Tbqts3SC/91SfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49218327"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="49218327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:25:19 -0700
X-CSE-ConnectionGUID: mn90HYndQg6M6afILFSsHQ==
X-CSE-MsgGUID: gg0NrmnyTbm+VjZ2Z26AZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="142016810"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:25:17 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v4 0/4] drm/xe: Improve wedged mode handling
Date: Wed, 14 May 2025 11:24:48 +0200
Message-Id: <20250514092452.8364-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Prevent the VF from attempting to update the GuC reset policy when
changing the wedged mode, as this operation is not supported on VFs.

Additionally, validate the wedged_mode module parameter input, update
the internal wedged.mode state only on success, and allow setting
wedged_mode=2 only in debug builds if running as PF.

v1: https://patchwork.freedesktop.org/series/148214/#rev1
v2: Replace magic numbers with definitions (Matt, Michal)
    Use helper to sanitize wedged_mode (Michal)
    Change debug messages (Michal)
    Reorder patches (Michal)
    Add fixes tag (Matt)
v3: Rename xe_device_wedged_mode_validate to
    xe_device_validate_wedged_mode (Michal)
    Make enum nameless (Michal)
    Add default field in enum (Michal)
    Change names of enum fields to match modparam description (Michal)
v4: Fix GuC reset policy update
    Replace missing magic numbers with definitions
    Update debug message

Lukasz Laguna (4):
  drm/xe: Validate wedged_mode parameter and define enum for modes
  drm/xe: Don't update wedged mode in case of an error
  drm/xe/vf: Disallow setting wedged_mode=2
  drm/xe/pf: Allow wedged_mode=2 only in debug config

 drivers/gpu/drm/xe/xe_debugfs.c      | 13 ++++++------
 drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  7 ++++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      |  9 +++++----
 drivers/gpu/drm/xe/xe_guc_ads.h      |  3 ++-
 drivers/gpu/drm/xe/xe_guc_capture.c  |  3 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  6 +++---
 drivers/gpu/drm/xe/xe_module.c       |  5 +++--
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 10 files changed, 58 insertions(+), 21 deletions(-)

-- 
2.40.0

