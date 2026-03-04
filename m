Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99EFEDEBF9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 00:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6093D10E903;
	Wed,  4 Mar 2026 00:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjBCxXjK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9977710E903
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 00:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772585770; x=1804121770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k84tAFRWBimyW5qECJwf9dDD6HxEXnN91mGcAnszBeU=;
 b=GjBCxXjKjum4SKOsGQeXnKlXLn/pnLrZOg7g6OMdwqrIZfSZKFLhuYh0
 6ddRncYL/FY13wM62y+lyT5bWeAom2EO2CthEu8HfTm/3zy97nlKGX8we
 TlrZ8bo6Jg0w1z04cSi/O/nW3eaCzTxKaShgZZofHdRScwGDsvBJ7uSbm
 pMGqtw0TX12529uqzV09WDBjkeqK1sqnkV3Yo2j7kfMbKl9Vg/5WM6uqq
 ACnO+EJOugaP2qe2UhL9xzRBp4A/aSVaTIKkOcJxymxt7jN2L8CpOj8hP
 JVjxfPMgOe+kNybGkdRBbn8cZ8CnPpz4UQx9h6o/MDQWhYhU086ryGlLg A==;
X-CSE-ConnectionGUID: J3aBDNpcRRmHP3RXjDbmqQ==
X-CSE-MsgGUID: UbJQhGJTRC+tFiA776A0OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73705472"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73705472"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:56:09 -0800
X-CSE-ConnectionGUID: HJ/K1qiuTCW7VdaZ9tQFHQ==
X-CSE-MsgGUID: /1bX+2xPT4S92Vq6nfI6Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218130204"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by orviesa009.jf.intel.com with ESMTP; 03 Mar 2026 16:56:09 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v3 0/3] Page Reclamation Fixes
Date: Wed,  4 Mar 2026 00:56:08 +0000
Message-ID: <20260304005607.2511440-5-brian3.nguyen@intel.com>
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

A few changes to the page reclamation code. Fix up the PRL generation and
move the page reclaim done handler to its own function.

Thanks,
Brian

v2:
 - Update non-leaf handling.
 - Re-add assert for non-leaf.git 

v3:
 - Modify secondary PRL abort to check non-leaf levels. (Matthew B)
 - In the case of NULL VMA, there should be no corresponding
   PRL entry, so leverage existing skip logic to skip over.

Brian Nguyen (3):
  drm/xe: Skip over non leaf pte for PRL generation
  drm/xe: Move page reclaim done_handler to own func
  drm/xe: Skip adding PRL entry to NULL VMA

 drivers/gpu/drm/xe/xe_guc_ct.c       | 23 ++++++-----------
 drivers/gpu/drm/xe/xe_page_reclaim.c | 26 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h |  3 +++
 drivers/gpu/drm/xe/xe_pt.c           | 38 +++++++++++++++++++++-------
 4 files changed, 66 insertions(+), 24 deletions(-)

-- 
2.43.0

