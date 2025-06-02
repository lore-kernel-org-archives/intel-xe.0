Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0706FC54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 07:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A04C10E1A3;
	Mon,  2 Jun 2025 07:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mo/fLH8W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6828C10E1A3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748850920; x=1780386920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rY6dXMkciGOhBOQiCBrjEbExl59CgSHfH4K0Z4sq+zA=;
 b=mo/fLH8Wefsz+Z76zrYYURvq4B2aZlR1twZFGsT4Bpdi8XnghLyML4zc
 eGnw9UTg9emtDqEL3RZYcobpiTcQ6GIYCsesOBwjit0sGoRzaT9ROjl+V
 vrePT0F8bej6uUZgzkNCsjrndKzr0O3Z/ps9A0q67NW2aeenozRJDHJLb
 ym0uKO+yiY/i6xzEtk6tdrMMvCc2asP14D1xeXaMA7XfL+OsX4LmxLBdI
 4V4iMlMuGGL3DKm3gHgQzHCQWuRyeaDY9G5+UxXCzrVgti6vvn7ZwzVVA
 EfXtYR0BIGRPRxVjmqFRIe/3IkbffY9oHK/9tKYaZ4yI63sCzCvTmssEF Q==;
X-CSE-ConnectionGUID: HW6VavFvTEC8HRraHiaexg==
X-CSE-MsgGUID: cE6UXxoARb2uwwcNr/IxHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="68403891"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="68403891"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 00:55:19 -0700
X-CSE-ConnectionGUID: kDEa2oqNTEeAYD6jtPP2sQ==
X-CSE-MsgGUID: xO6VLZcJRPS5oto+wXtiPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; d="scan'208";a="167647549"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 00:55:19 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/3] drm/xe/bmg: Update some WAs
Date: Mon,  2 Jun 2025 00:53:27 -0700
Message-Id: <20250602075330.1728243-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Additional changes related to existing WAs.

v2: Review comments (Rodrigo)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/xe/bmg: Update Wa_14022085890
  drm/xe/bmg: Update Wa_22019338487
  drm/xe/bmg: Update Wa_16023588340

 drivers/gpu/drm/xe/xe_device.c       |  10 ++-
 drivers/gpu/drm/xe/xe_gt.c           |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 129 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
 drivers/gpu/drm/xe/xe_wa_oob.rules   |   1 +
 6 files changed, 142 insertions(+), 4 deletions(-)

-- 
2.38.1

