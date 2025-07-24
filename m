Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B55C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 01:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D295D10E7DD;
	Thu, 24 Jul 2025 01:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcLojMCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D02610E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 01:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753319083; x=1784855083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wwtks4hlhPr2eFVakukwGTWkfqQAWj0egYfsZMymGZ0=;
 b=LcLojMCyqP5ugruKPoMyPIh9P9PZ+vgQ2EuitLZDB1CcQWXzkaRW9I5E
 LY4upvYwLQyGDh6HA8e2zUWI+bRjqk3HYNrGMRBqpk63IoDVM1QleKlqx
 EyMYa04xhqNiRRYMQbarkG5gIXaIMLVPP0WCoZXKS+eEW/grUCIXqPTQG
 iEbh7+JAyVF+N9IHP+mcbOMMcMkyx86tfp+b22Mb0kV2WFSsiz4ga6XqK
 no9FAidAKLRXn4DfCyt+jqxzj0PKFnVe6YKYNq4iCbR3IPihYjEC8or7d
 bThuMpsTrvi9skmCCT19NzK7Zn2ANrXgmM6LrNq/gUUsqVQ2kQCy2Yfic w==;
X-CSE-ConnectionGUID: lrdVt1DxT/mvGDc4csXJ9A==
X-CSE-MsgGUID: aLfniA1sSlWIY5vdnTwcWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55766480"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55766480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:42 -0700
X-CSE-ConnectionGUID: iixZTmsrRRmIML1+ma20xw==
X-CSE-MsgGUID: 8Ib4a65sQfioIWSw/FzEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="160106358"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v2 0/7] drm/xe: Add psmi support
Date: Wed, 23 Jul 2025 18:04:21 -0700
Message-ID: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250618-psmi-9f270bf67895
X-Mailer: b4 0.15-dev-858c0
Content-Transfer-Encoding: quoted-printable
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

Add PSMI support to aid debugging. More information about PSMI is in the=0D
second patch.=0D
=0D
Expose the toggle to enable it via configfs, which allows to debug just=0D
one of the possible cards attached.=0D
=0D
The allocation requests, as a runtime debugging configuration stays=0D
in debugfs.=0D
=0D
In order to apply WAs conditionally to using PSMI, a new=0D
RTP match is also added.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Changes in v2:=0D
- configfs=0D
- some refactors as noted on individual patches=0D
- Link to v1: https://lore.kernel.org/r/20250716-psmi-v1-0-674c13d7028e@int=
el.com=0D
---=0D
Badal Nilawar (1):=0D
      drm/xe/psmi: Add Wa_14020001231=0D
=0D
Lucas De Marchi (5):=0D
      drm/xe/psmi: Add GuC flag to enable PSMI=0D
      drm/xe/psmi: Add debugfs interface for PSMI=0D
      drm/xe/rtp: Add match for psmi=0D
      drm/xe/configfs: Simplify kernel doc=0D
      drm/xe/configfs: Allow to enable PSMI=0D
=0D
Vinay Belgaumkar (1):=0D
      drm/xe/psmi: Add Wa_16023683509=0D
=0D
 drivers/gpu/drm/xe/Makefile           |   1 +=0D
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |   1 +=0D
 drivers/gpu/drm/xe/xe_configfs.c      |  74 ++++++--=0D
 drivers/gpu/drm/xe/xe_configfs.h      |   2 +=0D
 drivers/gpu/drm/xe/xe_debugfs.c       |   3 +=0D
 drivers/gpu/drm/xe/xe_device.c        |   5 +=0D
 drivers/gpu/drm/xe/xe_device_types.h  |   8 +=0D
 drivers/gpu/drm/xe/xe_guc.c           |  10 +-=0D
 drivers/gpu/drm/xe/xe_guc_ads.c       |   5 +=0D
 drivers/gpu/drm/xe/xe_guc_fwif.h      |   2 +=0D
 drivers/gpu/drm/xe/xe_psmi.c          | 313 ++++++++++++++++++++++++++++++=
++++=0D
 drivers/gpu/drm/xe/xe_psmi.h          |  14 ++=0D
 drivers/gpu/drm/xe/xe_rtp.c           |   7 +=0D
 drivers/gpu/drm/xe/xe_rtp.h           |   3 +=0D
 drivers/gpu/drm/xe/xe_wa_oob.rules    |   6 +=0D
 15 files changed, 440 insertions(+), 14 deletions(-)=0D
=0D
base-commit: 10ed8e2e5529207fe710c22898b0c09ef7f16b0f=0D
change-id: 20250618-psmi-9f270bf67895=0D
=0D
Lucas De Marchi=0D
=0D
