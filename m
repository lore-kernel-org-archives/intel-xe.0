Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4528BC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 07:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E295310E467;
	Tue, 30 Apr 2024 07:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScQNRYq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD98810E100
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 07:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714462950; x=1745998950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9K5rDUhqPo/DkLpb1ArSrhB+rTdZp8Sm2cBzyy0YdCI=;
 b=ScQNRYq4Sl0JdY+8d3ky93lQn/JUXMMLzJN+dGxyJEh3DHwSd8MwrSqf
 qqL1c157tCGeUVtjORUCKG+cY6J/nMvnE3GRSBVpe7mtFSRoz2CkJkwS1
 WjTAVcboC4QxcyYCExcyIuQ+OGbpjvpEDaETi9Z6JwOkKGJBGZM3AaRzs
 CVZT9G+4uAwqCPfzOkMuJYTY2wrVNeUZN4Jftr/6Zrkj/6yG0KUu3X/Qf
 5RhGapZZQ+U1xIe3/m2u+zDUkR5EM+INodB5v2E7FS6l86NdjxKHqChgj
 2LdyQB5+A0NemlrWQiJDZoSNMTaKRN/sHjRaH6jjwBpbd6SarYTQpmadB g==;
X-CSE-ConnectionGUID: uZ7bWiwMSraGUWct1iEaQQ==
X-CSE-MsgGUID: 19mplp/kStmdNMBKmeFJmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10003655"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10003655"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 00:42:30 -0700
X-CSE-ConnectionGUID: 3qESSJ9UR9e+3BpWv1htvw==
X-CSE-MsgGUID: amM8/v21TuSoVCFV+EXTCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="63857146"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 30 Apr 2024 00:42:29 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 0/2] Extend wa_14020756599 to xe2lpg/lpm
Date: Tue, 30 Apr 2024 13:26:07 +0530
Message-Id: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

wa_14020756599 applies to xe2_lpg as well as xe2_lpm all
steppings.

V2:
  - Remove engine filter video_decode
  - Fix GRAPHICS/MEDIA/s - Himal

Tejas Upadhyay (2):
  drm/xe/xe2lpg: Add permanent wa_14020756599
  drm/xe/xe2lpm: Add permanent wa_14020756599

 drivers/gpu/drm/xe/xe_wa.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.25.1

