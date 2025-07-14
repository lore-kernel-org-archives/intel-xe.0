Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC10C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 17:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E931E10E08E;
	Mon, 14 Jul 2025 17:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAInGlhJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF29C10E08E
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752515621; x=1784051621;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v9iR+3lDVB+FatQJOSWNv34gYJ2BAWSFqzELWEQI7Tc=;
 b=aAInGlhJn65xG2m5ZKa52tKjXI9l6tMRdyvQi4ChEoj4fF8dSdVxh0hg
 IjZ6iJd+I9y+iYr4dAL3DVVdN3+30bYSdYu9OUey10pzffdVGw5F1QS6F
 f/erzmZWqETgmQigSKdw1boL8qQCVe6pE0rfbA/pOa0Pc9AD0TrOiLQo/
 l8dz93MlJXclaRu/V38KxidkfLUgFQKgmoynAlnYs1/3kfbDLkUsESFbD
 UMQASX5tYx9z5jfLKdg+1adGYXifps2V+/oGUxYIOkLYgsQcLnFOyEgMC
 AkTXT8hyDWGwGFiE85r1xlpnE+DQdWIsTkU2O3vh5o8VXGhnwf+71Uerr w==;
X-CSE-ConnectionGUID: vIdRYMdmSEWA0ZEU6rbSYg==
X-CSE-MsgGUID: W4aY05S6TfGEj9QmeBbLBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54590371"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54590371"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:53:41 -0700
X-CSE-ConnectionGUID: gT6/Y8VzQaq64rdbJv9wfA==
X-CSE-MsgGUID: P2R/rIWoSQ+gEzi/IgYQGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="162549520"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 14 Jul 2025 10:53:40 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BA4AE32EBF;
 Mon, 14 Jul 2025 18:53:38 +0100 (IST)
Message-ID: <3cb53574-8e87-487b-9e83-1268054b5e4d@intel.com>
Date: Mon, 14 Jul 2025 19:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250710205413.1105595-1-matthew.brost@intel.com>
 <CH0PR11MB5444A2EE452F111723C4635CE548A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aHAvIeeQJB5mNSwp@lstrano-desk.jf.intel.com>
 <su3sw3gyvzuxkbwtrio2i6sgtsulalfjxfcihz3bc2e6txu6ft@d2m7abm6c45g>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <su3sw3gyvzuxkbwtrio2i6sgtsulalfjxfcihz3bc2e6txu6ft@d2m7abm6c45g>
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



On 14.07.2025 17:52, Lucas De Marchi wrote:
> On Thu, Jul 10, 2025 at 02:22:41PM -0700, Matthew Brost wrote:
>> On Thu, Jul 10, 2025 at 03:19:03PM -0600, Cavitt, Jonathan wrote:

> It seems we are also doing something weird with
> DRM_XE_LMTT_2L_128GB coming from commit b1d204058218 ("drm/xe/pf:
> Introduce Local Memory Translation Table")
>

this use of the non-existing config was added as placeholder, in case
there will a need to support SKUs which are still based on two-level
LMTT but have more than 32GiB of LMEM, as theoretical limit of two-level
LMTT is 128GiB (LMHAW/LMGAW 37 bits, instead of 35 bits that we use
right now to cover up to 32GiB)

I can remove it if we don't expect any such SKUs in the near future...

Michal
