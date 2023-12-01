Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7279AC46CA0
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 15:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2469A10E8C4;
	Fri,  1 Dec 2023 15:39:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8F910E096
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701445187; x=1732981187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RyHf9l981EXXH9S2mKGLrDgiOEq4enqpgY52uR/QeGw=;
 b=lPdP8aQW9a8Pp2j6qoqyKSrmCKQB0ImvrkSXb9diju22IqARgxFWBHUi
 X6nSZLIl4H/MS3wAsfWWU4uZ5tk+JwBCYKp1ZCv5Eh7W1UdcJ3r1ArG9R
 GzpRvgsKhcKGEgzHB1+rm51Tf0ybXaLpw5XNc15TKkvSYiN1ppDGFX0Da
 o91R7bdmdEWIbeSTFBlId3FEn1JNJiLlnE1mbK9IXTQ5qzBf9kx6jXnTj
 EchRrbyELujHjjCR7VTn85AAlXJmzuEDHtGIBSteOcbZ+JoGrVoQCquyF
 f/ZuQl4OTv66R557TuGIFi1KosSBS1DW6ptdEVpX5g3DfvJzj5Y/7Aeur g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="533582"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="533582"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="840224124"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="840224124"
Received: from wpastern-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.45.65])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:39:45 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 17:39:19 +0200
Message-Id: <20231201153923.3433110-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] Backport fbdev Xe preparation patches from
 drm-tip
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Revert local fbdev i915 changes and backport same patches from drm-tip.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Jouni Högander (4):
  Revert "drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev"
  Revert "drm/i915/display: split i915 specific code from intel_fbdev"
  drm/i915/display: split i915 specific code from intel_fbdev
  drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev

 drivers/gpu/drm/i915/display/intel_fbdev.c    | 6 +++---
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.34.1

