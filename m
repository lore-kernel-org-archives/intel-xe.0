Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79171C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 07:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E26B10EED4;
	Thu,  2 May 2024 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRVbH6j4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9063910EED4
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 07:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714634689; x=1746170689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RLYhi4pMSVDRtLryjed2HVeLnbFHn0EK9gnJDY1cQU8=;
 b=ZRVbH6j4EOMVW5ZLBSH7nLQphJCGxTPUeUp3uCK8umci347dNpIYkwI9
 XCXom66tHc3w4JBURahek3JCwAhxMt/RG+O2gn/9ghvDqVMY4acwBKfxp
 n7cb+tWDciNWwwM/qbAIiONcwFT1jXUJOyqyFhwBE4/v3aq3I1qHtQGc4
 /VG2d+Z+N7JMfchX7bI838zKa4Z9A70xWQKka4Y+7HrL6aQHJyUtpYnba
 EfkA5nbt1CKALO4O5gBlkcroHlDOgUXzx8Y+z4ULpqCgbNeUddzqRCtzh
 ZSWob8Q0POJ7qVkvd0jQmMQi9Pik749pTp1Q9YODILQsrUoEdNV8Jwg4m Q==;
X-CSE-ConnectionGUID: YeKAuGw0T6O3kyqvaKMnwA==
X-CSE-MsgGUID: fgNtyJ6bQRCHZGQEn6y9tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10514664"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10514664"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 00:24:48 -0700
X-CSE-ConnectionGUID: kl6Cd6H4RqymCpaZbcyZUg==
X-CSE-MsgGUID: /4+EFT+wQpulPcKuNa2dJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27538914"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 00:24:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1s2Qo8-00000003DvJ-49wD; Thu, 02 May 2024 10:24:44 +0300
Date: Thu, 2 May 2024 10:24:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/2] Define generic helpers for manipulating macro
 arguments
Message-ID: <ZjM_vNXn9JmlzOkc@smile.fi.intel.com>
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501223221.2395-1-michal.wajdeczko@intel.com>
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

On Thu, May 02, 2024 at 12:32:19AM +0200, Michal Wajdeczko wrote:
> Michal Wajdeczko (2):
>   args.h: add more helpers for manipulating macro arguments
>   drm/xe/rtp: Prefer helper macros from args.h
> 
>  drivers/gpu/drm/xe/xe_rtp.h         |   4 +-
>  drivers/gpu/drm/xe/xe_rtp_helpers.h |  26 +++----
>  include/linux/args.h                | 103 ++++++++++++++++++++++++++++
>  3 files changed, 115 insertions(+), 18 deletions(-)

It's good in general to have the code being deduplicated, but the above
statistics is a bit scary. Do we have more users where we indeed make code much
nicer? If not, let's keep these where it belongs to for now.

-- 
With Best Regards,
Andy Shevchenko


