Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED1CCF9E9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 22:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFD210EB44;
	Fri, 24 Oct 2025 22:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvmCvUfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE87A10EB42
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761344452; x=1792880452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ByZkdBuCUmdQYBPErSQlYb2wEZBS3xxNheyS5vzeqkQ=;
 b=gvmCvUfOwSyC6F8kXJH8wbpoYmb9H5HJQ8cCJOnPxSaOl1YvUrDFFjw/
 vUrigUBb3bt4O+JxUzfVlIhG5pqhW8Xj3Khy8FNA/WiN1jgyMe9sA2Ekq
 aUHIHEJkEBBvvlIk4W+pF2WUJnLP3a0ELME0FFpfaF7G9s5UCIUcTyOM5
 3Up0E2jNMesAuXCBmpG180IxNlMRzD4Wb/w1No8aHPOFX3g7FbaXxIyUZ
 sftu4aVSUIHwNFxQ8qAvScYvztUygAidlm0wJNCcYNvHfNvvNhg6oO8T7
 cTEdz9kNo3GP9kGgMPq+CkS0/pXkTbFVVH0ybnM9ab3Emm7unc4neqwXt Q==;
X-CSE-ConnectionGUID: Wy5U09V6SS22rkF767iTXQ==
X-CSE-MsgGUID: mClW8eoQQKm2URogE1NOkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74874632"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="74874632"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:20:51 -0700
X-CSE-ConnectionGUID: Wl1S2yk3QqSnR30+gA5M7Q==
X-CSE-MsgGUID: j4qpa3ljSEqjnecHpzekmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184241681"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:20:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 0/2] Fix serialization on burst of unbinds - v2
Date: Fri, 24 Oct 2025 15:20:45 -0700
Message-Id: <20251024222047.1481039-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Attempting to resolve part of [1]; this solution differs than v1 [2] by
changing last fence semantics detailed in the patches.

Overview of issue in [1]:

When a burst of unbind jobs is issued, a dependency chain can form
between the TLB invalidation of a previous unbind job and the current
one. This leads to undesirable serialization, causing current jobs to
wait unnecessarily for prior TLB invalidations, execute on the GPU when
not needed, and significantly slow down the unbind burst—resulting in up
to a 4× slowdown.
 
Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
[2] https://patchwork.freedesktop.org/series/156144/

Matthew Brost (2):
  drm/xe: Add last fence attachment to TLB invalidation job queues
  drm/xe: Decouple bind queue last fence from TLB invalidations

 drivers/gpu/drm/xe/xe_exec_queue.c       | 105 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  18 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 ++
 drivers/gpu/drm/xe/xe_pt.c               |  64 +++++---------
 drivers/gpu/drm/xe/xe_sync.c             |  58 +++++++++++--
 drivers/gpu/drm/xe/xe_vm.c               |  60 +++++++------
 6 files changed, 234 insertions(+), 76 deletions(-)

-- 
2.34.1

