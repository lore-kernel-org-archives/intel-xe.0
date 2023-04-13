Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C889C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 14:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC04B10E36A;
	Thu, 13 Apr 2023 14:29:57 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F45A10E36A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 14:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681396196; x=1712932196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dXZkkPWp3PWlx081J9ooXjNxuNZNIIrTkufWkPWjpmc=;
 b=dit6PccxmfpHDG8uIzPeqeOkXqRJZxZPckhByLL2UrDUCmvAzA4gNWz4
 ULPijRzQcrWqwNrEmOPweLtgLVKLjECVKatGq3unFObh59U1LGoUT43H7
 sS+b8Hz9IxicQLLy4pnXjWccncCoZUqoaHHWZDSOOv9DAmnI54JzeabTC
 MUIRjEjc8rjhNtc7iTTm/rfogQnIq6bO0TBgIpXFFFNg+nFQC4UHNzSVk
 vm5vFpDBqECbUyUQK0kuX7icU68jKug3SW9NAcqTf295Rs6nbYhJafrmN
 vVnCvkdSSANCpSU0miXvq1L9f6M9ePVQ7042/d+LRkHS7QVby5y/G6D0m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342941794"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="342941794"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689370403"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="689370403"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:29:54 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Apr 2023 17:27:46 +0300
Message-Id: <20230413142749.1097229-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/3] drm/xe: Introduce eudebug event interface
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

Hi,

This series introduces eudebug connection and
event uapi interface for a debugger to track
clients drm/xe resources. xe_file (client) and the
vm resources are introduced as a baseline, leaving
rest of the events as follow up patches at a later
time.

To support use case where debugger is connecting
to a drm/xe client which already has opened
connection(s) to xe driver and allocated vm(s),
patch 3/3 introduces discovery where all
currently active resources are presented through
events for the connected debugger.

Mika Kuoppala (3):
  drm/xe/eudebug: Export GPL symbol ptrace_may_access
  drm/xe/eudebug: Introduce eudebug support
  drm/xe/eudebug: Introduce discovery for resources

 drivers/gpu/drm/xe/Makefile           |    3 +-
 drivers/gpu/drm/xe/xe_device.c        |   26 +-
 drivers/gpu/drm/xe/xe_device_types.h  |   25 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 1228 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h       |   27 +
 drivers/gpu/drm/xe/xe_eudebug_types.h |  176 ++++
 drivers/gpu/drm/xe/xe_vm.c            |    5 +
 include/uapi/drm/xe_drm_tmp.h         |   76 ++
 kernel/ptrace.c                       |    1 +
 9 files changed, 1565 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 include/uapi/drm/xe_drm_tmp.h

-- 
2.34.1

