Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD6E77188
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 14:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF8C10E012;
	Wed, 18 Dec 2024 14:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fn8P7Uw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220AF10E012
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734531227; x=1766067227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=leNe7Vao+Pp2QFWX0fdUnZVir+FPeblaQ+f0/aXRNHo=;
 b=fn8P7Uw5pDwLs52+Xr3UDbwcPONlRlM9G1ko8OmXXdH4HrQ/CBCkSDMZ
 Qdi47oTCvKs6ZHGsnd5mahc60xiJalL3cTkr+EJKc2W7Z7r5OefcUyMLo
 E1+ncu4mKfZLPVqDUwYWRfYU7EK4T9JXGJRRnY5l4ObgsGDOwTnfSjRaC
 JEINi+etvwYnYmIgAS6N8H/P/bqWS1W0aAYa4sUCbd0k2JrCMzcmxYTM0
 axHFrghsPiWdeP4IiHuCx0oaStAl9GHKitI4flKy6QkBx4JiVHUhNhsuL
 zajWD540wXNWy58EgJhpA3dJObiTngbi/YcgW5ydEydg0HtyTcnk1X7jd Q==;
X-CSE-ConnectionGUID: y6P8ZK6CRx6rkCyQRibhtw==
X-CSE-MsgGUID: sezWVptJSPKDLdIWpxE2sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38943500"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="38943500"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:13:47 -0800
X-CSE-ConnectionGUID: 5+xcJSsKT/6sUOsS+i0SRg==
X-CSE-MsgGUID: pFzyqfDyQGKzIQjvKpoVbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97716865"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.208])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:13:46 -0800
Date: Wed, 18 Dec 2024 08:13:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, 
 aravind.iddamsetty@intel.com, john.c.harrison@intel.com,
 ashutosh.dixit@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v2 8/8] drm/xe/pmu: Add PMU support for engine busyness
Message-ID: <erhe5xquod7e7mlr5nnnaqtlzxsvgytrnxw3xczydibvqcxxtt@v2ta2k3tzip4>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-9-riana.tauro@intel.com>
 <4k3j4q3sakdke5fd3l25rrntjtdjxcm6447xg66czx6whofjbb@jel5xjc7kf77>
 <5165cae4-729e-4b78-84d6-fbbbb3470fb9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5165cae4-729e-4b78-84d6-fbbbb3470fb9@intel.com>
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

On Wed, Dec 18, 2024 at 10:42:53AM +0530, Riana Tauro wrote:
>Hi Lucas
>
>On 12/13/2024 11:28 AM, Lucas De Marchi wrote:
>>On Thu, Nov 21, 2024 at 12:09:04PM +0530, Riana Tauro wrote:
>>>PMU provides two counters (<engine>-busy-ticks-gt<n>,
>>><engine>-total-ticks-gt<n>) to calculate engine busyness. When querying
>>>engine busyness, user must group these 2 counters using the perf_event
>>>group mechanism to ensure both counters are sampled together.
>>>
>>>To list engine busyness counters use the following
>>>
>>>./perf list
>>> xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
>>
>>this will need a rebase on latest versions of the pmu patches as we
>>moved to have gt as a param rather than mangling the event name.
>
>In case of multiple gts, there might be different engines for each gt
>So should we display a common name and unsupported in case the engine 
>does not belong to the gt?
>
>sudo ./perf stat -e xe_0000_00_02.0/vcs0-busy-ticks,gt_id=0/ -I 1000

why is engine not a param, like gt?

Lucas De Marchi
