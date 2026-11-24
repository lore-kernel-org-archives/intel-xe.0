Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9A606A339
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GrpigCcC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FAC10E594;
	Tue, 24 Nov 2026 13:26:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7510E594
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795526792; x=1827062792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y3rcL0+vNQI86EJW7H/G02P6DsdJH9DGVPGf0jTRHS4=;
 b=GrpigCcCOnkndar5u/RlPMTdptFNq3AVxdi6AcntFRT5xqW5XfJid1IR
 DcNMD56C49CT+NjtxG7o0tFCW6vyL1gDntexjVhqXtxYJUCNC0Lo0r/UU
 iGTbV1CkGhFG6Ata7Op2qcz5D9KLZTyBVkJzv2MnqJV8Or8SQmYd8fSEP
 7i7yoRt1QHjtae5oLFepeOWDgP9EgCOrZKRiA5VrGjcwjUGqvrsMrq4Uc
 uGDOqsnrbcJSp0YeDzcrDFXqznhquEqs39FLS7jN611dsRNyNulmutyQQ
 PSpOfiqyki0mkpur53Fz0K/NFIj7NADGdWvjYm2V+nCiR8HVj2v/6ZskI w==;
X-CSE-ConnectionGUID: JjZCtfGsQ7GGKufwtxDiAQ==
X-CSE-MsgGUID: wJtzrzO6R56wzwLiccbWFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4388672"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4388672"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:07:09 -0800
X-CSE-ConnectionGUID: DeOr4QQtQk6oOTDWSAyqmA==
X-CSE-MsgGUID: sQfQ65K8QHK5pDy2+rdCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11347093"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:07:08 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 tilak.tirumalesh.tangudu@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH 0/2] drm/xe/xe3p_lpg: Implement Wa_14028597154
Date: Tue, 24 Nov 2026 18:36:58 +0530
Message-ID: <20261124130657.800225-4-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement both parts of Wa_14028597154 for graphics version 35.10 when
multi-queue is enabled:

1. Back the reachable low-4MB GGTT PTEs (plus one trailing spill page)
   with a dedicated dummy page so misdirected CS semaphore token writes
   do not trigger GGTT faults / CAT errors, and restore them on suspend,
   FLR, and D3cold resume.
2. Enable the corresponding GuC workaround KLV (0x5002, GuC 70.81+) so
   GuC stops relying on PPHWSP semaphore wait info for multi-queue
   contexts.

Tangudu Tilak Tirumalesh (1):
  drm/xe/guc: Enable the KLV for Wa_14028597154

Varun Gupta (1):
  drm/xe/xe3p_lpg: Implement Wa_14028597154

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_device.c        |  3 +
 drivers/gpu/drm/xe/xe_ggtt.c          | 90 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ggtt.h          |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 12 ++++
 drivers/gpu/drm/xe/xe_pm.c            |  3 +
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 7 files changed, 109 insertions(+), 2 deletions(-)

-- 
2.43.0

