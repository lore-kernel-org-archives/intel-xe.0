Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E52FCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 05:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74D310E59D;
	Fri, 13 Oct 2023 05:36:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9E710E59D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 05:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697175410; x=1728711410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1PR41aM3LqCPCumEAEf0cx3L+1J9uxpY8wHa7srI1lo=;
 b=iqL1gC0aEr3DvtOC9/6S+NqIOEY1yugyWE6vFnjG+xvzSTx/L9jN9P3z
 wXfL+IRbG/O1zSfTMU5nHBvFe9eSEmT7pXRjU4RjC8MU3RXS80IoSA927
 QRrIsuOjHTMuEDJwX/RYjq2CUVXYlK8p7y/DXBhXW30Nsh7yCph3RYVDv
 UdiXwaKLjRLynI1UmK98I+Zw8yv9JN9++vQIGX9cn+KcaWMjwf+nYTFjV
 cgQioB9jYyCtBgbuO9Pf5QjusT1JgJM5md+aOYjqs7BGZErmlNm4FuYFN
 n1/hKLTG7OxIM+i3rw+ub/uOUoc29RhLTzIiY+XVd9jVkSr5t9wYnbnCc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451588239"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="451588239"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 22:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704487284"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="704487284"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 22:36:47 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 11:04:53 +0530
Message-Id: <20231013053455.835094-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/3] Remove Stubs in HDCP code
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
Patch 1 is a fixup patch which removes the stub
Patch 2 is i915 refactor which has been already merged and
cherry-picked here.
(https://patchwork.freedesktop.org/series/123955/)
Patch 3 adds the definition of intel_hdcp_gsc_check_status in Xe.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (3):
  Revert "FIXME: drm/i915: xe doesn't have gsc hdcp interface or
    something"
  drm/i915/hdcp: Move checks for gsc health status
  drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe

 drivers/gpu/drm/i915/display/intel_hdcp.c     | 13 +------------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h | 10 ++++------
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      | 11 +++++++++++
 4 files changed, 35 insertions(+), 18 deletions(-)

-- 
2.25.1

