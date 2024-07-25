Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DCAC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F4910E8D4;
	Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljhv4UJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D48A10E8D2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721945404; x=1753481404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tzaet8VOH2t0Yeoq1+Oq7sUrots6CsIZZOyaOlNt+u0=;
 b=ljhv4UJTMz+vuH18TJLogP4zTGx5kUjPR5NflgDf3iLFxSDXeC3hQQiv
 42eWLpmvzMSiJQeZxcXlHMIWR35ak5V6U6YxX3ZYZ+BV235COrxW8SSej
 fuO/70JgZs/s0OyAWLGd0+0Az8GxbT+x6opozyQRbPaGpbEiSglcI8kp1
 nesbxx4JVuMjA3ifm04I+Jq1NA1wpqOqZdbCaCKPJHLI9iY5ykJKi8NSe
 VkJRZ2xZBXSH+GlhqpaETpObz+3BmihitG78Zh2FhwDOYCM5+l0vSWaaL
 6DovuBFbBzFV6E7fpRw9c/UCStWz+kEUuVA/SxlsEQpE/E2Ah87HLazuB Q==;
X-CSE-ConnectionGUID: 1V2KVo1oQbmhx+xEqqVN7A==
X-CSE-MsgGUID: 8bTp00+eRG20xDXY1oiwFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19853165"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19853165"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:04 -0700
X-CSE-ConnectionGUID: AqUpHTXgQAGS9iNQcb4FfA==
X-CSE-MsgGUID: alFh+tr+RKm8HyblXfo+Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="57346265"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: gustavo@freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] Fix rtp when processing OOB workarounds
Date: Thu, 25 Jul 2024 15:09:51 -0700
Message-ID: <20240725220956.737987-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

First patch is a quick fix for processing rtp entries that is used by
the OOB WAs, i.e. WAs without an action associated. Thanks Gustavo for
spotting the issue while browsing the code.

Second patch refactor it a little so it's more obvious what it's doing.
Last patch enabling kunit test to check the active entries. This still
doesn't cover what caused this bug since it's only using
xe_rtp_process_to_sr(), not xe_rtp_process(). We should either join both
into a single interface or add more tests later.

Lucas De Marchi (5):
  drm/xe/rtp: Fix off-by-one when processing rules
  drm/xe/rtp: Simplify marking active workarounds
  drm/xe/kunit: Test WAs for BMG
  drm/xe/kunit: Rename count to sr_entries
  drm/xe/kunit: Test active rtp entries

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 53 ++++++++++++++++++--------
 drivers/gpu/drm/xe/tests/xe_wa_test.c  |  1 +
 drivers/gpu/drm/xe/xe_rtp.c            | 14 +++----
 3 files changed, 43 insertions(+), 25 deletions(-)

-- 
2.43.0

