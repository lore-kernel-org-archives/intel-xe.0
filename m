Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27739C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 06:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AFA10E1CF;
	Tue, 13 Feb 2024 06:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K82O1VL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB0210E1CF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806115; x=1739342115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z1EcRy8iE147JUPdAyYEF6FbRZPp0X4/uACBRctf5do=;
 b=K82O1VL+TWWPifhvHXXvS2+8KDX0/G/8XqVwarViS8ec2riReoL1f1lC
 EN8KxQAiPyDY91kVJygIpHIx2B+jp/9RnQmLv4w9f3QlwdEPh3uoFolZ2
 mQAasUq2rQgllXHNqmiBLYLCYuqsbKdjY59CONmXMvDQbAR45YJEFbSQB
 IzqUaBBXeyDQRqw06oRm85rgndB2lkWSnk3W5uWPx7gQpqnY4VM8Zo1Ca
 m+JcVyfQsIIJRsCEfDLeLtnM78q17x9dx3wMxXs0LB1YfBMi9lpNyTON3
 yBDC+N7y1klA7+GkapiZWLKiOikagJXcNR7ziNxvvnGXymW9mQKGoHmur Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1671680"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1671680"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="40247069"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:35:15 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/1] Xe OA Consolidated Diffs
Date: Mon, 12 Feb 2024 22:35:09 -0800
Message-ID: <20240213063510.131098-1-ashutosh.dixit@intel.com>
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
  drm/xe/oa: Combined diff of changes between v9 and v10

 drivers/gpu/drm/xe/xe_guc_pc.c   | 12 ++++------
 drivers/gpu/drm/xe/xe_oa_types.h | 12 ++++------
 drivers/gpu/drm/xe/xe_query.c    |  4 +---
 include/uapi/drm/xe_drm.h        | 40 +++++++++++++++++++-------------
 4 files changed, 33 insertions(+), 35 deletions(-)

-- 
2.41.0

