Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2D3C44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 04:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B342410E06F;
	Thu, 22 Jan 2026 04:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T03Ec/M3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82D310E06F;
 Thu, 22 Jan 2026 04:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769055714; x=1800591714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VO9fbcC2J2ZwVeozHnLJtPzwkJMrNVRB74vsm8f1l/8=;
 b=T03Ec/M39fH2Ln495l2/vjNN1FlFQD9g9God/YKeI/LyJgNm/hUUO4wm
 KeEEOyaisBG2sDDhFOKBVr0pDQ/sD+H69mLAf7ialHaF71fdIjlvjlYUJ
 pxxAazdATvv9YcwcSqckMU8hKUEkCoe4h9ztZU4sQyuj88tbkGKcUiPJO
 /nsfSc1Xje64uqerfu5ZRIAh6jiIyLSe5qp36/vqDVWFaKFTfVlGxiff5
 hejB+/yV7IeKdQST8R5d0lLDHSRw/xOe/Bcg2JWl86ymAVa1vV6Jef8+1
 gd876Wbhi/c/ddHzB8TMhrsTTQNzapbSvuPc12f5NNKH9PWRNjsZeZGYZ A==;
X-CSE-ConnectionGUID: gOG1OEA8R9qzmNQYsoQS4w==
X-CSE-MsgGUID: KbWOlvtWQgyecFKnbM0m3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81402265"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="81402265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 20:21:51 -0800
X-CSE-ConnectionGUID: pOwyEPitSmyRn8/F4WqZXw==
X-CSE-MsgGUID: 33l0yDgpSvuz5M2GJmgvQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="206230522"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2026 20:21:50 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH v1 0/1] Implement Wa_16024710867
Date: Thu, 22 Jan 2026 09:41:32 +0530
Message-ID: <20260122041133.757072-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

Reject PTL+ platforms in intel_ddi_port_sync_transcoders,
As port sync feature is deprecated from PTL onwards.

Mitul Golani (1):
  drm/i915/display: Implement Wa_16024710867

 drivers/gpu/drm/i915/display/intel_ddi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.48.1

