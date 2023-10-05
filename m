Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF02EE9370C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 13:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8834210E408;
	Thu,  5 Oct 2023 13:52:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BD610E408
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696513936; x=1728049936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QP1o2sc4/UWy3X01FDxSCB7EmYixTKyfcA48cWApbPE=;
 b=bgq3Pjv3PuIKKl7Kvupi/JGQrpvgfDJUdd9wbHjUSlgl64IIrLPTUJvM
 tcMfoaSJbaM7j/wzM5hDRFHismUzpMC7EdgGSrCPArNa1r2xEHrRGLFFj
 almfT+U7tgaaC98WaoZT629l+9QlMcTfhDakCA1pSDKdX3q7CTmymWdW/
 pPB6X7IEIV4zesV14G1evjiqO2jIA9zVC/E8TswW0hK2XcnKfsvGlyKLx
 1T00qibqkwuH0RJ42sjdSn4aT8Sg6EUX1/L5D+d2wpTEoQGEOleeIp2jS
 st2Rdx0FwvnIntgDzHUK206hXhjOubZRNfgtCyZR4KI0FBnYvBHMcOIqb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="373857265"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="373857265"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 06:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925593709"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="925593709"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga005.jf.intel.com with ESMTP; 05 Oct 2023 06:52:14 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 19:29:14 +0530
Message-ID: <20231005135918.2345364-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Cleanup for addressing vga decode
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

Uma Shankar (3):
  Revert "FIXME: drm/i915/vga: disable vga set decode for xe"
  drm/i915/display: Created exclusive version of vga decode setup
  drm/xe: Create a dummy version for vga decode

 drivers/gpu/drm/i915/display/intel_vga.c     | 22 +-------------------
 drivers/gpu/drm/i915/soc/intel_gmch.c        | 14 +++++++++++++
 drivers/gpu/drm/i915/soc/intel_gmch.h        |  2 ++
 drivers/gpu/drm/xe/Makefile                  |  1 +
 drivers/gpu/drm/xe/display/xe_display_misc.c | 13 ++++++++++++
 5 files changed, 31 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_misc.c

-- 
2.42.0

