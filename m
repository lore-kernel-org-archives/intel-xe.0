Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307F5C04FDF
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5B010E3F0;
	Tue,  8 Aug 2023 18:24:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B6D10E3EB
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691519058; x=1723055058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bJ6r2N4DK6UqqRsGc60LanbCQr2M8dpVM+HOKRmyR+8=;
 b=nUkpaBcJ/V5rf+jXADI0R4Uddye0z1fWdwH42sX63QA3Nx/RhSTmxof6
 5hxDHu5EriLjbJZ8btdev5a/QbMZ2u8D8VnqjhFzKDqdNI9exbe1Fe+c/
 cBi70EUBQ+nAj2a9/ezUEGK4rP/AI72/Y4arq1nhcM883blA84teM2M1g
 z6yltGGoLPKv7auT/nv9bQL9HY16MsYYNxF5eu/XyDF0q9h37sx2mGF9E
 q9hgLNEfVgOY2luGKJiqHIvK11V2cn6dV6vo156XD3NwY3yj3PNdLTQRI
 9CZ0jA8ZA30q7phI3Dy1AJyHR1vZ1Ho3ZLyzxc6w6tqD/D3flurfL37Nt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370907025"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="370907025"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731512581"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="731512581"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:24:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 11:24:07 -0700
Message-Id: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] drm/xe: Add preemption timeout config options
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

Allow preemption timeouts to be specified as config options.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (4):
  drm/xe: Simplify engine class sched_props setting
  drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
  drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
  drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COPY

 drivers/gpu/drm/xe/Kconfig.profile | 35 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  | 44 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_hw_engine.h  | 17 ++++++++++++
 3 files changed, 82 insertions(+), 14 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

