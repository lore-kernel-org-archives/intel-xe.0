Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CF1C35FF1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 13:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D0510E9F9;
	Fri, 14 Mar 2025 13:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dy2lzeQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B8810E9F8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741960497; x=1773496497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wfp8O3Ky5V+dziPcyapkfmp4DMyQuWc9z7G1GjCCXVQ=;
 b=dy2lzeQQgwtZg0fWND4n5g6ktPXf6kpRpmwuRLTpesqZR5m13+TOKw2O
 SGOQRvnYWdVn9Z5jdV/50imF9YKxqjMI6nM1LvE/px5InXKxZu6/QSGAD
 L4lxvZns9SDsgJ/GXxoif+1T4ltge+iqjItGrBrpK+17qyJiMBA9+zIRd
 A9DCcOH9gesXlA9V7tTj0n4HTIz+ceYabFOsGAyCcqBwDmDwql/pJ7NXy
 bYHsnF3kIgR6RmZJIGlHuPR1Pq3N2AYr2lgg6B+3/JvBqzNDLoi0kH6Vx
 jcpLXwPJ0vXvXpHU58N14riXXuI5DRWPVNQfK26IXYNZc0VyNNtnPUYc0 g==;
X-CSE-ConnectionGUID: SxYK6HWITs6P6v6mWxUKzA==
X-CSE-MsgGUID: 5ipaehSqT92dGAPkqPem9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43000751"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43000751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:54:55 -0700
X-CSE-ConnectionGUID: cXX22h79RzadJhpePYMmQg==
X-CSE-MsgGUID: XDwm4rzHRr28r5BuxTAtNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121333187"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:54:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 0/3] drm/xe: Fix survivability
Date: Fri, 14 Mar 2025 06:54:25 -0700
Message-ID: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250310-fix-survivability-703246c0c480
X-Mailer: b4 0.15-dev-c25d1
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

It turns out commit d40f275d96e8 ("drm/xe: Move survivability entirely=0D
to xe_pci") did a bad job moving things to xe_pci. The fix provided by=0D
Riana in 20250306055407.511405-1-riana.tauro@intel.com fixes it=0D
partially, but injecting a failure in xe_pcode_probe_early still causes=0D
the kernel to give warnings/errors.=0D
=0D
Correct the course and better split what is done in xe_pci vs xe_device.=0D
This time, also add a patch to test we can handle errors in=0D
xe_pcode_probe_early().=0D
=0D
Entering survivability mode was tested with an additional one line to=0D
change the return of xe_survivability_mode_capable(). If we want to=0D
inject error, we'd need to change it's return type, but there's also=0D
another patch series to force it via configs, so this doesn't seem very=0D
important right now.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Changes in v5:=0D
- Minor change in 1st patch, no change in behavior=0D
- Link to v4: https://lore.kernel.org/r/20250313-fix-survivability-v4-0-5e9=
0efdede99@intel.com=0D
=0D
Changes in v4:=0D
- Minor change in 1st patch, no change in behavior=0D
- Link to v3: https://lore.kernel.org/r/20250312-fix-survivability-v3-0-546=
20dbcbbd7@intel.com=0D
=0D
Changes in v3:=0D
- Add another fix for heci=0D
- Rename function according to review feedback=0D
- Link to v2: https://lore.kernel.org/r/20250311-fix-survivability-v2-0-729=
ce081155e@intel.com=0D
=0D
Changes in v2:=0D
- Cover more error injections in the second patch=0D
- Link to v1: https://lore.kernel.org/r/20250310-fix-survivability-v1-0-7af=
31432bbd0@intel.com=0D
=0D
---=0D
Lucas De Marchi (3):=0D
      drm/xe: Move survivability back to xe=0D
      drm/xe: Set survivability mode before heci init=0D
      drm/xe: Allow to inject error in early probe=0D
=0D
 drivers/gpu/drm/xe/xe_device.c             | 18 +++++++++++++++--=0D
 drivers/gpu/drm/xe/xe_mmio.c               |  1 +=0D
 drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++--------=0D
 drivers/gpu/drm/xe/xe_pcode.c              |  2 ++=0D
 drivers/gpu/drm/xe/xe_survivability_mode.c | 31 +++++++++++++++++++++-----=
----=0D
 drivers/gpu/drm/xe/xe_survivability_mode.h |  1 -=0D
 6 files changed, 48 insertions(+), 21 deletions(-)=0D
---=0D
base-commit: 7e32e5705a5c8398e606a23eeba751a059a0b970=0D
change-id: 20250310-fix-survivability-703246c0c480=0D
=0D
Best regards,=0D
-- =0D
Lucas De Marchi <lucas.demarchi@intel.com>=0D
=0D
