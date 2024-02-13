Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7220AC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B5510E4E7;
	Tue, 13 Feb 2024 21:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZYvCXM7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDEA10E393
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707859474; x=1739395474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cAsM8yFwaqljYB8Z2GiuqCVwL+0oEpw347Q2dgESJSo=;
 b=PZYvCXM7YHyRiPPmHOyFeHhIXWX1XZk704DwLALX8tQobM7LRMQtA2gg
 HbFgMMa4CPd1CyvXVV4lHWO67KPXRL2Dl+JIRnrVTh2bzy73pcowGwmai
 8sDy81nttRJ3EtmmNM1E1L7AtIE+oB/U0C0r5xFY/nfQWvrXfRP8y7FFw
 K2w6teUT6jwsHQMrDG8gElCxJXI0U+WhZ2lntvgZoupm9D+OsqMblmY0D
 dsHAdRamioOTQcfqRACEW0mM6zEdbXnkwf7/AfUOAvU1SbU45UpKhGZt1
 E+wduyL1nWfqf2Do+NZH0zYgZ10yF8sl7A+QLdiIYh9kEqSHNfrNVb4CH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1741123"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1741123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3042894"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:24:31 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] LMTT improvements
Date: Tue, 13 Feb 2024 22:24:15 +0100
Message-Id: <20240213212418.1309-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Force 64K alignment of the LMTT PD to match hardware requirement and
make multi-level LMTT as default for the future platforms.

Michal Wajdeczko (3):
  drm/xe: Allow vram bo allocations aligned to 64K
  drm/xe/pf: Request 64K aligned allocations for LMTT PD
  drm/xe/pf: Always use Multi-Level LMTT for newer platforms

 drivers/gpu/drm/xe/xe_bo.c   | 3 ++-
 drivers/gpu/drm/xe/xe_bo.h   | 1 +
 drivers/gpu/drm/xe/xe_lmtt.c | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.43.0

