Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89170C2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 00:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCCC10E134;
	Wed, 26 Jun 2024 00:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3py7/nA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2987C10E134
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 00:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719361944; x=1750897944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WtsPtRoCXIoQRb/yNLaBmaLDGz8PYAq+zZpt3gADWG8=;
 b=B3py7/nAXfGPaujORvrw6UaMHt4716ssUDOPfzVBxaMufZR8gqMXZEl+
 Fz3hd0WhPGmmYE/95plLt26aMkJZ97ltFLGiAQNr7SmV9IvxNNHTDpTOm
 b57pxoSPDOQ8faoxEjDrTCPZmrKI++9ZWPKO/Ly4BoZaxQ2ytw2/txKZp
 AaWexjN+EFTpp5eoQEHfi7nU+Gh37yXWH66SQ4a/KONqHzgQc/UwzSsWd
 M290KVvjGJaiNn8f6fPOjzbhuwjdUSR8gcGJvSrCrOqOL9ptBzQPMG0J7
 uDyh5XU+cRwMCyqP3zH9r5iUnbKg0FFZSD3e7PPDKUdxQ4QbboMVYqeyK A==;
X-CSE-ConnectionGUID: lQtMvyHfQFeE5dFiTImS9w==
X-CSE-MsgGUID: l56BXpfJRhyF2gD23vL/3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="41828729"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="41828729"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:32:23 -0700
X-CSE-ConnectionGUID: K0795PMpRkSIMNqXpJRtmQ==
X-CSE-MsgGUID: MnEJYWLZStSLiRiJghOV4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="43896483"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:32:23 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>
Subject: [PATCH RESEND v4 0/2] drm/xe/oa: Add NO_PREEMPT property
Date: Tue, 25 Jun 2024 17:32:10 -0700
Message-ID: <20240626003212.1048545-1-ashutosh.dixit@intel.com>
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

Add DRM_XE_OA_PROPERTY_NO_PREEMPT property. This is intended to be Xe GuC
equivalent of i915 property DRM_I915_PERF_PROP_HOLD_PREEMPTION.

v2: Introduce no_preempt exec queue op
v3: Introduce set_no_preempt and clear_no_preempt exec queue op's
v4: Revert to v1, which doesn't add new exec queue op's

Ashutosh Dixit (2):
  drm/xe/oa: Allow stream enable/disable functions to return error
  drm/xe/oa: Allow preemption to be disabled on the stream exec queue

 drivers/gpu/drm/xe/xe_oa.c       | 104 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 include/uapi/drm/xe_drm.h        |   6 ++
 3 files changed, 98 insertions(+), 15 deletions(-)

-- 
2.41.0

