Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0735CA0EE4
	for <intel-xe@archiver.kernel.org>; Sat, 16 Aug 2025 00:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9AE10E2B6;
	Sat, 16 Aug 2025 00:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2UJBYqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6CB10E2B6
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Aug 2025 00:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755305326; x=1786841326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w7MwDdKSVOsBO4YImKcVTXMPQB+D0RpiXpvLnF4XnFA=;
 b=B2UJBYqSn8PH3Ke53g6PjIEYsifARRAvK671OrAH30KVJ4iRG0sp933f
 tQHGwZdU3dtSl3jNoqG1JPmKX1d3+e/NyJbntzfqALCe5rzcxf3v8M1Qi
 1SnOF8BH0tcMqQ6CLKKmTLSQ+n1cg/FKfxrfgd6ZdMfdX5k5p9HYAbHSn
 evqnpQIIHr4TRZBtTAlmoPXIhf848ve2iU4RqydFidnsW0VGmVmQUtqBm
 C0GRbCIZOR4pzWwimtAUc/sZ0RM8pFHgr/smTgrA4iaW6RFDoxy+6uEQx
 tLKeTLv1F+kos+zXehASmnJ6/WIqdo8AKHr+z0Pd/ptlgym5w3s3l2ZaV g==;
X-CSE-ConnectionGUID: srYNg6P3T3GDw7JApZ3i3Q==
X-CSE-MsgGUID: geBaqxaZSNqSio0g/qHP2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="83053196"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="83053196"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 17:48:45 -0700
X-CSE-ConnectionGUID: Y+TD+AMWTaq1cM7Vhbvmww==
X-CSE-MsgGUID: tP57G7xSQaWJGhqCf+UIzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172468476"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 17:48:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tomasz.lis@intel.com
Subject: [PATCH 0/1] Document GuC submission backend
Date: Fri, 15 Aug 2025 17:48:40 -0700
Message-Id: <20250816004841.2549488-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Long overdue: this documents the GuC submission backend’s design and
implementation, including the presumed VF resume flow.

Matt

Matthew Brost (1):
  drm/xe/guc: Document GuC submission backend

 drivers/gpu/drm/xe/xe_guc_submit.c | 181 +++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

-- 
2.34.1

