Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6767DC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A8410E1C8;
	Fri, 24 Mar 2023 21:04:26 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3921610E1C8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679691864; x=1711227864;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fY1M7EauoYSlHXxSUmcfHZa0SGQW1Azf6ol8FYByToc=;
 b=GiWEzmF/+OgWw9PliQ8+QnuS7xTb1b676dnZT0fxUfllg++YUUitmulY
 DcFVwIIC/dROz461GIIkUb1km8hCyDDL28yZL0MDTKCNk272rGFwgiTnx
 oGiEZEU0ME7xgywtmtoAp7QBYaToCAdz3QW/eURK59GC3zrPCiUvFr+RV
 /6z3QXF+/PEauzxqBr3TdzsEDKG3i7eqJL0Q/Udc37MMJ5sKc7xvo1rzb
 31dGKk0elC++6SapGmL1CTk2hw1Nlp92yYljvNWaFk/WLN7EVU8qotLv4
 /HlXUS9TtdH1HZoBcVVBc0/ie8r/tw/I1NDtWxt7LbrGED6mGip7z8ENn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341456102"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="341456102"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="752022830"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="752022830"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Mar 2023 14:04:09 -0700
Message-Id: <20230324210415.2434992-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] PAT fixes
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The page attribute table code had a few issues that needed to be
corrected:

 - PAT registers are MCR on some platforms (or even a mix of unicast and
   MCR on MTL).  We need to ensure that we're using the appropriate kind
   of programming for each platform/GT.

 - MTL extends the number of entries in the PAT table, but there's a
   jump in the register offsets in the middle; although we don't program
   any of the entries in the top half of the table [yet], we should
   update the register definition macros to accomodate this in case we
   do need to start programming those entries in the future.

 - MTL's PAT tables were set incorrectly.  1W coherency should only be
   used on certain entries.

Some general cleanup and refactoring is also provided in this series to
keep the code clean and easier to understand.

Note that this series only addresses the programming of the PAT_INDEX
registers, i.e., how we tell the hardware the behavior that should be
associated with PAT index.  Selecting and encoding an appropriate PAT
index into the PTEs is not handled by this series (and still needs
general updates for the Xe driver).


Matt Roper (6):
  drm/xe/pat: Move PAT setup to a dedicated file
  drm/xe/pat: Use table-based programming of PAT settings
  drm/xe/pat: Handle unicast vs MCR PAT registers
  drm/xe/pat: Clean up PAT register definitions
  drm/xe/mtl: Fix PAT table coherency settings
  drm/xe/mtl: Handle PAT_INDEX offset jump

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 -
 drivers/gpu/drm/xe/xe_gt.c           | 82 +----------------------
 drivers/gpu/drm/xe/xe_pat.c          | 98 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h          | 13 ++++
 5 files changed, 115 insertions(+), 80 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pat.c
 create mode 100644 drivers/gpu/drm/xe/xe_pat.h

-- 
2.39.2

