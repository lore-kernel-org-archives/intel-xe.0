Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CA5CA0EDB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 18:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5229D10E037;
	Tue, 12 Aug 2025 18:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFCSbuQs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173B310E037
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755023225; x=1786559225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pVymzrqu1aieCMdPHbcZqLL2mdx88dKj/fDNpXmgRcY=;
 b=MFCSbuQshEnA1RkjLLcBsqRErlIodF24Zvk3RPv96rhm0j0R0lCAWg5w
 NRy0k60QU9nOqz85lsuZ1IzNXvqtV4WHqva4WiBaZ70qrpuwiEl45iZdw
 +U3jLycrnSin7/m/P4b8XWo7jAMrJAuU/g0htFqVHykhhmdiU34Wnnqm6
 T+6pGYrZELJRjSEShPmFSinY0/bxRfyEaO4vRgVIm5fgNQrReQZ3Irql6
 DTfm2W6t6u6mEfSDlxqhuRncr//vrvLhrsKTOEoZcUxwDPba8ro+gRFZm
 fu+VqMtL6n64IXDWH1H+hKoUU7ny1ynFIDSpuL/mld3VwYzN0PDg68FM4 w==;
X-CSE-ConnectionGUID: 5wbAGLQVQa21ItL/Gm2h0A==
X-CSE-MsgGUID: j4Juoii6RZixYcaudzQR8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74757081"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="74757081"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 11:27:05 -0700
X-CSE-ConnectionGUID: GhP0tpXFRGqF2H2Av4CvlQ==
X-CSE-MsgGUID: CIrpK43OSNOgC0UCc32l8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="197124868"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 11:27:04 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Date: Tue, 12 Aug 2025 11:28:45 -0700
Message-ID: <20250812182846.1608209-1-fei.yang@intel.com>
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

Quote BSpec, MI_STORE_DATA_IMM "simply initiates the write operation with
command execution proceeding normally. Although the write operation is
guaranteed to complete eventually, there is no mechanism to synchronize
command execution with the completion (or even initiation) of these
operations."
The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT consecutively
to implement user fence. However, according to the BSpec, the data write
operation is not guaranteed to be completed when triggering the interrupt,
that would cause the xe_wait_user_fence_ioctl to wait until the full user
specified timeout is reached before checking the fence value again. Great
performance degradation has been observed in IGT xe_exec_fault_mode test
cases due to this unnecessary wait. The worst case is that if user set the
timeout to MAX_INT32, the wait could end up being a hang until some other
random program triggers a user interrupt to wake it up.
A semaphore wait is added right after the data write to avoid the unexpected
wait.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: serialize store_data and user_interrupt for ufence wait

 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ring_ops.c                 | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.43.0

