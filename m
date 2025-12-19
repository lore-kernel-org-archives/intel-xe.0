Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE561D74970
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 10:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C27910E0ED;
	Fri, 19 Dec 2025 10:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5LuiFW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476DD10E0ED
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 10:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766138401; x=1797674401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gXfqH0+QbcGK9NSP78DogBWySoo7Bm6YWFumRdZGZGk=;
 b=k5LuiFW2l1XbXOJHFCpLaXynIYs39LWTiOlNl5LqyXONVl8v3YCwcTEE
 iUiiqyxTFVBtWEryQtQKK2yeLvagilT6VEFhbRI1L3MJdXOizQb77V00L
 SZ1xtYcKowfO6r4NGULdK8v2ddPkqcjNRXe22gZIv9xITNTW9TEAqRty7
 nBXRjhzndJ1z5pK9AfB6qpgwkB8JoQsRNR3nAO0NCDupf+XLBsSz5X5cL
 Mq39nRFSL/dLVchu+ekltlHc0Itn+s8XnuA4Ra7+1LeR/NDjWGPJ91/f1
 DPz7iB3/9yVmGj7BYnJdz0AHh3k22ZZfLxSUTkIFG49RleyeO2IPBM6oY w==;
X-CSE-ConnectionGUID: 4O0tDYGnSp6JiCPGz4SSPw==
X-CSE-MsgGUID: BNzcD3AVRkm8ScUdxEKMdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67977263"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="67977263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:00:01 -0800
X-CSE-ConnectionGUID: t+4NOHpxRAaLRPnJni/QeA==
X-CSE-MsgGUID: 4kXadGAfSKKK8+i+iJBGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199643951"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by fmviesa010.fm.intel.com with ESMTP; 19 Dec 2025 02:00:00 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/1] drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV
Date: Fri, 19 Dec 2025 09:59:54 +0000
Message-ID: <20251219095955.801776-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

When SR-IOV is enabled, a VM may suspend on one VF and resume on a
different VF after S4 sleep cycle. Because GGTT space is not virtualized,
this transition can lead to incorrect GGTT references. To address this,
validate the GGTT space during resume and apply necessary fixups if
the VF has changed.

---
V3 -> V4:
- Fixed review comments (Matt B).
- Do not split the GGTT query function (Matt B).

V2 -> V3:
- Fixed review comments (Michal).
- Added a new function xe_gt_sriov_vf_resume_fixups()
which handshakes with GUC and does GGTT fixups.
- Updated commit message.

V1 -> V2:
- Rebased to latest drm-tip.

Satyanarayana K V P (1):
  drm/xe/vf: Fix up GGTT mappings on S4 resume across VFs

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 28 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c          |  7 +++++++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 30 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
 5 files changed, 67 insertions(+)

-- 
2.43.0

