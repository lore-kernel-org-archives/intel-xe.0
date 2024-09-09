Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67026CE7AB0
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 07:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2596610E2FC;
	Mon,  9 Sep 2024 07:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzuXYfyB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD6D10E2FA
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 07:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725867407; x=1757403407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YQ/jW5Xif+uXmSS9FBeTO6eynkcAvXIZ1JF9k6PQT0k=;
 b=NzuXYfyBpYjpkexFDU0/uq8uthCn0mFpW6nP9mYxSbh2l+BqOxwOSFvA
 I6n/THcSe2icWPlNBeMesFA7DWs1Hl6EJtzy++exiJTBjVVeoreesixF5
 N+fcmvPQ4LheJ740+5W6E1LaVDJsz3iunDKWSMp/0pk119WJgNEP54Hl1
 t6HjTfIhitmwZNcCpZ3yzJmR5hXYfOnz1WBttxbWFXVwP338CW9mOOSAr
 k2Lr0lhWVETGgja67xewcyJW7XIiIBmeqbf0qEtuq/42WOIkfw6OnQxZ4
 yp++lvzvnxH+1+44UpqHgT0RaKgDkF0LJ+9YOKv3scZV5BYMqj9jbTtai w==;
X-CSE-ConnectionGUID: qgL2l7qAQZC6V+KShFHsow==
X-CSE-MsgGUID: kHGErmQFSlKWSrAC5hUGWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24701823"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="24701823"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:36:47 -0700
X-CSE-ConnectionGUID: S0xy5bwBRxWXHhm7KX8Q1g==
X-CSE-MsgGUID: MkQA9udRT+SwrvvvFuhnRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="89853660"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:36:46 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v3 0/1] Add support for EU stall sampling
Date: Mon,  9 Sep 2024 00:36:39 -0700
Message-ID: <cover.1725866097.git.harish.chegondi@intel.com>
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

Support for this feature is being added into Mesa.
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142

A new test in the IGT repo: 
https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
is also under development to test this feature in the driver. This
patch has undergone basic testing with the new IGT test that is under
development.

Thank You.

v3: a. Removed data header and changed read() to return -EIO when data is dropped by the HW.
    b. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query EU stall data record info
    c. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2
       to xe_drm.h. These declarations would help user space to parse the
       EU stall data
    d. Addressed other review comments from v2
v2: Rename xe perf layer as xe observation layer (Ashutosh)

Harish Chegondi (1):
  drm/xe/eustall: Add support for EU stall sampling

 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   33 +
 drivers/gpu/drm/xe/xe_eustall_cntr.c       | 1000 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eustall_cntr.h       |   60 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    6 +
 drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_trace.h              |   35 +
 include/uapi/drm/xe_drm.h                  |  134 +++
 11 files changed, 1298 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.c
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.h

-- 
2.45.1

