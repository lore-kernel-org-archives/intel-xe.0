Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA84C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 08:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAF610E4DC;
	Tue, 18 Aug 2026 08:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7L9brmK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912BC10E29C;
 Tue, 18 Aug 2026 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787042827; x=1818578827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vl12PkdrN/rLhxz+bvAcv3mvoswb/CWQ/XrMn78Y18o=;
 b=Y7L9brmKqVoDnA8TyQ04QecVse7KIONFc3J/cviPzXJ2bQRK9865e/mx
 u+rvnuLyQdw4YNqhQjNP7TN7AHzZiyjzocluu2WwrxLtNnfNdcszgAzyF
 JIWEyqFN0yU9HEOxF9Gg02B/0lNTZtfUZ255JARXKiXa4HzHwPv3Y9lIX
 LTdXm7vU21HjOUzMN4x+Cob7PaQglHfd7mhSZOM4rUtaf1CBJA1SM6fR/
 d+FJQ/d2DG8fkRFQ+w5VKxRJeB/FlfbFnkeVQ6e0uvEi4H+lX5LwOjDBR
 k0B2zEMKu5G5uDMfM2OryuL5ECMqWeA/d7DDcvAn27YKNcHnfLP1JilCj Q==;
X-CSE-ConnectionGUID: 3BgZcZcFTleLuaG63pzn1Q==
X-CSE-MsgGUID: rR/OFmdiRyeBiZ40VtBf6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87403705"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87403705"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 01:47:06 -0700
X-CSE-ConnectionGUID: dw+sDVdLRIG/J70yAH2tbg==
X-CSE-MsgGUID: l2FYgzksRxqZ/PWL4wMEmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="267136503"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 01:47:05 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/6]  Enable joiner cursor fast updates
Date: Tue, 18 Aug 2026 14:12:30 +0530
Message-Id: <20260818084236.2168580-1-nemesa.garg@intel.com>
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
  drm/i915/cursor: Program secondary cursor planes
  drm/i915/cursor: Schedule cursor unpin per joined pipe
  drm/i915/cursor: Allow joiner cursor fast path update

 drivers/gpu/drm/i915/display/intel_cursor.c | 274 +++++++++++++++-----
 1 file changed, 205 insertions(+), 69 deletions(-)

-- 
2.25.1

