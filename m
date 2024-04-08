Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB81CD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FCC1128C4;
	Mon,  8 Apr 2024 17:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSFGfkFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0C6112899
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595925; x=1744131925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iuy4ZKz6zMn4LgZJKMi4dTQebCaRQQpM/E+nqDp9r0k=;
 b=RSFGfkFRFG2Di50lNrI77Hmx6jHdhumVKFdMnTaDBjTe1JDlkbdMLcDO
 pO8vBclK+6bC139isHrMFuy8p1eppqNDPj4efIJiL/Gyn5+wzYYE+bRqb
 YJJNB7CcL/AoCrj07MljP98H/syeT+YV6MVgyoC3Z6LttRaPdzWaa6kw9
 Ds3XRoibgX7eeCKGNQNwpTSqkdCsKPZY+hDuYIn8p6vimtA7IaBsCsS9h
 ywvdnNP16TjBz/6zkCbVfC6//pLaOpmohr5WRwmvZrMQhEhFGLB6XZfUI
 1S5W/tJYVPb6sujvOdW8N/2PKTK4rY1vTOjf39NevXMBGys3obHFXmEiN Q==;
X-CSE-ConnectionGUID: d8acMhOzQDGyP4HyXFnDew==
X-CSE-MsgGUID: 6Xmw62bvQDCR7KSAp45IpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679130"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679130"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:25 -0700
X-CSE-ConnectionGUID: Wfw+Zw56RjqHJmRuoERIEA==
X-CSE-MsgGUID: Cw+DMybyRqG1d81WKZUnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733836"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:24 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 00/11] Add Battlemage support
Date: Mon,  8 Apr 2024 22:35:34 +0530
Message-Id: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

Add basic support for Battlemage, which is a discrete graphics card
based on Xe2 architecture.
This series provides basic enabling support. This will be followed with
further patches series to enable display support and loading of required
firwares.

v3: Resubmission because v2 had mixup of patches

v2:
* Removed the BMG PCI IDs to stop driver from binding to it. Will be
  added later after enabling patches are merged.
* Function argument modified for function get_flat_ccs_offset
* Removed WA_16020183090 which is no more applicable.
  Extended WA_18033852989,WA_18034896535 to xe2hpg
* Switched to open upper bound for "Tuning: L3 Cache" setting
* improved commit description for
  "drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx"
* Included the patch from [1] as the patch "Add initial GT workarounds"
  has a dependency on it
  [1]: https://patchwork.freedesktop.org/patch/587168/?series=131912&rev=3

Akshata Jahagirdar (1):
  drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx

Balasubramani Vivekanandan (1):
  drm/xe/bmg: Add BMG mocs table

Bommu Krishnaiah (1):
  drm/xe/xe2: Add workaround 18034896535

Gustavo Sousa (1):
  drm/xe/xe2hpm: Add initial set of workarounds

Haridhar Kalvala (1):
  drm/xe/xe2hpg: Add initial GT workarounds

Himal Prasad Ghimiray (1):
  drm/xe/xe2hpg: Determine flat ccs offset for vram

Matt Roper (4):
  drm/xe/xe2: Recognize Xe2_HPG IP
  drm/xe/xe2: Recognize Xe2_HPM IP
  drm/xe/bmg: Add BMG platform definition
  drm/xe/bmg: Program an additional discrete-specific PAT setting

Shekhar Chauhan (1):
  drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG.

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  14 ++++
 drivers/gpu/drm/xe/xe_bo.c             |   3 +
 drivers/gpu/drm/xe/xe_mmio.c           |  39 +++++++++-
 drivers/gpu/drm/xe/xe_mocs.c           |   1 +
 drivers/gpu/drm/xe/xe_pat.c            |   7 ++
 drivers/gpu/drm/xe/xe_pci.c            |  12 ++-
 drivers/gpu/drm/xe/xe_platform_types.h |   1 +
 drivers/gpu/drm/xe/xe_tuning.c         |   6 +-
 drivers/gpu/drm/xe/xe_wa.c             | 102 ++++++++++++++++++++++++-
 9 files changed, 177 insertions(+), 8 deletions(-)

-- 
2.25.1

