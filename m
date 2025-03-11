Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D6EC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 11:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AA610E167;
	Tue, 11 Mar 2025 11:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZB572eb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3BD10E167
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741693275; x=1773229275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zq/aUJmxptQhg5BQZS4X3RMlz+3g7E2eC24xU+Waxo4=;
 b=DZB572ebt/75J8WOtz0T/rtsO2F+3XaoAy9w/DvdRpmRC0sZ2NgCQTSJ
 PeGgLJWr8J2kzQAPsmaHfdwVuXzJOwWPQWWzY4rqZZsTa4OzLh1lSn5Tn
 GY43wjoz+CsVF7Gx33/14XcvLSjOPZ2NrpJ88M3sRbHTgRhgesKH8+iGT
 Hu7DDh73TiO8kJJPRduPCzrQvZ5R7FW8GfrygWj1kjWMZ5/qI3cwiKjlJ
 bU2brD42SG5d8Tj/TziVN07xsGZ/0h1NpCuYSR7tRy37wdNlw5uo4ZbUL
 vSg0yPW1GAjc6mUlME1gHAooj+fJQ+xWk9oeDMMVFA6+6u8vAQ3/crcQ5 w==;
X-CSE-ConnectionGUID: yFr6SklbST+7eDRbKIPSbQ==
X-CSE-MsgGUID: FrNY314+Su+gkBWXBLgnyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42637131"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42637131"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:41:14 -0700
X-CSE-ConnectionGUID: 42iwQzlkTBKKgnjKrLx2KQ==
X-CSE-MsgGUID: VACeyzt3QSKDd1wfusktWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120015668"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 04:41:13 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] SRIOV: Eliminate usage of CTC_MODE
Date: Tue, 11 Mar 2025 12:40:40 +0100
Message-Id: <20250311114042.1954-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
  drm/xe/vf: Don't check CTC_MODE[0] if VF
  drm/xe/pf: Drop CTC_MODE from VF runtime register list

 drivers/gpu/drm/xe/xe_gt_clock.c            | 15 +++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  6 ------
 2 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.47.1

