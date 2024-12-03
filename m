Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93B5E69EBD
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 22:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A958910E264;
	Tue,  3 Dec 2024 22:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzbFNglI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774610E264
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 22:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733263878; x=1764799878;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1HVFDEsbmgQKui2citUz92YdleHZ2iGG4LI2mievuTk=;
 b=VzbFNglI3Ndn67903UmHfdL0E2Ylz3/g9ts6xtHUHjWk1hfdxPHHWlau
 yg4/1T0Ki/Z6yZzdKmUH737j5/HlXAA6mL9kvfCDuhhJptRxYN2rfu4Og
 ivk7xlTxoRDHCct31Q+ig+FDRh+KKv9/UsOOAY5ym6PWSsruOeY9oH/7W
 iMf8NjavsFFEqqZMrOjnGmw76KkJsLDWnPG1t9yPfvVTbjiK4vAYDEhgE
 6aaQYW1jbxFUZrV4vv2l4Pf3uvby/k2V+ny35Xe76VcDON/JEvJJlGmw+
 mxuWjLe+05jBt8QukIKZHyzTKt3jfOa7QxbSB3zdlUYFqIy8kjjizXfaM Q==;
X-CSE-ConnectionGUID: n8lUpl+QQW2PwDyV9m73Fg==
X-CSE-MsgGUID: /mfyNQHsT3WTIm6esXIoTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="32850533"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="32850533"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 14:11:18 -0800
X-CSE-ConnectionGUID: ZCwuHWSlQqGDHt4j0akbPQ==
X-CSE-MsgGUID: 73lGNYO0SVGienhnUX14Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="116821672"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 14:11:17 -0800
Date: Tue, 3 Dec 2024 16:11:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, 
 "Zuo, Alex" <alex.zuo@intel.com>, "Nerlige Ramappa,
 Umesh" <umesh.nerlige.ramappa@intel.com>, 
 "Harrison, John C" <john.c.harrison@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Message-ID: <7bm4nksegt4vlbq5s4ze4ivzq3u66qb3wsuozb5ytk7fe2uy44@xybhcfgpz32r>
References: <20241122180826.7075-1-jonathan.cavitt@intel.com>
 <85ttbl3jvv.wl-ashutosh.dixit@intel.com>
 <CH0PR11MB544416674720232DB8B7B8ABE5352@CH0PR11MB5444.namprd11.prod.outlook.com>
 <85r06o3026.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <85r06o3026.wl-ashutosh.dixit@intel.com>
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

On Tue, Dec 03, 2024 at 01:53:53PM -0800, Ashutosh Dixit wrote:
>On Mon, 02 Dec 2024 13:11:21 -0800, Cavitt, Jonathan wrote:
>>
>> -----Original Message-----
>> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
>> Sent: Monday, December 2, 2024 12:33 PM
>> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
>> Subject: Re: [PATCH v3] drm/xe/xe_guc_ads: Add nonpriv registers to write list
>> >
>> > On Fri, 22 Nov 2024 10:08:26 -0800, Jonathan Cavitt wrote:
>> > >
>> > > When performing a guc_mmio_regset_write, we add all the registers in the
>> > > reg_sr list to the save/restore list, but do not do the same for the
>> > > nonpriv registers.  Add them in.
>> > >
>> > > v2:
>> > > - Add all NONPRIV registers to avoid undefined behavior (Harrison)
>> > > - s/whitelist/nonpriv
>> > >
>> > > v3:
>> > > - Rebase
>> > >
>> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> > > CC: Lucas de Marchi <lucas.demarchi@intel.com>
>> > > CC: Matt Roper <matthew.d.roper@intel.com>
>> > > CC: John Harrison <john.c.harrison@intel.com>
>> > > CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++++
>> > >  1 file changed, 7 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > > index 943146e5b460..b0afb89d9d90 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > > @@ -243,6 +243,8 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>> > >		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>> > >			count++;
>> > >
>> > > +	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
>> > > +
>> > >	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>> > >
>> > >	if (XE_WA(gt, 1607983814))
>> > > @@ -727,6 +729,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>> > >	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>> > >		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>> > >
>> > > +	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
>> > > +		guc_mmio_regset_write_one(ads, regset_map,
>> > > +					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
>> > > +					  count++);
>> > > +
>> >
>> > What about the EU_PERF_CNTL registers which were there in the original
>> > patch? Those are not needed?
>>
>> It turned out they weren't.  At least not for this use case.
>> They might be needed later for a different issue, but right now we aren't
>> observing any issues caused by their absence.
>
>Ok, let's keep this patch restricted to the nonprov registers.

applied, thanks.



Lucas De Marchi

>
>
>>
>> >
>> > >	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>> > >		if (e->skip)
>> > >			continue;
>> > > --
>> > > 2.43.0
>> > >
>> >
