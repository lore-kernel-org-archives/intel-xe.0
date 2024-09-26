Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75707CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 09:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1BD10EB80;
	Thu, 26 Sep 2024 09:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNUnWsjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661CE10EB80
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727343846; x=1758879846;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=N7Ffiw27F8OtZZGQQnYIpLMTYKCFpaxZegQCHTo+8pw=;
 b=eNUnWsjt99gO2i7uO3DEbeNQXUva6UV7Jg4MJHFxw6YydJ99Iw6BeRYS
 MS9WKot04iFxp6SYiLRf/SIWD8I8V7sZHKGobjRWlP0SxIAGL/y2QyLGI
 WP02rql4IW5Y/9+7SgsyBEf0lIThIzG9M1IQY2JRzHf7x/2wNQC1yJB57
 CmN+r+jnLmjF2MN7ABCW4ayB1Tjmr2/hCm+IeyjyAMwj7WW/Q2zEL1zEC
 nNFv06Ty2aa8THg9teYFBrrS0a4npLnBnsh+zdLNVfdl9qMhF8dtKk7TS
 35tdm5UYa3rFgLhKjh0xiD4neJ9MdMwG167x0WIZlXoTDK1WM3rA3Gjdx w==;
X-CSE-ConnectionGUID: h4+OOH3nRfmh93/06KiOCQ==
X-CSE-MsgGUID: rY14FG7RTMC35GkrOLHV0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30221367"
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; d="scan'208";a="30221367"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 02:44:05 -0700
X-CSE-ConnectionGUID: CwR7GM1yTJW7RosdOo3BWA==
X-CSE-MsgGUID: Mz8PlwYyQzu+Ey4jLhyk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; d="scan'208";a="76583461"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 02:44:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe: Use fault injection infrastructure to find
 issues at probe time
In-Reply-To: <20240925155546.76630-1-francois.dugast@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240925155546.76630-1-francois.dugast@intel.com>
Date: Thu, 26 Sep 2024 12:43:59 +0300
Message-ID: <87jzey21i8.fsf@intel.com>
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

On Wed, 25 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
> +/*
> + * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
> + * runtime and use a provided return value, in order to test errors paths in the
> + * callers. The requirements for the error injectable functions are not strictly
> + * fullfilled but this is acceptable because the caller only propagates the error
> + * up the stack without cleanup of resources potentially allocated here.
> + */

I'm curious on the details of "The requirements for the error injectable
functions are not strictly fullfilled". It's repeated many times, but
not explained. Maybe I'd like the info spoon fed to me instead of having
to figure it out for myself. ;)

BR,
Jani.


-- 
Jani Nikula, Intel
