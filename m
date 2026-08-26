Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D253C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 17:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106D510EDA1;
	Wed, 26 Aug 2026 17:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k8jqkQwD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7110EDA1
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787764322; x=1819300322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4lM8uajI6isNyLK3tUEq0+gIX8y1yCmrtjShCPFGavo=;
 b=k8jqkQwDCnRmpZTa6VRpioFlUJxRW/WRBeIcA8GSckAzu4gjJ7Jdgvgl
 XAOe+avr6usg8Fu4O4gUlNf6kFQ9SUfLTmkQI9fIO1cG7bKrafJ37zsFg
 sezsSKVMhferQtzHon0VHvh/h/+4yTPfj15fnQzMXen/Q4NhKgnrAwBLc
 Q+M4WWHA9tXPKsCBmU6Mw6u4yDUGvNicL1v30Q+lWrh7nJokYchUyMyEd
 Fem4WBy+Ohu6pN8i4dFAbgEpwik5CW7Y9yuryWarfEqYvqxjTRzq0rqc9
 2gFGpcShK5BJ/Quu77nC4+PEdCJUM+Gqw614Mj6yvuSR6uKx/+n6/wmWf A==;
X-CSE-ConnectionGUID: nN+IkwXgR16J2k7YDPDsbw==
X-CSE-MsgGUID: IzTiNA9MSY+noXaX6C9/8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88379118"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88379118"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:02 -0700
X-CSE-ConnectionGUID: XJwW3QcRRcen4HnUFbjSkQ==
X-CSE-MsgGUID: +cY91bL7QAe17Y+aZdZ7/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="261493114"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:01 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 0/6] Prepare for WCL GSC FW
Date: Wed, 26 Aug 2026 17:11:43 +0000
Message-ID: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
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

v2: rebase

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

