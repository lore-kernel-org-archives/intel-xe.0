Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19E6C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594A111A164;
	Thu, 25 Apr 2024 05:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwLECo00";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B7211A164
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 05:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714024493; x=1745560493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nk8kYZXGlIqAdQr6PA0hW9MiHdx2qNeO5yqrKKUign8=;
 b=WwLECo00AQ3TgpQ7Hz7K4E4f2iKtTltfewuQxpFPAOnNjv2Z6YUX99fa
 G7149T4bwsqekIhvu4TNfs/RJSQQLge3GaQaMftxC/I0EXWDiwJuP5Jk6
 /eLVOhiL5P7vbZpG/Qgdzmwg2LbsTgp5OI1TCgtCvknfBEdrBES9zz6dJ
 DXBJzqr2/gI8Xq6FzK4mrMy9eCV8BUNQbdZt1VnZlbjnS9dIov4qNawPF
 Y4pPcuL92VvVjKYpy4hpzvZo82BFZ8f4Wif8o0cT/eiOb/Zf4faIe3CkK
 2rFT/irhfUHFJg4ANN2Q5CivBz3Beh1VMFDnR1JL5Qe6P8pivntZ1Xkuk A==;
X-CSE-ConnectionGUID: cgK2qsIcTZaWKU3fRV/1ZA==
X-CSE-MsgGUID: O5bXxjTUTXi56usQZc9bsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9554283"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9554283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
X-CSE-ConnectionGUID: sGVYKzGvQyW3Rn3e64sZQA==
X-CSE-MsgGUID: +qlCMHCsQtCh/diQ1Dy73w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="55894770"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 22:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/5] xe_guc_submit style cleanups
Date: Wed, 24 Apr 2024 22:55:17 -0700
Message-Id: <20240425055522.1919005-1-matthew.brost@intel.com>
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

Posted this a while ago, reposting to see if reviews can get traction.

Matt

Matthew Brost (5):
  drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
  drm/xe: s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
  drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
  drm/xe: Fix alignment in GuC exec queue state defines
  drm/xe: Replace engine references with exec queue in xe_guc_submit.c

 drivers/gpu/drm/xe/xe_guc_submit.c | 46 +++++++++++++++---------------
 1 file changed, 23 insertions(+), 23 deletions(-)

-- 
2.34.1

