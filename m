Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4078FC5DF8A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A017E10EEB2;
	Wed, 19 Aug 2026 19:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdOXk42W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347B310EEA8
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166898; x=1818702898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YWQemOuCiGNCeVwW4wk8Wrb0E3Z/h+pCxNWWKmy0C+U=;
 b=DdOXk42WPePi5HrUlPU6PGhzYCUKUE28VtwiKKVVjKTMwy8Jh5dLowqd
 cDXopbX2Jd4vagz/9rdyvZbadEdYRYh7ZmAxvq1xDG0V+ecgOSy9wNvJG
 GwlW5VYKPE0GsBgudb0ZM76TpVAULehq3sknGDzmdy7BeDljvTtj1gfj1
 tlFtHy4mGrcf0skNSNoy9dCC3W2U6v0p2DB2dCJv9t9if8RArwOK8OA9Q
 58V9Ds2GY+ldMzwqEJ2gCYJmV7Mufj9tHB4QnKMmQKRXeeo/Jhx3KIZCa
 AypQ2ErM4jtgeLBy3OZfQUl865YiLtdGzxi2INhjaj1vdJScTHhuUhpk0 w==;
X-CSE-ConnectionGUID: L2YellEaQYyKO7OY2KLhWg==
X-CSE-MsgGUID: JbnnNLwzTHW64MRnaoR9AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647295"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647295"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:14:58 -0700
X-CSE-ConnectionGUID: 9R/NwDcvQUue2FJ39c+7RQ==
X-CSE-MsgGUID: wGZrAOMGQreEdHnb/ev9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556767"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:57 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 08/12] drm/xe/pat: Assert pat.ops before dereferencing members
Date: Thu, 20 Aug 2026 00:44:37 +0530
Message-ID: <20260819191442.1957986-9-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

Add an xe_assert for pat.ops to catch a missing PAT table early
rather than faulting on the subsequent ops member checks.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a5fe1beec652..4331ef097ba0 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -690,6 +690,7 @@ void xe_pat_init_early(struct xe_device *xe)
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 
+	xe_assert(xe, xe->pat.ops);
 	xe_assert(xe, xe->pat.ops->dump);
 	xe_assert(xe, xe->pat.ops->program_graphics);
 	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
-- 
2.54.0

