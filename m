Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87C6F94CDB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 07:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A310C10E222;
	Wed, 22 Apr 2026 07:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAZbMX15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2477610E152;
 Wed, 22 Apr 2026 07:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776843672; x=1808379672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HZjkpinlYvkr8fzjIYvTFD/QaMfdB9BbbsteMQk27cc=;
 b=bAZbMX159y5js55Cwlc4TYMBlkAABHokXuiUlQofV+yHYHtv/1ptzfpu
 EWKDSb7Udav4PGd/hnqJCh/N3UGhpPhiYXRfJN1CufOWelZ2JghO2YYDi
 IDAkRHkBhs3XLvAyFnFbZRuOmgf7k+mwIuDsUoOoJAyijExp6PWhvs99v
 Wy4AOlY1ug7pUuIV7SL15LLJuemACu/iyTlKpp20g08YBbFUgdPNiArQ1
 uyrcajSShbfdY/ZSI9FFuj6Gmagudzw4TIJ2+gRsu+57u+r7ydLMkc3yG
 LiOYJAVAnsp58TZe8wOkZRHsYQGwlAszwkjgppRu4oSbi0dEPTYv4+VRe Q==;
X-CSE-ConnectionGUID: eH1CKiPMQ2C7H4rQo19law==
X-CSE-MsgGUID: oDUiog9LSoqTeo8JFsIOIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89177156"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89177156"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:41:12 -0700
X-CSE-ConnectionGUID: ZibytzjZRIacdqmptkGIJA==
X-CSE-MsgGUID: LSgpg9mNS+W/+wyvgfGllQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229114673"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2026 00:41:11 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/6] Enable joiner cursor fast updates
Date: Wed, 22 Apr 2026 13:07:16 +0530
Message-Id: <20260422073722.1861494-1-nemesa.garg@intel.com>
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

 drivers/gpu/drm/i915/display/intel_cursor.c | 184 ++++++++++++++++++--
 1 file changed, 168 insertions(+), 16 deletions(-)

-- 
2.25.1

