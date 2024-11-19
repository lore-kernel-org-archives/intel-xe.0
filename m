Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FBCD6C290
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 20:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C1710E363;
	Tue, 19 Nov 2024 20:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlIoS1B7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8699E10E363
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732048006; x=1763584006;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rZYWp2N6Ht97+KntrzkFVv9tirEthNgxvYXGIZYj4ZI=;
 b=RlIoS1B7AxK1xKP6OmP4gQfI/IyhQRwpg6HJ7rK7Ehkb/v+b2a3pRdHl
 Q8qaME/xTL3Os7uyFnaqBiqC4CxyZDuojqbvSStHJs+AmtwenHTRbe7BT
 E3bqk171mtP3f3OWASkQtYwVKP8cI96giIQzSXtcZ0cPh0J8GdFGw5e0i
 a/5CG7A6lMkYZtkdYqrIQQDRs17eZ3ZZEuMXEcgzL5x0UnSF9/J7FPPRl
 UbLhHtLJ23FW4lq11ZoNxSwTGzmq9QZMOaTWz5HYS4igTFBmsC3pUb6iY
 BNK4Ufj+qxcJkfIP2XOTJAuEbXg3zRjllNranOL7ypK9y2YaPEKPqOpob w==;
X-CSE-ConnectionGUID: 0UAjhaR7SJKaFyxZqOPu3g==
X-CSE-MsgGUID: x9CSrEreQtaDd6d3qoXV3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31822684"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31822684"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:26:46 -0800
X-CSE-ConnectionGUID: o6J9RxUbRBianvxnEdUAXw==
X-CSE-MsgGUID: pANazkXmRp65l5TkoBBF6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90088939"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2024 12:26:44 -0800
Received: from [10.245.80.89] (unknown [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EF4262879A;
 Tue, 19 Nov 2024 20:26:42 +0000 (GMT)
Message-ID: <855208c6-cd7c-4e63-a865-8d970bda11df@intel.com>
Date: Tue, 19 Nov 2024 21:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Introduce force-wake guard class
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-2-michal.wajdeczko@intel.com>
 <ZzzdQGnrSSD7jKs_@intel.com> <ZzzlLQAh9yqAl3q8@black.fi.intel.com>
 <4mulnkmh6np2ney767qf5hvcj4tfse6t2bavudulnz77jjyagg@r4xtypqhsnkq>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <4mulnkmh6np2ney767qf5hvcj4tfse6t2bavudulnz77jjyagg@r4xtypqhsnkq>
Content-Type: text/plain; charset=UTF-8
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



On 19.11.2024 20:59, Lucas De Marchi wrote:
> On Tue, Nov 19, 2024 at 09:21:17PM +0200, Raag Jadav wrote:
>> On Tue, Nov 19, 2024 at 01:47:28PM -0500, Rodrigo Vivi wrote:
>>> On Mon, Nov 18, 2024 at 07:45:10PM +0100, Michal Wajdeczko wrote:
>>> > There is support for 'classes' with constructor and destructor
>>> > semantics that can be used for any scope-based resource management,
>>> > like our domain force-wake management.
>>>
>>> There is, okay...
>>> It can be, okay...
>>>
>>> But why do we want?
>>> What are the advantages?
>>
>> Makes error cases easier to handle + less code.

and this 'easier' is not just that as it also means that code is much
more robust as it's the compiler job to take care of all the cleanup,
which could be tricky when doing early exits from different paths, or
due to late updates to the code done by someone else

>> We significantly cleaned up intel pinctrl and gpio drivers a few
>> months ago
>> and almost halved the footprint in some cases.
> 
> I'm ok with using this pattern as I already expressed before.
> Particularly seeing other subsystems adopting it and being used well in
> the core kernel as well.
> 
> Main ask here is to provide proper justification in the commit message.

there was a little more in the cover letter:

""
This should allow us to use:

	CLASS(xe_fw, var)(fw, XE_FORCEWAKE_ALL);
or
	guard(xe_fw)(fw, XE_FW_GT);
or
	scoped_guard(xe_fw, fw, XE_FW_GT)
		foo();

without any concern of leaking the force-wake references.
""

do you want/need more?

> 
> Lucas De Marchi
> 
>>
>> Raag
>>
>>> >
>>> > Define xe_fw class that can be used for force-wake management.
>>> >
>>> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> > ---
>>> > v2: aligned to new force-wake usage model (Michal)
>>> > ---
>>> >  drivers/gpu/drm/xe/xe_force_wake.h       | 12 ++++++++++++
>>> >  drivers/gpu/drm/xe/xe_force_wake_types.h | 10 ++++++++++
>>> >  2 files changed, 22 insertions(+)
>>> >
>>> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/
>>> xe/xe_force_wake.h
>>> > index 0e3e84bfa51c..e46e44f7eb70 100644
>>> > --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>> > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>> > @@ -6,6 +6,8 @@
>>> >  #ifndef _XE_FORCE_WAKE_H_
>>> >  #define _XE_FORCE_WAKE_H_
>>> >
>>> > +#include <linux/cleanup.h>
>>> > +
>>> >  #include "xe_assert.h"
>>> >  #include "xe_force_wake_types.h"
>>> >
>>> > @@ -61,4 +63,14 @@ xe_force_wake_ref_has_domain(unsigned int
>>> fw_ref, enum xe_force_wake_domains dom
>>> >      return fw_ref & domain;
>>> >  }
>>> >
>>> > +DEFINE_CLASS(xe_fw, struct xe_force_wake_guard,
>>> > +         xe_force_wake_put(_T.fw, _T.ref),
>>> > +         ({ (struct xe_force_wake_guard){ fw,
>>> xe_force_wake_get(fw, domains) }; }),
>>> > +         struct xe_force_wake *fw, enum xe_force_wake_domains
>>> domains);
>>> > +
>>> > +static inline void *class_xe_fw_lock_ptr(class_xe_fw_t *_T)
>>> > +{
>>> > +    return _T->ref ? _T : NULL;
>>> > +}
>>> > +
>>> >  #endif
>>> > diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/
>>> gpu/drm/xe/xe_force_wake_types.h
>>> > index 899fbbcb3ea9..15456a24f707 100644
>>> > --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>>> > +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>>> > @@ -85,4 +85,14 @@ struct xe_force_wake {
>>> >      struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>>> >  };
>>> >
>>> > +/**
>>> > + * struct xe_force_wake_guard - Xe force wake guard
>>> > + */
>>> > +struct xe_force_wake_guard {
>>> > +    /** @fw: force wake manager */
>>> > +    struct xe_force_wake *fw;
>>> > +    /** @ref: opaque reference to woken domains */
>>> > +    unsigned int ref;
>>> > +};
>>> > +
>>> >  #endif
>>> > --
>>> > 2.43.0
>>> >

