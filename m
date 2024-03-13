Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7487FC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 14:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0E10F05F;
	Wed, 13 Mar 2024 14:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+NV79ar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D283F10F030
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 14:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710341803; x=1741877803;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IexXHtDynKD/R/lIJgoAN1eGTYoFUKVLe2IdzSfMbjM=;
 b=m+NV79ar06NA0G74+BOYwTL0fw9BYL7jIP0KWqONVEIzkw+wKcLsQySx
 Z6/E+NRp8/xSjQYjex98BzfOTWa4E9ja0ds3YLj6+M4Tyeaw7wQqMiLO6
 A2L3aIgq1XRy3zsEH9gZlkWcn+CREhU4AilIKlylDsPmH1kttipKJZCCy
 R2/6CZjgLQ3pZPG5LYLQ0vmipNDzAWiITWCcQ7Q4jUhufzO2h++gUBFr5
 iUOAs58vSEP76PNi8HNVG64qn5asuYICtjjOjoFTqOdtvaca5omVWlwxm
 81GvpkiVD29kK9VyWoAq/jW7uJ0Mj49tAzGgxQ6ZF97/CEPYzovHy8fe2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8053052"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8053052"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="12358766"
Received: from jbakowsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.28])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:56:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
In-Reply-To: <76b70dd3-794b-45a1-994a-020525954d9f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
 <87h6hasfbj.fsf@intel.com>
 <76b70dd3-794b-45a1-994a-020525954d9f@intel.com>
Date: Wed, 13 Mar 2024 16:56:38 +0200
Message-ID: <875xxqrxi1.fsf@intel.com>
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

On Wed, 13 Mar 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> On 3/13/2024 1:31 AM, Jani Nikula wrote:
>> On Tue, 12 Mar 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>> index d9aa815a5bc2..902c52d95a8a 100644
>>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>> @@ -287,7 +287,7 @@ static void gsc_work(struct work_struct *work)
>>>   	spin_unlock_irq(&gsc->lock);
>>>   
>>>   	xe_pm_runtime_get(xe);
>>> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>>> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
>> Up to the xe maintainers to decide, but I'm really not a fan of hiding
>> functionality inside warn ons. My approach usually is, would it work if
>> all the warns were removed? If yes, it's good. If not, maybe reconsider.
>
> The code works even without the warns, they're only there so we know 
> that there was a forcewake issue if/when some other error crops up down 
> the line (which will be handled appropriately). There is nothing we can 
> do to actually handle the forcewake failure as it can only happen if the 
> HW is in a bad state.

My point is, I personally prefer:

	ret = do_stuff():

	WARN_ON(ret);

over:

	WARN_ON(do_stuff());

because in the former do_stuff() stands out as something we actually
want to do functionally, while in the latter the fact that we do
anything at all is hidden inside the WARN_ON().

I prefer WARN_ON()'s to only have stuff inside them that have no
side-effects:

	WARN_ON(check_stuff_but_dont_do_stuff());

Again, not my call to make here, just musing on style. ;)


BR,
Jani.


-- 
Jani Nikula, Intel
