Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B4C53209
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 17:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C99810E491;
	Mon, 27 Jul 2026 17:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfuF+wkh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4645910E483
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785173237; x=1816709237;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KJJVnJQLIw3k5F30/oeYYgPfj3Ms+Y2S1KEEjCL5g+U=;
 b=VfuF+wkh+vPnUJi+c6Qnp2RAE7DtzI08eTk1lwOvGlZzkEEAlnYIuUyd
 iS0QAZ/UcXnEv0EAuThx7jhx582BCOEOaabY4/cGtbY7LgXvZNJdQ7ZAr
 rEJVZHMZbu6SsOMzTQPySPzm760qO2mOIXMbJGDQomsa4J/3YE0Y7ENIN
 urjW+PDTA2lAtu/HKFucu+UNYg7UdmT3tFjnJ0UVnGmt3vavrxyyWdCxs
 F5LzH5kavQcGLfhHO3bMCwPjb582SKw0d73c7D5CeK/anH9tTg37P4MKQ
 56IVG2QIbNH2IvBrERWRph2zea6rz5qHq5igch4Rqi4fRHUi1K7fg27U3 A==;
X-CSE-ConnectionGUID: vSE7EjR8Rw2q75yec4plvw==
X-CSE-MsgGUID: xi9a50c4Ra+OxGLhv0Ck4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108542896"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="108542896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 10:27:17 -0700
X-CSE-ConnectionGUID: whS+dBryQWWuf73CMPwjeA==
X-CSE-MsgGUID: 4m5xn0cGRYGW/WpNVn/YYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="255159385"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 10:27:16 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/xe: Changes for Xe3p_HPM media
Date: Mon, 27 Jul 2026 10:27:10 -0700
Message-ID: <20260727172712.2877706-1-ashutosh.dixit@intel.com>
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
Bspec: 67103, 77977

v2: Fix bug in Patch 1
v3: Change Patch 1 for BMG (Matt Roper)

Ashutosh Dixit (2):
  drm/xe/mcr: Take vcs1/vecs1 into account for first media slice
  drm/xe/oa: Extend OAM unit hwe assignment for new dGfx

 drivers/gpu/drm/xe/xe_gt_mcr.c | 8 ++++++--
 drivers/gpu/drm/xe/xe_oa.c     | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.54.0

