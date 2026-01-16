Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069CAD47CD0
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 10:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C071110E858;
	Fri, 16 Jan 2026 10:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSWiuhBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E3410E858
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768559674; x=1800095674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aKx9cp/BLsO6ZjcZ8BEEO5WbTboH1MONuFwfEbo15uo=;
 b=DSWiuhBxPL+0EnjMSNvAj2Ke1L8r/omjmokCdcs97L/u9Ng5wHL0qErH
 zXj45TYK8mUFtzQLXPlZoj1WuxoHOpyD8dPZXoCdITAUe54CvUuihh9Cx
 n+tOzO980QVEBuxS1HEH65ugcOHMUNxjw+bkMKvNDeOkHQmAzdMT2+W2U
 lYcXou9dDm51XJay3c1Kt+EBjRff3AYJ5xel+Iva08lt576N8Qlf3wRe/
 WmSwo1ZiJ72L9A6jWsl+3HVca6Rm1eks6gCHZxAFhLlrHtoZLPZjbUPMz
 EogEya+zhYLry8107aP4nBkVAj6EfF1wOzPSkXyQ115roLxciG/kt+jkZ w==;
X-CSE-ConnectionGUID: e3tpfZXzQGaPujrzb3rDyw==
X-CSE-MsgGUID: YXOVWNETT9OOgfWPLk6vAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80990431"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80990431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:34:34 -0800
X-CSE-ConnectionGUID: btYuq7fISDqSM+wn3unTMg==
X-CSE-MsgGUID: ICriwEPHREiXqcKsllZAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="242758106"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:34:30 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 daniele.ceraolospurio@intel.com, nishanth.p.reddy@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 0/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
Date: Fri, 16 Jan 2026 16:04:52 +0530
Message-ID: <20260116103451.304716-4-sk.anirban@intel.com>
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

 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
 drivers/gpu/drm/xe/xe_guc.c           | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h           |  4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h   |  3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
 5 files changed, 52 insertions(+), 2 deletions(-)

-- 
2.43.0

