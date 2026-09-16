Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44FCC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 05:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6610E036;
	Wed, 16 Sep 2026 05:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHPWzF/X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF9410E036
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 05:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789536532; x=1821072532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cGDHEL7D1xAp16JcP2mn1bHTVDqtP16h6TGk+A2O5ag=;
 b=UHPWzF/XKxXk0S+tKtEkbhZzPLCGMZK5Dn/r2k1Pwmw5a9FjsD9tYfzO
 Eo9V//U0u6LTqvRAKYLsXxA6oxmcQob02esA07QA11WS6rxEdnWSlIWJh
 oGp6YBzyyUb2LjtWmFTDCqZWuKtoQqU6z+1pyYbw6g1GS1s4USPSREXOP
 F6wHZOvMZ9skofACXMgEJS9MaqyWhdky2HvRVVAIS+5mxpyXiLtNcHz5I
 hSkmLmHxoCRCCQpvuVVtV4BHTaBZl1Pfseh8EJ+l9eY1KT1UxGUgtM0pQ
 gQA295SqpdyN4JnczYQn99sWHyhL+OwYCvhT4d2YSd/znLlHiuEClBDdp A==;
X-CSE-ConnectionGUID: iWjLFARmTJ216QKD5ovj/g==
X-CSE-MsgGUID: cjHC/iFeQjOCSBPIfZjB+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77469949"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77469949"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 22:28:51 -0700
X-CSE-ConnectionGUID: AExnyFtySz+IKuM9rWcbRw==
X-CSE-MsgGUID: E9K7yckRRm+YDShVo+UMDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275190109"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 22:28:49 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 0/2] Add error handling support for PCIe and fabric
 components
Date: Wed, 16 Sep 2026 10:58:37 +0530
Message-ID: <20260916052836.2953509-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add support for handling PCIe subsystem and Fabric errors.

Fabric Errors: System Agent Fabric errors caused by data payload parity
are treated as recoverable and logged. All other Fabric errors require
Secondary Bus Reset (SBR) to recover.

PCIe Errors: PCIe Subsystem Power management errors require a
Secondary Bus Reset(SBR) to recover. Rest of PCIe non-fatal errors are
treated as recovered and only logged.

Rev2: Fix SIGID logging
      add abbrevations to commit message
      fix cosmetic review comments

Riana Tauro (2):
  drm/xe/xe_ras: Add support for handling Fabric errors
  drm/xe/xe_ras: Add support for PCIe error component handling

 drivers/gpu/drm/xe/xe_ras.c       | 54 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  7 ++++
 2 files changed, 61 insertions(+)

-- 
2.47.1

