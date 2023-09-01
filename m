Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AC9CA0FE6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 13:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB60D10E1BF;
	Fri,  1 Sep 2023 13:00:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915F210E1BF;
 Fri,  1 Sep 2023 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693573209; x=1725109209;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Gw0JG4YPFiH6MD0xTmJjHqELE5jeUg9HR16WrQBNQk=;
 b=fAtldzNYbt+FxAFCM2v7jbNIcbYfQJ2ekyGga5ZN4CG1/JkZMr3jlDbx
 ImwRSO3V/DQu7rYxH+M9AdqawBWdkVN8n5mgnaKZjRGYsrFIGkbCEkY3E
 ZgF2ZlxyWF92NgmvQ0oSJ/GX2RTxsmor5sAb80LbBp5RSu0maYMdJ9qrt
 nu5QNDlVmZkY2ENZAkZDvoShDqXa5r6gujKUhH7msrPDL46HhAaLcUjT9
 HJbjixV6XXuTTqXM/aT2Z267Qo7Ymgtyq1Xc29gxbHDvbXtTkR1L4oYKr
 N9Z+alEw5pM4iYE56QyJ9cI15w6bhB7/j5H3eeIBXdjxyzeGif5Z/ujhb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442607787"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="442607787"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913681874"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="913681874"
Received: from jeroenke-mobl.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.252.59.110])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:00:05 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 15:59:49 +0300
Message-Id: <20230901125950.76088-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] fbc on any plane
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 ville.syraja@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

FBC can be supported in first three planes in lnl

Matt pointed out that FBC + PSR2 combination require few more condition
checks and also a WA also need to be impleteds. So patch to enabled FBC
in case of PSR2 is removed from this version.  Also per pizel alpha
condition is removed for FBC in LNL.

Vinod Govindapillai (1):
  drm/i915/lnl: possibility to enable FBC on first three planes

 drivers/gpu/drm/i915/display/intel_fbc.c           | 7 ++++++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 5 ++++-
 drivers/gpu/drm/i915/i915_reg.h                    | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.34.1

