Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76659C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 14:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2421910E954;
	Mon, 25 Mar 2024 14:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icWMWaaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518E910E954
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378240; x=1742914240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S9B2MoH6asgnZ9BWmFToH42hBNzexh+XRI/DwpQzQNs=;
 b=icWMWaaUqtA37kbLOccmnZ3Ftm8Dv+gkH1gu37ALHF+IKyTgqAnnMfnn
 4da3x6LDobWtnE2CM63VMcuSuZiuMIU+7BhPR/sFrEsKW4+vKSvd5Lv6L
 Rdc1lEn2rCkzJbjkOR9gB9vNxwqHH+SW9vuCn5Qk14yqKgqjRh4wJ4dmV
 vxjXf/oCJEYVN1QI/GULwGfOKiODBwOBIFaI0PeXg5xlbF1Q6SRN/J6KY
 c6P8YG4lxlUBtURPzlTfv7SlsKE4uj28AyMZLFY4xhAfqTsDq/xAdCU8r
 SYKHh51cxT+qc3oeQLspiEdAlohBdSBW9RAbML9aJvFwVQ9BnoDYC+ZZR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17819343"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17819343"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20328964"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:50:38 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v3 0/2] Add support for Wa KLVs
Date: Mon, 25 Mar 2024 20:34:33 +0530
Message-Id: <20240325150435.2967536-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add infra to opt-in GuC Wa via KLV interface. 
Enable Wa_14019882105 for LNL A step

Badal Nilawar (2):
  drm/xe/guc: Add support for w/a KLVs
  drm/xe/lnl: Enable GuC Wa_14019882105

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 85 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 5 files changed, 97 insertions(+), 3 deletions(-)

-- 
2.25.1

