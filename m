Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E0FC2BA1B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 05:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555A310E10B;
	Tue, 11 Mar 2025 05:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwabC3Ym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4291810E0C3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 05:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741671333; x=1773207333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MdDD/Mh5nQkmketaB1kwImJkgQ7I+SpbDHTMhJHKRms=;
 b=bwabC3Ym1ZzVRnt2J+XQer+hXceWI+CXYlh5ylDRjxzDSFLBbpO5aE/G
 eI20NaX+K13snFuvd3gEiOi8oAP+uuVU1+1MWmGyAmcJPxiKN1Wi+Brx1
 YJuk8Xe5n1tCeVcHg5UAowptE5nYQTNmKt2G3TPnRQffHwNekjThxEwjy
 54NoXyNOttDoM6pl0GmaPeCjHnVv8U0ehX1Jdn7HEH9Wm5MWI6bJjUuP8
 3CoYLjZFl7sGrWfvaYVOsT1ZMTQU2m3YRygHTqw4lHuEZILczLhs+0jXP
 0fhEM8Cs4Gtb7xl8L766hxWuyZg+Y9OSfucYNR1Jea92fpV7TXMe10HlC A==;
X-CSE-ConnectionGUID: 1jZ5tZA6QDCmgOmHknLFrw==
X-CSE-MsgGUID: 0u2Yzwj0Ru+i3vJWFC6PRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41938542"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="41938542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:35:32 -0700
X-CSE-ConnectionGUID: p98NUHmLTSaTtXe3bJUk9g==
X-CSE-MsgGUID: E3NlfTAIS0iq8w4jeOt3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120721004"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:35:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 0/2] drm/xe: Fix survivability
Date: Mon, 10 Mar 2025 22:35:15 -0700
Message-ID: <20250310-fix-survivability-v1-0-7af31432bbd0@intel.com>
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
---
Lucas De Marchi (2):
      drm/xe: Move survivability back to xe
      drm/xe: Allow to inject error in xe_pcode_probe_early()

 drivers/gpu/drm/xe/xe_device.c             | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
 drivers/gpu/drm/xe/xe_pcode.c              |  2 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 14 +++++++++-----
 4 files changed, 31 insertions(+), 15 deletions(-)
---
base-commit: 003c44ec0b7d86569bd13d4a810ee24176c3d034
change-id: 20250310-fix-survivability-703246c0c480

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

