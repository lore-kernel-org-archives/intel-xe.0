Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3885DC54E41
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 09:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCF710E523;
	Wed, 28 Feb 2024 09:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1mg2OPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A8710E2B7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709111420; x=1740647420;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vbT4fCr6T4CZv34ycjJnLJBQLJrRUB0Gito08Ie7by8=;
 b=A1mg2OPq7mc4xrpQy7hqk77infBN4F/df6XH5F0nulq5JVJbpjx6urH0
 pszbVbpmPDJvyHt0wdPC1DUn91Vih2d7q+uhTdXvFdFzW5gDQ588L/bIf
 +ZydH5FXbTCvTu/DxHJjCmJ0v5TqihwNhpxzsils7mkbQ1BQwGN2J2IMC
 tZCpEQNC4IVfrWqY5E9/O6sM4/WyXg3zRni8u3Ft293yEibG5UQcThUeB
 /te51FhYWmhkRnAH+VmeOvJ371en1OJHc9yNV/WQiEB5hwvFmOIYNP6H3
 LbCdbYz0x2vl67dnb9EHNnAZzZqCJFlWAEal67zjov8anYjg17mT542zP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3618931"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3618931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 01:10:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7931379"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa008.jf.intel.com with ESMTP; 28 Feb 2024 01:10:18 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: haridhar.kalvala@intel.com, matthew.d.roper@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 0/3]  drm/xe/arl: Add Arrow Lake H support
Date: Wed, 28 Feb 2024 14:40:01 +0530
Message-Id: <20240228091004.3271151-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
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

These patches includes the new PCI ids and support of workarounds 
for ARL-H platform.

Graphics version 12.74 (which is technically called "Xe_LPG+") should 
be handled the same as versions Xe_LPG 12.70/12.71 by the KMD.

Matt Roper (3):
  drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
  drm/xe/xelpg: Extend some workarounds to graphics version 12.74
  drm/xe/arl: Add Arrow Lake H support

 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 drivers/gpu/drm/xe/xe_pci.c           | 1 +
 drivers/gpu/drm/xe/xe_tuning.c        | 4 ++--
 drivers/gpu/drm/xe/xe_wa.c            | 8 ++++----
 include/drm/xe_pciids.h               | 3 +++
 5 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.34.1

