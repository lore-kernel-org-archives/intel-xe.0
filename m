Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271B2C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 17:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E104F10E472;
	Mon, 31 Mar 2025 17:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRhwyWVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E9B10E472
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743441229; x=1774977229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GQ6R9e+QAi5O+gfSlLrGbuOdUsMN26KxHsOv/nXqIRM=;
 b=LRhwyWVTZHjeWw5TYtZlphl3xNxyQ4ssq5Fatoc7MQDJFvb+AEf5et7n
 a1uYUVYDDIDzCRbfBrzHFQ4cHx4ZRI7Mj6QEyIpfhqueSh+BTu5XWIz60
 8R+VWoNgGAA4QtrBQ8sE3fPx5PNro14fcbkbdIWcPKWSVj0HghLWH1OKe
 +1ftQZFnGiqRwk9bnYwBfQ2tqrg3zfsnN6jCb2M3IruZaKRtfcAWLquyM
 56MZk5vyB/vww6dpAT8BIz57LPfsNBS4PB2FeSAPm/gB7e+gb16PfjCax
 xybktdGrcBUdX6DeZ6JM+bjZ8L1evjjntIznj2BzgldYtgYkldcUQiHhw w==;
X-CSE-ConnectionGUID: 3hUXBGbeQimDM89Qizq9RA==
X-CSE-MsgGUID: cODWVEiVT9O4EVh0Se5Psg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44650712"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="44650712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 10:13:44 -0700
X-CSE-ConnectionGUID: 0IL39QLyS5+fFnReSNdVSw==
X-CSE-MsgGUID: g9NqX/MYTvCa/whLGt8EDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="126947554"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 10:13:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()
Date: Mon, 31 Mar 2025 10:13:28 -0700
Message-ID: <174344114456.2117673.9071095648159099028.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-v1-1-ceb9ce7c8bc1@intel.com>
References: <20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-v1-1-ceb9ce7c8bc1@intel.com>
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


On Fri, 28 Mar 2025 13:50:50 -0300, Gustavo Sousa wrote:
> The context of each engine starts with a 4k scratch memory space for the
> "Per-process HW status page" (PPHWSP). In xe_gt_lrc_size(), we have been
> implicitly accounting for that page in the switch statement on the
> engine class.
> 
> Since the PPHWSP is common to all engines, let's extract that into it's
> own assignment. That makes the context structure more explicit in the
> code and aligns better with the descriptions in Bspec.
> 
> [...]

I removed the word "scratch" from commit message and applied to drm-xe-next.
Thanks for the patch and review.

[1/1] drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()
      commit: bac016066536cc050046c20807ca8b650c55cc70

Best regards,
-- 
Lucas De Marchi

