Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7DDC636D7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 18:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF8310E04C;
	Thu, 23 Feb 2023 18:57:54 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532410E04C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 18:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677178673; x=1708714673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UsY5SMCXvMMhXDpuqSnue16I4tiXCDwLq6G4tEU4iIU=;
 b=S1Nr0U0nsnh/r8cixrkfaiT9Fs5ZSZ72xlpqkAE4xavNY4hh0nYVhj30
 Hk7CCMsj/ykz2SLc/m46BvZ0FMCB008qlFLjdJniKfl6BKSBdLtFgy2GX
 +oEuhWDYyYAZY+wV+rOJU1FGE2rOvDpnyVOIL5vv+ulvLdpB9krEOl8M/
 ITQdSTJ0d0mNUDzR4WOlgy5RoYj3WQ/ww0Td6C+gdV7BER1NBs3ZBO7gh
 H+r7AJuPdK1lcBoglfzK/fcTiOPjtV0DZvidCT6+S3sZtL2YGP3BxSuXH
 wXtCWZGsoRkg8AZatYb3m7qmKa7K94eaRmtmVJ8QlAkvNM7japEuDxFz5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360793747"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360793747"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782018595"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="782018595"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Feb 2023 10:57:33 -0800
Message-Id: <20230223185740.3356127-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/7] Assorted MOCS updates
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The Xe MOCS code is heavily modelled after the equivalent i915 code, but
there are a few items that are not appropriate for the Xe driver.
Philippe's patch to add the MTL-specific table is also included.

As a follow-up, I'd like to rework Xe's MOCS to just use the xe_reg_sr
framework.  But that's a bit more invasive, so I'll save that for a
future series.

v2:
 - Add a sanity check for uninitialized info->unused_entries_index
 - Tweak some commit messages
 - Don't overallocate GuC regset for platforms that don't need
   Wa_1607983814.
 - For platforms that do need Wa_1607983814, only add the LNCF MOCS
   registers to the render engine's save/restore list.
 - Drop HAS_RENDER_L3CC flag.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Matt Roper (6):
  drm/xe/mocs: Drop unwanted TGL table
  drm/xe/mocs: Add missing RKL handling
  drm/xe/mocs: Drop xe_mocs_info_index
  drm/xe/mocs: Drop duplicate assignment of uc_index
  drm/xe/mocs: LNCF MOCS settings only need to be restored on pre-Xe_HP
  drm/xe/mocs: Drop HAS_RENDER_L3CC flag

Philippe Lecluse (1):
  drm/xe/mocs: add MTL mocs

 drivers/gpu/drm/xe/xe_execlist.c   |   2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c    |  20 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c |   1 -
 drivers/gpu/drm/xe/xe_mocs.c       | 178 +++++++++++++----------------
 drivers/gpu/drm/xe/xe_mocs.h       |   1 -
 5 files changed, 99 insertions(+), 103 deletions(-)

-- 
2.39.1

