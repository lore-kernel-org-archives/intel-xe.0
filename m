Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6995C10F1A
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 11:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D8A10E35E;
	Wed, 16 Aug 2023 11:52:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD0010E35E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692186763; x=1723722763;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZhzeWYHgXOY7eo7jebxWU1Z4G1jzbPFqD70Kt7yYPlo=;
 b=e00r8W+BXlfn/Bc3Iwhw23u85bNypkR7EBfH2rF4YcBjFccZzwjr/JNK
 LmQUHMw7fBvzHiniXPDLDvXpmDT4cJwdtL5P7vIex6GNAM5hjwCV0+qal
 COkrh5pWPVHD+ZVHRGWIYadnxXg5/f+qJKHiibLwbFfIpF6DqUYmVkh0X
 KkoIIXu9bmZu3JE11FA9TZaFa/jGS0nlJWXeh9lCVl2t0dXTDROzUvMzo
 bjd0sj33s29W0TvZQ6pYtaAXGIC8NvUnhTkVBqGF12Z54QSq6RWgLXDt7
 UHjiecIW8mP87dvKjpZwbQ9b8qW9qNvhq9uaQcZzjMipcrTKbA4AbdOq0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436407008"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="436407008"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 04:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857796793"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="857796793"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 04:52:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 04:52:36 -0700
Message-Id: <20230816115238.2340-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] drm/xe: Add preemption timeout config
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
v3: Remove CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE patch.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe: Simplify engine class sched_props setting
  drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT

 drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  | 29 +++++++++++++++--------------
 drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
 3 files changed, 31 insertions(+), 14 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

