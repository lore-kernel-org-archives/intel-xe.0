Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E156C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 08:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA50510E5F3;
	Tue,  5 Aug 2025 08:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTC2pkW+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279DE10E5F3
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754380890; x=1785916890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=1oeycqtTllu/0Xdij813kZlqpwq0mnvRSmFgqFWr68A=;
 b=CTC2pkW+L5ZQUs5lU/ft+iGranzWKZxgJo2hxL9yIDMOiBWPyXjl8o/U
 McOD0Ugu+Mvhm3QEV9iuE6J7VV1NCpPRauRzN5Smz7BLrewgJZC2pRKK+
 iGc7slADFebPz2Mdl0AiM0Gy5HSDWjfxBghN3RE1F+s09FTwpvl1baVcb
 gpeBNldE8PHGU0zs1mrikuiU8fF0kK7RsPHss5Joa5X7FU6EuiqAFPmnG
 hJFXnuOFckmf74lAUay2Rhwaql+w/aak4Pbk8LjrmIoC9o8TQFHsF4yeP
 z+zkhyzR8YvBo891Uns8NQeDYidOvmfzhXHZoKqsbc4lqhI/P6fuC6Wle g==;
X-CSE-ConnectionGUID: ojojWEQXQMCvMvw5DBEHUg==
X-CSE-MsgGUID: w9KDHBb3So+ok88xI+qcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="68035673"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="68035673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 01:01:23 -0700
X-CSE-ConnectionGUID: u3KDPxWxR4W2GoCzSA/ZdQ==
X-CSE-MsgGUID: Gmy57JpSRKiHE+AHKyLIwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164718622"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 01:01:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH] drm/xe: Fix coverity issue, truncation warning
In-Reply-To: <BL1PR11MB55251268AD97F367EAB270D18422A@BL1PR11MB5525.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250804104409.3305071-1-pravalika.gurram@intel.com>
 <aJF79APhUqUUK1Xl@lstrano-desk.jf.intel.com>
 <BL1PR11MB55251268AD97F367EAB270D18422A@BL1PR11MB5525.namprd11.prod.outlook.com>
Date: Tue, 05 Aug 2025 11:01:18 +0300
Message-ID: <c40ed15a85e68e3e4d9c3a3fa9f63d162a5b4cc2@intel.com>
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

On Tue, 05 Aug 2025, "Gurram, Pravalika" <pravalika.gurram@intel.com> wrote:
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: Tuesday, August 5, 2025 9:05 AM
>> To: Gurram, Pravalika <pravalika.gurram@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>
>> Subject: Re: [PATCH] drm/xe: Fix coverity issue, truncation warning
>>=20
>> On Mon, Aug 04, 2025 at 04:14:09PM +0530, Pravalika Gurram wrote:
>> > Use conditional assignment to avoid cast truncation warning.
>> > Set instance to 0 when hw_reports_to_instance_zero() returns false.
>> >
>> > Fixes: 95336cfd5b2ce ("drm/xe: Add memirq report page address
>> > helpers")
>>=20
>> Definitiely no fixes tag required here.
>>=20
>> >
>> > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_memirq.c | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_memirq.c
>> > b/drivers/gpu/drm/xe/xe_memirq.c index 49c45ec3e83c..75ddf4eda355
>> > 100644
>> > --- a/drivers/gpu/drm/xe/xe_memirq.c
>> > +++ b/drivers/gpu/drm/xe/xe_memirq.c
>> > @@ -257,7 +257,8 @@ static u32 __memirq_source_page(struct xe_memirq
>> *memirq, u16 instance)
>> >  	memirq_assert(memirq, instance <=3D XE_HW_ENGINE_MAX_INSTANCE);
>> >  	memirq_assert(memirq, memirq->bo);
>> >
>> > -	instance =3D hw_reports_to_instance_zero(memirq) ? instance : 0;
>> > +	if (!hw_reports_to_instance_zero(memirq))
>> > +		instance =3D 0;
>>=20
>> I'm failing to see how this fixes any possible static checker. Could you=
 explain?
>>=20
>> That said, I do prefer the way you have changed it here.
>>=20
>> Matt
>>=20
>>=20
> The Static analyzer treating the=C2=A0ternary expression "hw_reports_to_i=
nstance_zero(memirq) ? instance : 0" evaluates to a 32-bit value
> Hence, I have added if condition to avoid a=C2=A0static checker error
> cast overflow: Truncation due to cast operation on hw_reports_to_instance=
_zero(memirq) ? instance : 0 from 32 to 16 bits.

Obviously it's not possible for this expression to truncate anything,
and the static analyzer is being silly.

BR,
Jani.


>
> Pravalika
>
>> >  	return xe_bo_ggtt_addr(memirq->bo) +
>> > XE_MEMIRQ_SOURCE_OFFSET(instance);
>> >  }
>> >
>> > --
>> > 2.34.1
>> >

--=20
Jani Nikula, Intel
