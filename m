Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24876EB64D9
	for <intel-xe@archiver.kernel.org>; Sun,  2 Jul 2023 22:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945A010E011;
	Sun,  2 Jul 2023 22:17:02 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E3E10E011
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Jul 2023 22:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688336221; x=1719872221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uaKmTbWXvbjuxlhUvJoqRaOFcvINx7RkKNfPh/gx2Po=;
 b=JFiXAJq8qCuMFbHmBy/nDyLBW+u1qJTma/Jv2LdyeWGLxrUk+3k0hrjY
 GH5AGMgGY60UFVZhSg9eOZm430H+plIBaoPfnAY2PdpHG/l+1m6dcvMZb
 vObJh4q7vH46kT6pJprVawjMA7wneWzM0Hs7Jw4hool0sdiUscRx+hTp+
 23XiuUuq7sw63uW6Z5Bz3TgG2OQxWzMoJQtmDY7XeyQCZh9xWkkxuSfp2
 o+Cn+WUMzmLVE+nHXIbnCljOp+YjLiFRv/jnqlbU7l3TuE+2SRyC1Fcgc
 yqVQsLVVT/AfKdtMHncP2ih9TZfcboYdrsxHw4LwEcDNObh1BrWaw6zVe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426428698"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="426428698"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2023 15:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="783678528"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="783678528"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2023 15:16:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sun,  2 Jul 2023 15:17:08 -0700
Message-Id: <20230702221710.1332629-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Another attempt to fix two bind races
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

The first was patch originally authored by Thomas in the following
series [1].

The second patch is better version of [2] in which
bind-engines-independent worka. 

Tested with [3].

A follow up will clean up the maple_tree in a better way.

Matt

[1] https://patchwork.freedesktop.org/series/120031/
[2] https://patchwork.freedesktop.org/patch/544876/?series=120031&rev=1
[3] https://patchwork.freedesktop.org/series/120120/

Matthew Brost (1):
  drm/xe: Make bind engines safe

Thomas Hellström (1):
  drm/xe: Make page-table updates using the default engine

 drivers/gpu/drm/xe/xe_migrate.c         | 79 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_sched_job_types.h |  7 +++
 drivers/gpu/drm/xe/xe_vm.c              | 18 ++++++
 drivers/gpu/drm/xe/xe_vm_types.h        |  6 ++
 4 files changed, 105 insertions(+), 5 deletions(-)

-- 
2.34.1

