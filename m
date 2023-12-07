Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FF9C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8925E10F1C0;
	Fri, 22 Mar 2024 09:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtUumCII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C978310F1C0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711099702; x=1742635702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2le5Cuhq9kOFJ6FNQQdSYZuSvXxvDNxNgbJ4Mfo97Xg=;
 b=jtUumCIIAijY/Un1K7RUkdPz1sSgrlNfBRJwtVsTw/PAti3pqADlUyyQ
 oPPaZUdF1kqEggnb47XiPUXJhd1elYl2fQAKj+FV9SYKBUHNGQctl1P1K
 kq6uOiYeNu1qIze/s2C11XxF3rsM+jHeprFFNIU/qC9ZcWjlNO5+QYd1+
 w54QF9Z1dcr4YjQva7OFEyjHi/IDMHnQgumuTKRRT1hYW7XVuGHK8Ql3h
 6miIax++VmEK3g/mYFT9dj933iR2NMKt1bqm6gkGmdsjgJbaMeTTFxhE8
 2S6w+L6+0XFUTprbWayXeGCIQ6CLI4j3iGTD70nb1H/n8OORvCEgxt9D1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16774120"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="16774120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19565558"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa005.jf.intel.com with ESMTP; 22 Mar 2024 02:28:14 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH v3 0/2] drm/xe : avoid the risky function sprintf
Date: Thu,  7 Dec 2023 06:58:38 +0530
Message-Id: <20231207012840.48432-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

These errors were highlighted by Static analyzer. Used snprintf instead of sprint.
Static analyzer Reported "Calling risky function (DC.STRING_BUFFER)”

v2: Removed hard coded values abd used sizeof()
v3: for sysfs used sysfs_emit over sprint

Bommu Krishnaiah (2):
  drm/xe: prefer snprintf over sprintf
  drm/xe/xe_hw_engine_class_sysfs: prefer sysfs_emit over sprintf for
    sysfs

 drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            | 12 +++----
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c               |  4 +--
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++----------
 drivers/gpu/drm/xe/xe_hw_fence.c              |  2 +-
 6 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.25.1

