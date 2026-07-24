Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DAEC531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A68710E5CE;
	Fri, 24 Jul 2026 21:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKBNqEnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE4D10E471
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784928300; x=1816464300;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=39qdu2moWubymrOLoWKUFZkJf3RN6SkNNMHMWIDM66s=;
 b=CKBNqEnnPGwhGccNPiJ9Z66G3M7rsBcbXBFio1xMneuQ/9KvygGQXhEX
 5MPtaDC3Gm6lX2LcmR3kWzvuGvnLNJ9augDjNjtF4Zjkxrrp8lghOjUh4
 zcZlAtsL2onvOV+bMua6i49zXz3ZBZ2a15zKVWqo0tBTy+RHd4Qb3e8ms
 eZ7OQl9aYNbPhKkmZv78WiHf7n1K9RgQqo7RLLbH5mUkLr9mF838XgIMI
 RcCRKVl6cbS13ekq/K+/Qs9ayjpHLwROrdj1xqSencCjhwDNjAyoiHm+q
 kZoOxeqA9/ca76gHoRMkmINtXgZocTsj6yEeaGo10dZe5xie+jPH8szyY g==;
X-CSE-ConnectionGUID: fvrCcfe2SoKRK8B6SH2pHA==
X-CSE-MsgGUID: p7HSKzVFSGSDLPheVtMP9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="84580174"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="84580174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:25:00 -0700
X-CSE-ConnectionGUID: W9Tnto75TUyEb7JZC+2YAg==
X-CSE-MsgGUID: velsflAhQSuMaPq6Bgne6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="254886707"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:25:00 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/xe: Changes for Xe3p_HPM media
Date: Fri, 24 Jul 2026 14:24:52 -0700
Message-ID: <20260724212454.2823014-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Reference: fdce3e20dae8 ("drm/xe/xe3p: Add support for media IP versions 35.00 & 35.03")
Bspec: 77977

v2: Fix bug in Patch 1

Ashutosh Dixit (2):
  drm/xe/mcr: Take vcs1/vecs1 into account for first media slice
  drm/xe/oa: Extend OAM unit hwe assignment for new dGfx

 drivers/gpu/drm/xe/xe_gt_mcr.c | 5 +++--
 drivers/gpu/drm/xe/xe_oa.c     | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.54.0

