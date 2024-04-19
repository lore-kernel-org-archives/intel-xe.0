Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B79C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 20:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982C4112016;
	Fri, 19 Apr 2024 20:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isSoEcV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0661F112096
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 20:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713557721; x=1745093721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MgZiGZC5PoPu1d+v0IWlHXA3dfY3CzXNWHlNbymzUGo=;
 b=isSoEcV2IXaRKAE2aSaE/sChoAaT26Ozzyo0arjbl8xJ1w43rzaEFpn3
 Rwl7XP31cFXjftuDf6K22z8vULhvQOPNe/e1PJB9oRmv3llWZJ2vbr2jK
 ewnoeLkU4y0EFQ3CmULzxHf1ktcZWfdFbJO2HqpqK2FcVDqMcmc8hWXyF
 T2dnhn++GZHqXTzjIPtr4Ewctr4t26clp94UPYQydWTUOxBvSUzU4JsNA
 bkf/EluSzGsjAGri1EmtescEEiPLx7UHqzHa44BhbMoh36SiYcXkYDGfk
 ajd8umyFPxHJFFuubiYwhh7LZjsYnbWv6UGKuen/XsWwOpHfgjXj6nWhw w==;
X-CSE-ConnectionGUID: dY4onVjJQy+z6DMjEvIuLw==
X-CSE-MsgGUID: TU/P4SJnQH2EzgyRYf/oLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20599157"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20599157"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 13:15:21 -0700
X-CSE-ConnectionGUID: /7RYKNeyTGO5nAD5ls19dg==
X-CSE-MsgGUID: 0v8FPt/hTla7QtCafwMchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23940448"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 19 Apr 2024 13:15:20 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 0/2] Apply LNL workaround
Date: Fri, 19 Apr 2024 13:13:42 -0700
Message-Id: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Add another LNL workaround. Extend it to BMG as well.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe/lnl: Apply Wa_22019338487
  drm/xe/bmg: Apply Wa_22019338487 for BMG

 drivers/gpu/drm/xe/xe_device.c |  6 +++++
 drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c | 44 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
 4 files changed, 59 insertions(+), 2 deletions(-)

-- 
2.38.1

