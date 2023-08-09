Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EC0EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 10:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A936310E143;
	Wed,  9 Aug 2023 10:26:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C39D10E143
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691576789; x=1723112789;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=adMoynn23lOrbtjyAO1EovUPckOKqRHuFN17BgF0cJc=;
 b=bSnkzPGAzE72RMDaqvnKUCHC2AycnoyFDuoI2txEr8h+NSckJu9ECiRP
 OP43RRY8hsgNQU2cG9kVOhmPhH1KO/LIvsCKaLIm1Yw4LXPJHIbQaX6Vt
 0sU6lYe0jGTdhyT2muXzY5KXRaoMNUIZUnkiGMMQijJc3/a4UQfOpNqvT
 OTRXtwXdEjuZ1dJgJKhaH2pfK/M8mCSN6EYyxMsUqrNzMFZVR4iLXc9n7
 8hCiTYauDWGF+PlYyHcW81n05SlKa1lT5Z3ojoUdXOhzGjo60D4wPAXYC
 0h5V6T4jkNGIBgT3Vv5WXgjYLUVYwSmVo1UCjcTOkw01EvII/oUenblqV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="356051311"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="356051311"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 03:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681628252"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="681628252"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.102])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 03:26:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, David Kershner
 <david.kershner@intel.com>
In-Reply-To: <ZNKM0WeE1vbZ1Yqz@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230808164534.1027552-1-david.kershner@intel.com>
 <20230808164534.1027552-2-david.kershner@intel.com>
 <ZNKM0WeE1vbZ1Yqz@intel.com>
Date: Wed, 09 Aug 2023 13:26:22 +0300
Message-ID: <87edkcse9d.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Introduce a module parameter to
 control XeLink
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com, john.fleck@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 08 Aug 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Tue, Aug 08, 2023 at 12:45:32PM -0400, David Kershner wrote:
>> Add a new module parameter to control enable/disable of the XeLink
>> feature.
>>=20
>> Signed-off-by: David Kershner <david.kershner@intel.com>
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Basically the direction from upstream is crystal clear, and has been for
years: never ask users to modify module parameters for normal operation.

Also, it's not possible to adjust this per-device.

Why are we still doing this?


BR,
Jani.


>
>> ---
>>  drivers/gpu/drm/xe/Makefile    |  3 ++-
>>  drivers/gpu/drm/xe/xe_xelink.c | 17 +++++++++++++++++
>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_xelink.c
>>=20
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1b59702cd9f9..d46558cf12a9 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -115,7 +115,8 @@ xe-y +=3D xe_bb.o \
>>  	xe_vm_madvise.o \
>>  	xe_wait_user_fence.o \
>>  	xe_wa.o \
>> -	xe_wopcm.o
>> +	xe_wopcm.o \
>> +	xe_xelink.o
>>=20=20
>>  # i915 Display compat #defines and #includes
>>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>> diff --git a/drivers/gpu/drm/xe/xe_xelink.c b/drivers/gpu/drm/xe/xe_xeli=
nk.c
>> new file mode 100644
>> index 000000000000..51a31f6a4740
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_xelink.c
>> @@ -0,0 +1,17 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/moduleparam.h>
>> +
>> +/*
>> + * This module parameter is needed because SRIOV PF and XeLink are mutu=
ally
>> + * exclusive. The driver needs to be able to enable/disable the XeLink
>> + * infrastructure (specifically Device Physical Addressing).  Since the=
re
>> + * will be no enable/disable for the SRIOV PF path, this parameter is
>> + * needed to explicitly disable XeLink when SRIOV PF is required.
>> + */
>> +static bool xe_enable_xelink =3D true;
>> +module_param_named(enable_xelink, xe_enable_xelink, bool, 0400);
>> +MODULE_PARM_DESC(enable_xelink, "Enable XeLink feature (default: true)"=
);
>> --=20
>> 2.35.1
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
