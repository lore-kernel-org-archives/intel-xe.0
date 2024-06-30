Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1B8C27C4F
	for <intel-xe@archiver.kernel.org>; Sun, 30 Jun 2024 09:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1593E10E16A;
	Sun, 30 Jun 2024 09:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfpcl4MP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C224710E16A
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Jun 2024 09:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719739733; x=1751275733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jx+AGxhzKkrxCa0FvZf5SYe8IDt65fUmJicJnYqeRBo=;
 b=bfpcl4MPrqYja6Hs2BYAD2O2qbhZpYbFsSWSPcl8lT2bE5LwOCV/opuJ
 JT+hVDasDP8mqkmzM6ffH916FdcZpzLhF4cF5a/SMbdM0Pw1RIg9XAdwW
 iI/fjt5QR5FPolcko7dz6gwWOYOx3ryXYtx1yaWahEYXq2Oa8iIoOYSh0
 wf2JfedOcvB10+vLpvVdY7J96H6Ykzu6pOb/cdAVta8/wfolzYe1iYuh9
 R26iTut1E3hQbF7rt1rnbV2Q7wE8THfZ3RWkQdwaSicNNY+c4fxomF3ei
 KjNNfXp/q6ju0T1Lm+v+sqhAb4O5fGu/jTsVtom1jnYp21IaQzPtf9kmr Q==;
X-CSE-ConnectionGUID: Umja6N98QAaMgjNRar9AqQ==
X-CSE-MsgGUID: Ou91agVnT/m2j8YYAv/mLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11118"; a="20741439"
X-IronPort-AV: E=Sophos;i="6.09,173,1716274800"; d="scan'208";a="20741439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 02:28:52 -0700
X-CSE-ConnectionGUID: MpBqAsNIQuq8DTwo6jo95Q==
X-CSE-MsgGUID: 8KVYQerGQSSnYqm0DkMqBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,173,1716274800"; d="scan'208";a="45215911"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 02:28:52 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, felix.j.degrood@intel.com,
 james.ausmus@intel.com, lucas.demarchi@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [RFC PATCH 0/1] Add support for EU stall sampling
Date: Sun, 30 Jun 2024 02:28:44 -0700
Message-ID: <cover.1719735354.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
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

The following patch adds support for EU stall sampling, a new hardware
feature first added in PVC and is being supported in XE2 and later
architecture GPUs. This feature would enable capturing of EU stall
data which include the IP address of the instruction stalled and
various stall reason counts. More details are explained in the patch
commit message.

I am posting this patch as an RFC to get early feedback in the uAPI
while support for this feature is being added into Mesa. A new test
in the IGT repo: https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
is also under development to test this feature in the driver. This
patch has undergone basic testing with the new IGT test that is under
development.

The EU stall data from the driver include a header with additional
information about the data that follows the header. The header
includes flags one of which indicate if data has been dropped has
been dropped by the hardware due to buffer being full. While read
returns the total bytes read, any data dropped by the hardware will
be indicated in the flags. One feedback received so far is to make
read return an error when data has been dropped by the hardware
instead of setting a flag in the header. One suggestion received
is to consider two FDs per EU stall data stream with one fd to read
data and other fd to pass any errors. please comment on this idea
that's not represented in the code

Thank You.

Harish Chegondi (1):
  drm/xe/eustall: Add support for EU stall sampling

 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   33 +
 drivers/gpu/drm/xe/xe_eustall_cntr.c       | 1006 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eustall_cntr.h       |   62 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    3 +
 drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    4 +
 drivers/gpu/drm/xe/xe_perf.c               |   15 +
 drivers/gpu/drm/xe/xe_trace.h              |   35 +
 include/uapi/drm/xe_drm.h                  |   77 ++
 11 files changed, 1248 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.c
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.h

-- 
2.45.1

