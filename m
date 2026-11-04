Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8961606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 00:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPm958fO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F5810E54F;
	Wed,  4 Nov 2026 00:18:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313F310E472
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 00:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793751476; x=1825287476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oVwIASoxM26jWa17kbVpQcEifdAjGrijRZbULKnR/Wg=;
 b=kPm958fO9CkQdRHtPOmYoOy8TMXyt4zvA5ry7DDGLbVOHjP1PSSsduP6
 Ga97rvpfDSWifiUpVQ7GjAIJzpByU0d9cOxOpVst9TyoQzs4vznLP3wjw
 8z9DVAlw73X1R//ZWONM4Gme9ecm6jrJgeTuxZLvIrPMLNopCX7BAkfHJ
 f+OiQMSEAvoTOylsckLjz9JlC56gqx4l5SPtAmfICtKU3qJDJ6GViQnBi
 62wB3XUVf5FsQRs5Kmy98b+HDcd3afjnIdm3bZ1v5DImWjTwuZ/XZshFG
 KbGD44Xp5yzYPsuB73gPX95RvUqNi9bPMI59Fyys7MInFlZZuob7UkIsR w==;
X-CSE-ConnectionGUID: 6iqaxLeCTOWrAR82izPW7A==
X-CSE-MsgGUID: xa+3HBkPRWOUUy7eIE8irw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2505988"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2505988"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:17:55 -0800
X-CSE-ConnectionGUID: Z/oATgZUS2SQ1IHaeJ8rTw==
X-CSE-MsgGUID: 8+CQxtatRfu2qVopvJPN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8345309"
Received: from cyp07.fm.intel.com (HELO pallavi-cyp07.fm.intel.com)
 ([10.36.54.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:17:54 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com
Subject: [PATCH v2 0/2] drm/xe: Store GMD_ID subunit during GT init
Date: Tue,  3 Nov 2026 16:17:37 -0800
Message-ID: <20261104001739.703156-1-pallavi.mishra@intel.com>
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

Replace the separate GMD_ID and subunit fields with struct xe_gmdid,
then initialize that struct from the value already read during probe.

This is v2 of:

https://patchwork.freedesktop.org/patch/763681/

v2:
- Store GMD_ID in struct xe_gmdid instead of a u32 plus a separate subip field.
- Initialize the struct from xe_probed_info in xe_info_init() instead of reading GMD_ID again during GT init.

Pallavi Mishra (2):
  drm/xe: Store GMD_ID as a struct
  drm/xe: Initialize GT GMD_ID from probed info

 drivers/gpu/drm/xe/xe_device.c   |  6 ++--
 drivers/gpu/drm/xe/xe_gt.c       |  6 ----
 drivers/gpu/drm/xe/xe_gt_types.h | 17 +++++++++--
 drivers/gpu/drm/xe/xe_guc.c      | 12 ++++----
 drivers/gpu/drm/xe/xe_pci.c      | 50 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_query.c    | 11 ++++---
 6 files changed, 68 insertions(+), 34 deletions(-)


base-commit: 4f55b554315fcfc79faca48c521beeaa9651c26e
-- 
2.43.0

