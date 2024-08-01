Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B54C52D70
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA2410E12C;
	Thu,  1 Aug 2024 22:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hf0Ho/Ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34CF10E115
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722552169; x=1754088169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TTfqbyRY5vGbiXAkFKH2vklqKwIy+O/WkyL6FvqWLj0=;
 b=Hf0Ho/MamnjwNOcN+WcmsbpHKyzM9qqpgeRGps7PJy1L1V5XplnjTSgA
 QpNvCJiObi2W3Z1fd5R+1Ak73WLSblYNTT8mXPfsFFkwKp6v9gFqqapBg
 +5ODG6jCgil3BLym/8BcAzvKSin0s9soEXD78ksf+jKQ5mugNQS0jDquI
 /egoXD90NLrTFpJlb9c1Gm0iccUpv51xSLgN1iSY2zN+JC8dX9rpb+QWF
 MbFAVU65deJn+fIVgSUGgWSH6AL38Ao5CU3XGvuKjUx8wiP9CzqQUqK9z
 Po1nmxAGFl+B+g8/jYE1pS0ckOgnzEI3wZ7+afwpCt10JA3+Py6aaAeF9 g==;
X-CSE-ConnectionGUID: V7ENwI57TXujwtUCO9cEkA==
X-CSE-MsgGUID: gIN+hg5/S9C3kiHgO7LISQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38008318"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="38008318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:42:48 -0700
X-CSE-ConnectionGUID: QZ4eL8p5STSntGyfuPBcAA==
X-CSE-MsgGUID: 7StYKd7mTMCjvZH3pDfsnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55116240"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:42:48 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 0/4] Release GuC v70.29.2 as minimum for Xe (support LNL,
 BMG)
Date: Thu,  1 Aug 2024 15:42:36 -0700
Message-ID: <20240801224241.3050352-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
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

Update driver check for new minimum version.

Reverted patch to use 'intel-ci/' directory for cleaner merge into tree
under 'topic/xe-for-cu', and to keep PVC as unsupported but testing.

Final patch 'PATCH xe-fo-ci' will only be merged into CI branch.

v2: Update fw_def for all supported platforms.
    Split BMG into separage commit.
v3: Replace revert direct changes end explanation.

Julia Filipchuk (4):
  drm/xe/guc: Drop use of pre-release GuC definitions for LNL and BMG
  drm/xe/guc: Release GuC v70.29.2 for Xe as minimum required version
  drm/xe/guc: Release GuC v70.29.2 for BMG
  drm/xe/guc: Pick for-ci GuC v70.29.2 for PVC

 drivers/gpu/drm/xe/xe_guc.h   |  3 +++
 drivers/gpu/drm/xe/xe_uc_fw.c | 30 ++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_uc_fw.h |  6 ++++++
 3 files changed, 25 insertions(+), 14 deletions(-)

-- 
2.45.2

