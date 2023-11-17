Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58378C5ACB3
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 17:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256E810E310;
	Fri, 17 Nov 2023 17:56:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5C710E30F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700243801; x=1731779801;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kjUJjppgiz0/q7XKxv6pvroeAqzvlxZnLTY7nHxgzf4=;
 b=YOVj7iLrvJjHSac5LujTP3pUi7lO0kLUN7EGpks2HL4xBOwoXzug769y
 PqYtVG1QZ9iaWrJC7SDUa6hkduhun9X0uBinNt9cFQCv/NyJFFTV9I0Mc
 hEmhT1Yb09dmNy1xJM7cVFuekOpjIVICWwMu7xPK8MPwk1zqKwBg5CBTg
 w+F8bFrUpQhtFCVRA08LFsSxfj9UWLLW0mH+MGzskGuvtUNw446yNC/le
 6dVFF9dz0+uCSl53x081sX7v7AcubC2zcQPtJf86KO0F2PKHoUnRNYuXV
 SO2LbtPElF69KrHmFgRM/xEEFqCtBqWv7yyo60YndVxgKKGrhK+1twQwR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422434021"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="422434021"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="856403076"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="856403076"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 09:56:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 09:56:22 -0800
Message-Id: <20231117175624.535520-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe: Fix display build with W=1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remaining 2 fixups to finally get xe with CONFIG_DRM_XE_DISPLAY to build
with W=1.

Lucas De Marchi (2):
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Create a dummy version for vga decode

 drivers/gpu/drm/xe/display/intel_fbdev_fb.c  | 2 ++
 drivers/gpu/drm/xe/display/xe_display_misc.c | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.40.1

