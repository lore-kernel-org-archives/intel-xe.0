Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4B4CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 15:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD1210EDDE;
	Thu, 18 Jun 2026 15:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNY17NIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65C710EDDE
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781796974; x=1813332974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZyTlKnE6uGTjLXbH4mV5UUQrA1/HpqinIMKqZsuohAk=;
 b=jNY17NICHZCXWKrweryP9AspMnfA4BdMrwsa/inCJAoIOJOueBJbdJHu
 HaWIyQPMqb7/Kqy9WvC951mP7htBdaUv5a4jblCoMkQ7+IqRpbh8p2uC0
 kcicO4G6puxjgKFICAJUGOuyqPGaDTFz8LWsdcUnC1uWDdNoxOD3Fn4VZ
 7soBQTEknbIQhwP6NCtNyc/Q4Hwk/GSBlVcnJ2vDsD8B6O7v0pCa8IN9A
 yFX2otATp5QJxtcKotznniaR6LI9w1o4PVCd76g15xrvMJmzY5o3COtum
 1hPhXSzPHRaxrAfXnwEXASU6tM4RyuWpiJ7DAbqs57vhBG2m91I/WKvVN Q==;
X-CSE-ConnectionGUID: kdV18pF7TYelFA/iCA2URg==
X-CSE-MsgGUID: IB0Gas+ASY2Uq9I5Lq4jJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="94136285"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="94136285"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 08:36:13 -0700
X-CSE-ConnectionGUID: LWrjz77fQTOXBafi0wphAg==
X-CSE-MsgGUID: 4Fw2bwFZSPO/ZEqsl+9qXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="253487953"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 18 Jun 2026 08:36:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 0/1] Hardware Error handling for Crescent Island
Date: Thu, 18 Jun 2026 21:01:25 +0530
Message-ID: <20260618153209.110899-1-raag.jadav@intel.com>
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

Detailed description in commit message.

v2: Explain the usecase (Matt Roper)
    Allow hardware error routing through debugfs (Mallesh)

v3: Reorder macros (Riana)
    Squash debugfs patch with routing setup patch (Riana)
    Fix runtime survivability regression (Riana)

v4: Defeature hardware error handling with system controller 

v5: Add error log (Riana)

Raag Jadav (1):
  drm/xe/hw_error: Defeature hardware error handling with system
    controller

 drivers/gpu/drm/xe/xe_hw_error.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.43.0

