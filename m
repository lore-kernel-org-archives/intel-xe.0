Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33432D277F0
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 15:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473F210E1BE;
	Sat, 10 Jan 2026 15:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuxyngK0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425C410E1A3;
 Sat, 10 Jan 2026 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768059939; x=1799595939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMogBhJEsQ3AonnwFDAyaFRcV5hsMBspKq5MRgVckrA=;
 b=BuxyngK0/DZKagOuqdPGV8TLL4hCMWZAe1lS0ZLeNbPzPL2t3I8Tvphz
 IlWdwfTgIXl3dk3im0S9AfEdOzse6M2PdRXJnBpPFhQjpywhPEs63LqGU
 DqLc67eNCrl2PeTyeXGwaFvJnvw+eqgOWSeXAPrH1NGULoFIUIVxk0lib
 jlb2+mpcXZj44MEnP7g9Vqm+OI4qRF7x29NUvx6PsKQOZ9dJPiVTg4Nt7
 YCBEMM0cJCuksb9x5gdL+5ZSzexBXJq+L6MOsq0aY0RKoyxhsSB6C/0wK
 HoQhoiaRHhBkQG/7+eG9xHt+5ct2nYcYZao762jNI9Za+Zf8J6+5xpqAK A==;
X-CSE-ConnectionGUID: 7loikgolRPKzC/zDb3D8xg==
X-CSE-MsgGUID: DbbgsIOsRoCQUfVYJiYPcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="86828680"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="86828680"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 07:45:37 -0800
X-CSE-ConnectionGUID: VrUH7lpMS2WGrKNnB3ACtw==
X-CSE-MsgGUID: DMcwIlbnSluYis0H4YVn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="204138757"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2026 07:45:36 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: jani.saarinen@intel.com, suresh.kumar.kurmi@intel.com,
 mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [CI v2 0/2] acpi: pm: s2idle: LPS0 changes
Date: Sat, 10 Jan 2026 16:44:03 +0100
Message-ID: <20260110154405.2825339-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

These series is a continuation of [1] and tests Rafael's changes.

[1] https://lore.kernel.org/intel-xe/20260109223442.2622647-1-michal.grzelak@intel.com/

BR,
Michał

Rafael J. Wysocki (2):
  ACPI: PM: s2idle: Add missing checks to acpi_s2idle_begin_lps0()
  ACPI: PM: s2idle: Add module parameter for LPS0 constraints checking

 drivers/acpi/x86/s2idle.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.45.2

