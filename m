Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1657CD711C7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C687510EB9A;
	Thu, 18 Dec 2025 21:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gh0dP9Tp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6498F10EB8B
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766094264; x=1797630264;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IpM/WO2e98aO7/3s7cAyZ1+4XR6/1+WzG/Kox+nq5jk=;
 b=gh0dP9TpfkvDOkajgCY0K8hddEG601OEDDlgq+nHF8cugA2Ox04rn9D9
 9or2y/4v8+8PMFVgcoSSAIbuLAMzYg+3QIr//WAFycUUzisk+RYeIr12m
 tMA2MFBTlxfQ2u7IuAmqDiz4ybYiFcBl0rXRMeaHYMbHluzdA2G879/5S
 lDZubBOewCSZlT/ZbMCQshN05w2qW5Ok52HXbGTyeL4aZ/h1SENbm8fct
 jjFKxXUoo2W4VYJPsrbW8ej1WVGvL+DsWFzFPAgsjVKvyeezc3FQIgMxp
 HliVlgEl6E1YNsKuDxJhEwDQJcAtwRSaPv1IjdtJShWvR+enB60PT41xW w==;
X-CSE-ConnectionGUID: 1jXbevPyTFm70iiH7IU34Q==
X-CSE-MsgGUID: uft7arfNTUiqfRguGMdLCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68104128"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68104128"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:44:24 -0800
X-CSE-ConnectionGUID: xc1QAPM6TQuAUEOdZyzqiw==
X-CSE-MsgGUID: diyVOlQbQm+wsJqBWaNEEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199166547"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:44:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] Attempt to fixup reset, wedge, unload corner cases
Date: Thu, 18 Dec 2025 13:44:15 -0800
Message-Id: <20251218214418.4037401-1-matthew.brost@intel.com>
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

We have several bug reports [1], [2], [3] describing failures in reset,
wedge, and unload corner cases where memory is not properly freed or
fences fail to signal. This patch attempts to address the issue by
forcefully killing any remaining queues on driver unload and wedging the
device if not in mode 2.

Matt 

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
[3] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6029

Matthew Brost (3):
  drm/xe: Always kill exec queues in xe_guc_submit_pause_abort
  drm/xe: Forcefully tear down exec queues in GuC submit fini
  drm/xe: Trigger queue cleanup if not in wedged mode 2

 drivers/gpu/drm/xe/xe_guc_submit.c | 61 ++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 21 deletions(-)

-- 
2.34.1

