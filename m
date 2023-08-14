Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D112C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 16:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23C110E211;
	Mon, 14 Aug 2023 16:03:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B07610E09C
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692029030; x=1723565030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BmzGFAy4Zj1zYyP7Mx/rQv1I1y5fRGRR682pKwVUbGA=;
 b=L8PrMFZpXQyfvqSAEHVFwA6R04n/SVHM/BZtlrqVzBZor2iEfDUsYlfo
 miMxGKSURm/hhQMBHKYcuJOA71IqXUkXIyOw6aM+Km1hJWbJNp8nkhv/w
 L7o/ITbiuHJslx4cuuYylf0VpEXeg0+Ohp7bwJ7c8aIMI6yPoyLGZJtT6
 OzlG+d0xC0RSF4WTuSI58yzaEbr2AoXgsdyhvqLUBBD44zUV+4Ak+Y0Xv
 ty3F5czKImuBz8P0Oh7yIwqOTh/HaJgS6ZXN1dwFJZZMTTfqALhnfLMF7
 AF5Pe6F9y6h7gwVBq1rh3ovzQw1ywPSn0r0mdLqi/8A4d+cZJBJj1l7gz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372065708"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="372065708"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 09:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710364279"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="710364279"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 09:02:26 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 09:02:14 -0700
Message-Id: <20230814160217.10707-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] drm/xe: Add preemption timeout config
 options
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

v2: Remove CONFIG_DRM_XE_PREEMPT_TIMEOUT_COPY patch.
    Change unit to microseconds.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe: Simplify engine class sched_props setting
  drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
  drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE

 drivers/gpu/drm/xe/Kconfig.profile | 23 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  | 41 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_hw_engine.h  | 10 ++++++++
 3 files changed, 60 insertions(+), 14 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

