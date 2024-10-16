Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F2D1AD39
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 09:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548C510E011;
	Wed, 16 Oct 2024 09:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bxo1b8Ja";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCD510E011
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729072684; x=1760608684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a+zhY/mDrQtdvuHXZcqSker0pHclNuFve/eOvHuMmbk=;
 b=Bxo1b8Ja6QcF3xb+WH46h7Yd7Sp7IVrUsHBEQiuvTPT9VDLXOiqhRgJS
 ILB0yNk8BMDezthPxHbej3XOs+EI+dJAFbgrjeOTXUODrCVeeJonWRjOX
 v2fW4dG9beLaSLTv6KY7z218tVGfrMSu9ON+GkINX0HPyX0OKq/v6q116
 oWK73/t1N/UtBfHk4Be/E41EFY487d54A7hrPbMNutLZ6w4xvojEkPCyU
 A8fXaB5TA3f4cEoi8KsXarvYVROcTxXUnpz5TyqNHxu6ixm1DXm5Cp79d
 NWeezTkG2vltYKCAkzCuHAkItbcrtc9Dwq1cqA6yTasELwLSqj+RMIVsd g==;
X-CSE-ConnectionGUID: orvNOAfITiKaGh2etWr7sw==
X-CSE-MsgGUID: jy2ET8GaThC8GevUI89YOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="27951153"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27951153"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:57:56 -0700
X-CSE-ConnectionGUID: qWgpD/xUToCkAUFkVofkKw==
X-CSE-MsgGUID: /NnRteFSRoycUTEhZIBnRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78201564"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:57:55 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v1 0/3] PF: Add functions to save and restore VF LMEM and CCS
 data
Date: Wed, 16 Oct 2024 11:57:42 +0200
Message-Id: <20241016095745.7477-1-lukasz.laguna@intel.com>
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

State of VF LMEM and corresponding CCS metadata needs to be saved and
restored during migration of VM with attached dGPU VF. Add helpers that
allow it. We will start using them in upcoming patches.

Lukasz Laguna (3):
  drm/xe/migrate: Add function for raw copy of VRAM and CCS
  drm/xe/bo: Add trylock helper for buffer objects
  drm/xe/pf: Add functions to save and restore VF LMEM and CCS data

 drivers/gpu/drm/xe/xe_bo.c                    |  16 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 100 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   7 +
 drivers/gpu/drm/xe/xe_migrate.c               | 208 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h               |   5 +
 6 files changed, 336 insertions(+), 2 deletions(-)

-- 
2.40.0

