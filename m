Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18916CEF17E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 20:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4CB10E5BC;
	Tue,  8 Oct 2024 20:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjDSsNCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DFF10E5BC
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 20:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728420392; x=1759956392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DTAD49BCKNLxonxTEBF8gmF0KmuPUstzkzq+0AhDE8M=;
 b=OjDSsNCAYIsow1oCsdLXmP6jdLCrDq+m0NGrAw7B38YzsbEjSJWa38Qg
 1hu8SsRSsLRSXfDP5LjGJ7XifHydDgpMyW0T9HFUe6LweKb3qXQZoJjG/
 ql22RM9K0GTi+wQKMtXcKnroTNSxdRLGGB+iJvFaVc5oislyhlSqsTEEp
 aHznPcEbv6wbJGeYAg4EcDEWGukDxFuBWRhkPWyso3z9ii86BK7PxF8cb
 txjLKNxWWuYDVPNPPkJzDCYEX3N+crvjczhmchkGphTmd72sHPh9SMzuB
 9YEsPGO7WbAYLoQSmBhz36wpAUtGjG4OdG+mpd7ABoVzaSdmboYFO38Te Q==;
X-CSE-ConnectionGUID: 8rEupkoUTq6k5CSMnWwHyQ==
X-CSE-MsgGUID: BTUajDXYSFG7EEbysDz0/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27544898"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27544898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 13:46:30 -0700
X-CSE-ConnectionGUID: /M2ds/GfS1+GG/1EyjRwsg==
X-CSE-MsgGUID: FcI5pv2oSROhAz+cAqaU+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="113442645"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 13:46:30 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v4 0/1] Add Xe3 and Panther Lake support
Date: Tue,  8 Oct 2024 13:46:25 -0700
Message-ID: <20241008204626.55802-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

Add the basic enabling for Xe3 gt and media and add the Panther Lake
platform definition. This defines the Xe3 feature flags and initial GT
workarounds.

Display support will follow later.

v2: Drop several patches in favor of a more lightweight approach,
address feedback on the remainder, reorder.

v3: reuse xe2_graphics defintion, merge steering entries where
appropriate, fix mistake in stepping for 2 workarounds.

v4: update initial workarounds patch

Gustavo Sousa (1):
  drm/xe/xe3: Add initial set of workarounds

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
 drivers/gpu/drm/xe/xe_wa.c               | 47 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 4 files changed, 52 insertions(+)

-- 
2.45.0

