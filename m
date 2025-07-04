Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAE2C83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 12:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4CC10EA0C;
	Fri,  4 Jul 2025 12:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhMIY7Kv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C7310EA0C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751632108; x=1783168108;
 h=from:to:cc:subject:in-reply-to:date:message-id: mime-version;
 bh=zkKtA2XbXK0fE3bC68AbQmmnY5m/To7OSCIOACSO4uw=;
 b=XhMIY7Kvr0fvawVSuOlpiIKgIBamWkMZgOb5xOG1LXwcoX8S11fOa2zU
 RVkf0cY59A1tIX2a1zjmtsqlIacKFmHOlFvKG/b5VEU+vJvSFvKNuDGhZ
 OupOEaFalyLVYNBOv/D+B5/HqZF/rUoQpuOlsoVJbl2diThVqgQ6mjfR5
 g4H446V+rgFPlxkxXZKPE5g79pO9Mxyc1f5hFE8h684Cw3u/zQPrY8RKL
 BQKdMCLYq90zSIS84XdRCTcQQcTzv5XE/iXfwUk10Hxq8al//abRmSSOn
 jz6QC7+cyFAquP+rPPsk5PEij3F4aT7UpQt3fjbR5PYVsk7DFYgjw7z/w A==;
X-CSE-ConnectionGUID: BC7LUA+hT5mMxFnPlDiKYA==
X-CSE-MsgGUID: BhXlGzJgRDuGlysuOF5YRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54085771"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="54085771"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:28:27 -0700
X-CSE-ConnectionGUID: /sSwazriRdK78WoktFwTuw==
X-CSE-MsgGUID: bVctPbgiSoyMifDEMm+RWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="155395736"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:28:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/tests: Add legacy IP descriptors to param
 generators
In-Reply-To: <9cfb8a29-8f54-4b2c-a872-0bdfb9cd727b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 04 Jul 2025 15:28:21 +0300
Message-ID: <5eceba4a1631d59635d885afeae93452a5be3a8f@intel.com>
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

On Wed, 02 Jul 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 02.07.2025 10:35, Jani Nikula wrote:
>> On Tue, 01 Jul 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Fri, Jun 27, 2025 at 08:11:10PM +0200, Michal Wajdeczko wrote:
>>>> Recently introduced kunit parameter generators where based on
>>>> the existing arrays which have only GDMID-bsaed IP and didn't
>>>> take into account legacy IP definitions from pre-GMDID era.
>>>>
>>>> Add test only arrays with legacy IPs (as those will not change)
>>>> and extend param generators to start iterating over them.
>>>>
>>>> [ ] =================== xe_pci (2 subtests) ====================
>>>> [ ] ==================== check_graphics_ip  ====================
>>>> [ ] [PASSED] 12.00 Xe_LP
>>>> [ ] [PASSED] 12.10 Xe_LP+
>>>> [ ] [PASSED] 12.55 Xe_HPG
>>>> [ ] [PASSED] 12.60 Xe_HPC
>>>> [ ] [PASSED] 12.70 Xe_LPG
>>>> [ ] [PASSED] 12.71 Xe_LPG
>>>> [ ] [PASSED] 12.74 Xe_LPG+
>>>> [ ] [PASSED] 20.01 Xe2_HPG
>>>> [ ] [PASSED] 20.02 Xe2_HPG
>>>> [ ] [PASSED] 20.04 Xe2_LPG
>>>> [ ] [PASSED] 30.00 Xe3_LPG
>>>> [ ] [PASSED] 30.01 Xe3_LPG
>>>> [ ] [PASSED] 30.03 Xe3_LPG
>>>> [ ] ================ [PASSED] check_graphics_ip ================
>>>> [ ] ===================== check_media_ip  ======================
>>>> [ ] [PASSED] 12.00 Xe_M
>>>> [ ] [PASSED] 12.55 Xe_HPM
>>>> [ ] [PASSED] 13.00 Xe_LPM+
>>>> [ ] [PASSED] 13.01 Xe2_HPM
>>>> [ ] [PASSED] 20.00 Xe2_LPM
>>>> [ ] [PASSED] 30.00 Xe3_LPM
>>>> [ ] [PASSED] 30.02 Xe3_LPM
>>>> [ ] ================= [PASSED] check_media_ip ==================
>>>> [ ] ===================== [PASSED] xe_pci ======================
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/tests/xe_pci.c | 33 +++++++++++++++++++++++++++++++
>>>> 1 file changed, 33 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>>>> index baccb657bd05..c5acee52b458 100644
>>>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>>>> @@ -12,12 +12,31 @@
>>>> #include <kunit/test-bug.h>
>>>> #include <kunit/visibility.h>
>>>>
>
> /**
>  * IS_ARRAY_ROW - checks if @row pointer points to entry in the @array
>  * @arr: the array
>  * @row: the pointer to the row in the array
>  */
>
>>>> +#define IS_ARRAY_ROW(arr, row) ((typeof(&(arr)[0]))(row) - (arr) < ARRAY_SIZE(arr))
>
> ...
>
>>>> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
>>>> {
>>>> +	const void *next = legacy_graphics_ip_gen_params(prev, desc);
>>>> +
>>>> +	if (next)
>>>> +		return next;
>>>> +	if (IS_ARRAY_ROW(legacy_graphics_ips, prev))
>> 
>> I don't understand what "is array row" means.
>
> do you want me to include some kind of the kernel-doc (see above) for
> this helper macro used only here as a trick to combine two gen_params?
>
> or maybe do you prefer 'entry' instead of 'row' name?

Lucas already reviewed it, so who am I to argue...

...but I think it's a bit clumsy check if 'row' points anywhere in the
memory occupied by 'arr', not just at an element. And it completely
casts away the type of row, you could pass it, say, 5. Something like
this feels safer:

	const typeof(&(arr)[0]) __p = row;

But up to Lucas, really.


BR,
Jani.

-- 
Jani Nikula, Intel
