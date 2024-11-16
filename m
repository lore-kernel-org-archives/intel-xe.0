Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04125D68BDA
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 02:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E4F10E3EB;
	Sat, 16 Nov 2024 02:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/5CHlfC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A82C10E3D6
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Nov 2024 02:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731723161; x=1763259161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nZAtyZX6OawoLTiSwx6Vkqn+52qUCtjeapPe12UiK+M=;
 b=a/5CHlfCuYmb4nDFKa7laO/7Z/8vVAwOdUKDLLt/IIrlKPTigCnfKoMz
 3FUeF7Ax6XzCVa8ouAIvO8IIvshOXOYqcXEw4h4WV73XsnFtE1NyMaBes
 zWqghMnEegYsX/f467StDKnh1SlVjPR64+huszOyxx+Y9WoDWyPxBf+99
 DqEOp8gJhRDkvJL3zVdBJeX75UE2mRjVHkl5Pem4VMKFr3LQA1ezNky97
 ybeMmevN2xJLaJh6nFP7XG0BcN5Kqxmww0U1b/Ctp5Ak237VuU8ZV+FEs
 X0DkHAgaRFy/VhnzVzRtlddCto89OstLd+fvBY3kW9KakOzbGxMujXLQc Q==;
X-CSE-ConnectionGUID: zhl7/0oMRbOQCmhoCC3IRA==
X-CSE-MsgGUID: aM2vzmioSqejMaHodTEUEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="42380709"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="42380709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 18:12:41 -0800
X-CSE-ConnectionGUID: QEB7gg5fSwmZJh0/QTIgeQ==
X-CSE-MsgGUID: pM66vvrXSfOcHbwKk21ELQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="88481924"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa007.fm.intel.com with ESMTP; 15 Nov 2024 18:12:40 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/3] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Sat, 16 Nov 2024 03:12:35 +0100
Message-Id: <20241116021238.2486287-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

To support VF Migration, it is necessary to do fixups to any
non-virtualized resources. These fixups need to be applied within
VM, on the KMD working with VF.

This series adds two fixup functions to the recovery worker:
* for fixing drm_mm nodes which represent GGTT allocations
* for fixing content of outgoing CTB buffer

v2: Fixed missing include, made checkpatch happy

Tomasz Lis (3):
  drm/drm_mm: Safe macro for iterating through nodes in range
  drm/xe/sriov: Shifting GGTT area post migration
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 177 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 146 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  27 ++++
 include/drm/drm_mm.h                      |  19 +++
 7 files changed, 374 insertions(+)

-- 
2.25.1

