Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38AAD6C291
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 19:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9E210E374;
	Tue, 19 Nov 2024 19:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbVol00k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953AB10E374
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732046385; x=1763582385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JtH3GDTLY5YHDCJdmiPjr5H8DEEl7xnsYynqJi7A0Q8=;
 b=gbVol00k4ePDYvAAi4ceQCz7SgiLJWl6fPSalQ5omo+LMdSvjFLWx2DR
 RM1kotQRNijtdDrOpLyNueNfYJj8sB4NZueI4zSnECoQG3wu2Y9k1aBXD
 Qx/3es5ImgyhcpRiPt1Ug4ykICKIc6PgO31gDcJNWwN7XzHRMaciJSKef
 thbeAqBncLJuYiWBu7AD3EIBtKaf7Ur3Vi/EGx2qjXwWDBEtH5vdJTbJJ
 3HXGwxMmSyd9xXqJ5F3306ZCUMNwRNfAEgX9vYCVgJvXzsKYtGGpj5fkF
 aCzMpYZi8/LVLgK1kdE5NJx3CAk49IGmBLjdELLdzLGgmbwDLP23tzQGO g==;
X-CSE-ConnectionGUID: 6GO+JMG+QzGwvXpaHv64Lw==
X-CSE-MsgGUID: yNjslyLkSNqXrR27gr8ouw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32005673"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32005673"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 11:59:44 -0800
X-CSE-ConnectionGUID: HUKLzByfTC+uocnJQGWKlg==
X-CSE-MsgGUID: vhLthP0PQUm/JT1G3X00tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94606972"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.70])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 11:59:43 -0800
Date: Tue, 19 Nov 2024 13:59:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, intel-xe@lists.freedesktop.org, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Introduce force-wake guard class
Message-ID: <4mulnkmh6np2ney767qf5hvcj4tfse6t2bavudulnz77jjyagg@r4xtypqhsnkq>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-2-michal.wajdeczko@intel.com>
 <ZzzdQGnrSSD7jKs_@intel.com> <ZzzlLQAh9yqAl3q8@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZzzlLQAh9yqAl3q8@black.fi.intel.com>
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

On Tue, Nov 19, 2024 at 09:21:17PM +0200, Raag Jadav wrote:
>On Tue, Nov 19, 2024 at 01:47:28PM -0500, Rodrigo Vivi wrote:
>> On Mon, Nov 18, 2024 at 07:45:10PM +0100, Michal Wajdeczko wrote:
>> > There is support for 'classes' with constructor and destructor
>> > semantics that can be used for any scope-based resource management,
>> > like our domain force-wake management.
>>
>> There is, okay...
>> It can be, okay...
>>
>> But why do we want?
>> What are the advantages?
>
>Makes error cases easier to handle + less code.
>We significantly cleaned up intel pinctrl and gpio drivers a few months ago
>and almost halved the footprint in some cases.

I'm ok with using this pattern as I already expressed before.
Particularly seeing other subsystems adopting it and being used well in
the core kernel as well.

Main ask here is to provide proper justification in the commit message.

Lucas De Marchi

>
>Raag
>
>> >
>> > Define xe_fw class that can be used for force-wake management.
>> >
>> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> > ---
>> > v2: aligned to new force-wake usage model (Michal)
>> > ---
>> >  drivers/gpu/drm/xe/xe_force_wake.h       | 12 ++++++++++++
>> >  drivers/gpu/drm/xe/xe_force_wake_types.h | 10 ++++++++++
>> >  2 files changed, 22 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> > index 0e3e84bfa51c..e46e44f7eb70 100644
>> > --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> > @@ -6,6 +6,8 @@
>> >  #ifndef _XE_FORCE_WAKE_H_
>> >  #define _XE_FORCE_WAKE_H_
>> >
>> > +#include <linux/cleanup.h>
>> > +
>> >  #include "xe_assert.h"
>> >  #include "xe_force_wake_types.h"
>> >
>> > @@ -61,4 +63,14 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
>> >  	return fw_ref & domain;
>> >  }
>> >
>> > +DEFINE_CLASS(xe_fw, struct xe_force_wake_guard,
>> > +	     xe_force_wake_put(_T.fw, _T.ref),
>> > +	     ({ (struct xe_force_wake_guard){ fw, xe_force_wake_get(fw, domains) }; }),
>> > +	     struct xe_force_wake *fw, enum xe_force_wake_domains domains);
>> > +
>> > +static inline void *class_xe_fw_lock_ptr(class_xe_fw_t *_T)
>> > +{
>> > +	return _T->ref ? _T : NULL;
>> > +}
>> > +
>> >  #endif
>> > diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> > index 899fbbcb3ea9..15456a24f707 100644
>> > --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>> > @@ -85,4 +85,14 @@ struct xe_force_wake {
>> >  	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>> >  };
>> >
>> > +/**
>> > + * struct xe_force_wake_guard - Xe force wake guard
>> > + */
>> > +struct xe_force_wake_guard {
>> > +	/** @fw: force wake manager */
>> > +	struct xe_force_wake *fw;
>> > +	/** @ref: opaque reference to woken domains */
>> > +	unsigned int ref;
>> > +};
>> > +
>> >  #endif
>> > --
>> > 2.43.0
>> >
