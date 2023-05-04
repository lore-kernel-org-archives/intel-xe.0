Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0504AC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 04:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74DC10E1E7;
	Thu,  4 May 2023 04:54:45 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6287510E1E7
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 04:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683176084; x=1714712084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMLi7XNP90sP8KvPhATBWpEkvI/2OQnDhQtZdya04rs=;
 b=RKqwwMKTOE0f9J7yULKyA3NdMSZ4GlpGAn4uUWlZnMlvpmUKAKpsCJWH
 vydKhEiE3f1zC82Lj1S9rOtqzlS6TLt+Cr/QcxtMqqMXM6IRc48GIz0YX
 S/sAulzpTcI3bJ4rWdWrduIuAp5jaYUIVhYxrGVdoN9HqHqwllyak3dNE
 i/izSCBC8PcVcEl7tIik6znsKLMiEdLinDNUy2yTsIt2QorLdsojuEw2W
 HUpaKvbeNkKtAdGgzRoZeSMxj2IOP2BPIGTcfxE+pqpT1yF3apY+WZmvI
 06Car0ZRzUyLUQeB+hO9+jYeoFpKiM/l90gEymEN3JCPIQ/JKXTGHro+b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="346304847"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="346304847"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 21:54:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="943178188"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="943178188"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 21:54:42 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 10:26:56 +0530
Message-Id: <20230504045659.964449-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 0/3] Add Render C state properties under
 gpu_idle
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

Add rc_status and rc6_residency_ms under device/gt#/gpu_idle.
Handle counter wrap for the rc6_residency counter and remove existing
files under device/gt#/

Rev2 : Rebase

Riana Tauro (3):
  drm/xe: add a new sysfs directory for gpu idle properties
  drm/xe : add rc6_residency in ms
  drm/xe/guc_pc : Remove render c state files

 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_gt.c         |   5 +
 drivers/gpu/drm/xe/xe_gt_types.h   |   4 +
 drivers/gpu/drm/xe/xe_guc_pc.c     |  59 ----------
 drivers/gpu/drm/xe/xe_idle.c       | 179 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_idle.h       |  13 +++
 drivers/gpu/drm/xe/xe_idle_types.h |  32 ++++++
 7 files changed, 234 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_idle.c
 create mode 100644 drivers/gpu/drm/xe/xe_idle.h
 create mode 100644 drivers/gpu/drm/xe/xe_idle_types.h

-- 
2.40.0

