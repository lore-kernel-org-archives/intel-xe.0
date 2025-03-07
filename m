Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C278DC28B27
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0CF10E699;
	Fri,  7 Mar 2025 18:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEDuRSS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E150A10E191
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741371321; x=1772907321;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nBYIr1fvqckLlN4/ctmLv0eNOWQg8deIMpNlK3ipBgI=;
 b=cEDuRSS5pr4EGlg6wuexkTZBstHm8UWIs7AYb8bhnHbqGp7emqunI1++
 10+n8FyOAW4VcbSxA8EH0ryHLEc4vZlYzZtIjbhK4H10uQZME7InDCRV9
 9Yaap7zqUBf3wmLuAzY9zU6lJGdlQ4FseoFRrK0Ua9v2Dw2+N4DU3v2QK
 l6g7oul/CZuW75xC1z2ugCdVqjqGPNzctDzGNaipo4luu7Ky7uibtgnSR
 5/zdxUPeKDthbDVjHIMeKpq/Pls01FB3Ttm+9EebCh7d4jbOU+kCN9iei
 gwRpc2cyeIgxi+Z6Ao6FMdmNhPCf/7/NZhronyFivTQ6P13mfbSYdS+sY Q==;
X-CSE-ConnectionGUID: xA3LnWz/QZSP+NCQmMZg7w==
X-CSE-MsgGUID: 80u1qo5YSnKAvD00gXkn+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53825232"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53825232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:15:20 -0800
X-CSE-ConnectionGUID: PWbMOsXuQKC2dZcshcnrew==
X-CSE-MsgGUID: BTt2lrTXTNWkFKJQDPf5jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123580763"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:15:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] drm/xe: Support different GuCs per GT
Date: Fri,  7 Mar 2025 10:13:20 -0800
Message-ID: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250307-xe-per-gt-fw-4938dff9b339
X-Mailer: b4 0.15-dev-c25d1
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

This is an alternative approach to what John sent at
https://lore.kernel.org/intel-xe/20250303195215.1046192-1-John.C.Harrison@Intel.com/

Main thing is not making the name of the firmware magic, depending on
part of starting with "g" or "m". So here I add the gt type in a
pahole-friendly way and use it in the tables.

Tested on BMG with the following table, just for tests:

	fw_def(PANTHERLAKE,     GT_TYPE_ANY,    mmp_ver(xe,     guc,    ptl,    70, 38, 1))     \
	fw_def(BATTLEMAGE,      GT_TYPE_MEDIA,  mmp_ver(xe,     guc,    bmg,    70, 40, 2))     \
	fw_def(BATTLEMAGE,      GT_TYPE_ANY,    major_ver(xe,   guc,    bmg,    70, 29, 2))     \
	...

And with that I get (pasting just the relevant parts:

	xe 0000:03:00.0: [drm] Using GuC firmware from xe/bmg_guc_70.bin version 70.36.0
	xe 0000:03:00.0: [drm:xe_guc_ct_enable [xe]] GT0: GuC CT communication channel enabled
	xe 0000:03:00.0: [drm] Using GuC firmware from xe/bmg_guc_70.40.2.bin version 70.40.2
	xe 0000:03:00.0: [drm:xe_guc_ct_enable [xe]] GT1: GuC CT communication channel enabled

Something that we could also discuss is getting rid of the macro
indirections and just type the name of the file. Once upon a time we
needed to use different dirs, but now this only matters per for the file
name. The only repetition would be probably on the version. But I think
it would make it clearer what files we expect to have without the macro
indirections.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      drm/xe/uc: Remove static from loop variable
      drm/xe/uc: Add support for different firmware files on each GT

 drivers/gpu/drm/xe/xe_uc_fw.c | 102 ++++++++++++++++++++++++------------------
 1 file changed, 59 insertions(+), 43 deletions(-)
---
base-commit: 2c4fba1d065427efba4aaed5f80f4664c9f4a729
change-id: 20250307-xe-per-gt-fw-4938dff9b339

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

