Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB5CC10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6E210F044;
	Mon,  6 May 2024 13:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTZTKGmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E52410F044
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715001466; x=1746537466;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PuCvFM/83tdEIP0xK+p9d0WGbSBxCUqTMT53Cvd/IAE=;
 b=cTZTKGmHm3LN6zX+mI3BaGnQovnzeeyrcqQQzKoJhq7FXkf1NTM2kgpk
 55eT67BjUB4u29m/oDeiJir7Afm0jvGHvVhUBf9SZNcAPn0YDfYglaIXa
 lvCmubLlXnJvbAcXE572qk73KKrWhhQtmhqSJ4JzTXLQkvUEYwDIAUyqf
 mdxnC1kj4Q+I+IFOMjdNwa77wot5OePm+1rYC1+X5l5CsWhv6C1KsoQiJ
 geAxHimRyalZEcffN9sxMsTW7XUaCHRE7iME1D4uZPTeQXw1ltSqN8rf3
 aeuSCLsNCTVi1/eRl3hZuy+RY6OW88CioSyNkoslItBeiHyyb7XPh/rUF g==;
X-CSE-ConnectionGUID: MrjLlzX9R36e52V5Wdy9eg==
X-CSE-MsgGUID: K/9OZ3mFRiegjMak02Iz+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21296484"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21296484"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:17:45 -0700
X-CSE-ConnectionGUID: U/yNkZzaRYCX9Oqk+wANsQ==
X-CSE-MsgGUID: DZAaNjSMQ/yPY3KYqoJhLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28257492"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 06 May 2024 06:17:43 -0700
Received: from [10.245.96.165] (unknown [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3912E28778;
 Mon,  6 May 2024 14:17:36 +0100 (IST)
Message-ID: <265a5c7a-0a22-4276-9535-2d6026cdfef7@intel.com>
Date: Mon, 6 May 2024 15:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe: Add helpers for manipulating macro
 arguments
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240502223313.2527-1-michal.wajdeczko@intel.com>
 <20240502223313.2527-2-michal.wajdeczko@intel.com>
 <ZjUJyy7Ziy8cWdx0@smile.fi.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZjUJyy7Ziy8cWdx0@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Andy,

On 03.05.2024 17:59, Andy Shevchenko wrote:
> On Fri, May 03, 2024 at 12:33:11AM +0200, Michal Wajdeczko wrote:
>> Define generic helpers that will replace private definitions used
>> by the RTP code and will allow reuse by the new code.
>>
>> Put them in new xe_args.h file (instead of infamous xe_macros.h)
>> as once we find more potential users outside of the Xe driver we
>> may want to move all of these macros as-is to linux/args.h.
> 
> ...
> 
>> +#define DROP_FIRST(args...)		__DROP_FIRST(args)
>> +#define __DROP_FIRST(a, b...)		b
> 
>> +#define PICK_FIRST(args...)		__PICK_FIRST(args)
>> +#define __PICK_FIRST(a, b...)		a
> 
>> +#define PICK_LAST(args...)		__PICK_ARG(COUNT_ARGS(args), args)
> 
> All but these have ARG(S) in the name, I would add it.

but then final names will be IMO little too long

	DROP_FIRST_ARG
	PICK_FIRST_ARG
	PICK_LAST_ARG

maybe
	FIRST_ARG and LAST_ARG

would work still have no idea for the replacement for DROP_FIRST
(and likely DROP/PICK FIRST will be more frequently used than LAST)

besides, CONCATENATE also doesn't have ARGS in it's name

> 
>> +#define __PICK_ARG(n, args...)		CALL_ARGS(CONCATENATE(PICK_ARG, n), args)
> 
> Interesting, why FIRST and LAST are not symmetrical. Maybe the first
> counterpart can use the __PICK_ARG()?
> 

the PICK_FIRST could be defined without introducing PICK_LAST combo

and PICK_LAST was initially considered less important (but still serves
as a part of the complete solution) and it is implemented based on
simpler (and more likely accepted) PICK_FIRST and DROP_FIRST macros

since series is now already merged to Xe, I guess we can return to this
discussion when we will be promoting these macros to linux/args.h

Michal
