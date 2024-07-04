Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AC5C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 05:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1210E07F;
	Thu,  4 Jul 2024 05:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldlQmgGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4410E07F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720072762; x=1751608762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8mPZEN0VdPau42OxQw9v8epMiGlyY+2MsMaEW58kVtw=;
 b=ldlQmgGcqaWhCNhh9n/FVME28FHN8sCaI1p1/V7FnICO4/mLLrLbY+AA
 jx2gQinY87f4CUM6j50/uvcXzu5Qzxdk7uiwCtvvoXoT58MrTNbG0em16
 Sq9FcyOy4IauGClpfEa+Km9YDxemsbikUwJwZBYX35aaWiNNlkmqOwgQH
 TTdVSESSafsvYKuvHMJCTzzudCCFx4Mm4V598F9mkQn2CygdVFiKRYAEg
 TG6VicxEeLLbtdR1D2CLp2PhB1amhUXjeH7AbSY9yKHl043u8BKbqHI/N
 e7OxsA0Xd5+EmBe1mv1/YNOZhCal9nx4l3cww0umbykQX+XAaGqefME+G A==;
X-CSE-ConnectionGUID: w3nKo0CdQOqp/j0oEbmxHw==
X-CSE-MsgGUID: cDyXLPkMRSGb/wNLVnv6vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28006994"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28006994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 22:59:20 -0700
X-CSE-ConnectionGUID: gI8RNeVbSi+Zxi0LgMf+cQ==
X-CSE-MsgGUID: lWfBEYE1TjKnuvnZft0L/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="50933274"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 22:59:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v3 0/2] drm/xe: remove GuC reload in D3Hot path
Date: Thu,  4 Jul 2024 11:42:01 +0530
Message-Id: <20240704061203.3464835-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Power is not lost when only D3hot is allowed so remove GuC reload in
runtime suspend D3Hot path.

Rev2: Rebase
Rev3: fix review comments

Riana Tauro (2):
  drm/xe: move GuC CT set state function to header
  drm/xe: remove GuC reload in D3Hot path

 drivers/gpu/drm/xe/xe_gt.c     | 33 ++++++++++++++--
 drivers/gpu/drm/xe/xe_gt.h     |  4 +-
 drivers/gpu/drm/xe/xe_guc.c    | 69 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc.h    |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c |  4 +-
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 +
 drivers/gpu/drm/xe/xe_pm.c     |  8 ++--
 drivers/gpu/drm/xe/xe_uc.c     | 32 +++++++++++++++-
 drivers/gpu/drm/xe/xe_uc.h     |  2 +
 9 files changed, 137 insertions(+), 21 deletions(-)

-- 
2.40.0

