Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227B4E77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 17:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D277510E26D;
	Fri, 13 Dec 2024 17:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgM9XDb9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462B510E26D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734110780; x=1765646780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jAn8Tcn2aQSiimygXRwEQQgqlGh15S9fdmL42j/T+8o=;
 b=kgM9XDb9vO6wre8X9MCOiZeJvGF/Fp/calh04mSU9++/nQIANyqXoXEp
 vulkQaiqLHAMv0xBGCjdRJBc2mFh72yaxiIaHf0pRLZRhSRSVgdaxbOzA
 nVEynwuHdDNpX8RajGZPFCmnfCwLuNtm0LCVg+tw987C0Gqr4rix/exYA
 mL3tCQN+JVvZWH8GhF+8B4EQM31du7QEwYyCop08FZQR0iK4Zo/SizhfT
 h84PeF/QE9BbCU+rSdXtD3SbSwF/luxGnoo42WOTBR6TgiNE6Zr7N/ADg
 Pdag3NW2ezZapyZjwoG9SPinu3NbgDgt0tnYbu39Kjm1xSlZXnFHo5uwi g==;
X-CSE-ConnectionGUID: UyPGh4poTRmaY79TYPbcrQ==
X-CSE-MsgGUID: OM3gpzfpTvSal08xZFKzUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34709819"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34709819"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:26:19 -0800
X-CSE-ConnectionGUID: oRJgRYaJSjO4ppA+5UGTdg==
X-CSE-MsgGUID: WzP8TNK9TQ6CFCDROj5Izg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97376277"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.218])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:26:19 -0800
Date: Fri, 13 Dec 2024 11:26:10 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, 
 aravind.iddamsetty@intel.com, john.c.harrison@intel.com,
 ashutosh.dixit@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v2 7/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
Message-ID: <uzxdbdx6cceyvijbabppxtusznkm2tbb3pz6xjamtnsu4yhexm@gtqawko5tv2o>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-8-riana.tauro@intel.com>
 <u3bmt4wjtini2n7bes6gyq2f23kboagca4ee3ekg3oer3qjujj@mh5ct5xwggo6>
 <30a06548-d50f-4c57-9697-39a2bc3a562b@intel.com>
 <htcdqjyj75ymzb6ywe6wczq7vyhop4cocco7pj26sseajtlmo5@hafxw5sqtbj7>
 <588b5829-e5fc-4450-bf83-4f2cf05cf29b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <588b5829-e5fc-4450-bf83-4f2cf05cf29b@intel.com>
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

On Fri, Dec 13, 2024 at 11:40:38AM +0530, Riana Tauro wrote:
>
>
>On 12/13/2024 11:34 AM, Lucas De Marchi wrote:
>>On Fri, Dec 13, 2024 at 11:30:38AM +0530, Riana Tauro wrote:
>>>Hi Lucas
>>>
>>>On 12/13/2024 11:14 AM, Lucas De Marchi wrote:
>>>>On Thu, Nov 21, 2024 at 12:09:03PM +0530, Riana Tauro wrote:
>>>>>Engine busyness is supported only on GuC versions >= 70.32.0
>>>>>Allow enabling/reading engine busyness only on supported
>>>>>GuC versions. Warn once if not supported.
>>>>
>>>>did i915 used a different version of the guc api?
>>>>
>>>>There's no platform supporting GuC >= 70.32.0. We will need to add one
>>>>to be able to test.
>>>Requested for this guc version. Will merge this once CI passes 
>>>with the required version.
>>
>>this means you also need the igt ready for that. Is it done?
>Yeah igt is ready and has been tested locally.
>
>Waiting for other tests of pmu to be pushed 
>https://patchwork.freedesktop.org/series/140737/, to avoid re-sending 
>these patches again. Will send it once these are pushed> Lucas De 

makes sense, thanks. Please add the link to the igt tests in your cover
letter for next rev so it's clear for reviewer what's covering this new
functionality.

thanks
Lucas De Marchi

>Marchi
>>
>>>
>>>Thanks
>>>Riana
>>>>
>>>>Lucas De Marchi
>>>
>
