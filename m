Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EAFEEA84F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 20:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDF510E2AA;
	Thu, 12 Feb 2026 20:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpA/SF2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03DA10E2AD
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770928961; x=1802464961;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F1tprtehdlJ8k5W2Re7lNpE4uWiLmdZ9CKNep1Vdrg4=;
 b=cpA/SF2wzDdUtHWBnxVHpO76s2G+QIsPYPNh7Vdvntt1ymowasrINp0X
 K9EIWQzCSFx8L2OE3g3o5DycJ2JHGkVpfViK34PUf7myERJton0rV/XA/
 9u3q1uz6u65q8563cVaQbp1Xr9C+MGc+8ZSltL1ufKzhj0nBxpvccBmGZ
 vcHhrNP46ZAgXD7fPRNoug9vMF8zC/mCBuMRyJf2jjXTlNtn7XEvwoqlW
 xGZ9U7XjFb5aHRSHStRfWnWc+x17W6AYPz58oZDuDbFfP3oyBe0KRN6yc
 qZoleBW35i6Ttff0l+gfWaPUI8kWBP/hP0Bc5+06/nIneTy5TyndW+ck6 A==;
X-CSE-ConnectionGUID: P3MiWHALQhSgZthEGsQkMA==
X-CSE-MsgGUID: gR72o423T9yeNBnxsj1pOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89696422"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="89696422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:42:35 -0800
X-CSE-ConnectionGUID: KM/bsJVzTByVsdMu+oNnxg==
X-CSE-MsgGUID: 7dpe4cIETGSupgcURne9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="211527614"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:42:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Low hanging pagefault refactors
Date: Thu, 12 Feb 2026 12:42:25 -0800
Message-Id: <20260212204227.2764054-1-matthew.brost@intel.com>
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

A larger series is forthcoming to refactor page fault handling for
performance. This set contains some low-hanging refactors needed for
that work, submitted separately to reduce technical debt ahead of the
main changes.

Matt

Matthew Brost (2):
  drm/xe: Pack fault type and level into a u8
  drm/xe: Avoid touching consumer fields in GuC pagefault ack

 drivers/gpu/drm/xe/xe_guc_pagefault.c   | 12 ++++++++----
 drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++++++-----
 drivers/gpu/drm/xe/xe_pagefault_types.h | 14 +++++++-------
 3 files changed, 22 insertions(+), 16 deletions(-)

-- 
2.34.1

