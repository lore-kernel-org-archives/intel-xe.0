Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6A1D1CA02
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 04:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A0910E00F;
	Tue,  5 Nov 2024 04:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNBt0bwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594CB10E00F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 04:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730781298; x=1762317298;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gBQ+eN7YlE7b1SsAWIPx1sMSRB2PZiSM2wXPkLJ6Huc=;
 b=fNBt0bwytXZ3WKPHawI5OoHFHPZLjM9StzOHmMoty8WVRmmp8kGpfgot
 W8ml0/kgn94WQezIOVXBf6STzsoEkhO0EwQm+PHTNFG1Wh4N6rOr058zd
 9o9h6/zAuXtslCjsz0nB0nLMRt1JkMDfP/WlQ6dUs7IrCULIxodMjbnT8
 aeg9NV31fp/FnIUMDYouOJ4sPu+1MLEFQk0Koa9oLobKm1wKb6ictPCOy
 auiYeZP8KRO5goFgCGpB6kuG3DPvmDheG5j9d0TUay3InVzwkpgnh29FH
 VEEn/9ag9azv5Mra2c0uthHMYcf4m6NEgO3hG3m1svw522BxdsKKEbqyb g==;
X-CSE-ConnectionGUID: n8ASCA4xRWKO1i0lBNpq0Q==
X-CSE-MsgGUID: Q7J9ry+OTcqMXyvv5EQBzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34197691"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34197691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 20:34:57 -0800
X-CSE-ConnectionGUID: 6+gctLehR2+KkNA2rUXlqg==
X-CSE-MsgGUID: 50OsAe7lSfGbEykPFbSajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="121350698"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 20:34:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] A couple exec IOCTL fixes 
Date: Mon,  4 Nov 2024 20:35:22 -0800
Message-Id: <20241105043524.4062774-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Noticed a couple of bug in exec IOCTL while working on something else.

Matt

Matthew Brost (2):
  drm/xe: Fix possible exec queue leak in exec IOCTL
  drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get failure in exec
    IOCTL

 drivers/gpu/drm/xe/xe_exec.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.34.1

