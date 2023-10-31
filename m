Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135ADC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 22:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D163410E5D7;
	Tue, 31 Oct 2023 22:15:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDA310E5D7
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 22:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698790511; x=1730326511;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ha0FjtViGEC5qCwQWzNUb32A+qKxnmUA7S6vIyAOJlk=;
 b=SujHnxLgDaUGtHjtsusRuBgMJw2N8GUwVtDI0EeqBN+NUh0zOPELZG4M
 0Pwo+oFiTekRhU+tj5Ept5oQV/oTwbC5r0odIBI6DZjkn9IRYBip8e4RO
 Uqcr32Y0DdZ2c1vt1EBzINrJOHtr9rdKLkrbzcAKs2K+U5O9KfcQU7mBm
 LWisphYERA0Qk/XJzaHE/0tBsGwc+Eai0QsDvxJZT9QEuirNRyTFaktsN
 SNX/3Lkjrmto5ayw8mZ7bcLUQ6LpZ4a+tSAYYs0UtWt8SAtkVzrFWZAJZ
 j31OTpNaNDhrCDfQ79rYPsIOWWvkANmSCfowLivAd94xIImVIJ91+vjun A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452674822"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="452674822"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="789926625"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="789926625"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:15:11 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 15:15:08 -0700
Message-Id: <20231031221510.29355-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Fix pagefault and access counter worker
 functions
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

Fix two issues with the worker functions for handling G2H messages for
pagefaults and access counters.

Brian Welty (2):
  drm/xe: Fix dequeue of access counter work item
  drm/xe: Fix pagefault and access counter worker functions

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 73 +++++++++++++---------------
 1 file changed, 35 insertions(+), 38 deletions(-)

-- 
2.38.0

