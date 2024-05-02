Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68688C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 07:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CE110F137;
	Thu,  2 May 2024 07:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWHr/5HW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FF810F137
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714634846; x=1746170846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tEfpXmfpvZrkD5YWDTzE/rvlrz6VKJQ3h57+1QUoNVM=;
 b=OWHr/5HWGL7M+GTxJKnoGZf6iXT+RYA+gnjoJjwOjfwe6TA46CQW9qvN
 C3/Ie7QS2lvkjDSVPpGz9XwlJF1abEiAWJOm3Sg68fHl9BuNaCnJr7kxA
 O2YWql+UZwiJElv/CriqfSPLawZaguvmtkojsOgjL9f7aCEsL87rVUNAi
 NL12AEb5AvLNlrxq2GiYELwolEKRdlHaWX1zuAo/gFgtpYR6FBJY4qs0B
 fS3G7B3gnTTDesoFsjuU6fyapGzsoCLXXmz7sWgQIhGFSVWjvdQBvHi1u
 pZs4dTbYwLLZA1iyEufqcDXpBHEj2zEFCcX9bbU8GnJ11lN1/i7TU1raX w==;
X-CSE-ConnectionGUID: jbzE1ZVXSJK3IJKsqi/MLg==
X-CSE-MsgGUID: /2JX21QHTEyGD4pyfEp1CQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14170335"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="14170335"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 00:27:25 -0700
X-CSE-ConnectionGUID: Ju22IzAgToisl/hHNYJRuQ==
X-CSE-MsgGUID: E5cJ0uOAQZiNRMcQMD25Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="58229985"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 00:27:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s2Qqg-00000003Dxn-0Ug6; Thu, 02 May 2024 10:27:22 +0300
Date: Thu, 2 May 2024 10:27:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] args.h: add more helpers for manipulating macro
 arguments
Message-ID: <ZjNAWXbyNqnLIB-L@smile.fi.intel.com>
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
 <20240501223221.2395-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501223221.2395-2-michal.wajdeczko@intel.com>
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

On Thu, May 02, 2024 at 12:32:20AM +0200, Michal Wajdeczko wrote:
> Some advanced macros used to generate code may use helper macros
> to manipulate the argument lists. Define generic helpers that can
> replace existing local definitions and allow reuse by new code.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

In general I have no objections, but as I pointed out in the reply to cover
letter the statistics is a bit scary, i.e. we add too many lines without clear
benefit. Anyway, if people okay with that my tag is above (but also pay
attention that args.h is used in dozen of cases, including headers, right now
and this extension may affect a lot the build time of the kernel).

This also has to be sent to LKML.

-- 
With Best Regards,
Andy Shevchenko


