Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBECC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 13:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08F110E758;
	Wed,  8 Nov 2023 13:45:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88A410E758
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699451146; x=1730987146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vbdXLgkhERXfCmZSTknNIofqb3q9m7eylZgk0Mggc0M=;
 b=OcuPXFksB1cC4GroOS+oRbV7nB60YHgzjLNJpSzVERzMv7I50eHT+hqH
 a0U5iethg1uhPqL4cdphz7jyRI8LVQLdKNuDYaeAArkrNBPwSEeanUV/x
 xB8x0cJfvFPxH6SZ5cDHDH5tYSZImOR3vjXMYDRrAeY4U5epEqa5doFy9
 4Cl8Lls4M9GIrnhp/ivYxXflas+Yysd42XqpMB0YSQ9djF4VXwVbMMF69
 wk4U5oNitbSBwVCTQTan1fSoix2hsrlKEHkbMwvX1wEreYhne3LIqUJYB
 f2xksRNzlK+b9w6sQUYJeAdoJ3v+Jj1v3Zzg1QgEpSk4JAGJdRA+y4bes g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2711219"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="2711219"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936513423"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="936513423"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 08 Nov 2023 05:45:21 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Nov 2023 19:24:16 +0530
Message-Id: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Expose ATSM uid through sysfs
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

Series includes 2 patches,
1. Expose uid through sysfs
2. Move xe_device_sysfs_init to xe_device_probe

Tejas Upadhyay (2):
  drm/xe/ats-m: Expose uid for ATS-M via sysfs
  drm/xe: Move device sysfs init out of xe_pm_init

 drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
 drivers/gpu/drm/xe/xe_device.c       | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_pci.c          |  3 +++
 drivers/gpu/drm/xe/xe_pm.c           |  5 +----
 6 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.25.1

