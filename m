Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3310DCD68E5
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 09:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EB910E330;
	Tue, 10 Oct 2023 09:14:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2D010E331
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696929270; x=1728465270;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=4uQZSdkvTt5X6SKwkHQaHblsDeDREhqd2cAwhi8K3g0=;
 b=dV/k5gav13T2TJNHvY2PGGWXE76ZaeIwSc2cZ/HQiZkE0jeAZHlhQLJT
 lOBd3h7UASLd2NdxmmNfRwtW4W5uJfT5318W496EBElyqUzNXzV9JzR+3
 a7Ob/UJwH/d5b3CrnRUjrqTtAR6e3/TdYoLJ54NF1YMXplOSh71zLUU5h
 qz+nk0CRT0Mm7QJdd2nxIh3ZAYvbRorixyPbU+SQG8ZtlHCLvVpH+N3Ts
 EfMLU2QpMumj7pJJ2VQa91jX5PiJVb/vCjRNTYa6Kckz+6TacJ+XyYDH2
 87FU2nHg1/GP3qrBd5Up/FthJVppFj7XA2rHRCPBwI6kXdXAMUB81HE9u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="381607816"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="381607816"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="897103895"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="897103895"
Received: from pors-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.42.155])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:12:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
In-Reply-To: <DM4PR11MB63604707F3239BFE7A0A1E58F4CDA@DM4PR11MB6360.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231006115645.2402795-1-uma.shankar@intel.com>
 <20231006115645.2402795-4-uma.shankar@intel.com>
 <DM6PR11MB3177EAD727A47713E825B03FBACEA@DM6PR11MB3177.namprd11.prod.outlook.com>
 <DM4PR11MB63604707F3239BFE7A0A1E58F4CDA@DM4PR11MB6360.namprd11.prod.outlook.com>
Date: Tue, 10 Oct 2023 12:14:25 +0300
Message-ID: <87edi26dqm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [v2 3/3] drm/xe: Create a dummy version for vga
 decode
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

On Tue, 10 Oct 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>>
>> > -----Original Message-----
>> > From: Shankar, Uma <uma.shankar@intel.com>
>> > Sent: Friday, October 6, 2023 5:27 PM
>> > To: intel-xe@lists.freedesktop.org
>> > Cc: Nikula, Jani <jani.nikula@intel.com>; Murthy, Arun R
>> > <arun.r.murthy@intel.com>; Shankar, Uma <uma.shankar@intel.com>
>> > Subject: [v2 3/3] drm/xe: Create a dummy version for vga decode
>> >
>> > This introduces an exclusive version of vga decode for xe.
>> > Rest of the display changes will be re-used from i915.
>> >
>> > Currently it adds just a dummy implementation. VGA decode needs to be
>> > handled correctly in i915, proper implementation will be adopted once
>> > the i915 changes are finalized and merged in upstream.
>> >
>> > v2: Addressed Arun's review comments
>> >
>> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> > ---
>> Reviewed-by: Arun R Murthy <arun.r.mruthy@intel.com>
>
> Thanks Arun for the reviews.
>
> Hi Jani,
> Can you please ack this change, I will trigger a task for vga decode hand=
ling cleanup
> for i915 as next step.

Not super thrilled about adding a file named "display misc", because
experience has shown anything like that becomes a dumping ground for
random stuff. But anyway,

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Thanks & Regards,
> Uma Shankar
>
>
>> Thanks and Regards,
>> Arun R Murthy
>> --------------------
>> >  drivers/gpu/drm/xe/Makefile                  |  1 +
>> >  drivers/gpu/drm/xe/display/xe_display_misc.c | 14 ++++++++++++++
>> >  2 files changed, 15 insertions(+)
>> >  create mode 100644 drivers/gpu/drm/xe/display/xe_display_misc.c
>> >
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index
>> > dff1386ee6b3..175a357366d9 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -150,6 +150,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>> >     display/xe_hdcp_gsc.o \
>> >     display/xe_plane_initial.o \
>> >     display/xe_display_rps.o \
>> > +   display/xe_display_misc.o \
>> >     display/ext/i915_irq.o \
>> >     display/ext/i915_utils.o
>> >
>> > diff --git a/drivers/gpu/drm/xe/display/xe_display_misc.c
>> > b/drivers/gpu/drm/xe/display/xe_display_misc.c
>> > new file mode 100644
>> > index 000000000000..81ff97e704ea
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/display/xe_display_misc.c
>> > @@ -0,0 +1,14 @@
>> > +// SPDX-License-Identifier: MIT
>> > +/*
>> > + * Copyright =C2=A9 2023 Intel Corporation  */
>> > +
>> > +#include "intel_display_types.h"
>> > +
>> > +struct pci_dev;
>> > +
>> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
>> > +enable_decode) {
>> > +   /* ToDo: Implement the actual handling of vga decode */
>> > +   return 0;
>> > +}
>> > --
>> > 2.42.0
>

--=20
Jani Nikula, Intel
