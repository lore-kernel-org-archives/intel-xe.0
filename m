Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CA4C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 14:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BFA10E490;
	Mon, 29 Jun 2026 14:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iarRKVFX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3124310E490
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782742121; x=1814278121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mS+436ZyH7BPEZIhJwL073AR16sA1kyMgJnHTGHbvek=;
 b=iarRKVFX5tbkuicL+dTTn5CG8FmDVO089vx/JKJ2M4PdGfagva2UYD5p
 WoWx5/guYKs+630Ec7L5h2PPSVEQhxHCjoPBEwOiB2WSMe3qJ3rS33EXc
 Aa04Qeleh3EiArIukJmFdVHKdoe5ujLu6EYuc30ku9qXbWSmVC6B+4xj2
 CW46PtRfxGR3PMP/xWN5DcZ7lvS8Dnx/NjFXLeIc02LMocWAWY19lXX/3
 v+iyQnNNDrRDFUBtRNhWPZXamWoeaEpGT60Rfng2L1345tZzrujU2WfWB
 DMPHF+fuev8x7cUriv+GV0n4mtjPKUAFDI9Fw2uSfDCzzMOTfEDExCUd6 g==;
X-CSE-ConnectionGUID: MDp7JdIXSzqJYy2G/ZLBSQ==
X-CSE-MsgGUID: Y5ll8zz3QTOeUIGB8pz1Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="100972682"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="100972682"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 07:08:40 -0700
X-CSE-ConnectionGUID: yVW0+v6PSpqwzJjAZJHamQ==
X-CSE-MsgGUID: zwJ+G21zRgGFCQmUwaS9sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="256369857"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by orviesa005.jf.intel.com with ESMTP; 29 Jun 2026 07:08:38 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 0/2] drm/xe/guc: Handle GuC local uncorrectable error
 notifications
Date: Mon, 29 Jun 2026 10:08:34 -0400
Message-Id: <20260629140836.2074349-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add support for the GuC uncorrectable local error G2H notification and
opt in to the feature when the submission ABI exposes it.
Preserve HW error state in wedged mode 2 to help debug the root cause of
the error.

---
History:
v4: Add wedged mode==2 handling patch
v3: Remove not used flag bit and timeout worker check (Daniele)
    Remove wedged mode==2 check, which will be handled in separate patch(Daniele)
v2: Opt in for Xe3p only, excluding media GTs on NovaLake-P which don't support the feature
    Remove timeout bypass, which is outside the scope of this patch and can be added separately

Zhanjun Dong (2):
  drm/xe/guc: Handle GuC local uncorrectable error notifications
  drm/xe/guc: Preserve HW error state in wedged mode 2

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.c              | 10 +++++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 35 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
 drivers/gpu/drm/xe/xe_trace.h            |  5 ++++
 7 files changed, 63 insertions(+)

-- 
2.34.1

