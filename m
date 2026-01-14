Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6516BD2A00B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 12:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140A810E643;
	Wed, 14 Jan 2026 12:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xa+NH4nB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BE410E636
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768395596; x=1799931596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=16gnDjnjsUe1lrpDdhaqYeBna4RFxMNcQxd7gic6hqE=;
 b=Xa+NH4nB6KCYPkn4DyecqBEKRZocYwa/9+Mp1ajBLzZFpuf1YrzrarOa
 +w5Rf1TysF+1sK3n1C9DlA5R1MeRXrnK8R6qODajOMTnwKMktukxnJHWU
 Y38Nfj52w1K1kp9WVVbZi+vzQlneRHDEMoOLbPGpRix3F03v870ZvGNbD
 mzA2WsXOsa1BDmComHY+GIVvnHPPitjUhC5LuIltbhx+UgtdHOtfmJWCC
 G/eO7SD53/Fe/nxepMPehe0Ke1ml9RlL6EUF3NAbvXiTpNsJ5d4CvsHbk
 HzvAJqyOdBATcUsYSkxIvGsc9MLPSQTgqYL//AF0aBCxc7M7HeVBGydCy w==;
X-CSE-ConnectionGUID: ol/MCXoPT4edNZmTBIfZvw==
X-CSE-MsgGUID: mQ+3t4LBR/q1QGcaU3ODKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92361676"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="92361676"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:59:55 -0800
X-CSE-ConnectionGUID: 5bbgFuYvS5+6g+KH+ZEW+g==
X-CSE-MsgGUID: rkB7G5SdTEaTTXvvfy53YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="203810616"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:59:51 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 daniele.ceraolospurio@intel.com, nishanth.p.reddy@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
Date: Wed, 14 Jan 2026 18:30:16 +0530
Message-ID: <20260114130015.3917770-4-sk.anirban@intel.com>
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

Prevent GuC firmware DMA failures during GuC-only reset by disabling
idle flow and verifying SRAM handling completion. Without this, reset
can be issued while SRAM handler is copying WOPCM to SRAM,
causing GuC HW to get stuck.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  drm/xe/rtp: Extend support for max rules/actions per entry
  drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset

 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.c           | 37 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.h           |  4 +--
 drivers/gpu/drm/xe/xe_rtp_helpers.h   |  3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
 5 files changed, 58 insertions(+), 3 deletions(-)

-- 
2.43.0

