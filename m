Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A2BC3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 13:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5056C10E49B;
	Wed, 14 Aug 2024 13:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYIz1iaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539BD10E49B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723643786; x=1755179786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C37OoDdd1gzVMoFMiBQNgrjuyFWgYuDQxb7yZDxfzws=;
 b=KYIz1iaDFC6giBAIwqCoIvSWSBkvRovcZAaf7F+AVDx/QNhGZd3qssJY
 B+uii6cRg9XXR57vxsf/oXQ+gWE5pV+EqP9HR2DBL7hoTypzf3SYaKi4j
 oY3ZLHGIt47Kusj6IDcZUMzkxjnL9nwqJRCChQzZ3NIamZxAU7rNxag27
 20H0Q0xDhUH6CI6iNZdDW5wwniIlLpDerPI9rW7BHqEVyOD9opGMG9NBy
 s5iMq98idm/9tdH4QQkFF87JmAr2zHlgdjoli+6pfE/opTurn+5/897TP
 IXyVhCJS1lmN36vfe/ER4DqmLzrm1zDovfWIzZVqZ2srLz39KJuvCC6Qo w==;
X-CSE-ConnectionGUID: SzYTAiBTRVeodMApPd6RDw==
X-CSE-MsgGUID: /vOGHGMdR4yFmdI6Z5HEnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39368595"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="39368595"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:56:26 -0700
X-CSE-ConnectionGUID: 9Ro7xBblTQWDeWDH3tSr8w==
X-CSE-MsgGUID: BYri71D2SpCLdviTezlyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63963632"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:56:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1seEU9-0000000FCIt-0WkO; Wed, 14 Aug 2024 16:56:21 +0300
Date: Wed, 14 Aug 2024 16:56:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v11] drm/xe/vsec: Support BMG devices
Message-ID: <Zry3hOBb_fHbvlIN@smile.fi.intel.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
 <Zrtpd_WwougszltH@smile.fi.intel.com>
 <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Aug 13, 2024 at 02:29:27PM +0000, Ruhl, Michael J wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Tuesday, August 13, 2024 10:11 AM
> > On Mon, Aug 12, 2024 at 04:04:22PM -0400, Michael J. Ruhl wrote:

...

> > > +#define SOC_BASE		0x280000
> > > +
> > > +#define BMG_PMT_BASE		0xDB000
> > > +#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
> > 
> > > +#define BMG_TELEMETRY_BASE	0xE0000
> > > +#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)
> > 
> > This looks like double indirection.
> > Wouldn't suffix _BASE_OFFSET be better for PMT and TELEMETRY cases?
> 
> I am not sure I understand.
> 
> Are  you saying rename BMG_PMT_BASE to BMG_PMT_BASE_OFFSET?

Yes. Same for BMG_TELEMETRY_.

...

> > > +#define BMG_DEVICE_ID 0xE2F8
> > 
> > Is this defined in any specification? I mean is the format the same as PCI device
> > ID?
> 
> I think that this is defined in BMG PMT yaml definition.  It is provide in
> the PMT discovery data, so it is defined by the specific device. 

Is there any documentation / specification about this?
Can it be UUID or 64-bit number or other format?
_Where_ is this being specified?

...

> > > +	switch (record_id) {
> > > +	case PUNIT:
> > > +		*index = 0;
> > > +		if (cap_type == TELEMETRY)
> > > +			*offset = PUNIT_TELEMETRY_OFFSET;
> > > +		else
> > > +			*offset = PUNIT_WATCHER_OFFSET;
> > > +		break;
> > > +
> > > +	case OOBMSM_0:
> > > +		*index = 1;
> > > +		if (cap_type == WATCHER)
> > > +			*offset = OOBMSM_0_WATCHER_OFFSET;
> > > +		break;
> > > +
> > > +	case OOBMSM_1:
> > > +		*index = 1;
> > > +		if (cap_type == TELEMETRY)
> > > +			*offset = OOBMSM_1_TELEMETRY_OFFSET;
> > > +		break;
> > 
> > default case?
> 
> I validate the record_id and cap_type values at the beginning of the function,
> so default would be redundant.
> 
> The goal was to validate, then set data.
> 
> So adding the default will remove the record_id check from the if.  Do you prefer
> that path?

Yes.

> > > +	}

-- 
With Best Regards,
Andy Shevchenko


