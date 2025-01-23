Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B90C0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 05:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C2410E344;
	Thu, 23 Jan 2025 05:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1mw5E+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD2010E333
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 05:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737609098; x=1769145098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wbDAz9AIKUR34WFpEAd5eovYb/jZU3T5+jbW0T07nqg=;
 b=B1mw5E+xUoZkdXJ5cEuQRAMKGmQj7vDr49kEp7sGkhWInPv3gdJzA0BA
 tXWuxoZdY9NnL0LNoYLUN4iGkrhTOa82WUTuSratRSXSnjiC5Z2gg5vda
 Aeny7Gn9IQl0lV5RS8HoCia2uCbmD4gfbW1mpjyF9a89dWLKI9+KdqFJ+
 buHA76Zl6mHNkiPerO9qVSb7q4ErGKGXeZmgstx1d069KfO9nlFXS9mmS
 GuhvilxY9ohrB4glPTi8dfRJgLM2HMjocnfXiwfhMdOkNGhSxVIIjcBVT
 3xSpZz3S0+i6IEmIOyCsTtJYajstNVDFpiP5f7JEdzG5S5MfW+T0au5DB g==;
X-CSE-ConnectionGUID: fHSFWK2GSSCwX75WY3XP7Q==
X-CSE-MsgGUID: BbY1rqwnR3OCmr2XV9iazg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37353640"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37353640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 21:11:38 -0800
X-CSE-ConnectionGUID: KTrOGS24TgWu0FvVogineA==
X-CSE-MsgGUID: OoEaks+QQIysAda9OC0S3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107459874"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 21:11:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/2] Fix devcoredump and guc log dump
Date: Wed, 22 Jan 2025 21:11:10 -0800
Message-ID: <20250123051112.1938193-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Properly fix the devcoredump issue in a way that is compabitle with
the file format of one key per line. There's no change to mesa needed.

This was tested with mesa's aubinator_error_decode using this pending
MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33177.
That was needed to be able to fix the bug with kernel adding the exec
queue snapshot to the wrong section. With  that the tool is compatible
with both before and after the kernel change.

Lucas De Marchi (2):
  drm/xe/devcoredump: Move exec queue snapshot to Contexts section
  drm/xe: Fix and re-enable xe_print_blob_ascii85()

 drivers/gpu/drm/xe/xe_devcoredump.c | 36 ++++++++---------------------
 drivers/gpu/drm/xe/xe_devcoredump.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  3 ++-
 drivers/gpu/drm/xe/xe_guc_log.c     |  4 +++-
 4 files changed, 16 insertions(+), 29 deletions(-)

-- 
2.48.0

