Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF9CD2CDF6
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 23:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7048810E275;
	Tue, 22 Oct 2024 23:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEo2/5+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9210E275
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 23:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729639650; x=1761175650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NN1f3KxQQNyFCRzwbCSkL4U1rnUrMg56+iSpMJ6l0ZQ=;
 b=OEo2/5+W9nsRWx39imp4+t72jAhUeA5jT9A9EPI4DZ9RwSgXWa3QBDen
 Rw7Ty6tzs7MsAudSeWG3VKM4irFtprPaVKeYejVolLGIHp63QEAEHRIn4
 b+++d/t6BifoUE2sw24j5daQqKs1DcC6MNcnrWyTH99VtFkWenV/ucojx
 yCPjCA6HQT+DoOhk3DFJOmITPSazw+SI6J+vRxxw1mn0C52JuHoL3Asm4
 9Q27Xvc8l2o2Eg2kmCsUobuWdcy4TcKeRMhGp9kSDLy7WzcN6w1qSb1qg
 tsoZsMXb+Vp/kOANxRilJ4e3yRTMfRouDDDXVZmEu7EKFURQGtGj5RQVI Q==;
X-CSE-ConnectionGUID: 4tAbmdX6RyiCrxVVl5rNCQ==
X-CSE-MsgGUID: YQPMHjYcS2KuTTHSq1Om7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33129162"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="33129162"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 16:27:30 -0700
X-CSE-ConnectionGUID: suUnrbYxRMuYx1Ci+Pz1qA==
X-CSE-MsgGUID: qwWP6R0xTPOOh9gE6yBXSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80434195"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 16:27:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Subject: [PATCH 0/1] Don't short circuit TDR on jobs not started 
Date: Tue, 22 Oct 2024 16:27:55 -0700
Message-Id: <20241022232756.1769013-1-matthew.brost@intel.com>
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

Harmless W/A for now, refernces:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3164

Matthew Brost (1):
  drm/xe: Don't short circuit TDR on jobs not started

 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ----
 1 file changed, 4 deletions(-)

-- 
2.34.1

