Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E072CAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 21:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D4110E903;
	Thu, 18 Sep 2025 21:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q65qla/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B5D10E903
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 21:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758230007; x=1789766007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ld6QxWCnxJiypaVPE0odcjSow+s09yAvm35y0WrR6ug=;
 b=Q65qla/SBR0EO3usRBa64fqVJpRREPnX6CIsSmTWKks+6rPL8COFpGUR
 iDmFSFGKMzMxCpm28B5P6JPqOyGy86EAhkhJUYmRYl6eh1CLBCcNxF5GD
 1j/sf1BaRtd1ECMXMK2y1tKajkv5Ec0Wevz80/ciMFWI6U/DyjH1yOtbm
 femWGI6PIJvlpK6aayqVJMA92is/uOyRzjIj0gs8JTgWVz7FAoKoGVe/a
 EPvDXRNSh3sJd8pnl5kb28gXwIkaDOoDrsxX9XveQAKGnWYp/09Q54gd7
 EIjUhWlbTCA1PrIf6qkWBgE1/BTj39nTRAd6UYH0HjyVA2bkEnRuz2QKI g==;
X-CSE-ConnectionGUID: fxraderAR3+qNgQZg6Qdfg==
X-CSE-MsgGUID: S2EXiUjRRpSM8gGGJnaV6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60506098"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="60506098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:13:27 -0700
X-CSE-ConnectionGUID: rMX8AGuERNmhqEefxLuPxA==
X-CSE-MsgGUID: m53czwJURPy79/gpor9ACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="212809517"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:13:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 0/2] Allow configfs to disable specific GT type(s)
Date: Thu, 18 Sep 2025 14:13:17 -0700
Message-ID: <20250918211319.603324-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
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

During various debug or hardware bringup activities, it is often useful
to completely disable one of the GTs to reduce the scope of the debug.
Add a configfs attribute to make this easy to do in a standard manner,
similar to the existing attribute we have to limit engines.

Note that in practice it only makes sense to disable the media GT at the
moment.  In the future, with a bit of additional driver refactoring, it
should theoretically be possible to also disable the primary GT on igpu
platforms, resulting in a media-only or a no-GT (display-only) config.
But for now, the driver will refuse to probe the device if primary GT
disabling is attempted.  Also note that the requirement to keep the
primary GT enabled will likely always be present for dgpu platforms
since the driver relies on the BCS engines (part of the primary GT) for
various vram clear+copy operations.


Matt Roper (2):
  drm/xe/huc: Adjust HuC check on primary GT
  drm/xe/configfs: Add attribute to disable GT types

 drivers/gpu/drm/xe/xe_configfs.c | 119 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |   2 +
 drivers/gpu/drm/xe/xe_huc.c      |  10 ++-
 drivers/gpu/drm/xe/xe_pci.c      |  18 +++++
 4 files changed, 146 insertions(+), 3 deletions(-)

-- 
2.51.0

