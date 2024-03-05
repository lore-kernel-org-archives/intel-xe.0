Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34162C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 22:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FAB10F2C4;
	Tue,  5 Mar 2024 22:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N65Ukcmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A969410F2C4
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709678751; x=1741214751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u/7fgO6tjCXMgu8TcNpnN/swmpvIQ/OpIVl8nEMQD60=;
 b=N65Ukcmu6NGCKK2bo+QsE6ej9T6jMG29Qsi4Q9bX+6sn3CQTUUAp6wYx
 gqob2nx1voJ0clANvs2HXDJAuImZ3LrUHd+cSL4From4Y73Zf6e1+hX/f
 9rQ63hzR9yYhQ3Bn/pH8rJcEchoXIhaXZQfsub97IRKLrSBVnLm1HOY39
 Gj7Klo0vk/Ua1WdIdgLW1zUVKOs71CBMlRmjWPakSb3yi7GTzWVZA0LMI
 8RWY5euqnkL6cXuO9H6R+AEmMzfWCgTs1nN+Kny3hHDIrWSkKGjlRiSSB
 +HCDiobYl+6ieq0P+g6w7DkHnNUTpJwvg+Cfj0GWTaRI+85nM2ckhTbZc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15406776"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="15406776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 14:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9633425"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 14:45:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 14:45:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 14:45:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 14:45:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLRO3NEhSsAhi09yHcxQMGkFSinMr9t7xMxKykDvCKG0d1v+/jO+H7rb84pXN0MzRhPxgqHE0vCyq3eWlltm9xY2174h5vqw1yb6oHP2tsUnNI9VvA1HZI02dYeyInR/ZpAqKxE9dJZSKUXnFn15rOcJeytTkF+TE0RIaPMCh6f+47b5pTOWqrYUIvBVsRGNxtsQr5zjsZI3hlXtas55zx5gn0bNqTlTHlXjBGKfzLllgtrre+6fO7w/xx/G+dkBqFyPbJ1CB7FfaC5UbFpw0ur6IyLgf9Di6dsRhd1NyjvUL9S2hUMsB3kwZsPRQZhsGKdPuWy7QC3O1HsBlKnFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pwz37DEiURPod5xlCGu3t7wmsrQ+SvWBKiO9l/D9bJg=;
 b=abJwK9iqZB8bHVs4NTraikLBB1MmyvalqLDa16InERLsKXowJd0knBH1k0kbcJi4XjkXAHEzo3q1URIna2HVy0julMDc2QZSektZNFCW2hDdslYWYLxqWVx4O8zCMweDB77EUmljLFE1ci6bphLobgQhcU3EMAIN4dGFQZjZhFyZ4U7SPCAhkyvRTRFudPCleY/lMtJpca6NAv0WWJphINGBPFt8iLqF+hqR5iv+6im5atVWuF9lw3j83Gd0R/e859o5zXmh6xTDE/3ctGyMFBTbdtz+y+bGM3Xbfed1iatZLy0BWmNRJiKQ68aeyL0VCM8vn++TX1dVwy3GAwDo4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 22:45:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 22:45:47 +0000
Date: Tue, 5 Mar 2024 17:45:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/9] drm/xe: Move xe_irq runtime suspend and resume out
 of lockdep
Message-ID: <ZeegmIhyBz5aCwcm@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-4-rodrigo.vivi@intel.com>
 <13054dd0-51cd-4dd4-8b14-4587037acf2f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <13054dd0-51cd-4dd4-8b14-4587037acf2f@intel.com>
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 4677d3c5-b58e-4ef4-694a-08dc3d65ffa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9ATvfZeVea3UpjoT9EWe1actNyaTsSkxh83oNUxgDQujhtuD/XZhyRU7gC/pwvGIHuE31fSygWqiG47zJDF1yHzfiLdIIDip1KkuzIOGSeXR8MJXr8LnMJmBvx1xbn1I4BzNHaSYNBg2V/jjvzVg5WLCDY0+mwX4bKPvWR1JSRj1c5j9xrxyONVtZNlkCHha29ltbBNr6G/8xsoqlGV5w5WVQ8EdSG/woAizDCoyTg7dCclFec1ly08pBykBJZTiJ7IYP3se+Oj6DT3xTwBZVAqBdnC4Y4XKQvSCtch9MO+YuJwFS6KTuyU8TpH0+EP9f0jHfV5FLuSUQnCiE1d1Bz1XA9ttAVuArdLXyrTG6vOnu0+hnb3mWEMJ32/JtEq3tg7Tw+QtdZrn8kpQeerZg8PS8Mdob0qWTWpIQFjd2EbIB7/tc7M9wbrxPGOuxdABm8D3V1OdEUpcPgCmuNqlh9gVQ6EmEs27qb94wjxdVtO6lWNeUpqUkiKdAtDQQDsr1+5jU2wZrwLXjdDDdWOPMaPT9EY2iyXDCX0g8SP4oTmEVaMehB5ojG79czf4q+Y6Jb9KAhK47K3bhI1w2SslzhgFfaQ3KbEKPXgwB4LPQC3rQ2Q9z144hDMKFxNAQ2u6OWbMVgjJRaiE0FjLGjLNNHDZknYAWbrr688rTXe4aY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?64KYEI2gVgk9yswwQYVkOTQlH2crIuOBmTukwyXIIS9MIdPTuTQ7hcXLym97?=
 =?us-ascii?Q?7yTtrrGGV+8sVfhulkw6ULnIIVwDyvP9tsDFPM6orOZk1rKy+JwOuuf3r79Z?=
 =?us-ascii?Q?cJ8ZGofMj0Zcz4qABGR1mzi19DHocCEn/dibCXKn2x3KOnrcOfaD1fwJQV/g?=
 =?us-ascii?Q?O9L5rfciMUUxS24DXJz8UXUUDRknMDiEdIvT8BFmmhJQ4xb8t2CT3KZ8DYbb?=
 =?us-ascii?Q?eAc1XAh1YCgZn1gLAvy8/JsKlX5L/5wRSdDkii/Lv+Uyk8JMEvq+pqYvi1tG?=
 =?us-ascii?Q?dgr8PkGor54bAFNm3nf1Cd7zULb5NC4P3bN7WydZ9UtNlQyESUSqctKUPDrZ?=
 =?us-ascii?Q?E6S2XE7H9lCAiaVb3RxeMBI+cMBLnFUzOL4hI4FXWI2OKDWghW62Msoy5p6I?=
 =?us-ascii?Q?U5A+3zT+LTQZxJw/v0OeUg6xdbVSbpXmlXhE6nlpC/aoDjMcYotvo2cdzLaF?=
 =?us-ascii?Q?DZZ+jI6Jyf5hodd4B8oOI3+5PR2zRtkbX+cVC9rshhMK6zY08ZnE09/3wepg?=
 =?us-ascii?Q?71OnSyfzxq7t3tK6ApLAuGF3FtnK/3KAtgtKi97+brQIsAHO6u9u931I6IYA?=
 =?us-ascii?Q?iWRyKe36fkSAs4R5Tx2alxESAJsxda+VbEebzcMTCC/A6DiaQxdxQdpycAqq?=
 =?us-ascii?Q?0mmQq6OfVgvDQJ8RWx7u/nJV6ivWoJcuo4xB1GCUueIXsJDUakYJF68UFQ+o?=
 =?us-ascii?Q?woXKKFvQeC35wSngNwO7rwLwIyJMYMBgnF/mL6SjkfPwbay8QQd0ykgQqjbK?=
 =?us-ascii?Q?UKEcXypCCWbLghXEOGpZJmEPJYDnUKKPZwkcq3QKVKOIMXNUN9Ioz39jmCXK?=
 =?us-ascii?Q?oMvWyPjS1I3ftJ5uG15+H6m+kY93cK9iatk7BH98DcETJN1iXd42gvNPNyvd?=
 =?us-ascii?Q?3zZmrJoooEAkUcO7E/1FkNWRIsOqSfXiiPBgO5gKpvBZ9bzIRxcW+8lsq4a3?=
 =?us-ascii?Q?CoJ1VhWeuQE8IzL3J+VlI61k/0WVLCzBWq+mxikFUaCMx4i6tyH614m4/yvS?=
 =?us-ascii?Q?T9JsoKqO0hOaTo2O9q7+p/8JlRPm7+U8uMiKN8rz1DYs198cAdfFjuiR4TX5?=
 =?us-ascii?Q?8SlXWth6qpbOeWvrivwUdCQAk9H21tS5o9YOUova+j6l97Ph2XjIwSKzLrv6?=
 =?us-ascii?Q?htOE5ShYL02w6bHnd6x2RzJtxQA6NKRQvJkYm5/j7XQAuUZUNuEGduek8Jk7?=
 =?us-ascii?Q?1QrcXsjrQ7vR3IYSJGjOYSuYnhtOuGp7GRlOuVkl+RISexQSCHoJ0hFYutUi?=
 =?us-ascii?Q?3D/1AQK8v8xzSNABuocYsMM6hKYDTiJHZ9nMnuwJSvAsX8qK9LxYoIoTXnCe?=
 =?us-ascii?Q?+qWAoCWRfOu8+J5SdFbmtzLGhm/h67cp3ggCyrjEFICHCmNLc71rgHqm5ip5?=
 =?us-ascii?Q?YPODvDv/YimDjNL0E+Jfj9Nt85r0MXTPIOiFx+pPrgxrV4tEPiBUGq8sfpjw?=
 =?us-ascii?Q?TRHOu4anjLESfEOaaMPJt/zHI2dURwCfwe2toEP6yWlvGA6Fh8YrCApu6WHj?=
 =?us-ascii?Q?+NEcXiiUpo0bEwy2uxj9hPNGjeGNZ+BmydZs3rNuBmOBnGEM85ruP0PgUj74?=
 =?us-ascii?Q?WEown5JH7r3Hz/4wpDVWY11UL/WDzQMOdr8OE/F+K1828u3e+cIH3HowrPuH?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4677d3c5-b58e-4ef4-694a-08dc3d65ffa8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 22:45:47.1946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1s3tb7uMqF0be82RrF+a9CUozJpYfrRWpl4nk02vTPvuJ/ibAy3Wy72XMPUz1GexAAds6753UWDiTj1/jwyACA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
X-OriginatorOrg: intel.com
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

On Tue, Mar 05, 2024 at 11:07:37AM +0000, Matthew Auld wrote:
> On 04/03/2024 18:21, Rodrigo Vivi wrote:
> > Now that mem_access xe_pm_runtime_lockdep_map was moved to protect all
> > the sync resume calls lockdep is saying:
> > 
> >   Possible unsafe locking scenario:
> > 
> >         CPU0                    CPU1
> >         ----                    ----
> >    lock(xe_pm_runtime_lockdep_map);
> >                                 lock(&power_domains->lock);
> >                                 lock(xe_pm_runtime_lockdep_map);
> >    lock(&power_domains->lock);
> > 
> > -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> >         xe_pm_runtime_resume_and_get+0x6a/0x190 [xe]
> >         release_async_put_domains+0x26/0xa0 [xe]
> >         intel_display_power_put_async_work+0xcb/0x1f0 [xe]
> > 
> > -> #0 (&power_domains->lock){+.+.}-{4:4}:
> >         __lock_acquire+0x3259/0x62c0
> >         lock_acquire+0x19b/0x4c0
> >         __mutex_lock+0x16b/0x1a10
> >         intel_display_power_is_enabled+0x1f/0x40 [xe]
> >         gen11_display_irq_reset+0x1f2/0xcc0 [xe]
> >         xe_irq_reset+0x43d/0x1cb0 [xe]
> >         xe_irq_resume+0x52/0x660 [xe]
> >         xe_pm_runtime_resume+0x7d/0xdc0 [xe
> > 
> > This is likely a false positive.
> > 
> > This lockdep is created to protect races from the inner callers
> 
> There is no real lock here so it doesn't protect anything AFAIK. It is just
> about mapping the hidden dependencies between locks held when waking up the
> device and locks acquired in the resume and suspend callbacks.

indeed a bad phrase. something like
'This lockdep is created to warn us if we are at risk of introducing inner callers"
would make it better?

> 
> > of get-and-resume-sync that are within holding various memory access locks
> > with the resume and suspend itself that can also be trying to grab these
> > memory access locks.
> > 
> > This is not the case here, for sure. The &power_domains->lock seems to be
> > sufficient to protect any race and there's no counter part to get deadlocked
> > with.
> 
> What is meant by "race" here? The lockdep splat is saying that one or both
> of the resume or suspend callbacks is grabbing some lock, but that same lock
> is also held when potentially waking up the device. From lockdep POV that is
> a potential deadlock.

The lock is &power_domains->lock only, that could be grabbed at both suspend
and resume. But even though we are not trusting that only one of the operations
can help simultaneously, what are the other lock that could be possibly be
hold in a way to cause this theoretical deadlock?

> 
> If we are saying that it is impossible to actually wake up the device in
> this particular case then can we rather make caller use _noresume() or
> ifactive()?

I'm trying to avoid touching the i915-display runtime-pm code. :/

At some point I even thought about making all the i915-display bogus on xe
and making the runtime_pm idle to check for display connected, but there
are so many cases where the code take different decisions if runtime_pm
is in-use vs not that it would complicate things a bit anyway.

> 
> > 
> > Also worth to mention that on i915, intel_display_power_put_async_work
> > also gets and resume synchronously and the runtime pm get/put
> > also resets the irq and that code was never problematic.
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index b534a194a9ef..919250e38ae0 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -347,7 +347,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >   			goto out;
> >   	}
> > +	lock_map_release(&xe_pm_runtime_lockdep_map);
> >   	xe_irq_suspend(xe);
> > +	xe_pm_write_callback_task(xe, NULL);
> > +	return 0;
> >   out:
> >   	lock_map_release(&xe_pm_runtime_lockdep_map);
> >   	xe_pm_write_callback_task(xe, NULL);
> > @@ -369,6 +372,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   	/* Disable access_ongoing asserts and prevent recursive pm calls */
> >   	xe_pm_write_callback_task(xe, current);
> > +	xe_irq_resume(xe);
> > +
> >   	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> >   	/*
> > @@ -395,8 +400,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   			goto out;
> >   	}
> > -	xe_irq_resume(xe);
> > -
> >   	for_each_gt(gt, xe, id)
> >   		xe_gt_resume(gt);
