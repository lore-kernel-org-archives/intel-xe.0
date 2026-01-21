Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E678DC44506
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F34F10E88D;
	Wed, 21 Jan 2026 21:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJJYPjjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2FE10E88D
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769031752; x=1800567752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IID8keq6kavrEna33FghXP/9riHiA+kNu32AlOGRDUc=;
 b=jJJYPjjXhFZw9YYcLCuCfRznGAF4HBiTvVsVJJqgTjL76PVc5+J++9uI
 EalKBKbexXGH1P5BQcihUcS78GoV6g9/bRz/ecHebRAoQyMh6bOQTueW5
 VRUtGlBdScz9bNhrjCih554OpMvnE227H3jH0LPslWCcs3oHg66MpEFrL
 VXKK3RQRatO2CmaK0G3mz59k2QsKo0Fc2tQqv6juqeC2hTHZGz1Q9UPQY
 68cy76Ov4RUD7dwJmCZw1prXApbO9QMywA/Tzl1WkrZQeCtuLjfLcvlJx
 ceDtl8CbNuAP5BcXrcFGDiyGpXqg+wffwOMfAC0IIFfGq6TXOWmJUVAw+ w==;
X-CSE-ConnectionGUID: esa38T9vQAeUgL1/hdaL0Q==
X-CSE-MsgGUID: KcxoS65oTa6jCA90wbQOXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70433935"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70433935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:31 -0800
X-CSE-ConnectionGUID: nsbC34+FTJi1JcL/M96f0g==
X-CSE-MsgGUID: W7+oFZgQT1esebMqBDlcVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="205691608"
Received: from lalin-p14sg4.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.33.19])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:29 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/5] drm/xe/configfs: Add sriov.admin_only_pf attribute
Date: Wed, 21 Jan 2026 22:42:11 +0100
Message-ID: <20260121214218.2817-1-michal.wajdeczko@intel.com>
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

Currently we are relying on the info.probe_display flag to guess if maybe
we should provision single VF in more favorable way, without reserving
too much resources for the PF (mode known as 'admin-only-PF').

Start using configfs to allow flexible admin-only-PF configuration based
on the real need. But before that, do some cleanups and preparations.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Michal Wajdeczko (5):
  drm/xe: Keep all defaults in single header
  drm/xe/configfs: Use proper notation for local include
  drm/xe/configfs: Always return consistent max_vfs value
  drm/xe/pf: Define admin_only as real flag
  drm/xe/configfs: Add sriov.admin_only_pf attribute

 drivers/gpu/drm/xe/xe_configfs.c         | 64 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h         | 16 +++++-
 drivers/gpu/drm/xe/xe_defaults.h         | 26 ++++++++++
 drivers/gpu/drm/xe/xe_device.c           |  3 +-
 drivers/gpu/drm/xe/xe_device_types.h     |  3 --
 drivers/gpu/drm/xe/xe_module.c           | 42 ++++++----------
 drivers/gpu/drm/xe/xe_sriov_pf.c         | 10 ++--
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |  3 +-
 drivers/gpu/drm/xe/xe_sriov_pf_types.h   |  3 ++
 9 files changed, 131 insertions(+), 39 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_defaults.h

-- 
2.47.1

