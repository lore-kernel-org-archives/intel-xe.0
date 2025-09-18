Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E00CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 07:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7325D10E32E;
	Thu, 18 Sep 2025 07:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TV+p4pzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8073210E32E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758179588; x=1789715588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKwtcbdmpxudk33HmoBWhZxEEMjkYOCtL19o27hl/dA=;
 b=TV+p4pzvYZG792tCaXHlaY2S506HngWCkUQnSp2fWn20Z/ajxgpQO8Ly
 UVI05VpPju/Un2s5ptA/GQKt+relbrpDMHVPTLGyVYLKohQQSMhCbOPT9
 Kb0otLhWX0J1nuSGbqwwOtpaYDA7K2Ip32FXZZRXgcHFPCxFtaS1v5Uhf
 3SbVJZuMPs7bf7EPCX5Qbbl5F/ZewhZ8R4VjGZaenfH7q8WA7CzcSD7Dv
 3CIQU8xRoRnxQO/LjbjAFXRh57U2DU/fcDef9T81RZUreCbtttzhBnalx
 zcJAlqwiU97vk9kjh/NllW/YtlTaJ0s4mFfWqGb1AExYDjtlm8TLpLNQe Q==;
X-CSE-ConnectionGUID: E8CpwRkoQP2Cmv23GE81Cg==
X-CSE-MsgGUID: /v832DsuQZmWNqqcO9MZ1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60648745"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60648745"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:13:06 -0700
X-CSE-ConnectionGUID: iRYaUVCLTG+CFimU4JIo8Q==
X-CSE-MsgGUID: 5+TfOaYXSnq10FLeqBPPtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175856899"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2025 00:13:04 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/4] Improve CCS save/restore series (cont..)
Date: Thu, 18 Sep 2025 13:00:03 +0530
Message-ID: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
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

Improve CCS save/restore series with post migrations GGTT fixups and
by increasing timeout after BUSY reply from Guc while waiting for
RESFIX_DONE.

Satyanarayana K V P (4):
  drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
  drm/xe/lrc: Add helper to query post-init ring tail
  drm/xe/vf: Post migration fixups for CCS save/restore
  drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC

 drivers/gpu/drm/xe/xe_guc.c          |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c          |  1 +
 drivers/gpu/drm/xe/xe_lrc.h          | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_lrc_types.h    |  2 ++
 drivers/gpu/drm/xe/xe_migrate.c      | 28 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_sriov_vf.c     |  3 +++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 8 files changed, 67 insertions(+), 9 deletions(-)

-- 
2.51.0

