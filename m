Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACDFCCFA0A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 16:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8844110E919;
	Fri,  8 Sep 2023 16:50:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467B110E919
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694191853; x=1725727853;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bNRpQEwGxXYeveMAD5HPBLMkcgVTGK21DWHMsGdo1eg=;
 b=ajbtmYZu2QgipqYoo5hvG4E0eLrjgHwyvkBUx5+EyvrOH4SvGEr8ouKf
 HbCMCZG+bMRkpG4PtMoQIYGmhNO4D0V+N7sKtYjaL26Or6h7TDSt/ZzUD
 tLk4bkRWUUtbLMsRtOqGIc6I0d7kTlsYe1Go0LA7JoFdE8Ei5NG4cqRu7
 gZB6SymuVpEI/cM/YjL5PDaXDMRCJMgpNPNMdEHbeWmQdEfxQi/s8epQY
 +U6h3IokquEym+EfSbaAFuXPFk4BLOAwe2sMXm8cx29NKxLmNmIIdzgi7
 FSoVqcK2VI1OJuYbWHISSrTD3W3BNgpTbBEhLDaW997nY5kmsQVEdePnP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464064160"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="464064160"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 09:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692336172"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692336172"
Received: from hieule-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.34.174])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 09:50:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <ru3jqocgwkfmhyfgdvttfwewmoducukeqhrl43shkutsyjrvru@hvyfaxmnnlqu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
 <20230906180457.GF2706891@mdroper-desk1.amr.corp.intel.com>
 <26hcp33tuu24jtl2tyo7iyqaucnkbww3sd4na4k5boa577eof4@axnzegfuxdya>
 <871qf9gejk.fsf@intel.com>
 <ru3jqocgwkfmhyfgdvttfwewmoducukeqhrl43shkutsyjrvru@hvyfaxmnnlqu>
Date: Fri, 08 Sep 2023 19:50:45 +0300
Message-ID: <87wmx0fw2i.fsf@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 08 Sep 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Sep 08, 2023 at 01:11:43PM +0300, Jani Nikula wrote:
>>On Wed, 06 Sep 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Wed, Sep 06, 2023 at 11:04:57AM -0700, Matt Roper wrote:
>>>>On Wed, Sep 06, 2023 at 11:34:00AM +0530, Balasubramani Vivekanandan wrote:
>>>>> Print display ip version during module load
>>>>>
>>>>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>> index 60f3474844e2..fc01544346d5 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>> @@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>>>  		str_yes_no(xe->info.enable_display),
>>>>>  		xe->info.dma_mask_size, xe->info.tile_count);
>>>>>
>>>>> +	if (xe->info.enable_display)
>>>>> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
>>>>> +			xe->info.display_runtime.ip.ver,
>>>>> +			xe->info.display_runtime.ip.rel);
>>>>> +
>>>>
>>>>Rather than printing the display version here, it might be better to
>>>>call intel_display_device_info_print() somewhere appropriate which will
>>>
>>> Somewhere appropriate would be xe_display.c, so it only gets printed if
>>> there is display.... or if it's moved to a shared function in i915
>>> itself that we already call.
>>
>>https://lore.kernel.org/r/87r0nbheil.fsf@intel.com
>
> not sure if you are confirming what I said or saying it was wrong...
> A call to intel_display_device_info_print() in xe_display.c seems very
> reasonable.

Just trying to tie two threads of review into one in a rush. :)

Just calling intel_display_device_info_print() from somewhere, anywhere
in xe is an improvement. But perhaps it could be called from i915
display code after it's all been initialized. *shrug*

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
