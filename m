Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D956CCF2C4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 20:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD501129D6;
	Fri, 16 Oct 2026 20:44:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2833B1129D0
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792183444; x=1823719444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dx6t8hCb3cSObC27mdSyBEgAGATKup+2oWOutK8h64U=;
 b=VC/CABrsSQZcZe9tWfRevaobC4WZW7midhRnzi8N7aT0o8qyGaCNnu1E
 9sG2MjF7c8rn51SQMVB29TKhKpyUalbMZcU0SP0aLf7yvd48cQ4k34hrY
 ++Icnhvc6vrg8uI0r4BNhKxLbyy8Z3mwVcYmcAlNgV2cZwVg5qzpJlfSJ
 o2Bnn6iIvNJPn6/IBGDI6s9kDHPghBb5ST/TbzlL+rhPz7pNMCCXnIb2d
 94DNDvHmO6qGBTPNGaIWsrBmTeMx7sOY3/iWgKsNRgwlGSySRSQIRfMCV
 dTOpU+PK8kTXiH7/kzinoYfLDdtV6bx45iRQ8AGcmL29NfKsc5oEV+Xo5 g==;
X-CSE-ConnectionGUID: ID+nu4FZQ1qVLBlDDHUTKw==
X-CSE-MsgGUID: 6ILotJyDQoaGw02j3TFjWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1074528"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1074528"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:44:03 -0700
X-CSE-ConnectionGUID: dvD1Kio2SZCTuPEfD66bUw==
X-CSE-MsgGUID: njgyspqRRAa1OMty7BL/ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3784132"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 13:44:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, dnyaneshwar.bhadane@intel.com,
 michal.wajdeczko@intel.com, jesus.narvaez@intel.com
Subject: [PATCH v8 0/7] Use SIG_ID logs for GuC component
Date: Fri, 16 Oct 2026 13:43:55 -0700
Message-ID: <20261016204354.364846-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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

Add SIG ID logging support for some parts of the GuC interface code.

v3: Add some review comments from v2. Some opens remain. will address in next
revision as discussion evolves.
v4: Review comments from v3
v5: Review comments from v4
v6: Include Sashiko's comments and some fixes
v7: Comments from Daniele
v7: Comments from Daniele, Dnyaneshwar

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/guc: Use different error codes for GuC load errors
  drm/xe/uc: Report DMA failure using SIGID
  drm/xe/guc: Report major GuC failures using SIGID
  drm/xe/guc: Report errors that cause a CT shutdown using SIGID

Umesh Nerlige Ramappa (3):
  drm/xe/guc: Handle CRASH and EXCEPTION G2H with separate helpers
  drm/xe/guc: Make ct_dead_capture available on non-debug config
  drm/xe/guc: Cleanup error codes and handling for CT errors

 drivers/gpu/drm/xe/xe_guc.c    |  40 +++--
 drivers/gpu/drm/xe/xe_guc_ct.c | 317 +++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_uc_fw.c  |  13 +-
 3 files changed, 253 insertions(+), 117 deletions(-)

-- 
2.55.0

