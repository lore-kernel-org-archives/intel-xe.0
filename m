Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864E4C54ED1
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 22:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2088D10E182;
	Thu, 22 May 2025 22:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zf999L1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF29610E182
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 22:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747954453; x=1779490453;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VoG15b5v9HaNOD0U26YAy1LnE29PIv/uVBMXjDEfZ9M=;
 b=Zf999L1YgCEQ/K9cPGKKgQ+wBQA0KaLdrJ/hOhte5HgFK6mzSCora5tV
 ScuutaBC3xDBN80gMljPK8X5ypuP1WZdP5WdT/nuwJQWnmutQKADRl1w9
 uXygpvKLI+Onpq1TKprkmZFdQ0N9L5QZw2RpKXIeMC2Zjgft1QaOjWJAA
 677FnF5pK/C3R1JmROeCfEVw6VhikPS2JklOsoEiVvis/9+PtHx8jnzkH
 PH2xOqK8D7Bdjn2BYi8kGAOwHDbIZq2i/XgMi0zGaobtlQDbztM4sQhhA
 omTibZU/zAv4LBf5EtgtsKselzSFvGdORpOcQXhXorgTq+O5P7jcONdbK g==;
X-CSE-ConnectionGUID: 2FuN1M0NRZ2uOFdt/PkW+g==
X-CSE-MsgGUID: z5NzBFGgRhGj3oHNmQVggA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49996926"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="49996926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 15:54:12 -0700
X-CSE-ConnectionGUID: sF4OxmMkROi3sj9QnQ/sEA==
X-CSE-MsgGUID: VYficw/VQ0uO9pdE5NHSUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="145967083"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 15:54:13 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 0/3] drm/xe: Small fixes and cleanups for PXP
Date: Thu, 22 May 2025 15:54:02 -0700
Message-ID: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A couple of minor fixes (including fixing a non-properly defined case in
the UAPI to cover the case where GSC fails to load), plus some code
cleanup to make things more readable.

v2: very minor doc reword
v3: fix rpm handling

Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/pxp: Use the correct define in the set_property_funcs array
  drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready
  drm/xe/pxp: Decouple queue addition from PXP start

 drivers/gpu/drm/xe/xe_bo.c  |   2 +-
 drivers/gpu/drm/xe/xe_pxp.c | 147 +++++++++++++++++++++---------------
 include/uapi/drm/xe_drm.h   |   5 ++
 3 files changed, 94 insertions(+), 60 deletions(-)

-- 
2.43.0

