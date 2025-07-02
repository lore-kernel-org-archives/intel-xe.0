Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA14C83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 10:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8FC10E335;
	Wed,  2 Jul 2025 10:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVB3+HFm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D07A10E335
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751453002; x=1782989002;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mGhrxCOELuHaBhcAhSyhbVKglMm5Pp0XntZ4NfcbPI8=;
 b=MVB3+HFmfV7vFYaIyYmrqFl1+M6DUcByfUEki1PfieoARQuBMezEXg+e
 C4eqan1PR3FEWtPF3bGH/eduYunIeKF9mr0Z/fRfw8mWB38qxw43/FVkI
 9QFFWG1wkXv4idgxQd/j/o/5pBuan5vdINKX0yLa1oaTMB/NZjNQALFpY
 z7DL0wrV7CIyOKGGCJxirI47LCjtV0hofNqKBOB9SEvulkeZTSIjh82hO
 CtKlwJkAfCC7iQNK5zq8N2z4q3BsCFGYu0RQKzP7CIm9RK6Z/ej8skbt/
 AKvE4RQzadzoHonLNJVwIfd8HoAgYF4pOgRnysOgRs0o/LGDQBtJyKR6W A==;
X-CSE-ConnectionGUID: 36Or1ldXQHW0Fc7CJUzcnA==
X-CSE-MsgGUID: 0uKSWJbRTze01ID39bGV3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71169203"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="71169203"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 03:43:22 -0700
X-CSE-ConnectionGUID: 8kF3aQrBTNy/8VeSIx7JpQ==
X-CSE-MsgGUID: b1+IeYggTIaAKodcQskyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153499437"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 02 Jul 2025 03:43:21 -0700
Received: from [10.245.112.168] (unknown [10.245.112.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 75A442819E;
 Wed,  2 Jul 2025 11:43:19 +0100 (IST)
Message-ID: <9cfb8a29-8f54-4b2c-a872-0bdfb9cd727b@intel.com>
Date: Wed, 2 Jul 2025 12:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: Add legacy IP descriptors to param
 generators
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
References: <20250627181110.1436-1-michal.wajdeczko@intel.com>
 <qtzn3rwxvu4yoi7oxfpv34auqwenqxlfhfjqoxi7jfdzqapkxp@zrgntsdh7hiy>
 <dc5022e74e3d3ea117e979516f4795abdea2ac47@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <dc5022e74e3d3ea117e979516f4795abdea2ac47@intel.com>
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



On 02.07.2025 10:35, Jani Nikula wrote:
> On Tue, 01 Jul 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Fri, Jun 27, 2025 at 08:11:10PM +0200, Michal Wajdeczko wrote:
>>> Recently introduced kunit parameter generators where based on
>>> the existing arrays which have only GDMID-bsaed IP and didn't
>>> take into account legacy IP definitions from pre-GMDID era.
>>>
>>> Add test only arrays with legacy IPs (as those will not change)
>>> and extend param generators to start iterating over them.
>>>
>>> [ ] =================== xe_pci (2 subtests) ====================
>>> [ ] ==================== check_graphics_ip  ====================
>>> [ ] [PASSED] 12.00 Xe_LP
>>> [ ] [PASSED] 12.10 Xe_LP+
>>> [ ] [PASSED] 12.55 Xe_HPG
>>> [ ] [PASSED] 12.60 Xe_HPC
>>> [ ] [PASSED] 12.70 Xe_LPG
>>> [ ] [PASSED] 12.71 Xe_LPG
>>> [ ] [PASSED] 12.74 Xe_LPG+
>>> [ ] [PASSED] 20.01 Xe2_HPG
>>> [ ] [PASSED] 20.02 Xe2_HPG
>>> [ ] [PASSED] 20.04 Xe2_LPG
>>> [ ] [PASSED] 30.00 Xe3_LPG
>>> [ ] [PASSED] 30.01 Xe3_LPG
>>> [ ] [PASSED] 30.03 Xe3_LPG
>>> [ ] ================ [PASSED] check_graphics_ip ================
>>> [ ] ===================== check_media_ip  ======================
>>> [ ] [PASSED] 12.00 Xe_M
>>> [ ] [PASSED] 12.55 Xe_HPM
>>> [ ] [PASSED] 13.00 Xe_LPM+
>>> [ ] [PASSED] 13.01 Xe2_HPM
>>> [ ] [PASSED] 20.00 Xe2_LPM
>>> [ ] [PASSED] 30.00 Xe3_LPM
>>> [ ] [PASSED] 30.02 Xe3_LPM
>>> [ ] ================= [PASSED] check_media_ip ==================
>>> [ ] ===================== [PASSED] xe_pci ======================
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/tests/xe_pci.c | 33 +++++++++++++++++++++++++++++++
>>> 1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> index baccb657bd05..c5acee52b458 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>> @@ -12,12 +12,31 @@
>>> #include <kunit/test-bug.h>
>>> #include <kunit/visibility.h>
>>>

/**
 * IS_ARRAY_ROW - checks if @row pointer points to entry in the @array
 * @arr: the array
 * @row: the pointer to the row in the array
 */

>>> +#define IS_ARRAY_ROW(arr, row) ((typeof(&(arr)[0]))(row) - (arr) < ARRAY_SIZE(arr))

...

>>> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
>>> {
>>> +	const void *next = legacy_graphics_ip_gen_params(prev, desc);
>>> +
>>> +	if (next)
>>> +		return next;
>>> +	if (IS_ARRAY_ROW(legacy_graphics_ips, prev))
> 
> I don't understand what "is array row" means.

do you want me to include some kind of the kernel-doc (see above) for
this helper macro used only here as a trick to combine two gen_params?

or maybe do you prefer 'entry' instead of 'row' name?

> 
> BR,
> Jani.
> 
