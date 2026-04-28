Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC18FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AE110EBC5;
	Tue, 28 Apr 2026 14:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFRjEUJH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D337310EBB7;
 Tue, 28 Apr 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386069; x=1808922069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PRYt6HgYM60zbLlUvO7b1lkGIAJBlPIob+Er9MUvj6Q=;
 b=IFRjEUJHd0d+B0Tca5+4wLIAqXcDOj7EwwxWj4iEqhtxhVA0Dlk4ws79
 LTQPzPBbE5bTmbEF1Os3T/o/3KaV0ObwZp7nq23ZnbSEcd+6pGrpV5Zxw
 0dFsAL+WM8n1I5Q2JgDb1xudlWMiluWG3+b0cKhvBMrtAVgS+HO0BcBle
 GlsSl1o2YLVMQPUDUeXiejRAtVVfUkb9PrdLfFMK1xmeuc07cy0DhE4a+
 6qvrREbg25eyvMX9EdxnFYIchjkfZP8f/3w6M7TtMT7yi4D/6DfdFXLEr
 8LjKFEBtkUywSwVJQSCmXk5Ao2QDpHXmYdobg7zH76PvmhQqmzrzBfb+F g==;
X-CSE-ConnectionGUID: g1DT8gPBSu6nHtToz2fn1Q==
X-CSE-MsgGUID: 7bLS+M3vTECqoUIeoiW95A==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89756380"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89756380"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:21:03 -0700
X-CSE-ConnectionGUID: kIb8dRnyQHGFhsQRhai2Iw==
X-CSE-MsgGUID: NTl1k8hzSX2ouiJzb6eobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="227445400"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2026 07:21:02 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/6]  Enable joiner cursor fast updates
Date: Tue, 28 Apr 2026 19:46:33 +0530
Message-Id: <20260428141639.2373678-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

    This series enables the cursor fast path for joiner mode
and adds the missing secondary-plane handling to keep updates
correct and synchronized.

Nemesa Garg (6):
  drm/i915/cursor: Check joiner cursor commit status
  drm/i915/cursor: Add helper to update cursor plane
  drm/i915/cursor: Handle secondary cursor state
  drm/i915/cursor: Sync joiner secondary cursor state
  drm/i915/cursor: Program secondary cursor planes
  drm/i915/cursor: Allow joiner cursor fast path update

 drivers/gpu/drm/i915/display/intel_cursor.c | 284 ++++++++++++++++----
 1 file changed, 230 insertions(+), 54 deletions(-)

-- 
2.25.1

