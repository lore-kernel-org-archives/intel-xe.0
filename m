Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F404CAC5B5
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 17:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508D610E153;
	Sun, 28 Sep 2025 17:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnFbz9hP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B156510E153
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 17:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759081706; x=1790617706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ijIIXR+j0pxKJDW9J0ytT5Kd2Y1nZ2F7DtvNNnxHFeY=;
 b=JnFbz9hPQ1oJzy79B+feBIPzZII0KoBU8Ll6HidfyRBEGWZCHpHMOXNB
 03KEYZwvIRx/0sPiREcrzsdlrzyudwmkMReReKa8fRGJVrpaGfyD8fY/h
 KApueGCDVAjZIqCEXEgJ2Lgvth5Ih6QqSZwUn3tIgcccUpeq7PKK5+oOt
 6iXTlt9JJ4wdg3/Nw2A26rMWUUOx0pZGbXvAvOocBkSkk0IWnNrqfwDmJ
 IfWHjbkujelQiKnS+UoUnad5ym1jsO6S3rfLVuV7uA2xpDroRaDj8gW++
 S6QdIwYjLA28PpaG/z8NRAFwcu8BrDHi4r4P1r7OUexGjr21Dfq4wc6C8 A==;
X-CSE-ConnectionGUID: 9ZjGBN/7Rlego/Z2iRrwBA==
X-CSE-MsgGUID: 4R9oUxfPSVyOaX8fhCb7FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61226664"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="61226664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 10:48:25 -0700
X-CSE-ConnectionGUID: YwcadK11RymtmrpS6QjW0g==
X-CSE-MsgGUID: jQlwymL+QUWQx3a8g7qXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182459544"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 10:48:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Don't claim support for firmware late-bind if VF
Date: Sun, 28 Sep 2025 19:48:09 +0200
Message-ID: <20250928174811.198933-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe/vf: Rename sriov_update_device_info
  drm/xe/vf: Don't claim support for firmware late-bind if VF

 drivers/gpu/drm/xe/xe_device.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

-- 
2.47.1

