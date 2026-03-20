Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED121099B40
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 20:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC29010E128;
	Fri, 20 Mar 2026 20:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dF+wELWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459EA10E128
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 20:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774040091; x=1805576091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2G4Ecj4FVvDxpDDkFdNijlU9xzrRUKbW8g1Eo+9SdT4=;
 b=dF+wELWbt+4Tu9qQ98Tqpo/yO138hwlSAI+aEQ5/vJ+XPVmKVtknwCgR
 FQDjS/iD8M5AvnkyBlpLHn/nAXdWrGgrZOIKKiQ+AVCXs2wScN5rUn1lK
 WUKSVSENCmMK0pbVlpWSbv0qGO/qD2vdYjlY5qqvBix9qURT3I+erE37m
 bLIXPy1C487iLLhY1qwS6W3XE5U36iVI6CFm3ia6lCHBGBpdNOH+FWsuu
 zrNx3uId/wo4xnZ4MbsbNdgh7dyjWnzNacRqjKfA1+sIh+G/P730IALir
 ekoZ1nuBIAow6qLaQruMpNCClx8kzo91tD00dq6LORRlo+BOf/+f6DQEy w==;
X-CSE-ConnectionGUID: f5ktNV0zRfKq+ZVb6zIzDw==
X-CSE-MsgGUID: 5uWyGv+kQh+tC0ZwAdv9UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="62693874"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="62693874"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 13:54:51 -0700
X-CSE-ConnectionGUID: VudhbbjfQUKw2lMh6NTLXA==
X-CSE-MsgGUID: Ubhog+j7RHq9jG52i9iFag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223425722"
Received: from dut4407arlh.fm.intel.com ([10.105.10.118])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 13:54:50 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: piotr.piorkowski@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, niranjana.vishwanathapura@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/2] Add support for LMTT specific invalidation
Date: Fri, 20 Mar 2026 20:54:40 +0000
Message-ID: <20260320205448.95132-1-stuart.summers@intel.com>
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

Split this into a series from [1] to separate out the op
assert to apply to all TLB invalidation operations.

v2: Few minor changes to the main patch. See patch notes
    for details.

[1]: https://patchwork.freedesktop.org/series/163541/

Stuart Summers (2):
  drm/xe: Add an assert that the TLB invalidation op is available
  drm/xe: Add LMTT invalidation to VF provisioning flow

 drivers/gpu/drm/xe/abi/guc_actions_abi.h   |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  6 +++---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c      | 17 ++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.c               | 16 ++++++++++-----
 drivers/gpu/drm/xe/xe_lmtt.h               |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c          | 23 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h          |  3 +++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h    | 12 +++++++++++
 8 files changed, 72 insertions(+), 9 deletions(-)

-- 
2.43.0

