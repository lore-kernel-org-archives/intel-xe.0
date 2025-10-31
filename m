Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CD6CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 21:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0C110E325;
	Fri, 31 Oct 2025 21:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOmWsY/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96610E325
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761945508; x=1793481508;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tinjTeDGP1BIeWyIvXiaIneWbGePy96iD41xc6oQYcs=;
 b=lOmWsY/ClQScymgus0KWADlN4DxVSgUPnwW5fAgnsH1uW+ft9sLEWh5n
 v69G3RrGKELmuqajo6/phnT+cg/Qg+vn6FsyDiGhZaYlELeY8UKBWNE7g
 ChWVkr29CaoobHM7k5N9JGRG/3LkJ5JTSiCUW+P8L3ZBEHpjzgH7rQOBh
 an4WuK86yCn2WuDj4TnEkBR+68xHfD9JJpsP/mSghl6PYay1vklW8vGaY
 ormEuc9eTplpHrqDwHGOstz9pORX0r0qO3g+EWP5K73KlMxJ8q3zFHIGP
 xVL8JuCL8KLRpHTm0liI1uX6h4qRaxLbacHNCv72Pb8kgUnvfIS71AYeO Q==;
X-CSE-ConnectionGUID: 4mTTsBoZQuGD2V+psDem/Q==
X-CSE-MsgGUID: e6uo6td6TIWIzaeyE0Nhyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="86740451"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="86740451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 14:18:27 -0700
X-CSE-ConnectionGUID: F2ZEJD/OSkSUZJc59edvGg==
X-CSE-MsgGUID: Zks9zE6ASLiLdiWDRssdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="209891493"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 14:18:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/2] drm/xe: Add xe_pci_rebar
Date: Fri, 31 Oct 2025 14:17:41 -0700
Message-ID: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250918-xe-pci-rebar-2-part-2-766b5371fe09
X-Mailer: b4 0.15-dev-50d74
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

The rebar logic is closer to the PCI handling than to VRAM as shown by
commit 45e33f220fd6 ("drm/xe: Move rebar to be done earlier"). Extract
that logic from xe_vram.c to its own file.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      drm/xe: Move rebar to its own file
      drm/xe: Improve rebar log messages

 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c | 136 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      | 121 ---------------------------------
 drivers/gpu/drm/xe/xe_vram.h      |   1 -
 6 files changed, 152 insertions(+), 123 deletions(-)

base-commit: 287aaa69490a7901df27fdd9cb9219074cb81445
change-id: 20250918-xe-pci-rebar-2-part-2-766b5371fe09

Lucas De Marchi

