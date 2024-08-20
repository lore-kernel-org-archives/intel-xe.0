Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D48BC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 08:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3924310E117;
	Tue, 20 Aug 2024 08:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaWQfkZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01FF10E117
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724144162; x=1755680162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SEu3J80Q5SziFR7Yr9h9GnHg5JyFZTFo6OvM8WI0bDw=;
 b=OaWQfkZe/w0INvJLPtMobke4bYtX4Zq/5tNfLBnMm18CLwlbNYkuI3gh
 Ixh9qcEhIg5tRf1FTYQSqy5K+qaIlW5jJAp9CJiZDvh9w0bX/WVdZdJky
 CDb64EeoH/L7wLhSOp69r5sSVFPCCeP7aZVkB45CwXYySzmYJBulQaaZB
 ogbtzDSqPzIBnjJD0xKR5IQvD1Do/rGW7/1epHH1KXnv5uRKAnOkdOafn
 88tKzzNyMDX2fQqmtGsmWqNLP8xHk8soYvWdweVHV+0GVUB7ZTxKKCVlL
 8UGQb+YKpv6oOjdonc6bOGj1YN/9raoRy9RN0nDqTeVhzGZ2kkPNud7xR w==;
X-CSE-ConnectionGUID: /H90wlqhQ0W2aVRdS0xW9A==
X-CSE-MsgGUID: sHvkH3q9QhWMmStccuueJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="13110532"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="13110532"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:56:02 -0700
X-CSE-ConnectionGUID: NUUvVVjhSTOdQgzv0JaJGA==
X-CSE-MsgGUID: 1kPcMFnXQ1y+sNB+zUkHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="65619994"
Received: from singhapo-nuc7i7bnh.iind.intel.com ([10.145.169.50])
 by orviesa004.jf.intel.com with ESMTP; 20 Aug 2024 01:56:00 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH 0/1] drm/xe: Add NULL check before deferencing pointer
Date: Tue, 20 Aug 2024 14:24:53 +0530
Message-Id: <20240820085454.976636-1-apoorva.singh@intel.com>
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

From: Apoorva Singh <apoorva.singh@intel.com>

Add NULL check before deferencing of lrc->bo in
xe_lrc_snapshot_capture().

Free the dynamically allocated memory for snapshot
to avoid memory leak.

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>


Apoorva Singh (1):
  drm/xe: Add NULL check before dereferencing pointer lrc->bo in
    xe_lrc_snapshot_capture()

 drivers/gpu/drm/xe/xe_lrc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.34.1

