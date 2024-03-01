Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587E2C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 03:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F36B10EA7B;
	Fri,  1 Mar 2024 03:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmBrVsCg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A3710EA78
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 03:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709265311; x=1740801311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bvPenwv4gvtTgPjOCQpH7gAY/wSvLkjqZtK4R9AsH9E=;
 b=BmBrVsCgatGPA4cj6R+uv/OXqrHf/y7bmhOcdjUk1eGsTP4ZIvdhXq9n
 57EnJx3BzbQQidtwwDc5F+fFRuykwre9EX+YXzbRXtkhu2kQQMdPlCLfH
 GZPHnT+LVJobqmvNEaK67AumK+2oM1xYD7sobEzcWLX9O+ZdQ1RzXDJOe
 tTMa5iYAtWKoTh8pGYVnCq84coKj2LE2xwa86SCZmJoWKAn4Jfzt+8Sso
 OEk1jikbk0k77rpYax5NLQTYDJ2Qgwd1PDbM1v7OwnNsIogAaBhJBL7oG
 vN2odLmseICAfD+GEEawkDiXBfaeylNBba8j6pSn4FFHjkt9PVa36zNOv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14425065"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="14425065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 19:55:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="45607196"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 19:55:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/3] xe_sync and ufence rework
Date: Thu, 29 Feb 2024 19:55:19 -0800
Message-Id: <20240301035522.238307-1-matthew.brost@intel.com>
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

Matthew Brost (3):
  drm/xe: Remove used xe_sync_entry_wait
  drm/xe: Validate user fence during creation
  drm/xe: Get page on user fence creation

 drivers/gpu/drm/xe/xe_sync.c | 72 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_sync.h |  1 -
 2 files changed, 53 insertions(+), 20 deletions(-)

-- 
2.34.1

