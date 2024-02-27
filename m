Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0DEC48BF6
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 02:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC70410F298;
	Tue, 27 Feb 2024 02:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0zPX7xB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC2110F297
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709001808; x=1740537808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ziEKzFcYOxWs/vNghJaXQWlQq5H8ahbU3bWQNlpqVKs=;
 b=h0zPX7xB7bkMQxfCrolma4uDsh7b2fpK6ZyBYetxZNzaLaq1UFv+LsWv
 Dr6JIqJwcQXWmMjSxA7L2SXBvJfosE3bWbOEx9RrSFpe/eq6DYbL4YOWe
 jMO6p2KUKgtXiE+q5VhEeqLL+YNSX6wliAxCCrTb16ORDR7SwyTipqtsX
 YjnOGPLvLeJ66kAwIWC0Z62c6NIf6dlE1MRZ6aNUe7bQWlTmEYuYjFImE
 2ZlHCE8saCgMVt2QcF0Ibuo8402n7JBI5ukFfBqSX3wbaeZo880bXEJ4K
 gzBGTDKMol+dxvebDX/8rNbZ1w9m8fK9xydqBFN5R+zCW2EqDgGnWKypf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6275535"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6275535"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7094008"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:43:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/3] xe_sync and ufence rework
Date: Mon, 26 Feb 2024 18:43:34 -0800
Message-Id: <20240227024337.141585-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Remove unused code, better input validation, and gup ufence
implementation. gup ufence implementation based some internal i915
patches. Tested with [1]

Matt

[1] https://patchwork.freedesktop.org/series/130417/

Matthew Brost (3):
  drm/xe: Remove used xe_sync_entry_wait
  drm/xe: Validate user fence during creation
  drm/xe: Get page on user fence creation

 drivers/gpu/drm/xe/xe_sync.c | 65 ++++++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_sync.h |  1 -
 2 files changed, 44 insertions(+), 22 deletions(-)

-- 
2.34.1

