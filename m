Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA874C5B549
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 00:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A498010E272;
	Sat, 31 May 2025 00:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irWkbe93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EFA10E00F
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 00:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748650385; x=1780186385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ee7bcug2rkI6YmfZh9njHl3JoEkNSqqh384RgzqtGG4=;
 b=irWkbe93T0gIskwBXxi8YNCDBNRG/mNZowD7ktNK40PhiuqNi2rzEvsa
 AhN1GqmYFyZNhX+V9wUFQ0S7es1xMTOtjRpcwGFwaPp4MV5lty9hQtK7k
 Oj0I/pgQnMg3Xu3MfysffQuu2P49ih5W8V5hvupoum4u1rWXY+ylbFZcD
 oTPxuQOMnXBrA2zi0NGZCgTErlFAgbB0fKKgPYndyoCyUBXYiaznKC/DL
 VKqMrYg89kJIAHI+2YEGJ0cFn82BZ24VmE4Y9XMlsSNcVqNUWBoowIEjJ
 elXEvm2Rk9OUpHmSiehKLall1XSLIglw2BV07ecrkQNM+9p3Ib6g9x3i3 w==;
X-CSE-ConnectionGUID: W/q6GofURZKIXQ0N43KPbA==
X-CSE-MsgGUID: 85a8jdi9Q9mm5QYIriGDmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50669549"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="50669549"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 17:13:05 -0700
X-CSE-ConnectionGUID: ZRFo6oKVQle0VKc7OCLS3Q==
X-CSE-MsgGUID: 3qt1QzfdRRSHJAIBoeDYGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="143928007"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 17:13:04 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 0/5] Enable media OA
Date: Fri, 30 May 2025 17:12:54 -0700
Message-ID: <20250531001259.630681-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

We had previously enabled render and compute OA units. Enable media OA
units with this series.

v2: Added Patch 5

Ashutosh Dixit (5):
  drm/xe/oa: Expose media OA units
  drm/xe/oa: Print hwe to OA unit mapping
  drm/xe/oa: Introduce stream->oa_unit
  drm/xe/oa: Assign hwe for OAM_SAG
  drm/xe/oa: Enable OAM latency measurement

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |   3 +
 drivers/gpu/drm/xe/xe_oa.c           | 197 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_oa_types.h     |   6 +
 3 files changed, 153 insertions(+), 53 deletions(-)

-- 
2.48.1

