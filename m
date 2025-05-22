Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2353AC54E90
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 20:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62F010E191;
	Thu, 22 May 2025 20:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+JyXBGC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3332C10E188
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 20:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747946775; x=1779482775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fH6rGJq0Y6ux7b31DWOiSADUsoHGC7t+afgqAMBgqYE=;
 b=l+JyXBGCzCrXzPSjXekXNWuiYqaCIKZQoQJzWVJgjPNFosoXCUp4A2BE
 GCB5PuMB2/RTazekP8Gv9E4tAx3GqsD4lFNiaew3c2bem9rn0UscZ9+R0
 1CtBioN+H/j54dGuHlyiufZFbEbZEXpFLRRsAZdl8fi3uFJC2aAefl3Gi
 NWSD6s0qvmOkiU7CF8x1Th3QuyUoHaxgfnfmPMn+2/PfXUUqaHNAw9J8v
 oMMEYGYjKxjflwfyx8hNyAarW4h0Z1WXUHgxhtVzG8BJgAlFuyUUO86nY
 RqH04VmyWG/hUlxJO9sYSmLtfxlrnFv5gI/Jscr9cXkrZ/c9+6+ycxcWx g==;
X-CSE-ConnectionGUID: zt1kt5IgRr6kU8ytA1UIsw==
X-CSE-MsgGUID: ThDVBxxITfmPzYilv3BX2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50048332"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="50048332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:46:15 -0700
X-CSE-ConnectionGUID: v+wgct4sQ4GBx0OVoyyRoA==
X-CSE-MsgGUID: Yd1HegQXSHKEpMhDfk+FHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141188972"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:46:12 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/3] drm/xe: Small fixes and cleanups for PXP
Date: Thu, 22 May 2025 13:46:03 -0700
Message-ID: <20250522204602.3921904-5-daniele.ceraolospurio@intel.com>
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

Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/pxp: Use the correct define in the set_property_funcs array
  drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready
  drm/xe/pxp: Decouple queue addition from PXP start

 drivers/gpu/drm/xe/xe_bo.c  |   2 +-
 drivers/gpu/drm/xe/xe_pxp.c | 145 ++++++++++++++++++++++--------------
 include/uapi/drm/xe_drm.h   |   5 ++
 3 files changed, 96 insertions(+), 56 deletions(-)

-- 
2.43.0

