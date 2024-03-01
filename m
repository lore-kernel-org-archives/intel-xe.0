Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E765C54E55
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 22:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8589810ED6E;
	Fri,  1 Mar 2024 22:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DD2N1MSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0714E10ED6D;
 Fri,  1 Mar 2024 22:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709333352; x=1740869352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HF1fRn8HVQh5QcOaP7JVd3cKe68zYlZE5tObUad1ErY=;
 b=DD2N1MSa+szIVZhdxuk2fER15tZuFLn3zaw4t+kIPriGmIUFqQyKocCi
 0vPmHl1McH1LiypjxdEZmn4oMEPpZne1cOaYhyRKmwJTFR5ICBrHm510U
 x3Z5vNWC6AIYM9zQphwTAJvUvr8i6XAsawm8IfKejkjXip7tYevtse8Sg
 D68WOzGuk5uz4eG7PVfxhUP2VlcQw5gjEFy59Ad7Vngeluro403ltjA5p
 zXxUaI1i0LlfxvIE9wq3qZcWSEjyWJdGpbk5PaOgrOV+cvibmFTArIc3F
 0b3TzCW42ZBdDT/bwbVUop4gvySbkxcXKfuQ25eTR9NQNHFxz5dgQ8dEX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3752201"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3752201"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; d="scan'208";a="45870690"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 0/4] xe_sync and ufence rework
Date: Fri,  1 Mar 2024 14:49:15 -0800
Message-Id: <20240301224919.271153-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
patches. Tested with [1].

Matt

[1] https://patchwork.freedesktop.org/series/130417/

Matthew Brost (4):
  drm/xe: Remove used xe_sync_entry_wait
  drm/xe: Validate user fence during creation
  drm/xe: Get page on user fence creation
  drm/xe: Use get_user / put_user with memory barriers for ufence

 drivers/gpu/drm/xe/xe_sync.c            | 74 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_sync.h            |  1 -
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  4 +-
 3 files changed, 58 insertions(+), 21 deletions(-)

-- 
2.34.1

