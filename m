Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC735EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 12:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C56310E5BD;
	Thu, 20 Jul 2023 12:09:19 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D744D10E5BD
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689854956; x=1721390956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y59tt+kO6n0x5PfUPaGeu39Wrbh3rRcmQozBqqDCxsE=;
 b=cXogARl7amVQtJ1vdKeERkKenvDgmCPPZQc9K+0mbH3aJuZlTKP/P6ov
 9ND7ZzKbFpnFVOH1q/o1T7PxtK2Qji5GXT/E8cENCqXgoSvLAH/fxdx9Q
 v4joIW8h/PZTfzuGzlB0XTWtr0aJghwdoF2YV2UdIitoGUyMKnUsaxluN
 9cORZ3eHFkrIxudU92n+5PkWsk0tvWW8/J/GLoiwfsehhyq3Rdo4Bdxpx
 RvjjMp+U7TMVFnj4xu1kZk02TguuUEwtthU2Njy0WDjwuEfjPManz/8wu
 UNPorymKncgzsHoo23j0HETxk2AGq9X5MsSbrm+Ivqr3sdKFgyQ8ltncq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430479409"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="430479409"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 05:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="754048465"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="754048465"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga008.jf.intel.com with ESMTP; 20 Jul 2023 05:09:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 17:45:45 +0530
Message-Id: <20230720121551.518497-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 0/6] drm/xe: Add engine scheduler control
 interface
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

Patch series introduces this in several patches,
1. Add basic directory engine class under its GT, as below
   DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
   ccs/ bcs/
2. Add default entries with its value for user to go back
   to default
3,4,5 : Add individual engine properties sysfs entry
6: Introduce min/max to control in what range these properties
   can be set for elevated and non-elevated users.

VLK-46764, VLK-46767

V4 :
    - Rebase the series
    - Add CONFIG option to enable/disable min/max limitation on
      elevated user - Matt/Joonas
    - Movement of engine related code to its own file
V3 :
    - Improve class_mask logic
V2 :
    - Rebase to solve conflicts
    - Use sysfs_create_files in this patch - Niranjana
    - Handle prototype error for xe_add_engine_defaults - CI hooks
    - Remove unused member sysfs_hwe - Niranjana
    - Restric min/max setting to #define default min/max for
         elevated user - Himal
    - Remove some unrelated changes from patch - Niranjana

Testcase: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/94ccbe7cdf8651d5b76588102eca545cb74caad8
Testcase: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/0753ddf646df691cd1d2219192ce3a629f3e7e3f
Updated Testcase: https://patchwork.freedesktop.org/series/121046/  
Tested-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas Upadhyay (6):
  drm/xe: Add sysfs entries for engines under its GT
  drm/xe: Add sysfs for default engine scheduler properties
  drm/xe: Add job timeout engine property to sysfs
  drm/xe: Add timeslice duration engine property to sysfs
  drm/xe: Add sysfs for preempt reset timeout
  drm/xe: Add min/max cap for engine scheduler properties

 drivers/gpu/drm/xe/Kconfig                 |   7 +
 drivers/gpu/drm/xe/Kconfig.profile         |  45 ++
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_engine.c             |  47 +-
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 684 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  34 +
 drivers/gpu/drm/xe/xe_gt.c                 |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c          |  11 +
 drivers/gpu/drm/xe/xe_hw_engine.h          |  31 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h    |  24 +
 11 files changed, 890 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
 create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.h

-- 
2.25.1

