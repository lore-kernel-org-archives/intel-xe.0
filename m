Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FAAC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 07:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD25110E049;
	Thu, 12 Jun 2025 07:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAUH40zL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684CD10E049
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749712157; x=1781248157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xkGmfa4CLz9blH9cTjooH2NpBpYPdMii0MiSmpYKPbQ=;
 b=bAUH40zLt3p66pJCMFjbpObqvZ8RyGdjGtwW+sood0jlUxSK0GBlaxx3
 AYbOqt24+cq74fbfgSOOAcgy9KufK+bxCrzG7n617gHVSWuL0XDP0r74l
 pBvgQcejtuZWMUK+Bt+rKCBYp++x7vOHeZiag/Ya6yLfd24+eIJWVr/pU
 Gnysr0Ka7Oyz1It/n/75lBAiPCwzIT8/4D5mUi58hIMVQDU+cbvwrd/jH
 /0Pg05IqW9Lo9T5pBpkGMZqd1SoIIONT6+CMN4vBF3yFh9ZGN3FcXkD0l
 p8V/WOCOjQk0C4xJVWy6JiFDmFa+J0Yo5nvO2GvIQ6o9bfWVm2Dk03WBI A==;
X-CSE-ConnectionGUID: JH28BZkbSMS+0xZgdJ52bQ==
X-CSE-MsgGUID: CXv/T2llSGOjU/oRKQacvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51792680"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51792680"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:09:16 -0700
X-CSE-ConnectionGUID: 1eW3SI+mSvexLrFRZaPgoQ==
X-CSE-MsgGUID: eWzuJPmYTimfxsamZf3Law==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152197765"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:09:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 0/3] drm/xe/bmg: Update some WAs
Date: Thu, 12 Jun 2025 00:08:59 -0700
Message-ID: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250611-wa-14022085890-b4e79a65b8ca
X-Mailer: b4 0.15-dev-7a402
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

v2: Review comments (Rodrigo)
v3: Fix CI errors
v4: Re-order patches, make Wa_14022085890 apply to all GTs,
    drop Wa_22019338487 for now: it needs more work (Lucas)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Vinay Belgaumkar (3):
      drm/xe/guc: Ignore GuC CT errors when wedged
      drm/xe/bmg: Update Wa_16023588340
      drm/xe/bmg: Update Wa_14022085890

 drivers/gpu/drm/xe/xe_gt.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c     | 15 ++++++++++-----
 drivers/gpu/drm/xe/xe_wa_oob.rules |  4 ++++
 3 files changed, 15 insertions(+), 6 deletions(-)

base-commit: 03848f8a962392d602e7f2a6a22f2a7e3efa4a3b
change-id: 20250611-wa-14022085890-b4e79a65b8ca

Lucas De Marchi

