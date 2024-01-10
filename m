Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E00C4706C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 01:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6C110E563;
	Wed, 10 Jan 2024 01:24:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C2610E558
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 01:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704849846; x=1736385846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f6AAH1OuS4ZoQZ8WJ2ostWSo2DA+UZvtTi+LnEOF6lk=;
 b=HsXjTADYx0PAfavKd16vynmLOMuwyKHnLZrEhcVpl7fSM4bALc/20oaW
 yXO1KbowIq7OgImoTfxEAF7W+/6Iqi2xPlf0TJN7oWC/V9wrjpqyes8Hh
 31Qy7CiHkhClMh5Lvzw71El+aL2vF7HXZQHnhp2IjV4d/7sMin5Dl8XNe
 6XhsbqfKyXXES5DzpXwpvZB37z48rFWaM7GUBu0yR9nA6sehKbEQnSko4
 r1t1nnKBhtY4zf1rA67Xj/4TeJHWVxZVCvyddSneOmz5D7qHkVkICNqed
 MmqiyD+Aq8gjVVK6HQPVzlNcVXHj76MVQ3gBXhxIRgYZudIhjW4AfJvXp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395531955"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="395531955"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955187872"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955187872"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:24:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 0/4] Page fault logic clean ups
Date: Tue,  9 Jan 2024 17:24:35 -0800
Message-Id: <20240110012439.1400618-1-matthew.brost@intel.com>
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

Add build bug on and fix head / tail convetion for page fault and
access counter queues. No functional changes.

Matthew Brost (4):
  drm/xe: Add build on bug to assert page fault queue works
  drm/xe: Invert page fault queue head / tail
  drm/xe: Add build on bug to assert access counter queue works
  drm/xe: Invert access counter queue head / tail

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 38 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt_types.h     | 25 +++++++++---------
 2 files changed, 37 insertions(+), 26 deletions(-)

-- 
2.34.1

