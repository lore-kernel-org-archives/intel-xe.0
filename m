Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CCBCCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 08:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1325C10E9FF;
	Fri, 24 Oct 2025 08:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhBpspfU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1242A10E9FC
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761293712; x=1792829712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=louJdXNaqhBxzmMhU9pEO5/JzwE1VPD+3BQE0tQ16pw=;
 b=OhBpspfUGNTxRXAYP9dKHoJUtJU576NGVmGgCZjUzxZhgjIHq8yIbC0G
 tMXWnMJ7wU+7PHcNvk5iuYKzvIWIxWgb7NZoUAoVkBFLV7/f7rDvffyIi
 +rg6lfBPP7L/XCdhXtieIe+kXv6HfgGKKWwgnFOy+CahgZ3U3Pazawt0Q
 bbmSrsshtoHAj3sw2MNCRtZOkfVsqU7dwa9htNk4nTORPFjN3PpTmcqFk
 PyM1TPlRPtJsn+lnbu9JIR4ecRq40ou3rRlehMtPnGSXzCF5W2+vkUKFg
 fghOxSQOswD6KyDD6osSLtgBXo7C8YFyekeayYara4MySQB/2dxchlpHj A==;
X-CSE-ConnectionGUID: NO/4XpbGRSuUvNFlh/O+jg==
X-CSE-MsgGUID: P5pc02mHTpiycqA6HarxUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63397501"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63397501"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:15:12 -0700
X-CSE-ConnectionGUID: bfAkOOsIR2GPtj3zTmXsFA==
X-CSE-MsgGUID: GeGohE5PTsyEV62wxg2UWw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:15:10 -0700
Date: Fri, 24 Oct 2025 10:15:08 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/xe/gt_throttle: Add throttle_to_gt()
Message-ID: <aPs1jPILbBBUTICW@black.igk.intel.com>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
 <20251023-gt-throttle-cri-v1-4-9f36f3c8861c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-gt-throttle-cri-v1-4-9f36f3c8861c@intel.com>
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

On Thu, Oct 23, 2025 at 09:56:57AM -0700, Lucas De Marchi wrote:
> Reduce boilerplate code by adding a helper to go directly from the
> throttle kobject to the gt. Note that there's already a kobj_to_gt(),
> but that actually converts our kobj_gt object to gt.

Nice. These usually get me confused about where we are.

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
