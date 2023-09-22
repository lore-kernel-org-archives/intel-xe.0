Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E177CD4F2B
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 08:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC7D10E03E;
	Fri, 22 Sep 2023 08:31:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB4B10E03E
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695371465; x=1726907465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MEMuIE3mdQfGMnkhKdSbPbxdcm0ZTIvgoU0znj3iZEI=;
 b=BxqjISOnRuY9kC7tnlcN8O0A5qzDXLg+6gMJGz76udeohg+jyPkqnpqW
 fZxbMNzN32YAOtwpNyaHwZuyc2R5jytqqVFT3moy9zH57QlGNut7oC7q/
 yVrm4Ha3KRITFYXudZfEDp3KheWfjapfbihVIuLGTOwgO0JQ7AwxK0Zua
 7seaS2KxcXPY8EfjhHsRl5hYH92jsp1vjSZVU41JbIfwB+e6k01nfSTUq
 r4/JtwXaM81BqvdJPK+kOUe/QFyo6pCek2uK67R18C+OWvDGVfldBPEvo
 VvZYbcNRuHCKPvc6FbhGM0qwq1qDhz8oY3jm5raXxB8WXOTKbvBqhds1x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="371098039"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="371098039"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 01:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817698724"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="817698724"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 01:31:03 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 13:59:06 +0530
Message-Id: <20230922082909.334085-1-suraj.kandpal@intel.com>
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
  drm/i915/hdcp: Remove i915 check stubs
  drm/i915/hdcp: Move checks for gsc health status
  drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe

 drivers/gpu/drm/i915/display/intel_hdcp.c     | 13 +------------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  5 +++++
 4 files changed, 21 insertions(+), 12 deletions(-)

-- 
2.25.1

