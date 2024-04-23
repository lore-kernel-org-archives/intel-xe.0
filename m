Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D7FC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 13:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3104B10E462;
	Tue, 23 Apr 2024 13:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9nfagkG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D3510E462
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 13:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713877983; x=1745413983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2KT3gzNWSenR6OHErGboIXBYuMPenYojMx6pmM6fN/Y=;
 b=k9nfagkGSuQPcdElT6tsUbUtPkJq/5EsaPxT2Am6mqdAEbR4ZPWuFClL
 iuCd896xsxEeu08yao3gYa9Bxa601yDQLQF89x+MVnKBpxf+OwG6V8ofH
 Q+TpqaWl/CVEoxN7Qke1Y1TeGQt9cHJ+QqdOALjctnP1S8Iq+NEVs4yKT
 apNm51PxafsggGWKO9X+zguUYeCRLIukKx5FHYRpm/azb/9uymuexSxxB
 RVyOg7iW/DnCsl4NWsDeQkRU4k+I+Fh/vLc/NZSItaCfKS7XWGrH0atdj
 urCpeA6j+nbbYttwxXfsbivdMolYH9y6AcdMeQdDUu0q9lWosqNlu+vUb w==;
X-CSE-ConnectionGUID: eRN5fwsvQgOTO7+XN8j0cg==
X-CSE-MsgGUID: Gctnfoc+SAamCyJM4j3oXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20070870"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20070870"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:13:02 -0700
X-CSE-ConnectionGUID: hm9q2xnaT0CimRMIhRG2FA==
X-CSE-MsgGUID: JJltizLzSli+zwdqjAm51g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="55321528"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.48.128])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:12:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/3] PF: Expose GT-level SR-IOV details over debugfs
Date: Tue, 23 Apr 2024 15:12:41 +0200
Message-Id: <20240423131244.2045-1-michal.wajdeczko@intel.com>
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
   |     +-- pf
   |     |    +-- contexts_provisioned
   |     |    +-- contexts_spare
   |     |    +-- doorbells_provisioned
   |     |    +-- doorbells_spare
   |     |    +-- exec_quantum_ms
   |     |    +-- ggtt_available
   |     |    +-- ggtt_provisioned
   |     |    +-- ggtt_spare
   |     |    +-- lmem_spare
   |     |    +-- preempt_timeout_us
   |     |    +-- reset_engine
   |     |    +-- sample_period_ms
   |     |    +-- sched_if_idle
   |     +-- vf1
   |     |    +-- contexts_quota
   |     |    +-- control
   |     |    +-- doorbells_quota
   |     |    +-- exec_quantum_ms
   |     |    +-- ggtt_quota
   |     |    +-- lmem_quota
   |     |    +-- preempt_timeout_us

v1: https://patchwork.freedesktop.org/series/132621/#rev1
v2: check for overflow in policy_set functions

Michal Wajdeczko (3):
  drm/xe/pf: Expose SR-IOV VFs configuration over debugfs
  drm/xe/pf: Expose SR-IOV VF control commands over debugfs
  drm/xe/pf: Expose SR-IOV policy settings over debugfs

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 335 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h |  18 ++
 4 files changed, 359 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h

-- 
2.43.0

