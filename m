Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FB8CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 12:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5316210E76A;
	Wed, 22 Oct 2025 12:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7hqlL0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511DD10E76A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761135670; x=1792671670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GjRXxPOE7QvYH4vCksX42M59Kzngt+hTjrE7hKosIx8=;
 b=b7hqlL0m6isA9Z4IiqXINLs1wPDdiYjEt2KtDPvm0+zInbtOYdOmvLaH
 xFBrwRTSoprY9yCJehJvVIQRCbvDB+ETDEaz0J2GdP849/R0ErU/5b4UD
 XyKL/hph7cG8pUe+0Y7VVg4g0ZbY+JErcqpVbGmU1PROfe3p+KW0Gwfi4
 3IPrH+I5YWToAaTgvnDRNWj85R064ayoUdJsIZ/SPC5dzrb+tAlbmbUDz
 hNRC8y/C1oXQiHsF3OPruzwu0gQeWheD3usE0UdMvAKQKac/S0JNiNi+K
 9mQffWpdwj/KjqTkbm4ll8scABzJh3wmdU01vyI82PH/Xdtl+cO1Gz7iI w==;
X-CSE-ConnectionGUID: E/DdUpGtRnibJGvH1Mq8yw==
X-CSE-MsgGUID: i8vcOEM8R4SmAjmrtBD4cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63176444"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63176444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:21:10 -0700
X-CSE-ConnectionGUID: bAgJPIEsTaGfKoKKXKV5dg==
X-CSE-MsgGUID: GUETpQMASHW9mt62GRzs0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="187900345"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 22 Oct 2025 05:21:10 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] VF double migration
Date: Wed, 22 Oct 2025 18:08:08 +0530
Message-ID: <20251022123822.3747-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
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

In scenarios involving double migration, the VF KMD may encounter
situations where it is instructed to re-migrate before having the
opportunity to send RESFIX_DONE for the initial migration. This can occur
when the fix-up for the prior migration is still underway, but the VF KMD
is migrated again.

Consequently, this may lead to the possibility of sending two migration
notifications (i.e., pending fix-up for the first migration and a second
notification for the new migration). Upon receiving the first RES_FIX
notification, the GuC will resume VF submission on the GPU, potentially
resulting in undefined behavior, such as system hangs or crashes.

To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
sent along with marker and when GUC receives the same marker with
`VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF.

Satyanarayana K V P (2):
  drm/xe/vf: Introduce RESFIX start marker support
  drm/xe/vf: Enable RESFIX start marker only on supported GUC versions

 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 ++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 87 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 42 ++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  5 ++
 5 files changed, 169 insertions(+), 8 deletions(-)

-- 
2.51.0

