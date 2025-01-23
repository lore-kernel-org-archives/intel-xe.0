Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A666C0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 20:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2115810E07F;
	Thu, 23 Jan 2025 20:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtdovVnL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAAC10E07F
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737663794; x=1769199794;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ajq6s/1qpKxzWF+20MFBp/odmO8/uTexm/MnPrcS3gM=;
 b=GtdovVnLL1Z3vFqnny39HiX/zQmFdeE2DateY93UTP32mgwzrJs4W66f
 OdvFzjswZSIYK8PD/6Ur3OfzE0tAoTNRm4er8p7U+mz043UzGIjYd9QfC
 +hZROiwZPSGfLF7I3RJtVmMKgk9a9npUwNg0ArQm+6vPofQiiffC1mXAw
 ZAtUSia/nROQUB1VWvQ228c/hIiXrpTJtQhuKE5cQRP2ZeM+VUCfRsI+Y
 Z1oF2pXXaStn8UvsElApgjMlI4fsBDfYASO4cJGzMR8iegm9b34LvVzNq
 5GRQrjXmiqZeg5phlgI0Vk1NEncGiAl4Q1gbaOZtPZCZHwSDKK1qh4hD2 A==;
X-CSE-ConnectionGUID: 9JeT7LMqR7u2vtWpGMRd1A==
X-CSE-MsgGUID: AUKrgFuzRvKtHVIqNO/yQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41946285"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="41946285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 12:23:13 -0800
X-CSE-ConnectionGUID: bWqqL6YXRn+7F6liNWIpUg==
X-CSE-MsgGUID: /34S4ObrTW2UutKBnSEN7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138437907"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 12:23:12 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] Enable GuC log dump and minor fixes in devcoredump
Date: Thu, 23 Jan 2025 12:22:02 -0800
Message-ID: <20250123202307.95103-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.48.1
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

This patches enables dump GuC log dump again and don't require any
change in Mesa parser.

I will follow up with some changes in Mesa parser to not output
the GuC log binaries but bo and hw context parser are still functional
without those changes.

v2:
- added suffix description comment
- renamed GUC binary to LOG

José Roberto de Souza (1):
  drm/xe: Make GUC binaries dump consistent with other binaries in
    devcoredump

Lucas De Marchi (1):
  drm/xe: Fix and re-enable xe_print_blob_ascii85()

 drivers/gpu/drm/xe/xe_devcoredump.c | 33 +++++++++++------------------
 drivers/gpu/drm/xe/xe_devcoredump.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  7 ++++--
 drivers/gpu/drm/xe/xe_guc_log.c     |  5 ++++-
 4 files changed, 22 insertions(+), 25 deletions(-)

-- 
2.48.1

