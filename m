Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D81DCDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F2010E4A5;
	Thu, 12 Oct 2023 10:28:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824FB10E4A7
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106497; x=1728642497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G0hD2+7PYwafsbUBWZTFL23EE7US/SZNk4Dno7l4Ivo=;
 b=NjNp1VkDxWN/q12jX86PI+b4GiJacpdgkeN2q5EVNc8imWXiFjdBqofY
 DO8K5TIYFkBgJxaL9wm+vxjuGGEdUgE8chSgiNOxWAWTlSZ6M3K0J3hjY
 Ddh9aVBXLMFMiFq7NqSafBw5GOxkvze1j2LKtS1SpscvC3+PAd0G+Rb2n
 qkSPQ9nZZFdc0IXOj8HcFetT7VggeElx63gwEbeBF+2RNPU2sB0CQuKoK
 Ik8ft8vR1kkgVITzIw6iTLu7ihSQz/cTmaWQOrT9ftOQY2eYZbq2Oa3aV
 sj48NqIjfPVPkPzumMMVyOYz3mQCXllnZ0suBk2tC3J+oJ4tgRgsWRb/9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471145964"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="471145964"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001505445"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="1001505445"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 03:28:15 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 15:56:20 +0530
Message-Id: <20231012102622.810974-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/3] Remove Stubs in HDCP code
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
  fixup! FIXME: drm/i915: xe doesn't have gsc hdcp interface or
    something
  drm/i915/hdcp: Move checks for gsc health status
  drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe

 drivers/gpu/drm/i915/display/intel_hdcp.c     | 13 +------------
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  5 +++++
 4 files changed, 21 insertions(+), 12 deletions(-)

-- 
2.25.1

