Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B1AC83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 18:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7A110E15A;
	Thu, 17 Jul 2025 18:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfFDQm70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD1B10E0B7
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752778117; x=1784314117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HW2wCFQSNUTUHKIf9lPj0WPGu0fi16R7UwBgj/LI148=;
 b=BfFDQm70fFhbVnnsHnxPLo1yp7Wx3lLD+TnlhUD7ipq9A0ezF6p1ejh8
 yAejOP2+2A4MNX0IyCZZlbgWj5WCE36Rk78lPvKcFy5/lLudNrMS756KN
 1gGUj03UExZHjJjumzHE6V9AgUOTiwQKZQLm06tsQAPHbVjsSODfOiqrT
 LazFHLHmu8+KDDmJUDxXOgKPK/rxJJGBW8O/kMrzhY+W4U0WaZlZpmRNf
 Fhb+MWhv+i8j1x8Ky5ehr/GGY6G7dXKhYK/pezJ0kf9GM+8SEdQ0su9n7
 X5Oq58KGPYW9GuSOHrcxWjS61pwa0whwW/mK5mTh5WJE5b7BNzmDn42a1 Q==;
X-CSE-ConnectionGUID: hs1BwKtHS1CigVXBPI9s7w==
X-CSE-MsgGUID: xBWJv2niT26H1fP0AOXAKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80513733"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="80513733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:36 -0700
X-CSE-ConnectionGUID: xNYuqipFTxuVHFs6pIV+SQ==
X-CSE-MsgGUID: qu8JLLT1TpyEheQGnJuG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="181580942"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 11:48:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/5] Updates for drm/xe/configfs
Date: Thu, 17 Jul 2025 20:48:20 +0200
Message-Id: <20250717184825.851-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (5):
  drm/xe/configfs: Fix pci_dev reference leak
  drm/xe/configfs: Enforce canonical device names
  drm/xe/configfs: Use pci_name() for lookup
  drm/xe/configfs: Allow configurations only for Intel VGA devices
  drm/xe/configfs: Allow adding configurations for future VFs

 drivers/gpu/drm/xe/xe_configfs.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

-- 
2.47.1

