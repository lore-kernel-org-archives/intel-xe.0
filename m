Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21910C4829E
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 19:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA29210E1C6;
	Mon, 12 Feb 2024 19:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/s13wGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C4510E176
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707766221; x=1739302221;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=vF5jKuClLgpskWO2g3SeXcdsiCTGU8hU9HZtebB+QdE=;
 b=d/s13wGqa0dPw2dPD5SW13ewdIvEc3sMuvktwavylPnTeNXoJ5aFd944
 FdB+7f/8slwDT0aFEyWEMhO0sXcONAp2eHsm5scKpUPpkU9RwEMgcCYar
 lglPCQ5ztx/Yl4UL9P8yFV6Vm47R/mzSaaoEHqXadrLL3+Kx5RbfXSch6
 bFUGVitb8l2RbZg+FNd+OWY5nzfbRXYQC78kQA7Khct920JRfQCwquCrD
 cSwh6t0UUozVaujvi/vafg0CTVThQMm4h0uwMcJZxW4Lk/S/9FJqF+ltc
 oVfkuRRgOxLDVZi/nqZ8N0fM+ostIX5keRWC/uvAMMgH1tscRnRykkcAX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1896469"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1896469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 11:30:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="2650277"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 11:30:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: use drm based debugging instead of dev
In-Reply-To: <26e8d3c2ef45e64dc07f568222e709ac64ad6b35.camel@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240212145757.645094-1-jani.nikula@intel.com>
 <26e8d3c2ef45e64dc07f568222e709ac64ad6b35.camel@linux.intel.com>
Date: Mon, 12 Feb 2024 21:30:14 +0200
Message-ID: <87plx18oqh.fsf@intel.com>
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

On Mon, 12 Feb 2024, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> On Mon, 2024-02-12 at 16:57 +0200, Jani Nikula wrote:
>> Prefer drm_dbg() over dev_dbg().
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Thanks, pushed to drm-xe-next.

BR,
Jani.

>
>> ---
>> =C2=A0drivers/gpu/drm/xe/xe_irq.c | 2 +-
>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c
>> b/drivers/gpu/drm/xe/xe_irq.c
>> index 17b3affdb6a0..2f5d179e0d00 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -442,7 +442,7 @@ static irqreturn_t dg1_irq_handler(int irq, void
>> *arg)
>> =C2=A0		 * irq as device is inaccessible.
>> =C2=A0		 */
>> =C2=A0		if (master_ctl =3D=3D REG_GENMASK(31, 0)) {
>> -			dev_dbg(tile_to_xe(tile)->drm.dev,
>> +			drm_dbg(&tile_to_xe(tile)->drm,
>> =C2=A0				"Ignore this IRQ as device might be
>> in DPC containment.\n");
>> =C2=A0			return IRQ_HANDLED;
>> =C2=A0		}
>

--=20
Jani Nikula, Intel
