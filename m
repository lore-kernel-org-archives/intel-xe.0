Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA56D39423
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 13:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505AD10E05B;
	Thu,  2 Apr 2026 13:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xeq7l5Jb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C878B10E037
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775135974; x=1806671974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1FFMVmvcPnT5JLQRPvOo4TaOEbt1f2sTbG4nIlgH6PI=;
 b=Xeq7l5Jb6v5cM4A+DhxmEUGsZPpy4QecVUaBbp3V2Q215tf30aYZRwLc
 s5L1XR/hv+wKQfW3iSc7xOj0iffGU5f1rAeSeOJ6cfNHn3PccZtTerC3g
 Ra0ob9Gc6Q1iF2UW/vmTIbPZ9CzRWIuFJEB7qsvhYP17oG1Ok569ipb++
 9cdPicmELvdgtZANBpdcPmyDvvT/uiGFBNzbat894GdGwAbusZmd+iCF/
 2MDVlMoS1dgle3TdfdfTpgAeQ/0oednJCgZzPieuzpAkBspbM4SWdWMgg
 JLGZYQiDSAclPZesPCH/wUDok9QGAghUKWFiGxO9CRd3gBy/xsfkLKSEQ g==;
X-CSE-ConnectionGUID: GlJZlcW1RZaqKQetcTT1Gw==
X-CSE-MsgGUID: zSfzmXKQS+KZukWwr5bhNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="78786636"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="78786636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:19:22 -0700
X-CSE-ConnectionGUID: GCrtuIN3Sm69UhDV58WJ6A==
X-CSE-MsgGUID: uHhvlgeKTM23faaENZlOPQ==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa003.fm.intel.com with ESMTP; 02 Apr 2026 06:19:20 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [RFC v8 0/1] Do not create drm device for PF only admin mode
Date: Thu,  2 Apr 2026 13:19:13 +0000
Message-ID: <20260402131912.634248-3-satyanarayana.k.v.p@intel.com>
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

When the PF is configured for admin‑only mode, it is restricted to
management functions and should not allow users to run workloads.
Suppress device capabilities to userspace in admin-only PF mode.

---
V7 -> V8:
- Fixed issues reported by CI.Hooks
- Updated commit message (Ashutosh)
- Removed gem_prime_import from admin_only_driver structure (Michal)

V6 -> V7:
- Allowed xe_observation_ioctl as well with admin-only PF (Ashutosh,
Michal Wajdeczko).
- Updated commit message with steps to enable admin-only mode (Rodrigo).

V5 -> V6:
- Updated commit message.
- Make content of query_engines and query_mem_regions as empty in
admin-only PF mode instead of query size as zero.
- Allow all other query IOCTLs excepts query_engines and query_mem_regions
(Michal Wajdeczko).

V4 -> V5:
- Updated commit message (Matt B).
- Introduced new driver_admin_only_pf structure (Michal Wajdeczko).
- Updated all query configs (Michal Wajdeczko).
- Renamed xe_device_is_admin_only() to xe_device_is_admin_only_pf()
- Fixed other review comments (Michal Wajdeczko).

V3 -> V4:
- Suppressed device capabilities in admin-only PF mode. (Wajdeczko)

V2 -> V3:
- Introduced new helper function xe_debugfs_create_files() to create
debugfs entries based on admin_only_pf mode or normal mode.

V1 -> V2:
- Rebased to latest drm-tip.
- Update update_minor_dev() to debugfs_minor_dev().

Satyanarayana K V P (1):
  drm/xe/pf: Restrict device query responses in admin-only PF mode

 drivers/gpu/drm/xe/xe_device.c    | 60 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.h    |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c |  3 ++
 drivers/gpu/drm/xe/xe_query.c     | 10 +++++-
 4 files changed, 69 insertions(+), 5 deletions(-)

-- 
2.43.0

