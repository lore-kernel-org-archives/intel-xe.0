Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBF4EA7941
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 19:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B523C10E746;
	Wed,  4 Feb 2026 19:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8VuGz7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E58310E746
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 19:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770231997; x=1801767997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YYhBXRoZiDxJvUh3n1eUvlFjBv6oSmS1PClVKfpXQek=;
 b=Z8VuGz7OrSfqiSUKYFx1+X9SBRgiMDQaeDXKz2VTupcyEkAp4/z8Wkc5
 RX0tYSEBidgdYYtDPhERSd8YAve96Xe5jm0YJ8N/0MKQthtKlyyx1kR6V
 s4WuhxzGPOuMx40e4/mds3Bsxsyk7RLkpnsHMViaBN3lcp2av0RwYwRAR
 h92g/prqKz2iIyanlYdQzuffiRfNR8co6YQXTQUWg0xqc2+lzcaHDhXNW
 zs0be5lDm7KcsIGFX4QqiQH6zjxH/GFdjwLdSpg/FxLhbu2sn1gWtVIoh
 AzyV/A+SD5PAc/dUvJ/cabs/49zTsaF9kh22OtBH1ryUii9770TItpVPL Q==;
X-CSE-ConnectionGUID: mqugOW4dRrmBUnNrsJC8GQ==
X-CSE-MsgGUID: fpw3A1+ST2OI6ABbAXpfJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71322180"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71322180"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:06:36 -0800
X-CSE-ConnectionGUID: O+UKBlgGR+e49M5P7mFOXg==
X-CSE-MsgGUID: EfZSsa1zRW2kZkEgztA/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="210249933"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2026 11:06:36 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Add more info to powergate_info debugfs
Date: Wed,  4 Feb 2026 11:03:12 -0800
Message-Id: <20260204190314.2904009-1-vinay.belgaumkar@intel.com>
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

Add GSC status and dump forcewake registers with ref counts for all
domains.

v2: Fix checkpatch issues

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Add GSC to powergate_info
  drm/xe: Add forcewake status to powergate_info

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_force_wake.c   | 46 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h   | 11 +++++++
 drivers/gpu/drm/xe/xe_gt_idle.c      | 25 +++++++++++++++
 4 files changed, 77 insertions(+), 6 deletions(-)

-- 
2.38.1

