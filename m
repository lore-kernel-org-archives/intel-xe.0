Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5EDD0BB7F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 09:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A30D10E8E7;
	Thu, 24 Oct 2024 09:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQcyHOP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA5310E8E7
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 09:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729763185; x=1761299185;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3W0ISOETooojifiiOmVoTgeKNJz6L9HY3iIBPlO5hTA=;
 b=DQcyHOP3WYiXZBw7aNKg6MDSqZlT2yEsL5kegCopqM4c07hxIZhLsRBZ
 ffOwITIZ/CrxLpVmKtz+73xnGlBeTuRv9OVLHH7dbS/dZdENZOmmfO9Hm
 wKD7hE4xTH/FAYF6JpM8qTOoDHXN1a4eDBcunhvwdNJpvDaXyWEOEIonw
 skh8EchmDcHvfaNobZgFcjuJTJqA8AO1Ol9Dmt6k9uuWPnB6+b/zaeq4m
 zRKJY/WDIX0Dbrr7pyCV2KaIZ+/RfslOmNU0tph+l01PGHk7ogCG0CFNa
 GabPLEmXgfUfRpvNZOgG1Q7/UYYcIDlb4UWQwYeUu8MkF7JnaTbPunDJL g==;
X-CSE-ConnectionGUID: UhuG/iVfSGCg7E5j+OefVg==
X-CSE-MsgGUID: jIOoXkt5SPKQbDjU92TJ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39971371"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="39971371"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:46:24 -0700
X-CSE-ConnectionGUID: nmMrO5gQSFq/HH3Zhnc99g==
X-CSE-MsgGUID: 9tDrVuP7Q6uRL3gcKDnKdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="85330270"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.144.35])
 ([10.245.144.35])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:46:21 -0700
Message-ID: <17604660-d5d6-4d95-b260-dd440f498ef0@linux.intel.com>
Date: Thu, 24 Oct 2024 11:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241023155817.3618388-1-nirmoy.das@intel.com>
 <87wmhxsupa.fsf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <87wmhxsupa.fsf@intel.com>
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


On 10/24/2024 11:42 AM, Jani Nikula wrote:
> On Wed, 23 Oct 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
>> Flush xe ordered_wq in case of ufence timeout which is observed
>> on LNL and that points recent scheduling issue with E-cores.
>>
>> This is similar to the recent fix:
>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>> response timeout") and should be removed once there is E core
>> scheduling fix.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> index f5deb81eba01..7f034871345b 100644
>> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> @@ -155,6 +155,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>>  		}
>>  
>>  		if (!timeout) {
>> +			/*
>> +			 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>> +			 * in case of g2h response timeout")
>> +			 *
>> +			 * TODO: Drop this change once workqueue scheduling delay issue is
>> +			 * fixed on LNL Hybrid CPU.
>> +			 */
>> +			__flush_workqueue(xe->ordered_wq);
> Just flush_workqueue() please, not the double underscored version. The
> double underscores are there to tell you not to use it...


I will update that. Thanks for catching it.


Nirmoy

>
> BR,
> Jani.
>
>> +			err = do_compare(addr, args->value, args->mask, args->op);
>> +			if (err <= 0)
>> +				break;
>>  			err = -ETIME;
>>  			break;
>>  		}
