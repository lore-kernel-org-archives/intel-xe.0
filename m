Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07B3C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 20:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503C410E0B5;
	Fri, 24 Jul 2026 20:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ec0Tq2mz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE0C10E0A6
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784923893; x=1816459893;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iygcGbSOrbc2cKfOH3kP7LNUXaFnshehonVr7i7QGrc=;
 b=ec0Tq2mzwUbOiHAiAvY6wZ/jH2VCn7p9YWcK4ZAxofzT4fFNj6vvnXX5
 erRDpzbNka0Ey9yKS6Is7R7gh/8zGWomayDa7Rwb9b90hFx63uEvW8hne
 Eu/Z4oVTKU8IfYNy2iWQvYWr+oz8corfQo+20zOJn/yubxvKIzkZyyyIi
 3q9orPUOm/wfEwBEazw53Z819197w07AWLgbok4iRzunQOl1gvNJdRbRq
 aU6TEcMzIuZx681HAjJWfWABylQKUDruW20X+uB2yuizfNd8j78kAXKb+
 Ke9Kec5KQ8nmvSY36PPooKc5IdNdxny/8wMfOnUij0BTWaMO6GcuAMaNi g==;
X-CSE-ConnectionGUID: sRuwqAXNQJKpD9YFFnts3w==
X-CSE-MsgGUID: i1fTDRayRt6+PhOFP9eiEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="89268049"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="89268049"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 13:11:33 -0700
X-CSE-ConnectionGUID: G9I8qCuCQDe1LwA8U0hlfA==
X-CSE-MsgGUID: Sj5hJT1FThmhhPfNoBPTHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="258241793"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 13:11:33 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Changes for Xe3p_HPM media
Date: Fri, 24 Jul 2026 13:11:27 -0700
Message-ID: <20260724201129.2814030-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (2):
  drm/xe/mcr: Take vcs1/vecs1 into account for first media slice
  drm/xe/oa: Extend OAM unit hwe assignment for new dGfx

 drivers/gpu/drm/xe/xe_gt_mcr.c | 5 +++--
 drivers/gpu/drm/xe/xe_oa.c     | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.54.0

