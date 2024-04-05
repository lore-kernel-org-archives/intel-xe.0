Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5957ECD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 13:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCFE113C13;
	Fri,  5 Apr 2024 13:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XK0t7bq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9119910E50D
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712324385; x=1743860385;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ib3u0E73SIqhdypoAFnymV6sgZWYtFcxY2ZLRW6l2V8=;
 b=XK0t7bq2RegyLfj+/ndk35P0PSxRKhXov6owdtv+srqaiULnGYeP0IM5
 zzM81PuuwKSX+l52Oy/P1Ph5W6/gCAV4kbSjo9UM2kMowc0IpYkv26Hfn
 a7l107L2eaauF8cXt74qIV7V5IpRiFl57AT0H3LxaJ+iBsyEhp5xvSZmz
 SkXZ8J6wxrX2zik7ACZNR6s4q0Z+vKUPevy4tCxDoAeqmQwtSPzyLk+gZ
 qkn2wfmgGzV02pQfNbU4NXqL0JTpIOD39tWxRL8V8T89gjjKnXpuAtlHm
 fBynOBIMcaSv7a6QhSHJkfNaHP4HdocTjUm2LR7gnES979be9Cp3sYy0i A==;
X-CSE-ConnectionGUID: q/2cTzGNShG+dkkUMOjIjQ==
X-CSE-MsgGUID: cidVVoA4Sm2H0Ez+4FNmew==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7838162"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7838162"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:44 -0700
X-CSE-ConnectionGUID: Nzs6b20FT4yLVBjeiEh4Kw==
X-CSE-MsgGUID: wWtVE2tVSY+4vGfz55ahDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19239401"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 06:39:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] More VF tweaks
Date: Fri,  5 Apr 2024 15:39:33 +0200
Message-Id: <20240405133936.891-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (3):
  drm/xe/vf: Don't emit access to Global HWSP if VF
  drm/xe/vf: Don't try to program MOCS if VF
  drm/xe/vf: Don't try to read legacy GuC MMIO notification if VF

 drivers/gpu/drm/xe/xe_guc.c      |  3 +++
 drivers/gpu/drm/xe/xe_mocs.c     |  3 +++
 drivers/gpu/drm/xe/xe_ring_ops.c | 11 +++++++----
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.43.0

