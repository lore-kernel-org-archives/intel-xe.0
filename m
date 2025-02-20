Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45256C021B4
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 17:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ADC10E9C5;
	Thu, 20 Feb 2025 17:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJVjMSOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BDD10E9C2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740072360; x=1771608360;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i3kC55jctNnunttWLg9PrABCM8DBCuVXZ5qqcS7Oy18=;
 b=cJVjMSOEmuXVCo0REj/g0dvwW+6pP8ubkMJib1OsFi7ZZ7kLZ4VEBHPx
 7BSB9qO3RR+smWLiqVpBNN13qExBjPdPEsuRvnDKby6znZV0sbWSn2UIK
 V3Ma5YHvJHsvrgNiPvep7cQqaMoDTJfK2X/EbliDC2DfIpP0msYoqgMwP
 1JPRUd5tu39wROX7c0pfK2h5Var1BYhLB87YDo1PJ6YGWa8bVyz+PhtIn
 U3Df+FD+3QQFVibxCbrFiTURHVBVal7zVMPMW8lS7akDzsX47iQzyFcjn
 U4NtNC9mdvBfk9udRNNWlS0aj1dyiVIta5i11szza8MC6lpKKLtfihk3s g==;
X-CSE-ConnectionGUID: KiXeml1HQIaNdlPqqCpQlw==
X-CSE-MsgGUID: yiPu2ZMCTpCxTGsmhyHmmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40788073"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40788073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:25:59 -0800
X-CSE-ConnectionGUID: TWAeRM/NSGGADaTqj4zZKg==
X-CSE-MsgGUID: 2VO6PPmxRCO9S2N0UM/SEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115634855"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:25:58 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] drm/xe: Unify IP descriptors
Date: Thu, 20 Feb 2025 14:25:07 -0300
Message-ID: <20250220172532.66613-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.1
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

The Xe driver has support, official or not, for both pre-GMDID and
GMDID-based IPs. For each type, we have been using a different approach
for describing instances:

- For pre-GMDID ones, we fully describe the IP via struct
  xe_{graphics,media}_desc.

- For GMDID-based ones, we have IP info separated in different data
  structures: instances of xe_{graphics,media}_desc are used to describe
  IP names and features; while instances of gmdid_map effectively fully
  describe the IPs, by mapping IP versions to descriptors.

In this series I propose that we use a unified approach to describe IPs:

- struct xe_{graphics,media}_desc purpose becomes to only describe
  features of the IP and can be reused across releases if possible (the
  latter is already done with the current approach);

- struct gmdid_map is turned into struct xe_ip, to fully describe an IP;

- the field "name" is moved from xe_{graphics,media}_desc to xe_ip,
  making the former specifically about the features while xe_ip
  incorporates features and release info.

Gustavo Sousa (4):
  drm/xe: Set IP names in functions handling IP version
  drm/xe: Disambiguate GMDID-based IP names
  drm/xe: Rename gmdid_map to xe_ip
  drm/xe: Convert pre-GMDID IPs to struct xe_ip

 drivers/gpu/drm/xe/tests/xe_pci.c |  24 +++---
 drivers/gpu/drm/xe/xe_pci.c       | 118 +++++++++++++++---------------
 drivers/gpu/drm/xe/xe_pci_types.h |  15 +---
 3 files changed, 77 insertions(+), 80 deletions(-)

-- 
2.48.1

