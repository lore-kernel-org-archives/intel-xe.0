Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5499FE6B27B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 13:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179EE10E2D7;
	Fri,  1 Nov 2024 13:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnVr8R2a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA3B10E2D7
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730467265; x=1762003265;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1ASEgG2xQ413CWrh5QFSHQlB8KX65S3r1j0stYmpXBI=;
 b=WnVr8R2aepTQGh5AsJ68PJ58yu3+SAVZm17G0gxzdv5j5PtSpnLDJWkc
 QLzhtA6deTEzKjAOISEQgM2NcRJPuSKJUN3oXkdg9MBoIskwApJGYpmeq
 AVmozaJr1c3BJwZ+W/g5kcyNODzdFdE16l0maaBUJXEPdiRNQwIxh1RY4
 IHUOR5iQCcm/7jRAkhKduCC6Bjkf0EaSZR140WQ4QorGxzBHn6Kd/OH/W
 b3iwanyll//LRo2NybszqgS6qwkuDnahQHXiIyjoGwsnpi7GpbBnowpE3
 juQz2fQ4KpZD+lxhFA5ZGMkE+VLyFChwaYUS9FKtdhZr3QY57uatVTmBh w==;
X-CSE-ConnectionGUID: 1BK+Qxt7SA+BsnH8aHteQQ==
X-CSE-MsgGUID: QI8HeyL5TQGP6i4KlOFVUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30395938"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30395938"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:21:05 -0700
X-CSE-ConnectionGUID: hO8Og36ESzibQlpjPjrpkA==
X-CSE-MsgGUID: 87eRw875RuWEOe4kwyraCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="88086775"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.34])
 ([10.245.244.34])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:21:04 -0700
Message-ID: <9d9c47de-c1ab-4c5e-b4ac-9eeff730e4fb@intel.com>
Date: Fri, 1 Nov 2024 13:21:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/xe/ufence: Flush xe ordered_wq in case of
 ufence timeout
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
References: <20241029120117.449694-1-nirmoy.das@intel.com>
 <20241029120117.449694-2-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241029120117.449694-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29/10/2024 12:01, Nirmoy Das wrote:
> Flush xe ordered_wq in case of ufence timeout which is observed
> on LNL and that points to recent scheduling issue with E-cores.
> 
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is a E-core
> scheduling fix for LNL.
> 
> v2: Add platform check(Himal)
>      s/__flush_workqueue/flush_workqueue(Jani)
> v3: Remove gfx platform check as the issue related to cpu
>      platform(John)
> v4: Use the Common macro(John) and print when the flush resolves
>      timeout(Matt B)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

