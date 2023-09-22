Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E83DE7D0D3
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 06:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE29610E06A;
	Fri, 22 Sep 2023 06:44:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EFF10E06A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695365089; x=1726901089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x3uqvWl+KGLgkkoCPWHOLnSkIsErd8bI5FHirCYLAr8=;
 b=LjTIzY1KnGGBviGOqKaa4hAErFn7pNXpt5NAZTftFo614iK5ekk8uyN3
 ye+LQ1tbOV1TF7EKLZFxJ2K0pELPg1PS/tOAEt5D7vAed/LCrBB96XVHe
 MROgkFj5l51UYfNW80DxIeuSQIaDDY/ezLM8c/mmGnS4/M0neztvMvZev
 7Hozi49jA6R2Gpq1YGQvR33R/NXBmd6TV925f8lRMdVHPI/nVOMiQL6To
 RT4USPIb+ydsDPVN0DR7yD918dH/IljKQMeG9/nHUtwKsUhaWsJhwQ0Pc
 56VjUr8LAp78e4uzowWw6/KlHPI2CyJ9qsjAgy5/s+yTswbS4kTML7F82 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="365814844"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="365814844"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 23:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697055392"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697055392"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 23:44:48 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 12:12:45 +0530
Message-Id: <20230922064247.329994-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Remove Stubs in HDCP code
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

This patch series aims to remove stubs from code in HDCP code.
Patches 1 & 2 are just added so no rebase issue is created later
and for buildbility patch 3 is what we actually aim to merge.
Patch 1 brings HDCP code in par with current i915 state (removes stub).
Patch 2 is i915 refactor which has been already floated.
(https://patchwork.freedesktop.org/series/123955/)
Patch 3 adds the definition of intel_hdcp_gsc_check_status in Xe.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (3):
  drm/i915/hdcp: Move checks for gsc health status
  drm/i915/hdcp: Move common message filling function to its own file
  drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 620 +-----------------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |   2 +
 .../drm/i915/display/intel_hdcp_gsc_message.c | 588 +++++++++++++++++
 .../drm/i915/display/intel_hdcp_gsc_message.h |  56 ++
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |   5 +
 7 files changed, 678 insertions(+), 602 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc_message.h

-- 
2.25.1

