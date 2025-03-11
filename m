Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04369C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD50510E056;
	Tue, 11 Mar 2025 18:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmL56t/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7937A10E056
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741718124; x=1773254124;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HzRE8d6n7uDFQbpOfrf9feIW18mweQIgQtBt5ylX5fM=;
 b=RmL56t/MzkvI8N1CepXuDzqK55tSUDcXx9KkOowDaT3LGqmlU3wmqeUT
 XNmSlNkw092qKP8NQ1DUts9YX8ljTry6jJr8FBmNx67Bc7kIOPgT76fWZ
 ZeAIWM3xG4GW+dbBIMIwNPnjOKFppDwluCaew8/CJSP++FwKG+oo2piF/
 hlvi7LpeqPzosOzNwDT26HeZ0iKBW3GwjLI5llewDslQWDLiK28XKL8kx
 b4m/Q+aa//leLcwF8qupzJKodRBfeU55Uv0wy2hsBrBTnpTbxOvY1eYb0
 D4gJFVbY0/sWaZxCVhLqsHRqOFQqYdFhsuezWK1gURfu8daHJe/O8uxHs Q==;
X-CSE-ConnectionGUID: uxZTxN13R6+U1JjCUzuoKg==
X-CSE-MsgGUID: zDK5NTj6T6yFRzkpil+/cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42983301"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42983301"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:35:24 -0700
X-CSE-ConnectionGUID: G9Px1oqbSZaxEhl4NBp74g==
X-CSE-MsgGUID: rSTLf9ggTQSqJ9onzemeAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="121301495"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:35:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Fix survivability
Date: Tue, 11 Mar 2025 11:34:54 -0700
Message-ID: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250310-fix-survivability-703246c0c480
X-Mailer: b4 0.15-dev-c25d1
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

It turns out commit d40f275d96e8 ("drm/xe: Move survivability entirely
to xe_pci") did a bad job moving things to xe_pci. The fix provided by
Riana in 20250306055407.511405-1-riana.tauro@intel.com fixes it
partially, but injecting a failure in xe_pcode_probe_early still causes
the kernel to give warnings/errors.

Correct the course and better split what is done in xe_pci vs xe_device.
This time, also add a patch to test we can handle errors in
xe_pcode_probe_early().

Entering survivability mode was tested with an additional one line to
change the return of xe_survivability_mode_capable(). If we want to
inject error, we'd need to change it's return type, but there's also
another patch series to force it via configs, so this doesn't seem very
important right now.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Cover more error injections in the second patch
- Link to v1: https://lore.kernel.org/r/20250310-fix-survivability-v1-0-7af31432bbd0@intel.com

---
Lucas De Marchi (2):
      drm/xe: Move survivability back to xe
      drm/xe: Allow to inject error in early probe

 drivers/gpu/drm/xe/xe_device.c             | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_mmio.c               |  1 +
 drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
 drivers/gpu/drm/xe/xe_pcode.c              |  2 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 14 +++++++++-----
 5 files changed, 33 insertions(+), 15 deletions(-)
---
base-commit: f8df428b3850ed87a1e2f3b12b6025328d8a6373
change-id: 20250310-fix-survivability-703246c0c480

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

