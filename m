Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2D8F46C6D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 18:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C42710E291;
	Mon,  6 Apr 2026 18:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WL0o7MtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BCA10E290
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 18:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775499948; x=1807035948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j25sDjqCDnbq180WbyrrLZ/+OpGPAh3vPD9NrzyRFzM=;
 b=WL0o7MtZLbevzZKUXbFw3kGmGuBv9DfFnYeDGGmbUjj6hOLGX0yx+mER
 /Fx1Lr2F1BSaoxA1ppHrppzXNLYEkde/4cDFWuO27lvGTIXTxjJ6f10ga
 AZv7k8m/YXuybPStCiKMHQXPxhgOm6MsT6PT5VQj/MMsp0FxDGDnVlNjB
 lqTwE7yxb3aN6rCVKHZLvIrjj+bTJjxJ3wdApVcOhvQSz85nynz0lkAnF
 xN9Hjcr7i8CrjVTQe2exh8xJ4Ge9DZc3685VAnhEPGHcjcF4gJW8wfrDb
 CZTVVmMSjap/8TDMQcZ7NkwTBQ3kuUYT0Ul8rLWFDIYF/ofPKYwyTXiYZ w==;
X-CSE-ConnectionGUID: dLKidv2RS0m9aJBJ1xoSWg==
X-CSE-MsgGUID: kd4fmiwIQFq/mlAX+aVScg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="94034677"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="94034677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 11:25:47 -0700
X-CSE-ConnectionGUID: ps9phx39Ru6FPKgb7GAfUw==
X-CSE-MsgGUID: gcX0a+WrTWGyh+AJnBLOAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="251213734"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa001.fm.intel.com with ESMTP; 06 Apr 2026 11:25:47 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/2] drm/xe/pat: Type cleanup and invalid index hardening
Date: Mon,  6 Apr 2026 11:25:44 -0700
Message-ID: <20260406182546.569131-1-x.wang@intel.com>
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

Small follow-up series to harden the PAT subsystem:

Patch 1 fixes two remaining spots where pat_index was typed as u32/int
instead of u16, aligning with the rest of the driver.

Patch 2 defaults XE_CACHE_NONE_COMPRESSION to XE_PAT_INVALID_IDX (like
WB_COMPRESSION already does) and adds xe_assert() guards in xe_migrate
to catch any use on platforms that don't support it.

Suggested-by: Matthew Auld <matthew.auld@intel.com>

Xin Wang (2):
  drm/xe: Standardize pat_index to u16 type
  drm/xe/pat: Default XE_CACHE_NONE_COMPRESSION to invalid and assert on
    use

 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 9 +++++++--
 drivers/gpu/drm/xe/xe_pat.c          | 1 +
 drivers/gpu/drm/xe/xe_vm.c           | 2 +-
 4 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.43.0

