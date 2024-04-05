Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3271C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 11:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A66113B62;
	Fri,  5 Apr 2024 11:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWTyv6ZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A82113B62
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712318376; x=1743854376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZlKMj6XLnfoccTzofuSEAg1p60sGDx8/eYZ9a/ithSk=;
 b=AWTyv6ZBn2EjcE/V5zPH3g3oqfJynFscA5SRDCxNZM4TtN42xcIGFWza
 cHMtaQs8qjkOdkBgdidxc7+BdT0wlee5nG0qpq35HGG3R/MLTNWO9V3pV
 iPPitBurlWKEzoxzUDYmAe/qQ2ZxPzsRIVGVgQX3G7+r+i15ie8Cr5Bkp
 r65oyp6btrnxSaJjFxmoXMHxK7Q7bE9d9plr1cTybAoUegkrrEeSfOQq0
 SVGqZggriiMXuR0C83xp8Tx47kk3oAaaoH54LgROSOpCRH8akEv41VbNQ
 AlKGN7Wq6jV7agf5lE76ryVbq/KkK3aVUF+Ybbs4u3gHwMuMLZnYfG2T3 Q==;
X-CSE-ConnectionGUID: JWe53iX1Q5uaNwWp6BWbvw==
X-CSE-MsgGUID: v4PHX6T7Q7m0gghd0EgHRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7877532"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7877532"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 04:59:36 -0700
X-CSE-ConnectionGUID: cfmnkiOAQMG+P+6IhX02Zw==
X-CSE-MsgGUID: QAj561rjT2awZmqGDbqI5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19594005"
Received: from ettammin-desk.ger.corp.intel.com (HELO b12736dfd7b0.intel.com)
 ([10.252.41.208])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 04:59:34 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 0/2] L3 bank mask
Date: Fri,  5 Apr 2024 11:59:13 +0000
Message-Id: <20240405115915.7-1-francois.dugast@intel.com>
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

This new series is a rework of
https://patchwork.freedesktop.org/patch/584654.

As suggested by Matt, the patch is now splitted between internal readout
and storing of L3 bank masks, and the optional addition to the topology
query if later needed by user space.

Francois Dugast (2):
  drm/xe/gt: Add L3 bank mask to GT topology
  drm/xe/uapi: Expose the L3 bank mask

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   3 +
 drivers/gpu/drm/xe/xe_gt_topology.c  | 107 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     |  13 +++-
 drivers/gpu/drm/xe/xe_query.c        |   9 ++-
 include/uapi/drm/xe_drm.h            |   2 +
 5 files changed, 129 insertions(+), 5 deletions(-)

-- 
2.34.1

