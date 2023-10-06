Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE27FE81DE8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 11:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940C210E4DA;
	Fri,  6 Oct 2023 11:49:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1D10E0D2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696592987; x=1728128987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PMFkNnkLgabnlz6to6rCJG3Aj4bGmiesYb3u/egyxtw=;
 b=IKlxX1i1xC6ToCzl1v5oew6PouAy9pLBhYXdLJ2+ITshBWFl9m5EvSD0
 Gro6ZTrEpnANGV9yQrflbjKd9SjFM9Wa+KYPeXEoQAJmOU/gZ9JM6INol
 tCDY6n8BtvrwH4edv0JY9zJjkEf6PoXppo8d7AsQ73u9BekBMTISnB0nN
 grC8bTy5asoJkUdw4+zQ+3Y//ZBXlWajAFGCl1nx1wEGwYqr3PNE/B95v
 5xn58eFSFK+qP10UkejdUaTvrn51Nl2kPDmqhFJ78ZPOZ5XsYGN5vHKz0
 wQIioiNWOwl+amTyg9UB/62VUs2hquHV4vPE0vdiLBssonIZTqOUmT7nx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414731365"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="414731365"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 04:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="1083423629"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="1083423629"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2023 04:49:42 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 17:26:42 +0530
Message-ID: <20231006115645.2402795-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [v2 0/3] drm/xe: Cleanup for addressing vga decode
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
Cc: jani.nikula@intel.com, arun.r.murthy@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series implements exclusive version of vga decode for i915
and xe. It reverts the FIXME with #ifdefs.

Currently the xe verison is a place holder, will be addressed
once the i915 display changes are re-worked in upstream.

v2: Addressed Arun's review comments

Uma Shankar (3):
  Revert "FIXME: drm/i915/vga: disable vga set decode for xe"
  drm/i915/display: Created exclusive version of vga decode setup
  drm/xe: Create a dummy version for vga decode

 drivers/gpu/drm/i915/display/intel_vga.c     | 22 +-------------------
 drivers/gpu/drm/i915/soc/intel_gmch.c        | 14 +++++++++++++
 drivers/gpu/drm/i915/soc/intel_gmch.h        |  2 ++
 drivers/gpu/drm/xe/Makefile                  |  1 +
 drivers/gpu/drm/xe/display/xe_display_misc.c | 14 +++++++++++++
 5 files changed, 32 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_misc.c

-- 
2.42.0

