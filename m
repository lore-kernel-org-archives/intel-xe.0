Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EACC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 13:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B0D10E38F;
	Tue,  7 May 2024 13:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbFnzyMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C74710E38F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715087308; x=1746623308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TEmk9OJe7XPc42rjeq9RRuwyAO+7VMMBG6VGb7m1uKg=;
 b=VbFnzyMb0cW/Unh6JyO0E2JjJtfoaaFH0g/5mgT7hmM/dI+OVft4IOUq
 3mT7SYIJDGiQGYx4JEu93O6NIN2jlNd5SYzu3nUUc1m2KLBSV0+ObtsQ1
 yGIab5qgquuzuu5U3cFoghNLyxlpZw2twwAPPUKBaWQ/OmmsEIEzATmRl
 gsc8Tz6ZTlKOuUx8XisnnGXpFG+hrloWQzp1deWu/D3znG3pleAclcF3F
 OO6U5nbl5MhgtTe8sJT5xtNHyGBjda0Y3r9+BMDbrR3F+ufOsIqsVdR9p
 Z+BOTe0mijVJkJrIQe0rPdedKSdodpOHN2nv3LUcLvtSYK6ioazi99GTt A==;
X-CSE-ConnectionGUID: PCrIWVCNQPmYnTwi2DWLag==
X-CSE-MsgGUID: n6p2CFO3Q4615p1nwrSQKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11408847"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="11408847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 06:08:28 -0700
X-CSE-ConnectionGUID: Im7dOQrKT7mdKiKTjykBUw==
X-CSE-MsgGUID: tslBoJApSbGSDyuO4FaIpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="33190179"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 06:08:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s4KYS-000000052aS-15on; Tue, 07 May 2024 16:08:24 +0300
Date: Tue, 7 May 2024 16:08:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Rename few xe_args.h macros
Message-ID: <ZjonxyRr6K91Rytg@smile.fi.intel.com>
References: <20240506215618.2703-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506215618.2703-1-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, May 06, 2024 at 11:56:18PM +0200, Michal Wajdeczko wrote:
> To minimize the risk of future name collisions, rename macros to
> always include the ARG or ARGS tag:
> 
>   DROP_FIRST to ARGS_TAIL
>   PICK_FIRST to FIRST_ARG
>   PICK_LAST to LAST_ARG
> 
> Suggested-by:: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

One colon is enough :-)

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

No need to have a Cc for the person who has already mentioned in another tag.

With above being addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


