Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996FDC9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 16:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394BB10F129;
	Wed, 23 Sep 2026 16:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URL+HT8P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B8710F129
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790179287; x=1821715287;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Kp2/4Ad5F1XiVbIHO7wSK4Be2DhgK8cIO9F4HjRfHUw=;
 b=URL+HT8PpSl5Xg8rnshD7r3QXdasLIvsh9ju5AJpfbBPvvErkG9t71cw
 8TeJAFL7Ys3shwpF4K7/lr1cUlaMVz5H4ew+ueNp122BnlOGALAAUZv4A
 WuL42wZryhk458Ii0sbl9EKX8VztSEw2QgXQRY/zoOj3+a99bpfkSVbcl
 LHIJcbKXFONMj8rB7gC+mAnQvnwCnPRGd4HEPd/IXm7tteMiilrxoIB7q
 Ix+59DE+lPQpOhRlnn6Rj6aKGhr5P+TJX2syIJgp3d/wIiYQf9adS84bv
 UIknt8epi0bQ/ovw0qG0MAh0N2n22T0N31upf/u8oBi4VnCaab7uKSdjJ g==;
X-CSE-ConnectionGUID: eLpku6NIQX6b3xxKj801RQ==
X-CSE-MsgGUID: v7MpsCeyRueD69CT07OBYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="102251464"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="102251464"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:01:25 -0700
X-CSE-ConnectionGUID: By+1JBTLSIaKAnl/U4+w5w==
X-CSE-MsgGUID: jzXoPVvlQZ+YYVAnoZlTaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="272854373"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:01:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/display: reduce includes in xe_display.c
In-Reply-To: <sb4ohi5vcesorj3ilyybodexjxoiu37hlwjmcukahtevt4fcck@4m3eg66hc3bw>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260922151721.1483978-1-jani.nikula@intel.com>
 <sb4ohi5vcesorj3ilyybodexjxoiu37hlwjmcukahtevt4fcck@4m3eg66hc3bw>
Date: Wed, 23 Sep 2026 19:01:21 +0300
Message-ID: <9a916635a5589b45d89425ade99d0edf613f04f5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 22 Sep 2026, Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com> w=
rote:
> On Tue, Sep 22, 2026 at 06:17:21PM GMT, Jani Nikula wrote:
>> xe_display.c has a bunch of extra leftover includes. Remove and
>> simplify.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

Thanks, pushed to drm-intel-next.

BR,
Jani.

>
> BR,
> Micha=C5=82
>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/x=
e/display/xe_display.c
>> index 7b25c0814674..506f26e9c59a 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -6,31 +6,23 @@
>>  #include "xe_display.h"
>>  #include "regs/xe_irq_regs.h"
>>=20=20
>> -#include <linux/fb.h>
>> +#include <linux/acpi.h>
>>=20=20
>> -#include <drm/drm_client.h>
>> -#include <drm/drm_client_event.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_managed.h>
>> -#include <drm/drm_probe_helper.h>
>>  #include <drm/intel/display_member.h>
>>  #include <drm/intel/display_parent_interface.h>
>> -#include <uapi/drm/xe_drm.h>
>>=20=20
>> -#include "intel_acpi.h"
>>  #include "intel_display.h"
>>  #include "intel_display_core.h"
>>  #include "intel_display_device.h"
>>  #include "intel_display_driver.h"
>>  #include "intel_display_irq.h"
>> -#include "intel_display_types.h"
>>  #include "intel_dmc.h"
>>  #include "intel_dmc_wl.h"
>> -#include "intel_dp.h"
>>  #include "intel_fbdev.h"
>>  #include "intel_hotplug.h"
>>  #include "intel_opregion.h"
>> -#include "skl_watermark.h"
>>  #include "xe_device.h"
>>  #include "xe_display_bo.h"
>>  #include "xe_display_pcode.h"
>> --=20
>> 2.47.3
>>=20

--=20
Jani Nikula, Intel
