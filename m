Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CA9C74A5B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 22:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDD610E4A2;
	Thu, 23 Mar 2023 22:48:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0622410E4A2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 22:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679611684; x=1711147684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/YGz2QIOmvixczvBujZ/Tkn2A4CIVOTfSxgbTMCd2CM=;
 b=QI49Px2JueRLx/8rc4bTUt7BvOjEDO9FWT4lC6PMbGvUrcVykyF4hiAk
 VmkfDkGlglLrLW4Oa1PtgIbmjyxwNk8/8tl82Gux6JZHp9CdRLH8CME/8
 QMfh1+5qbyJqx0hU2aRkB49NMst7K5jrTVwBhqHPQ2fyBAlP8MNiUo3yf
 wuRLvjd7phtLu4DeZ1LXC0KZTrl9qUq07LYMxG4xpFqoQTNfNYdmhFbl7
 9uXQNM+GdHUXc9KrQW0SkrHFKOZKHSlhvlbT+dXWZ2Fm4HScjn0DJtvqI
 6HuTWCW8ZuYNXNxl/pp42xmv2EzrtWfntv3NIzCL0Gtfjd0JiJ1Y/eUbj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402224174"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="402224174"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 15:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682460266"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="682460266"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 15:48:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:46:49 -0700
Message-Id: <20230323224651.1187366-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] HuC support for ADL-S
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Same as https://patchwork.freedesktop.org/series/115526/, but without
the 2nd patch, a few cosmetic changes in the first and my r-b.

I was working on top of these commits since we still need some changes
on the autoselect logic for both HuC and GuC. However there are still
some issues to iron out. There is no reason to keep these 2 commits out.

2nd patch I'm removing as plumbing the require_force_probe to the
xe_device is probably not what we want to do as per my review. And that
part will also need to change for the autoselect logic being done.

Anusha Srivatsa (2):
  drm/xe/huc: Support for loading unversiond HuC
  drm/xe: Load HuC on Alderlake S

 drivers/gpu/drm/xe/xe_uc_fw.c | 54 ++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 20 deletions(-)

-- 
2.39.0

