Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DDACCFA05
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 12:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B33410E270;
	Wed,  5 Nov 2025 12:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPBDhLMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8872010E2D4
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762344715; x=1793880715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5X7piww4cUtekP2e/A9FlZ8pMTTfGGHJ+xtxpn3rmVw=;
 b=mPBDhLMfPoWdBVr8/8x7faKhXCAwId5vsIAeLGkBP9qytYe/EMpTEbNY
 r6h1khXHZuKXIAQH5EqqltZw7/u2o/8CSs1oc43vactb2PQPMRD90ToEe
 i0CtWOfd3MBlsgNmvc6VUpULxpE8JCmXDKu8oipgMfw5RROhcdk6PTNLh
 puKxskLn4UtiHYCqLrvswFYJA4DU8my6u3IHMDVH/+i/FNmgir4/OfBkH
 pK8RgyXidCcmIAa6bK02QtVCbX/CHOPyZe/hH2W8Frr+W2b13XX6a5PRY
 EzNlRn58AZbcSLFXRK1Inw22LzLIrtV7wP8jqYsC9a3NUFV4G1hVx4fKo w==;
X-CSE-ConnectionGUID: B81gZQw6Sl2PdBrZNorOjQ==
X-CSE-MsgGUID: Z5GwJ4EfRkG/DxWX74I08w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75807778"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="75807778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:11:55 -0800
X-CSE-ConnectionGUID: 3E8XF4GvS0ucrUxMOb6+dg==
X-CSE-MsgGUID: k2J4NIRJTduDw5wGU2yydA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187130920"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 04:11:55 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 0/2] Improve CCS save/restore series (cont...)
Date: Wed,  5 Nov 2025 12:11:49 +0000
Message-ID: <20251105121151.2680100-1-satyanarayana.k.v.p@intel.com>
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

CCS copy command consist of 5-dword sequence. If vCPU halts during
save/restore operations while these sequences are being programmed,
incomplete writes can cause page faults during IGPU CCS metadata saving.

Use shadow buffer management to prevent partial write issues during
CCS operations.

V1 -> V2:
- Updated xe_sa_bo_swap_guard_lock() to use guard(mutex) class (Michal W).
- Moved xe_device_wmb() into xe_sriov_vf_ccs_rw_update_bb_addr() (Matt B).
- Added kernel doc for xe_sa_bo_swap_shadow() and xe_sa_bo_sync_shadow()
functions (Matt B).
- Removed xe_sa_bo_swap_guard_lock() and xe_sa_bo_swap_guard_unlock() and
created xe_sa_bo_swap_guard() to which return mutex. (Michal W).

Satyanarayana K V P (2):
  drm/xe/sa: Shadow buffer support in the sub-allocator pool
  drm/xe/vf: Shadow buffer management for CCS read/write operations

 drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 54 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h      |  3 ++
 drivers/gpu/drm/xe/xe_sa.c           | 67 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sa.h           | 20 ++++++++-
 drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 22 +++++++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 8 files changed, 164 insertions(+), 8 deletions(-)

-- 
2.43.0

