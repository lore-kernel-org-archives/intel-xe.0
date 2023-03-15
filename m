Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720B1C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 10:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B33B10E99B;
	Wed, 15 Mar 2023 10:27:47 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D72510E99B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678876065; x=1710412065;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=x8WLqFA1SrM/Fgbh/6eVbSYbacMyKg3ORUHJtdK/BU4=;
 b=CWwf3gVZN33xO3P4vcgrjAvFYUu673YRT4143SRiyN+3glHDz1LUHAlP
 E3RhHifpRRFv2ma10CvlBeLlQg3UmXgTQn6ztbAEy6HFq9UAO5/+I4gte
 Jqo1iNOL/sgRaOnWsgLOsUAPUYXNxuc5EN72YwAv1DcMJufDrWjsqkY12
 IEZLWxA90UbCNs5NZa+1fxy9cVuRM6qC/AylsyQzQiZ6FwI5xXLFE/D4l
 dqc/g7cD79Qsb1IfLnTTP+I15d6vR6ZdlFoBgeD4coPRVdZuQ4cSUsxs4
 3LD6SPH4e102M/8PXWdxdwQOFDjNMvr9OBS1A+/uxBYfTONmUKPWahjTo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="340030451"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="340030451"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="789743852"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="789743852"
Received: from wujunyox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.32])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 03:27:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <20230314213538.j3pu4dras5geerio@ldmartin-desk2.jf.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309122133.486044-1-jani.nikula@intel.com>
 <20230309173734.GA3408186@mdroper-desk1.amr.corp.intel.com>
 <20230314002437.baxfkjubclrc272a@ldmartin-desk2.lan>
 <87a60f7hd0.fsf@intel.com>
 <20230314213538.j3pu4dras5geerio@ldmartin-desk2.jf.intel.com>
Date: Wed, 15 Mar 2023 12:27:40 +0200
Message-ID: <87jzzi5mxv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/irq: the irq handler local variable
 need not be static
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

On Tue, 14 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Mar 14, 2023 at 12:32:59PM +0200, Jani Nikula wrote:
>>On Mon, 13 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Thu, Mar 09, 2023 at 09:37:34AM -0800, Matt Roper wrote:
>>>>On Thu, Mar 09, 2023 at 02:21:33PM +0200, Jani Nikula wrote:
>>>>> It's just a local variable.
>>>>>
>>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>
>>>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>> but the commit message should probably say 's/need/should/'. Setting it
>>> as static pretty much breaks setups with 2 devices like TGL + DG2.
>>
>>Mmmh, only if the probe races between xe_irq_install() calls for the two
>>devices. Can the same driver probe two devices in parallel?
>
> true, I don't think currently it will ever be in parallel since 
> we are tying the bind to the module load. We could stimulate
> a race by doing the bind separately, but even then the window for
> the race is just a few instructions.
>
> When I read this commit I was under the impression that whatever got set
> in this variable would end up being used later. Checking again, it's
> only used inside the xe_irq_install to call directly.
>
> So I'm fine with the current message and my r-b stands.

Thanks, pushed.

BR,
Jani.

>
> thanks
> Lucas De Marchi
>
>>
>>BR,
>>Jani.
>>
>>
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>>> index ae2f65c00fa6..529b42d9c9af 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>>>> @@ -529,7 +529,7 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
>>>>>  int xe_irq_install(struct xe_device *xe)
>>>>>  {
>>>>>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>>>>> -	static irq_handler_t irq_handler;
>>>>> +	irq_handler_t irq_handler;
>>>>>  	int err;
>>>>>
>>>>>  	irq_handler = xe_irq_handler(xe);
>>>>> --
>>>>> 2.39.1
>>>>>
>>>>
>>>>--
>>>>Matt Roper
>>>>Graphics Software Engineer
>>>>Linux GPU Platform Enablement
>>>>Intel Corporation
>>
>>-- 
>>Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
