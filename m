Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D9DC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 23:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BF010EB61;
	Tue, 25 Aug 2026 23:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ke+IOQ3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2615F10EB61
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 23:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787699774; x=1819235774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H1NtfXMjrzgoacfIN3Aa3A95vWYVD/WtfEg8gTEMBB4=;
 b=ke+IOQ3nKOHdYVhxu+cqXnCw2HTcHuCgXm45dApvP7CQPjNCVgKZvflH
 eGtS4kN4PhroM+Q+t34VvaCjK16gERrvUgsvslu6EIJf8r1LsLPxEvtCO
 b56w74jClBHoMMcjZ0o0TajlUTreoCo1sApAPJ8KVT2eRKIQPvrL6GCbF
 kbfHCxeMVfmRj3rm7FQ4V6FI1gA8fnt3DLVFuZm5V819cdqC306hJnkro
 CqNISd4zIdzNw10VoZgIzkZQsAqqHPFRwjIOijILNayYPFjkQ2wynNzAm
 V9b8wJuHrO8h7k1xHzMA2UTco0k67xe9G7Or8W0tPDORnX8ocrF7ooaB2 g==;
X-CSE-ConnectionGUID: AvhiezFmQka4etZP7FseHA==
X-CSE-MsgGUID: KtMpGGe6RMqBKsTR84ooCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91857230"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="91857230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:13 -0700
X-CSE-ConnectionGUID: uRoBKjiiSumfxLeDFdWR/Q==
X-CSE-MsgGUID: Qkt7m0yqRGaXzSb4d7In4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270906865"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/6] Prepare for WCL GSC FW
Date: Tue, 25 Aug 2026 23:15:58 +0000
Message-ID: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
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

The GSC FW team has decided to fork the PTL FW and have a dedicated
build for WCL. The PTL FW will keep working on WCL, but the newer WCL
FW image is recommended; the WCL FW will not work on PTL.
While the WCL FW is not ready for release yet, its addition will not be
trivial, so we can start preparing for it. In particular, we need to be
able to distinguish WCL from PTL and be able to fall back to the PTL FW
on WCL if the WCL FW is not found.

The 5th patch on this series adds the WCL FW definition to show how
that's going to look, but that shouldn't be merged until the firmware is
available in the public repo.
The last patch adds a mock GuC 99.99.0 FW definition for LNL, to test
the fallback mechanism to GuC v70. This should also not be merged.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>

Daniele Ceraolo Spurio (6):
  drm/xe: Define WCL as a PTL subplatform
  drm/xe/uc: Add FW file fallback support
  drm/xe/uc: mark HuC and GSC as only available on the media GT
  drm/xe/uc: Support fetching different FW files per-subplatform
  DO NOT MERGE: drm/xe/gsc: define GSC for WCL
  DO NOT MERGE: drm/xe/guc: add a mock newer GuC file for LNL

 drivers/gpu/drm/xe/xe_gsc.c            |   7 --
 drivers/gpu/drm/xe/xe_huc.c            |  11 ---
 drivers/gpu/drm/xe/xe_pci.c            |   6 ++
 drivers/gpu/drm/xe/xe_platform_types.h |   1 +
 drivers/gpu/drm/xe/xe_uc_fw.c          | 101 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_uc_fw_types.h    |   9 +++
 6 files changed, 95 insertions(+), 40 deletions(-)

-- 
2.53.0

