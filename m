Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C32EC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 06:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25CF10E1DF;
	Fri, 28 Feb 2025 06:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epNEs1yy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A988010E1DF
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740725738; x=1772261738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yg5PAhKaxfVr1KI+2hnXrphdSG9yzzPB+f2YTfdaxjM=;
 b=epNEs1yywDo3hQ17GdcTXJwqoyrH+d8Xa9PtoCKvB2jaB2BXLVUwiWLB
 32EStQ2DKuYYzgux4EOjOdBEvDB9fHvZagxREpiofSJxdPE58czC09a9P
 iSNoWscEL1uVpoLTIpLvo6Loe/MTD5rQ4zG0jFuyUXc5wnqZ7OayX8n1t
 D+U643j0aB4yPZ6EKGV2gIEQevJ+x7GlPQJMwvFwiFKi6KCCw3ghimgi4
 Cn5hmFOczOzvfbJnTxwb47DB7ZsMT4Y+5/nkm58hr+T6MViFMYDpFzGE4
 uLih1R8cNuNZ2sLfZxrA6rkUf/O4Z/cQZj8vqMl/1H2EIsOkG5voDtWpq A==;
X-CSE-ConnectionGUID: tWA6IVujQ5OxP2PtRRp38g==
X-CSE-MsgGUID: AjfLw+/STOmJABLpUcD9kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41527898"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="41527898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 22:55:36 -0800
X-CSE-ConnectionGUID: SH3GVaGfStWnuXjLxk9Kdw==
X-CSE-MsgGUID: cSCjkKHJRx6tqUJPtstfsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154431892"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 22:55:35 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V10 0/1]  Add UAPI support for low latency hint
Date: Fri, 28 Feb 2025 12:32:23 +0530
Message-Id: <20250228070224.739295-1-tejas.upadhyay@intel.com>
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

With this user can hint low latency during exec queue creation.
KMD will forward hint to guc.

Test-with: 20250227122117.711646-1-tejas.upadhyay@intel.com

Tejas Upadhyay (1):
  drm/xe/uapi: Use hint for guc to set GT frequency

 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c            | 10 ++++++---
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
 drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  8 +++++++
 drivers/gpu/drm/xe/xe_query.c                 |  2 ++
 include/uapi/drm/xe_drm.h                     | 21 ++++++++++++++++++-
 7 files changed, 58 insertions(+), 4 deletions(-)

-- 
2.34.1

