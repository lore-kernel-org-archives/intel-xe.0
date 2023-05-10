Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F597C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 20:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6ACE10E008;
	Wed, 10 May 2023 20:22:19 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E222610E008
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683750138; x=1715286138;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=SDbhZahLHctzp4CFawufS7iOHtYvcobHgm5Rlv85iJs=;
 b=LE3CW1NRBQetWSI6G7aVVxd5BETnWy0LzmV75V8wzDN/BJoDPTHjeOcK
 iDh3bNP10ob63jtLL6vUh+eNdNqVbVO/BGWDmOcmrysvpqmaH7w3qd02/
 8+rxUgGckIxLzvOfhZvg/uMtT6EAwTW/QDVfgkV+N5qJZIS08/XpwWYIZ
 nBmeJnYhuXGZeBrNcOB+qMlJeaH3LbTetS537wfkVljESqeOd2EjHoNoY
 FWsW69hJ4V2UKPJUbFwHlQfoyLkL/1WiZOyzf35KOp0pYmRpdw9x4H5/3
 OAnDzPSzZrObndh2RnkbyF0nIug/Aqz7sqfyQuT6jTTt5HurL0V8ncaz4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352510077"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="352510077"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 13:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732278096"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="732278096"
Received: from azaki-mobl.amr.corp.intel.com (HELO localhost) ([10.252.63.3])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 13:21:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <168374872604.358529.7514478797295259747@gjsousa-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230509222053.1541049-1-gustavo.sousa@intel.com>
 <87pm78midb.fsf@intel.com>
 <168374872604.358529.7514478797295259747@gjsousa-mobl2>
Date: Wed, 10 May 2023 23:21:00 +0300
Message-ID: <87h6sklyz7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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

On Wed, 10 May 2023, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> Quoting Jani Nikula (2023-05-10 10:22:08)
>>On Tue, 09 May 2023, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>>> Make sure all necessary exit functions are also called when
>>> xe_register_pci_driver() fails.
>>>
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_module.c | 16 ++++++++++------
>>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>> index 6860586ce7f8..9698875852d3 100644
>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>> @@ -53,14 +53,18 @@ static int __init xe_init(void)
>>>  
>>>          for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>>>                  err = init_funcs[i].init();
>>> -                if (err) {
>>> -                        while (i--)
>>> -                                init_funcs[i].exit();
>>> -                        return err;
>>> -                }
>>> +                if (err)
>>> +                        break;
>>>          }
>>>  
>>> -        return xe_register_pci_driver();
>>> +        if (!err)
>>> +                err = xe_register_pci_driver();
>>
>>Why aren't xe_register_pci_driver() and xe_unregister_pci_driver()
>>init/exit functions in the array? It would avoid the special casing
>>here, and allow some init functions to be called after register.
>
> Hm... I would imagine that the intention would to make it explicit that
> xe_register_pci_driver() must be the latest one called and, if that was the
> case (which is probably false based on your comment), maybe adding a comment on
> the array entry would also suffice.

In i915, i915_pci_register_driver() is *not* the last one!

> So should we just add them to the array?
>
> One issue would to be related to the function names, which would be
> incompatible with using MAKE_INIT_EXIT_FUNCS(). Since those functions are only
> used in this file, I guess it would be okay to rename them to
> xe_pci_module_init() and xe_pci_module_exit() for consistency sake. Thoughts?

Personally, I don't like MAKE_INIT_EXIT_FUNCS(). It does force a certain
naming pattern, but it also throws off code cross-referencing tools. I
can't just go on top of MAKE_INIT_EXIT_FUNCS(hw_fence) and have my
editor find the definition, and neither can I find all the call sites of
xe_hw_fence_module_init(). git grep doesn't fare any better. For me,
that's a productivity hit that's perpetually worse than having
init_funcs[] fully spelled out.

BR,
Jani.




>
> --
> Gustavo Sousa
>
>>
>>BR,
>>Jani.
>>
>>
>>> +
>>> +        if (err)
>>> +                while (i--)
>>> +                        init_funcs[i].exit();
>>> +
>>> +        return err;
>>>  }
>>>  
>>>  static void __exit xe_exit(void)
>>
>>-- 
>>Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
