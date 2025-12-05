Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D130DD32D8A
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 14:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AC010E1FE;
	Fri,  5 Dec 2025 14:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFpBI3J1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7142110E1FE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764945670; x=1796481670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UAe4mSlV9TSGJgkC6760tlZ+sDQz67cFNXXS1obqAro=;
 b=fFpBI3J1CGPofG+ktFf7rAOJ8aRF5Hx6+GbNJMQCV9ErpMxuIRafZelh
 Ukq6pYek4y34+LQiqJE3bB88cziRn9N6N+gPV8JeKFrJJSFzLXyYTMTjB
 c+3uT4zqHWims9JlL0crhJ/tG3Jt2O5MVD4YC8VN5cvxOyHcKx3Oz5fEf
 JVgUv+8SEHtEHfApKbeBr7q6jrqUM7fPpZV3hPxGwEMuSqm2+Djp+9Pbr
 fDxOplI1Y/BO5EjmcQ3Yl9wShC+ic8nmr5X/cpI8rnjuqj/+sjp3loO/Z
 /YwnQFKFUPrP912Abv87vMH1I7BEpiMxBV5xTbIGeBxTOSASx/Z13iQlz w==;
X-CSE-ConnectionGUID: n55K720dSwyA9Wx4Txf8GA==
X-CSE-MsgGUID: U0EMGjiBTAObmUbSWtSXlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84583265"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84583265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 06:41:10 -0800
X-CSE-ConnectionGUID: J9GFScLfQEyX/ljEbKHJOA==
X-CSE-MsgGUID: klWluCLbSnaEeHBkDgjcDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194379255"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa006.jf.intel.com with ESMTP; 05 Dec 2025 06:41:10 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 0/2] drm/xe: Separate out GuC RC code
Date: Fri,  5 Dec 2025 06:38:13 -0800
Message-Id: <20251205143815.1343989-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

This allow for independent toggling of GuC RC feature.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Decouple GuC RC code from xe_guc_pc
  drm/xe: Add a wrapper for set/unset params

 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_guc.c    |   5 ++
 drivers/gpu/drm/xe/xe_guc_pc.c |  88 ++++---------------
 drivers/gpu/drm/xe/xe_guc_pc.h |   3 +-
 drivers/gpu/drm/xe/xe_guc_rc.c | 154 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  20 +++++
 drivers/gpu/drm/xe/xe_oa.c     |   9 +-
 drivers/gpu/drm/xe/xe_uc.c     |   7 +-
 8 files changed, 209 insertions(+), 78 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

-- 
2.38.1

