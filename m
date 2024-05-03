Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FEAC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 15:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70E010FCC7;
	Fri,  3 May 2024 15:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bl7okJAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD92E10FCC7
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714751953; x=1746287953;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GdmCaENkuEISvry12Ptar9eKJ6+JeeHCEjGU8/ZSa3g=;
 b=bl7okJADh/8iT6+FhOeMbpP2IRh30K2sCZvhS0nceCOHHsrUt67o6vWt
 wSzBiInySqYH3+G9R/gDzALLr6IkirGKd8jFnoJhA66LyzNNuZfU+Jc2x
 z/NwfTA5tD/us4q8Fly8mqJ6Or6hhjdRLM3HRojT6HuR7Qh/HW2ThAY63
 hFGbTqmSEGKiey2fiIhAWWohVzB2TxuX3UTHu+11bIhoOgIRJkus3xNrV
 zJFk03TNV/7c04EjWjpSa1sMF+DJC6Xv7rSahkGirNfCgFo0XSk2FqWCH
 sQxlI865QRR6fEX7lKzd3UwLhC8uggajA/2EE1ZmUwU7SjR8/lW5nZ+df Q==;
X-CSE-ConnectionGUID: gGBGhLtvRniLUdJag02yng==
X-CSE-MsgGUID: UDneiSEjRdmPJAT/SnQj5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14381391"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="14381391"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 08:59:13 -0700
X-CSE-ConnectionGUID: naWrZNkAQMmvLrypBpJdkg==
X-CSE-MsgGUID: rkDq04B8T9GyguElsKbZzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27513877"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 08:59:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s2vJU-00000003hFH-0co5; Fri, 03 May 2024 18:59:08 +0300
Date: Fri, 3 May 2024 18:59:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Add helpers for manipulating macro
 arguments
Message-ID: <ZjUJyy7Ziy8cWdx0@smile.fi.intel.com>
References: <20240502223313.2527-1-michal.wajdeczko@intel.com>
 <20240502223313.2527-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502223313.2527-2-michal.wajdeczko@intel.com>
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

On Fri, May 03, 2024 at 12:33:11AM +0200, Michal Wajdeczko wrote:
> Define generic helpers that will replace private definitions used
> by the RTP code and will allow reuse by the new code.
> 
> Put them in new xe_args.h file (instead of infamous xe_macros.h)
> as once we find more potential users outside of the Xe driver we
> may want to move all of these macros as-is to linux/args.h.

...

> +#define DROP_FIRST(args...)		__DROP_FIRST(args)
> +#define __DROP_FIRST(a, b...)		b

> +#define PICK_FIRST(args...)		__PICK_FIRST(args)
> +#define __PICK_FIRST(a, b...)		a

> +#define PICK_LAST(args...)		__PICK_ARG(COUNT_ARGS(args), args)

All but these have ARG(S) in the name, I would add it.

> +#define __PICK_ARG(n, args...)		CALL_ARGS(CONCATENATE(PICK_ARG, n), args)

Interesting, why FIRST and LAST are not symmetrical. Maybe the first
counterpart can use the __PICK_ARG()?

-- 
With Best Regards,
Andy Shevchenko


