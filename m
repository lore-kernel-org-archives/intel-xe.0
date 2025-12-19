Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE5E6689C
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572CF10F0C9;
	Fri, 19 Dec 2025 21:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRo2ZGg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E96E10F0C3
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766178727; x=1797714727;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZNIJwOvZganhd6mQubG2W/HJc37VDT5IPZGSDZGdtyA=;
 b=XRo2ZGg/UgHE0ypYZfIT98z5Sh3KjhVLqM+its+Ftls8Frk+jJJS0r8o
 Pm9+iRYzGIU2YRt0WGLq4e5DsHvKxJA8VHmt/Jn5z2bSPjp8iTrlOlLIl
 sSrPU3pY5ROpwhcecHU0N1yojrEjb7Xw1Vk2v5aHAL1SMJHh44rqT2lsb
 BQrPZsraTjztZFysUDK57JbLExfxKEhglsXz5rW2/B2Mp6oJGnYIdU4Bk
 EBoT/ThsbrTNZs3uycI80/3rqnbyqEKZZ9WvLkZDLt4NvMoiS/htbHU0V
 M9taCSRE4+zP5qC9uO57q8kB1/Chk+qj9aTrKIB5wv7J9U8jE3kLyn2i4 g==;
X-CSE-ConnectionGUID: y7hhupptRq6idL+GMqKYtQ==
X-CSE-MsgGUID: ziIaezIfT2GenSWNwXT8pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78460619"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="78460619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:12:06 -0800
X-CSE-ConnectionGUID: Sfyv2C8dQ+GKfafFCpy56g==
X-CSE-MsgGUID: grOpAU0iSqiKPktcyd8sXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="204030369"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:12:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Migrate layer improvements 
Date: Fri, 19 Dec 2025 13:11:58 -0800
Message-Id: <20251219211201.4107410-1-matthew.brost@intel.com>
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

We have occasionally seen the migrate engine take a page fault. Add some
debug logs and assertions to ensure we know what we are doing.

Matt

Matthew Brost (3):
  drm/xe: Show migrate VM layout
  drm/xe: Assert VRAM address is valid in migrate layer
  drm/xe: Assert actual size of VRAM mapped in migrate VM is aligned

 drivers/gpu/drm/xe/xe_migrate.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

-- 
2.34.1

