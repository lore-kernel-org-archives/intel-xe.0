Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F520CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 06:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A21F10E413;
	Thu, 12 Oct 2023 06:25:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7921D10E413
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697091953; x=1728627953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iRNfKl+l3Fah4zyjeh828rmLabAJb+ikYBN8kwfE2lc=;
 b=epPTPezIO+585lt+S86ONwev8BCMEH5yHSqNoT2HDKYyIWo5OgjpMLJK
 3nBnVLEamazBeDjvMMUDacjLqoThEVbTsjsy/EbjAMaPR56aNgZRWOQre
 vZ6kGe2+EpsYVReZG2oNXoVTaaz3hm2LbyC1V5GpXsW+yAPnaaDN5mbQP
 lfNKgdvPxd51bsPdwUq90Zpouxy5FBhZdvXDSzj8n1j9lmPOZnriQAidj
 k36v8BSpKHE1fq8WqCAM2kL+Jc7j8wGwKyf1+zscavKeFIy3reiMZHfuR
 c05/vZCT7wI93tHL8ckrd/IAoUvy485M1Ns/Y6VkHKTJG5IHciomht9/P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387681209"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="387681209"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 23:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="754126930"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="754126930"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 23:25:49 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 12:02:07 +0530
Message-Id: <20231012063209.56824-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Remove GuC Reset in D3Hot path
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

During Runtime suspend/resume, GuC is reloaded for both
D3hot/D3Cold -> D0 transistions. It is not necessary for GuC to be
loaded everytime for D3hot->D0, only enable/disable ctb communication.

Rev2: Fix review comments

Riana Tauro (2):
  drm/xe: Add helper functions to toggle CT communication
  drm/xe: Toggle GuC CT communication for D3Hot Transition

 drivers/gpu/drm/xe/xe_gt.c     | 62 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  2 ++
 drivers/gpu/drm/xe/xe_guc.c    | 36 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc.h    |  3 +-
 drivers/gpu/drm/xe/xe_guc_ct.c | 15 ++++++--
 drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c     |  4 +--
 drivers/gpu/drm/xe/xe_uc.c     | 23 ++++++++++++-
 drivers/gpu/drm/xe/xe_uc.h     |  2 +-
 9 files changed, 137 insertions(+), 11 deletions(-)

-- 
2.40.0

