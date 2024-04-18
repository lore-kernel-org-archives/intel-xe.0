Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA28BC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 20:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F808113FC1;
	Thu, 18 Apr 2024 20:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8vsWeMx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C6F10F5EF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 20:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713472498; x=1745008498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R1QXtzEeroFFk5UJONPGhibZjcYaESQzw9ZxB+OIGI0=;
 b=I8vsWeMxCRIJPHinxsA8RfV5vL9JT3uglrOHgZcjl0/4wQwnIDl200lE
 YezIky2I5suUDFHv4oZStlKa6XPz+O3KqGT9JKnQ48H7PbMlMICVx3j3y
 tb5rWm203E4HoT6SXn21UIkzpIlB2/ras6jJTfpY7HW0NcaNrG+TDIJg1
 Z9tYAr+2KDSdx95IuT+nP6+6Gcl8DF4M6noZW2pK8DKap1ssBPRNmxYxy
 RwAI5HHs7cZshfaHlYly4CpYaapVWWdRYzvgkM1WetQKQeb03XlgDaHg8
 dAoOKzwVRg5elHlHsPayrex+8PWzVPCD2KPyW6/zrNRMGIqkdsp3/CCT/ A==;
X-CSE-ConnectionGUID: LPAEDnRWSS6V1AfyDG2J2w==
X-CSE-MsgGUID: /MkTP/cJSwKi436Szrmi5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="11992054"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="11992054"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 13:34:57 -0700
X-CSE-ConnectionGUID: kIP5vqesQkeH+hQmpZKi5A==
X-CSE-MsgGUID: 5u6bB/lrSjKgRi5E3NRROA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="22969841"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.62.251])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 13:34:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] PF: Expose GT-level SR-IOV details over debugfs
Date: Thu, 18 Apr 2024 22:34:39 +0200
Message-Id: <20240418203442.226-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

   /sys/kernel/debug/dri/0/
   +-- gt0
   ¦   +-- pf
   ¦   ¦   +-- contexts_provisioned
   ¦   ¦   +-- contexts_spare
   ¦   ¦   +-- doorbells_provisioned
   ¦   ¦   +-- doorbells_spare
   ¦   ¦   +-- exec_quantum_ms
   ¦   ¦   +-- ggtt_available
   ¦   ¦   +-- ggtt_provisioned
   ¦   ¦   +-- ggtt_spare
   ¦   ¦   +-- lmem_spare
   ¦   ¦   +-- preempt_timeout_us
   ¦   ¦   +-- reset_engine
   ¦   ¦   +-- sample_period_ms
   ¦   ¦   +-- sched_if_idle
   ¦   +-- vf1
   ¦   ¦   +-- contexts_quota
   ¦   ¦   +-- control
   ¦   ¦   +-- doorbells_quota
   ¦   ¦   +-- exec_quantum_ms
   ¦   ¦   +-- ggtt_quota
   ¦   ¦   +-- lmem_quota
   ¦   ¦   +-- preempt_timeout_us

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Michal Wajdeczko (3):
  drm/xe/pf: Expose SR-IOV VFs configuration over debugfs
  drm/xe/pf: Expose SR-IOV VF control commands over debugfs
  drm/xe/pf: Expose SR-IOV policy settings over debugfs

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 332 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h |  18 ++
 4 files changed, 356 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h

-- 
2.43.0

