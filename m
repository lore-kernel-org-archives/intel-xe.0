Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4AEC6FA99
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 17:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B4010E40D;
	Mon,  6 Mar 2023 17:50:52 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2608710E40D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 17:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678125050; x=1709661050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tuBV5fvwPfILykdjKrn2R1C4H30rurlwNaH7Ekgg8YE=;
 b=G7PQo7wHpd0+nn17ryDBRiB33Axh+/dUZPzO0yEsaMlS1xnEwAHYD7mP
 gIbJ2drk0Q0Kr3WJL+2cx2qcmO6+hm+7y9amgdcRmH2vTX3EmSOEQs/Yu
 yPrJXUG2Ou183U4IcZ3w4+LhRkV/e4oZ/QV1UpfkJBu4UK05O5jSDBhoi
 KZs7xJFGIw3KRzYDzJigT0L8oVa24C6Rb2J2NnO1GrqZMPoGkn1OqXmf7
 E8k93spueQcxzo1nNM/Oi+FrjqIqMAqcDZoRZ3dn5lFIez757xY6y60WU
 G4O8Mji2RggbHp3I4lYzcQamWN5jDDUvhQ4GyxGY9MIMqlsWxm0tuOBZx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337949796"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="337949796"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676241560"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="676241560"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 09:50:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 09:50:22 -0800
Message-Id: <20230306175025.720323-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Const propagation and helper for WA
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In some follow up WAs we will need to check when the first gslice is
fused off (see Wa_1308578152 in i915).  Export a function from
xe_gt_topology.c that can be used for that.

Since we are only reading the array, the pointers passed around can be
const. This helps making sure the struct isn't modified in places we are
not expecting it to. In the RTP infra the match callback to decide if
the WA should be applied for that platform passes a const ref: see
xe_rtp_rule::match_func.  First patch proposes a different way to
implement gt_to_xe() that handles that better.

Lucas De Marchi (3):
  drm/xe: Allow const propagation in gt_to_xe()
  drm/xe: Constify xe_dss_mask_group_ffs()
  drm/xe: Add helper to get dss per group

 drivers/gpu/drm/xe/xe_gt.h          | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
 drivers/gpu/drm/xe/xe_gt_topology.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_gt_topology.h | 5 ++++-
 4 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.39.0

