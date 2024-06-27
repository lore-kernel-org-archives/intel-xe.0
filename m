Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B208C3064D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 17:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A437A10EA9D;
	Thu, 27 Jun 2024 17:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bn3nXIT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FB710EA9D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719509039; x=1751045039;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4cfQlIUGmSA4BdhaI8SuNlgcwTNYWeIk7o0K1ajEwWc=;
 b=Bn3nXIT+5PAnH5lyDteReY/O9ZBSVW1KsP+pVjYoH503Ctx6quCnWB5j
 iimmeg+WBsBnDYy0jsDrBVAe75kb2qN4PItZ3WRAl0FxKEqfsp8hIq1tw
 ijTM6kfmVGuwpu8Dn5oolEH4jsxZxuAGQN+5hVCIQvLZb/2AauPnPaj3p
 +ridvvMBd8S12EI65M/fCu9W5ZJfYOIoJosGd8HMu45SlY1zHlnFVppT8
 OIuTKJ/+rX+6JiieiZZs9dpijibjMotm9VDSp/4U8cUEF/0qaleQGIaOp
 XY5XcRyZY76af33Ez4LC8pRFBoIpl9U7xjRd/FWvH76PQShoVfdBYo0dt Q==;
X-CSE-ConnectionGUID: kTDAZQf9Q/q4nIgucLnzAg==
X-CSE-MsgGUID: srq3IfHvTaWtStNyBtg/9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27245543"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="27245543"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 10:23:58 -0700
X-CSE-ConnectionGUID: VJ6oJ+rmQrGm2nBPjTn8gw==
X-CSE-MsgGUID: Dhkdmh0rRcOXFOURROW88Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="49373447"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 10:23:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/2] Fixes and cleanup for per client utilization
Date: Fri, 28 Jun 2024 01:23:46 +0800
Message-Id: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
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

From: root <root@xpumcyp04.jf.intel.com>

Reviewed patches posted here for CI run before merging.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  drm/xe: Use a helper to get delta run ticks from the exec queue
  drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP

 drivers/gpu/drm/xe/xe_drm_client.c | 14 +++++++-------
 drivers/gpu/drm/xe/xe_exec_queue.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c  |  5 +++++
 drivers/gpu/drm/xe/xe_hw_engine.h  |  1 +
 5 files changed, 32 insertions(+), 7 deletions(-)

--
2.34.1
