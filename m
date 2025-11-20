Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9092FCF8841
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 10:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3088810E748;
	Thu, 20 Nov 2025 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFHoaHZi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF8A10E741
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763635492; x=1795171492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=taau9uKYjTATaZpq1Jcjum+aZTco/brL4xuqB08W5GU=;
 b=bFHoaHZiX89Rt+UZ9s5MZEZquMnyDkObD8zUJLHM+Tq3uF6D6RmZAEkF
 XNoe9pxTsd/dBT3SFjcpHOMTbLNbyVaVeKHZXsVPDEjogWITdArrcsMcT
 cjjUl3uaDvGi2Q/0vklDVJtKdtNimlx7dUdzDKWgFbj+mvXq0a13hZBsQ
 QRuAmWW5oUbGkc+wrekAgMkZM6XGHjD/aG/AAMJTPKP37TuPBYiHpgxu4
 T2v+g4A/EWZ7mG3srec4siTYLh9GIVH0pn0lBXhbwNNf6u5Jc8v9U+W6b
 1iGvvo9nUWEUgT5CQhJojavwsStzwwDyrsRWEwmZTGxu8ks2dm87mVIfC w==;
X-CSE-ConnectionGUID: yo8HFphOSe2Zi3HjZ+vVFQ==
X-CSE-MsgGUID: afAnO1/3Q8GJcsnraN+TCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65737814"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65737814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:44:52 -0800
X-CSE-ConnectionGUID: fvPi4DGcSQOyQHZuBf8BFA==
X-CSE-MsgGUID: unOLNSqvTYu9d0qmVXDCeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="222262807"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.4])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:44:51 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 0/2] Add tracepoints to profile SVM page faults and migration
Date: Thu, 20 Nov 2025 11:43:37 +0100
Message-ID: <20251120104436.1438720-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

v2: Rebase patch #2 after page fault refactor, expose more info

Francois Dugast (2):
  drm/xe/migrate: Add tracepoint during VRAM copy
  drm/xe/pagefault: Add tracepoints for page faults

 drivers/gpu/drm/xe/xe_migrate.c   |  3 ++
 drivers/gpu/drm/xe/xe_pagefault.c |  7 ++-
 drivers/gpu/drm/xe/xe_trace.h     | 85 +++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 1 deletion(-)

-- 
2.43.0

