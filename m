Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525CEE743E6
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 04:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E5E10E0D9;
	Fri, 29 Sep 2023 04:44:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0153910E0D9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 04:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695962654; x=1727498654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xVGh1elJduAetKX5lt7XlZ0b+5q/ETJwWAiPbfi3SZk=;
 b=a4ote2AjlDqs+CrYEp9q8cFBofqngZpKkGRHX0eetcFCS5ecjRDhe7zs
 irTTMAysUPZG6Phg6dDSQ0CyPwfc5Co6mCAk7LfiOGgu5LS5hfpQ6C6RZ
 snnaZgcG65fr+4XgPW0EUNaALuVmT1K+JO5Fr2NmY7aI3SuesrzjlMDRi
 lkV6JgcaDMZ5Cq2Y6N+tloDiCQJ8ga1z1f42HQ5yaA+glT1QuVrpjrJg8
 NLjy7WePZ0JoszYjvzyCjSdnX0SF83DnubNyAxteInrKlW2pOPpSNu9zP
 JQ25/Ep012D4buhUD60/RJvepCsR9SCGlswX6sBFemYXwkZYMXYUVk7kP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="361608388"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="361608388"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923503045"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="923503045"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 21:44:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 21:43:47 -0700
Message-Id: <20230929044351.3145468-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] xe2: mocs and blitter commands
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adapt the blitter commands that gained support for specifying the
dst/src mocs in xe2.

Haridhar Kalvala (4):
  drm/xe: Adjust mocs field mask definitions
  drm/xe: Rename MEM_SET instruction
  drm/xe/xe2: Set tile y bits in XY_FAST_COPY_BLT
  drm/xe/xe2: Update MOCS fields in blitter instructions

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 16 +++++---
 drivers/gpu/drm/xe/xe_migrate.c           | 46 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_mocs.h              | 12 ------
 3 files changed, 44 insertions(+), 30 deletions(-)

-- 
2.40.1

