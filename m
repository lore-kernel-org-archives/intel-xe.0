Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A44D1AD30
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 09:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C19E10E035;
	Wed, 16 Oct 2024 09:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPSHsWoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C35810E035
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729069515; x=1760605515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dgt+9Hmp4NV8DPxi2wOLa13n9oGnMQIU0n0ZpD4ZwAM=;
 b=MPSHsWoB4TupHzIMi5f6LuVbgV80HEFuJ3fB9Uf1FHkjx+pF+vanEwEv
 zvrtvpt3JddGuMcRSNtwScJqEDiAu31n+N2itU9cuckVO3iWFyB2y+rUT
 i3l9YeZ9RSvgQ4u0p1uWAInHFyMf8N69s2tC8depio8ESWk6USoPYh7ox
 PrzbRrGYPD3ec9HaZpNUcohx8yfMgjxv85KgRbsEafbP0gMi0/7WVlt/p
 R5G3J2HNAaTXBXIdJZ3HAYH6fWbH7Dj9kyp3vL19lSUUb3nC0KLSP/eEQ
 fPo4cjQ8y6tPfJA3rDWvnwBfuL3apILl+fkh6tbgAOMB230qBt4x/abkV A==;
X-CSE-ConnectionGUID: cFMDhlWVT8mASlEjRnvBsg==
X-CSE-MsgGUID: xa81x47NQXe+ZjM5pH2Xdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27978388"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27978388"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:05:14 -0700
X-CSE-ConnectionGUID: EJSEwtCfSbaBkQO2/Zu+rg==
X-CSE-MsgGUID: QjYkFN9XThCeRRRjey7U1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78998359"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:05:12 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/2] Improve ufence addr validation and error handling
Date: Wed, 16 Oct 2024 10:23:02 +0200
Message-ID: <20241016082304.66009-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Resending https://patchwork.freedesktop.org/series/139887/ with 
Test-with tag to validate we catch bogus addr from userspace early.

Locally I can reproduce current bogus addr passing issue and the test
also validate that it is fixed with the 1st patch.

v2: s/XE_WARN_ON/drm_dbg(Maarten)

Test-with: 20241014141839.1618518-1-nirmoy.das@intel.com
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Nirmoy Das (2):
  drm/xe/ufence: Prefetch ufence addr to catch bogus address
  drm/xe/ufence: Warn if mmget_not_zero() fails

 drivers/gpu/drm/xe/xe_sync.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.46.0

