Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B3AEE57EE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 10:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5054210E060;
	Fri,  8 Sep 2023 10:11:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ADB10E060
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694167910; x=1725703910;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TG8fNXqO05m93BQUQgwTyunFAK6dXLIqAIguWPlpDk8=;
 b=mFMITUPI3O+vhf4t6LcVy731IXxUjiNDFPm7ojphntEANRtNKU9Y+IEU
 2ys5uoid5CtEPSb0c+lrCXW+uPkG/urilFuDEbtFlULnnPuXsKN53j4Xh
 MawKcW2cwUIB0fZ6E7yH2tGomXDLS/onMUL8oEkGfqlv091K7iWVyfzqy
 twR3mJSaAaFuvZWFjw9R2hnbKvC49PkeXArbHagrpd3cJKVZKo6cDcX78
 C3LBwM1bfiSaMYXINAUbXbbc0f8V0kgRSG8OEEqxahz2T5MON5h8osbCA
 0zeFmdj2VUhmWCdHmBLWHR74IZgRXydSbRIRlnhG3rbMpHo+0pl7JM4lf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357916766"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="357916766"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 03:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="916123125"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="916123125"
Received: from hieule-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.34.174])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 03:11:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
In-Reply-To: <26hcp33tuu24jtl2tyo7iyqaucnkbww3sd4na4k5boa577eof4@axnzegfuxdya>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
 <20230906180457.GF2706891@mdroper-desk1.amr.corp.intel.com>
 <26hcp33tuu24jtl2tyo7iyqaucnkbww3sd4na4k5boa577eof4@axnzegfuxdya>
Date: Fri, 08 Sep 2023 13:11:43 +0300
Message-ID: <871qf9gejk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Print display ip version
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 06 Sep 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Sep 06, 2023 at 11:04:57AM -0700, Matt Roper wrote:
>>On Wed, Sep 06, 2023 at 11:34:00AM +0530, Balasubramani Vivekanandan wrote:
>>> Print display ip version during module load
>>>
>>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 60f3474844e2..fc01544346d5 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>  		str_yes_no(xe->info.enable_display),
>>>  		xe->info.dma_mask_size, xe->info.tile_count);
>>>
>>> +	if (xe->info.enable_display)
>>> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
>>> +			xe->info.display_runtime.ip.ver,
>>> +			xe->info.display_runtime.ip.rel);
>>> +
>>
>>Rather than printing the display version here, it might be better to
>>call intel_display_device_info_print() somewhere appropriate which will
>
> Somewhere appropriate would be xe_display.c, so it only gets printed if
> there is display.... or if it's moved to a shared function in i915
> itself that we already call.

https://lore.kernel.org/r/87r0nbheil.fsf@intel.com

>
> Lucas De Marchi
>
>>dump not only the IP version, but also the relevant feature flags.
>>
>>
>>Matt
>>
>>>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>>>  		xe_step_name(xe->info.step.graphics),
>>>  		xe_step_name(xe->info.step.media),
>>> --
>>> 2.25.1
>>>
>>
>>-- 
>>Matt Roper
>>Graphics Software Engineer
>>Linux GPU Platform Enablement
>>Intel Corporation

-- 
Jani Nikula, Intel Open Source Graphics Center
