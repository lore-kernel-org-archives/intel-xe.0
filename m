Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B09CCA464
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 09:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA791126E9;
	Fri, 16 Oct 2026 09:24:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A821126C2;
 Fri, 16 Oct 2026 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792142646; x=1823678646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RxZiB5URAxM/OczVSBILAqG5zEurd4Ju4TfxIRvkEQ8=;
 b=Hcf1T8jP/jvU8ngCfbBOQMLxSoX2oPwFq1PXNOnK+E2mtb7i/zrai0pH
 21HNhbz6wYO7haBTSm0vTi6HWzu1UHyF9IzlkrviEVu8ef3fhN2KvHASQ
 sHqSn9oVQDw5bqiRUyF2byjHzqEAratJkH+s/kVw5CFchbxLTY4RygK0o
 IKOGArklt5CBpSMBIN9Ozej+1yCMFSeiMnUwglv47njceoRf3xg/jcXSB
 8f9/SPn6W/rH7Lc0FSdC7UJI5JKgi3Lm5H7NSEQq+Nf0NwhousttCaxax
 yB5ILmfspFiVGcSxu1fnCp0H9cEY1+9jm3NpVRkkAuMGa0VCpbHuHTH0m Q==;
X-CSE-ConnectionGUID: sJetv8PVSgKI0oApmvKmcA==
X-CSE-MsgGUID: tk2nd7UITBy3XegXODC9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="822037"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="822037"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 02:24:06 -0700
X-CSE-ConnectionGUID: TS9pec6BQWCFFHmsNg+59w==
X-CSE-MsgGUID: /pM8NrwgRbW9Sr3xRnig5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3695137"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa013.fm.intel.com with ESMTP; 16 Oct 2026 02:24:05 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, suraj.kandpal@intel.com,
 Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 0/1] Move the PLL power save W/A to the display W/A
 framework
Date: Fri, 16 Oct 2026 09:23:59 +0000
Message-ID: <20261016092400.3112502-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

This is v3 of [1], with the following changes
- drop the power saving wa for NVL (Suraj)
- keep the changes bare minimum by simply adding support
  for WA framework

[1] https://lore.kernel.org/intel-xe/20261014105306.2761683-1-mika.kahola@intel.com/

Mika Kahola (1):
  drm/i915/cx0: convert the PLL power save W/A to the display W/A
    framework

 drivers/gpu/drm/i915/display/intel_cx0_phy.c    | 6 +++---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.43.0

