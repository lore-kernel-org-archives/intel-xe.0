Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F8DCCFA06
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 11:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B5A10E075;
	Thu, 26 Sep 2024 11:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HR05JGa4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3460110E075
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 11:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727351828; x=1758887828;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8Y4LGaAgUfM6qyO5EBCQjMKpLuf+r+7ZMhyMRjWvXcs=;
 b=HR05JGa4g3ztFoE4rR6kTTrwks5kkEwdNCn/8mpbGM5Llndb7nUJggIR
 buUq0AIhu8tvSYqooaQMUfwU7ap5DCTZnFrySw2Dt4eXt2wrp9kuibBHm
 b4Z5cVZV5MxAz2W2KtR6hitWLmCwxDWA2eTJ1XiDEpVeMb4HmuDbgOq2h
 6BGpYlrhluahErn/wbnxXEgAPG8+z0GRy8W7sIupQH7e5sMxBJNWERNl1
 qveBKEGKt0JReqtvl8fGJJNjjR+M6TZ7DOqJjOVKNxupgoNuV4/7vCsJc
 xEJCGsv1Q3DNwIYaqa3FrNz+IZ4l26gTorHvwJZQnHdfl4ed5eUTU1Dvp g==;
X-CSE-ConnectionGUID: ShI4FIxPRsC1BQMauQoZeA==
X-CSE-MsgGUID: NuWZtkM6RiyopheffMJxKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26563343"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26563343"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:57:06 -0700
X-CSE-ConnectionGUID: iAIIo9DHRGCAMBt//laI3Q==
X-CSE-MsgGUID: ieswk7P2TRmwVuZj0oEwKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="102944287"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:57:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe: Use fault injection infrastructure to find
 issues at probe time
In-Reply-To: <ZvVJKGc_ltNgYDsl@fdugast-desk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240925155546.76630-1-francois.dugast@intel.com>
 <87jzey21i8.fsf@intel.com> <ZvVJKGc_ltNgYDsl@fdugast-desk>
Date: Thu, 26 Sep 2024 14:57:01 +0300
Message-ID: <87ed561vci.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 26 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
> On Thu, Sep 26, 2024 at 12:43:59PM +0300, Jani Nikula wrote:
>> On Wed, 25 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
>> > +/*
>> > + * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
>> > + * runtime and use a provided return value, in order to test errors paths in the
>> > + * callers. The requirements for the error injectable functions are not strictly
>> > + * fullfilled but this is acceptable because the caller only propagates the error
>> > + * up the stack without cleanup of resources potentially allocated here.
>> > + */
>> 
>> I'm curious on the details of "The requirements for the error injectable
>> functions are not strictly fullfilled". It's repeated many times, but
>> not explained. Maybe I'd like the info spoon fed to me instead of having
>> to figure it out for myself. ;)
>
> Understandable! I will make it more explicit in the next revision. Any
> suggestion to avoid the duplication?

All I can think of is adding a single, more thorough explanation comment
about the approach to error injection somewhere suitable (*), and then
have short comments referencing that.

	/* See xxx for details on error injection. */

or something.


BR,
Jani.


*) Where, I don't know...


-- 
Jani Nikula, Intel
