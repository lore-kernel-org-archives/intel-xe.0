Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB04CA5FFC
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 21:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6594910E461;
	Tue,  6 Oct 2026 21:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NF/zu5Xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE18D10F40A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 21:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791322172; x=1822858172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uafeglDK4gsHCcXtUHT865OVXE1kS+bWwAdG9oY/Uwg=;
 b=NF/zu5XeUTO8L7WAEGalj8HcVOxcF8vAJaEYaj6yzBdlge+4J3a5WcnI
 Ynznx+hBL310yRcYdc5ocTZZHcSWBDbdCyB1Y4iJEhbxqUOzc4W0uR2nW
 7sFpwt1l6+FpaKjDGmBBeMInYABo9lLDrQwlCE2GLz5pTuaxp7gQL9zxb
 IeG49tpU6yMoi1dkLX3MJS+zAbCmZTIxuENHIlYmbm2xghJuZdniQC6nd
 WFXNXM7W21ZVt6AgOzUgOm8VqFwIKUnQQ2tKtVew1SpZlGMIpJ3HnZcU2
 rlk3t3eDAnLiqsz43b5KCt9eV1YQbdBEWr06AEaTE8lLNkYgSrFavMPGx Q==;
X-CSE-ConnectionGUID: rOgeq0fkRbiG4BatKt3Daw==
X-CSE-MsgGUID: dW2lSvQ2Ts6jKsrIWbrxiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="65929"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="65929"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 14:29:31 -0700
X-CSE-ConnectionGUID: /ptoZabqS9KXdpsjf8DTTg==
X-CSE-MsgGUID: N7kpWYWRQvKgYcp/fE+TLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="306728922"
Received: from fyang16-desk.jf.intel.com ([10.24.81.66])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 14:29:31 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: fixing endless PF range response
Date: Tue,  6 Oct 2026 14:34:47 -0700
Message-ID: <20261006213449.4027749-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

xe4_guc_ack_fault_range() reads vma_info, which is not updated by the
SVM handler. This causes the ack fault to loop through the whole address
space with 1G pages, and that is wrong and the loop takes a long while
to complete.

Fei Yang (1):
  drm/xe: fixing endless PF range response

 drivers/gpu/drm/xe/xe_pagefault.c | 7 ++++++-
 drivers/gpu/drm/xe/xe_pagefault.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0

