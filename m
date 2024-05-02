Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6861C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 10:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6336610F2BA;
	Thu,  2 May 2024 10:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLc8q1jv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2935E10E2CF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714645052; x=1746181052;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HsdtpUqrfZIbPhfhMI1YbiDQ6Peydk9xbY2vujfJ+hA=;
 b=BLc8q1jv8n7fwvgvAPIG2vI4sRfOyzwcc56bDwJGwOatsfdaKKG80zXV
 exqGF/hU+T+pKDIMtXJA8AL4EuKsH/aPcN2wpPW2//JmsUxLBT2aCilMP
 sPB5FImTpzqvHZKFf1VzcFXDRFj66xK3z+Pm/zwO5vahXr4kRZ9IY+Wua
 dLbfRpK70NDzStLD5B3NHSf3PyyJp90bOzEu2fybmvgKc9Fd9sUj8y6Z+
 Bfmrm/UAHNkwJOhvTj8zLimuCME/OONLvq86WrCus4KkuIvQHRaZY9K2D
 zHXeMNiBA0vAZTov0t5BBvnVbsQvcKisI1E0DLa//Zh66GLdoMtaamlYw w==;
X-CSE-ConnectionGUID: 0UiVg4Y3Tr6YLvZaWd5AXQ==
X-CSE-MsgGUID: HmihfFVgTFSAcJmR0cga/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10230652"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10230652"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 03:17:31 -0700
X-CSE-ConnectionGUID: BJKdIDiiTLyrKCVnKAJlbQ==
X-CSE-MsgGUID: GMmaNJZgSiCICqObgV3GrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31881361"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 03:17:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s2TVG-00000003HIw-45o5; Thu, 02 May 2024 13:17:26 +0300
Date: Thu, 2 May 2024 13:17:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] args.h: add more helpers for manipulating macro
 arguments
Message-ID: <ZjNoNoLib_A8EKNa@smile.fi.intel.com>
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
 <20240501223221.2395-2-michal.wajdeczko@intel.com>
 <ZjNAWXbyNqnLIB-L@smile.fi.intel.com>
 <d0d5a86c-3234-4cfc-b41b-f0b164d2e287@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0d5a86c-3234-4cfc-b41b-f0b164d2e287@intel.com>
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

On Thu, May 02, 2024 at 11:49:16AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 02.05.2024 09:27, Andy Shevchenko wrote:
> > On Thu, May 02, 2024 at 12:32:20AM +0200, Michal Wajdeczko wrote:
> >> Some advanced macros used to generate code may use helper macros
> >> to manipulate the argument lists. Define generic helpers that can
> >> replace existing local definitions and allow reuse by new code.
> > 
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > In general I have no objections, but as I pointed out in the reply to cover
> > letter the statistics is a bit scary, i.e. we add too many lines without clear
> 
> with another spotted potential user (macro FIRST from bpf_probe.h) and
> without comments those statistics will look like:
> 
>  drivers/gpu/drm/xe/xe_rtp.h         |  4 ++--
>  drivers/gpu/drm/xe/xe_rtp_helpers.h | 26 ++++++++++----------------
>  include/linux/args.h                | 26 ++++++++++++++++++++++++++
>  include/trace/bpf_probe.h           |  7 ++-----
>  4 files changed, 40 insertions(+), 23 deletions(-)

Still not convincing, I would suggest to have xe_args.h for now. You may put
a comment that if new users will come, these macros may be moved to args.h.

> > benefit. Anyway, if people okay with that my tag is above (but also pay
> > attention that args.h is used in dozen of cases, including headers, right now
> > and this extension may affect a lot the build time of the kernel).
> 
> not an expert here, but I guess the cost of parsing another dozen of
> lines should negligible compared with opening hundreds of other include
> files during compilation ...

-- 
With Best Regards,
Andy Shevchenko


