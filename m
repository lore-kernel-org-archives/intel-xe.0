Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFA3C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 17:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D0D10EA80;
	Thu, 18 Jul 2024 17:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQLTYPpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837AD10EA80
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721324041; x=1752860041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dnwdi/j7owa7ae516y1AG0MyYW4leuWU5/SpKm71frg=;
 b=MQLTYPpu2A92oR4s1NiiYjouDmVyRLjUMnVhtGNQ0V1JfDxDaNU4tgjP
 B4f6RbwNXvGlQkCnyLh4lr5IcH1L2rHYaaMiqkuuRdotvs211hMfInH+1
 G7/qdOLgz/Wy7ocy6aYvha5lNkzds0onfUEVV+WURj8b/G2P/rP2lvPyC
 NtT5lzhiTYtBslfNwGpTcY11nY6JKhcobfRi16Ho9SHpLBUzUFn5Z9y3u
 bOJcVgvVQw2v4bTpiF1l20UCd4Y5R+xIMidikBoAV0M0XjJhIgyxf31lu
 cy4twMi7+AK22K9Ejppr77vLhKsi6yQXhh0f4OMVArzBygv/ct6ntJaA7 Q==;
X-CSE-ConnectionGUID: 2Jw6io5USLWVqCKD9bThAQ==
X-CSE-MsgGUID: G8EpKWZGS9+baY64oOGqJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="12613128"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="12613128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 10:34:01 -0700
X-CSE-ConnectionGUID: bi6ZcQlUSUS1HyYR4X7DrA==
X-CSE-MsgGUID: iE/YbO5zRS2+6hP2EMdwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="50887867"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 10:34:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	nirmoy.das@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH v3 0/1] Build PM into GuC CT layer
Date: Thu, 18 Jul 2024 10:34:44 -0700
Message-Id: <20240718173445.1490455-1-matthew.brost@intel.com>
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

Alternative solution to [1] to fix GT TLB invalidation issue raised in
[2].

Matt

[1] https://patchwork.freedesktop.org/series/136219/
[2] https://patchwork.freedesktop.org/series/136145/

Matthew Brost (1):
  drm/xe: Build PM into GuC CT layer

 drivers/gpu/drm/xe/xe_device.c     | 4 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c     | 8 +++++++-
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
 3 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.34.1

