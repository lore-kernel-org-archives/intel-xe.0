Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E4CA0EC0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 10:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FE010E41F;
	Mon, 18 Aug 2025 10:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnVvM8mx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453B710E41F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755512017; x=1787048017;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2FR7DRsGcv2uWpj6hm8tmn56bol7MEd6cLTMf4XowXg=;
 b=SnVvM8mx1YDDYF0GaUPs9mJYKvWZi2ku+miRPa2dKsYGwd8bssImLokP
 gWak1giEHnlltmP7iRPgYK72VlcQwMSPiJAzbNHiaqtNznDOwW1ZuMjot
 mlS8pfOHHT3QqOOq4qb+XscsEUvPOXgDiYS2QbIfac2HdzjdRsBJxteXJ
 1LXpgzytxM2BmGjPnLSMK1t5WdrDU13dp6q58lArXDUS+QRjlLonLxPqv
 6+ggFWTjnsMavVt5oniL6yDZusJDQUin0So4K1cYSdWM3cEmW0MIhNDaF
 t8q9oOHu/X989QyZCGGzuMN05pS+KvF5cidb28WIquBuRo884SPKJnYUp Q==;
X-CSE-ConnectionGUID: RmvQnDpPRWupARUpgFIvxA==
X-CSE-MsgGUID: +/7xPzxxRj63FCYge0dJYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57877973"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57877973"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 03:13:36 -0700
X-CSE-ConnectionGUID: bicZPdEQROKQe00xQgdcbg==
X-CSE-MsgGUID: 2k6JEOjRQmKx+mkvtr6I5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167780658"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.202])
 ([10.245.245.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 03:13:34 -0700
Message-ID: <02a896d2-f992-4814-95b4-316d10425fc8@intel.com>
Date: Mon, 18 Aug 2025 11:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/pm: Disable RPM for SR-IOV VFs
To: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
References: <20250812163613.9954-1-satyanarayana.k.v.p@intel.com>
 <aKIGF3wKoK3U6bVu@intel.com> <aKKMLn7becx6s4Gh@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aKKMLn7becx6s4Gh@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 18/08/2025 03:13, Matthew Brost wrote:
> On Sun, Aug 17, 2025 at 12:40:55PM -0400, Rodrigo Vivi wrote:
>> On Tue, Aug 12, 2025 at 10:06:13PM +0530, Satyanarayana K V P wrote:
>>> VFs without native PCIe Power Management (PM) capabilities inherit their
>>> PF's power state as per PCIe specifications(§5.10.1 PCIe Base Spec 7.0).
>>> Enabling Runtime Power Management (RPM) for these VFs trigger unnecessary
>>> driver suspend/resume operations that ultimately perform no PCI-level power
>>> transition.
>>>
>>> Since VFs without PM capabilities cannot independently enter low-power
>>> states, the existing RPM workflow becomes redundant:
>>> 1. Driver executes full suspend/resume sequence
>>> 2. PCI PM transition step becomes no-op
>>> 3. VF power state remains tied to PF's status
>>>
>>> Disabling RPM for VFs eliminates this redundant processing while
>>> maintaining proper power management through PF dependency. This
>>> optimization ensures VFs follow their PF's power state without superfluous
>>> runtime handling.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> and pushing
>>
> 
> This might need a little more thought(?). What are the full consequences
> of this patch? For example, will xe_pm_suspend()/xe_pm_resume() never be
> called on a VF? I think that’s correct and desirable, but consider code
> paths like:
> 
> if (xe_pm_runtime_get_if_active())
>          /* Take action assuming GPU state is valid */
> else
>          /* Take action assuming GPU state has been lost */
> 
> 
> On a VF, this is now broken, since we don’t lose GPU state—unless I’m
> missing something, or xe_pm_runtime_get_if_active() always returns true
> on a VF which in that case we should be good.

It should behave as though the system is always RPM_ACTIVE with an 
elevated refcount (since driver is no longer dropping the refcount to 
turn on RPM) which will make it always return true for if_active() and 
others.

> 
> Matt
> 
>>>
>>> ---
>>> V5 -> V6:
>>> - Updated comment (Rodrigo).
>>>
>>> V4 -> V5:
>>> - Disable RPM for VFs without checking pm_cap (Rodrigo).
>>> - Updated commit title.
>>>
>>> V3 -> V4:
>>> - Fixed review comments (Rodrigo & Maarten)
>>>
>>> V2 -> V3:
>>> - Fixed review comments (Michal Wajdeczko).
>>>
>>> V1 -> V2:
>>> - Disable RPM only for VF devices when PM cap is not implemented.
>>> ---
>>>   drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index 5e8126ca8e27..51934d5dc44f 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -247,6 +247,10 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>>>   {
>>>   	struct device *dev = xe->drm.dev;
>>>   
>>> +	/* Our current VFs do not support RPM. so, disable it */
>>> +	if (IS_SRIOV_VF(xe))
>>> +		return;
>>> +
>>>   	/*
>>>   	 * Disable the system suspend direct complete optimization.
>>>   	 * We need to ensure that the regular device suspend/resume functions
>>> @@ -367,6 +371,10 @@ static void xe_pm_runtime_fini(struct xe_device *xe)
>>>   {
>>>   	struct device *dev = xe->drm.dev;
>>>   
>>> +	/* Our current VFs do not support RPM. so, disable it */
>>> +	if (IS_SRIOV_VF(xe))
>>> +		return;
>>> +
>>>   	pm_runtime_get_sync(dev);
>>>   	pm_runtime_forbid(dev);
>>>   }
>>> -- 
>>> 2.43.0
>>>

