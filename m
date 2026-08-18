Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA531C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 23:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3BA10E6FA;
	Tue, 18 Aug 2026 23:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0+WmZq6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5D010E2E0
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 23:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787095038; x=1818631038;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qCCNjJLhGS53/EK6S5DrW/evKSnznk148VqPCoVyBeM=;
 b=c0+WmZq6fPerpMNwMuGabwkemsmSdCJq8lxRKiGq1INixtkOWB429VkZ
 +zD8eONq4FSU7O/Eil8+QA9q03mDVZ5Jon9V39d9z18Vygu4NlKIKFpdQ
 dgcbpgroG3q6qUbzDpFzI1EnebHDDb5I/laTIlu2v3ok4V2cj620hlr+x
 zrEHETjQo6Mxlr102btzxGmvHJMpOvaze9qbwEoqOXEf9QeHMAtJUzhKZ
 R0ZzfQKuGXcwc+gkaBTcxcgXVJbDmQkqNR/AOHoYU2ZApzsY6MjYA3yKS
 7hDRT5eL30LGYcI4MBMQRU9Q+pfnwNoua63WiWRmkYzj9fgXTp3IOPAaa Q==;
X-CSE-ConnectionGUID: 6ubvLx2JRS65J2oYjZqp8Q==
X-CSE-MsgGUID: d0nd6kjCS9S/fL0jFhwFbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110384423"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="110384423"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 16:17:18 -0700
X-CSE-ConnectionGUID: xLOw5kbZSGCyMLVovT8Hmw==
X-CSE-MsgGUID: CJ6YHAczTyGc+T8WrF3Ijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="268883493"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 16:17:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, mallesh.koujalagi@intel.com
Subject: [PATCH 0/2] Convert some HW errors to use SIG ID helpers
Date: Tue, 18 Aug 2026 16:17:17 -0700
Message-ID: <20260818231716.731788-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

Use xe_log_comp for internal HW errors from CSC and PUNIT.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  drm/xe/ras: Report internal HW errors from CSC
  drm/xe/ras: Report internal HW errors from PUNIT

 drivers/gpu/drm/xe/xe_ras.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.51.0

