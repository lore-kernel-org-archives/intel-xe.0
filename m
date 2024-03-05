Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EED6C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 05:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331D1124ED;
	Tue,  5 Mar 2024 05:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWNJSzfW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86E31124BD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 05:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709616103; x=1741152103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sw5TG0ZU/zcFlrE2JcT/b8kJNAaITekiL/+nCM/3AqU=;
 b=hWNJSzfWF2lP9umALHEUtnEtsC5oaogqXaIp658VNtURLseT7JjgvwMC
 03zBa0gaAiBWd1j706Euvl6BS+9EDzRA7W5ydE/+rKAiMK/GTfWTzpt5G
 h6c2gDD5ZwSGT98ITLjqZcsteeZF4hpsQ8sVGKBiDDTWiaCgV6BMEJlhr
 6wQ/2PwpGwzAM8fljczU/ZFaitSION9qYVeBYcJFdYtXqiFnEAFY8EhDB
 8sNhOtWeoacHz96IdDxd6PYryZUjGgJdDrtD+9ZMvEYB/ox/CXSBOTyXc
 owFrJRdDhkpKvYxx/jkY6ByzZ6gJdjWda0s+WLdddsaDngQKtvl/igL6D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4067609"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4067609"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9426505"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:21:41 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/1] Xe OA Consolidated Diffs
Date: Mon,  4 Mar 2024 21:21:35 -0800
Message-ID: <20240305052136.2405509-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, I am providing a combined diff of all changes in a single
patch to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

Ashutosh Dixit (1):
  drm/xe/oa: Combined diff of changes between v10 and v11

 drivers/gpu/drm/xe/xe_oa.c       | 21 +++++++++++++++------
 drivers/gpu/drm/xe/xe_oa_types.h |  2 +-
 include/uapi/drm/xe_drm.h        | 19 +++++++++++++++++--
 3 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.41.0

