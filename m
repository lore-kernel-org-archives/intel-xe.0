Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8347AEE49A3
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 05:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E29F10E224;
	Wed, 23 Aug 2023 05:04:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D6510E224
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 05:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692767075; x=1724303075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QAw7zjSjMu9gpqYH9CsruRNO28E/QW+Ec8sfqvL/ezM=;
 b=GZ8OAJkhkvbZ0Ar7eigB5TDSWlXZqbS2tdPdBCRfIMluAoHPrcJ3veIW
 OiNnlvOICMab5tN3z5zhsECiLy6NtGtln23gPHJyQvT0XDOXqN6Ds3W4i
 p4OnLtXxTAK5OjA9fPiqJu1rlxD5i4HBPHSGPq82vO3oeg5CiAQvEhbGj
 FHZDxpeVGN2+fPh5yOxzvm3iPIPD5IXeAQ5nThB4GUQl/Q2iT/BNJZdJe
 ojOhAg1X/1xhLGO1tnf3983hamfguNXdCQ8CY55XxEp/VoMe4Wu/AUJSo
 ic4AizJ0bQfLAnvWiyZ2JnORPAHv4yX/fUREKrCl1A4DKrFfdZLtgC50+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372956852"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="372956852"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983130427"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="983130427"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:04:33 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 10:39:53 +0530
Message-Id: <20230823050955.1226024-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Remove GuC Reset in D3Hot path
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

During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
transistions. It is not necessary for GuC to reset for D0 -> D3hot,
only enable/disable ctb communication.

Riana Tauro (2):
  drm/xe: Disable ctb communication
  drm/xe: Disable GuC CT communication for D3Hot Transition

 drivers/gpu/drm/xe/xe_gt.c     | 56 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  2 ++
 drivers/gpu/drm/xe/xe_guc.c    | 15 +++++++++
 drivers/gpu/drm/xe/xe_guc.h    |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++-
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 +-
 drivers/gpu/drm/xe/xe_pm.c     | 10 ++++--
 drivers/gpu/drm/xe/xe_uc.c     | 18 +++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 112 insertions(+), 5 deletions(-)

-- 
2.40.0

