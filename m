Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BB5C0218A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 17:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F6C10E213;
	Mon, 27 Jan 2025 17:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6CtcPxX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D1210E213
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 17:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737997891; x=1769533891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysKlVzCC1MpUGcNiZMITTObyBPe24wFz/PhQJhW2Xwc=;
 b=X6CtcPxX1uHwPuGftl2MZmyt7K7RJzfY0ehXy9bDh8K4ctmDCJJHsfMf
 VnUIgSYXYJTupbY1wXyM+v6/Qu4uSx2Nbk3WCevLnrbv4h8c+WH5ezi0V
 SksWRS1K5393h6fQkzV2GRL79NMJCRFEG0Lz+PQzn05H/i4ixyVkTb5VP
 jfSgBR8ShmL89ahDkLJn9RyD2tfBVmcKk+JVgjUrVW7KMw2WargKNe6fu
 QzAZIedPJzjF7KoLjBI51UAMLzwJbBW0Vo9m7Lmmn+Psq35ANIThLYsEy
 oWERLAljbOAuWZQ5V3UvbawH28XmrTTbScJNygL0gGV2AnIfWSWHBitm+ Q==;
X-CSE-ConnectionGUID: 4oIrxIwYSCmhjC3ZcUUXrA==
X-CSE-MsgGUID: jLjuqy1lSgCveWP7zDUIwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49859478"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="49859478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:11:31 -0800
X-CSE-ConnectionGUID: 4l9h2PazSeu7vX5KJ2azWQ==
X-CSE-MsgGUID: LTVeypkDQ/OIRCdACcZJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108281969"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:11:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [CI 1/6] drm/xe/pmu: Enable PMU interface
Date: Mon, 27 Jan 2025 09:11:15 -0800
Message-ID: <173799774713.3216773.12948556637647760134.b4-ty@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250124050411.2189060-1-lucas.demarchi@intel.com>
References: <20250124050411.2189060-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Thu, 23 Jan 2025 21:04:06 -0800, Lucas De Marchi wrote:
> Basic PMU enabling patch. Setup the basic framework
> for adding events/timers. This patch was previously
> reviewed here -
> https://patchwork.freedesktop.org/series/119504/
> 
> Based on previous versions by Bommu Krishnaiah, Aravind Iddamsetty and
> Riana Tauro, using i915 and rapl as reference implementation.
> 
> [...]

Thanks for the patches and reviews. Applied to drm-xe-next.

[1/6] drm/xe/pmu: Enable PMU interface
      commit: caeb72c10ae8f2f0066dd22d395eab13a57677ee
[2/6] drm/xe/pmu: Assert max gt
      commit: 9dc0fbc14f62e4fd305f5fc04dd421f1a67844df
[3/6] drm/xe/pmu: Extract xe_pmu_event_update()
      commit: c4280ae68679b0c6f6a3c450dfe436c833d19084
[4/6] drm/xe/pmu: Get/put runtime pm on event init
      commit: e8e903c0f43867c16c56a2077f1c01f5301ced6f
[5/6] drm/xe/pmu: Add attribute skeleton
      commit: 2af91d1236d4ba2326f891ae209d7c4c8bb50602
[6/6] drm/xe/pmu: Add GT C6 events
      commit: b0fe5c3340457bd190107cc5822f8c024bbdeaf6

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
