Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE7DC54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 13:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D986A11222F;
	Fri, 15 Mar 2024 13:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ps5LcyVo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011B511222F
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710510640; x=1742046640;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aIPrKWNCsaAZabrD+dFlNf9lFvbCgFTb4Lq7A5pICK4=;
 b=Ps5LcyVoLeplBNr/f8zkS5XiHybTLVdZob9MrtVDf6q4q0LG3ZstIWH1
 FaMzmUO+BZ7lPJohM8AmFsIjlFBCUPw++Zb5A6c8kHZ9HgJh4w5bgdj+7
 ECcGQV4pSZYXbigZZhDqx8JoAYe5iUlieJhCS7/W5CC1QJyDEEFkUfqfK
 xl5RJzbJRYGQCb1DqhbS4kIpJQUx+myYGgL/jyLBywkVF0EAscnZMDALV
 DEq6faeM2JTtv6pR3baxaajy2Du1rwtqpjF2NeXgUk5kqU/nINkkOb4R1
 QQot1Jorxj+gOLOg+swNiWvS8v7ktIAY6Dqcfm6LFYu3FINDDwZnjUg89 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5223259"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5223259"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="43578739"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 06:50:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 06:50:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 06:50:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 06:50:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 06:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIqmoBAMTVzgzUW5bo6ksReVxElMI8c4wGOvR8khuZRBL5KN8nAfLPQHfXirR0tVbreTjykoBGAPqSQV3/jEot3PyhqfkHZ0YIKk8SlpyieWPvOYiXz4dRIYChwRBroMnu/lDgtvQBziuRe0MbWcOVn0tbuMf24X5KOsSv/cvPRbMnBhAJJLzf8VsCUU5Kna+SWKN+agMczA5NLlyixq/OO3gRYrBXVj1khugosLGjyJgj6yK4fd88hYf267wC8l2rwNSC9MIzzW5cTUd6cWTkjDVpEbUmGRDdVgeaffMvuQhs9TkN9SxtCTyPrxDl96un0s6uB23IjLN4xckRvL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFGhQCCj1PCeFYyxBo364dQs+2M6JLI6rG0i8JE+KCY=;
 b=Q2LvmSNKiksU9w5f1ntmygs+wgJe+mXwoKUfJ8eqhBuJn92OGlmtanX1TZYXVXt7vziHNmjHcLqgp+G7nA8vUnuTWglt52yU2+5pAL7xgcle1cK1n6ipXfJOn8IK5CDsINGSSgda+FdZ+cNoDHQUXCtOB2B4zoW8ip+EoVdAbCn8PfNKLej43erKoS73x1Qbq5yx4I7WU/WULky1FLKynEKPEL6q3PAeQQ+oxMmCcxsBEO5vtoMXKrmNtb5xHHzv9CKMWaCMZSSBks4oC5L//M/XelFapeAd+qfqkJ8ptnm+mPEAXJ92w1mWD10BM9CoFSKBq3oilH50iYVlsbsi5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.8; Fri, 15 Mar
 2024 13:50:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 13:50:34 +0000
Date: Fri, 15 Mar 2024 09:50:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple busted state
Message-ID: <ZfRSJCq2ruBJ4YUM@intel.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <d26e6c71-81a3-4d43-9317-126ab5aeaca0@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d26e6c71-81a3-4d43-9317-126ab5aeaca0@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 5158cd2c-f675-42f0-ccd5-08dc44f6e2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jr4CMDqrSTUxExMPBxPtI4cICfdIG5dS0fV5zChEmpdvI26gZck7nlGUL2Dpaxx8L2nv/WeD+dW7qb6yEBDMbTag29PMF7h+D55dqrLdrpzQRVHTCVqpGZAR4P7acQLrhdZV3Xj14XHLy4kzPWBQceFq2vamoJndWF8HVTnB84E3MQSYBJ4p2ox2rv/+O2FL5xnhjMxPTxNXV7g2EzWEIVCx3IQoTDyyN540EdL4fqwktQCp3OdhuWEsAwVKjn8acOUcIsrQtLYLOQSs3v51HWfYkWwWpvRJ3l5sfmYHU/7UeWAqZah4Vl5K/7nUsf4RWJru7uu5LyKa7XCSDF/K2aPDTrfqDTBoclzKmzs5rruElf4HMWJOhFttxcG511qeub903H74K92ANTBlYj8YCgGW+T5xRC5THb9M4DA3zhFN+dWqnMyZxO3zeKwxE3JipZOhNgcAmfV5eCQawAmMYVpWyxVPVxa+p8+bwecP3V7WEmXklt6BjauCh7OVEjK3NeDIgP90eVOtqCgozu3dO6uMROIPPruui9o8x4+wcToDGpP0n6ekG00keufrRP1XBfBKmiVNqa0JWc0euxkdM7TTn0CVtsPiCYC5qlc5lmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mucCTFFZd7qdTlWvZkbHNWo+KR3E2bbOcTS1OQaH+vBXaALi1XWHDuciJOB6?=
 =?us-ascii?Q?oY0dSSfwuZMUg8jw7TaV6gVLjMA/yNDuh+JVoWULvILSCHMZPtgHXi3JjbK4?=
 =?us-ascii?Q?nu7JJNH/lxUkUjhzvCnlsaJkRofX6vfbOoLtOPR7+R3FANNUUK3IJVMxIMiu?=
 =?us-ascii?Q?LnFd1bIW+eTBAJDD/Q/qKoAqLLAk3pXzG3UZ56UC2MeiQJZnxcpJUCy6ET73?=
 =?us-ascii?Q?EQmfLvnsw5/K7MrZ77J9+KG9ntMjem8TnHZezf2ga/RIZm7VwzkKwOFWx7aG?=
 =?us-ascii?Q?RDJeif36yvL8mv2one8/zq6q5WyWdu6Y7Wh9HCfh3AvvW58MQ/VuErmAUAnC?=
 =?us-ascii?Q?uVwCk82X+Tz3jfI9HupDFiQP9nEvguGQFkisrlW2uLQgMpaid45a45kIvlRg?=
 =?us-ascii?Q?ZmQGvWDCFb+4TCb+fFeR4IDs3SUY9c+3k6BIt/FGFU4bd7R1cobh9/l3jPEd?=
 =?us-ascii?Q?C6ChDaJEZ5t76661j8SuMNR1YyY6gNoV/G4m8/allmuvIH/Kto6haMEcKOL4?=
 =?us-ascii?Q?zS71cDVTjFA23NSl1cTmFDOkF7/lfid0CUrEJpMu3wCZcjlRq/DBgtGC8ZK+?=
 =?us-ascii?Q?LEV5TpQR/MCPQi4yPE4nSLbujezK/PaxdGe5RYhsAbJ34OiSJMKOD+qzBRCB?=
 =?us-ascii?Q?78v8z0xymTep8+CUiggRXQTwVFLUYXFO3Rsi/dSGkmk+qaaDZTAFN20qQDmH?=
 =?us-ascii?Q?S3XMrzq/otzeXYc5fr7HwYvVgz38r2gWekRgCcE1mtBwxczpRcDEvLKeYTQn?=
 =?us-ascii?Q?xqO/z8HJDp6QVFzw+NZEiCj2ORKm7nR9ewqZwB/ER1KRQWfukEPBQ8/1OQXU?=
 =?us-ascii?Q?AZ8q+FrBGkF+r86ZZ5RoCw72gIRh1HhCRW1CGco7Igt77naDMxDrXjKYs6UL?=
 =?us-ascii?Q?x2wpmsAMT/FkK8z/X1YgKk61KOiXd7ygdjkWNoL+JwbfY0AQckAndS8ZwXNT?=
 =?us-ascii?Q?p3DI2mGFQuLup6AeIRABczVzFsFYJcud4i1fqQVQX0K8LOsczzKdxva4f8yT?=
 =?us-ascii?Q?IUeMsfpPcQEG/UVqQwup6icS6PW0OXU2hE6jTQicmsBZhtninpYm4ftdEAvD?=
 =?us-ascii?Q?kBaJs1f/91fq/UOoO7TSzOYB97YRlXJ+/lh3cuo0/V3vZINf6jsrMZFo2xD1?=
 =?us-ascii?Q?mJtJPyq88/CnKE9cmp+cl1VziTemTS40ZkG/rwHLcFt8wXN9PMD2vgFy3xeu?=
 =?us-ascii?Q?9xu+SZ7zRiVXhWTyWScIISy9AhEFgrqGG7P86EmFJ7rhSKjhT0xRXmmSDWLQ?=
 =?us-ascii?Q?PXD8Kg4JJDHk1LaOVnMIEiuUafWF4BMGuQyyUBylKCggamzfi99zCYCVRxVA?=
 =?us-ascii?Q?62acmhF+u7kIFh+Jjk6CaB9fMp257S2B/FvVezeWt3QFP2N2xSNOUR+3scsc?=
 =?us-ascii?Q?GjaiY+dgWjHqWqaxZouL3n47upGv7GiQD4zBkMeAgre4e8GgwDTgCjkdx33g?=
 =?us-ascii?Q?ZXcB9k5Phpy8dYDdEfFMCRHUd9ujo32w1XLyh1IrQcykWNc+unRFNloUY+KW?=
 =?us-ascii?Q?mXbCBl/GEhjvW3m/nWIwMqidaoi7oKtB4hewlIXaZpadRSwavDwhRAh6Pu5s?=
 =?us-ascii?Q?8nakmarNPlSWK/e6S6yts6MhXSybxxjYSK+I29ud?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5158cd2c-f675-42f0-ccd5-08dc44f6e2f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 13:50:34.2974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDVxs61XDzFr1qQjwOnvtfZK1HDPfQyYdvEEHG936/BudzAC9nOiuw83WjixDnfugUMUmyCnglTKKY19MX8tKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
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

On Fri, Mar 15, 2024 at 12:43:07PM +0530, Aravind Iddamsetty wrote:
> 
> On 15/03/24 06:33, Rodrigo Vivi wrote:
> > Introduce a very simple 'busted' state where any attempt
> > to access the GPU is entirely blocked.
> >
> > On some critical cases, like on gt_reset failure, we need to
> > block any other attempt to use the GPU. Otherwise we are at
> > a risk of reaching cases that would force us to reboot the machine.
> >
> > So, when this cases are identified we corner and block any GPU
> > access. No IOCTL and not even another GT reset should be attempted.
> >
> > The 'busted' state in Xe is an end state with no way back.
> > Only a device "re-probe" (unbind + bind) can restore the GPU access.
> >
> > v2: - s/wedged/busted (Lucas)
> >     - use unbind+bind instead of module reload (Lucas)
> >     - added more info on unbind operations and instruction on bug report
> >     - only print the message once.
> >
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
> >  drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
> >  drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
> >  drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
> >  5 files changed, 37 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index b0bfe75eb59f..d02e59fb49eb 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> >  	long ret;
> >  
> > +	if (xe_device_busted(xe))
> > +		return -ECANCELED;
> > +
> >  	ret = xe_pm_runtime_get_ioctl(xe);
> >  	if (ret >= 0)
> >  		ret = drm_ioctl(file, cmd, arg);
> > @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
> >  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> >  	long ret;
> >  
> > +	if (xe_device_busted(xe))
> > +		return -ECANCELED;
> > +
> >  	ret = xe_pm_runtime_get_ioctl(xe);
> >  	if (ret >= 0)
> >  		ret = drm_compat_ioctl(file, cmd, arg);
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 14be34d9f543..2c6d9b77821a 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -176,4 +176,22 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> >  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> >  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> >  
> > +static inline bool xe_device_busted(struct xe_device *xe)
> > +{
> > +	return atomic_read(&xe->busted);
> > +}
> > +
> > +static inline void xe_device_declare_busted(struct xe_device *xe)
> > +{
> > +	if (!atomic_xchg(&xe->busted, 1))
> > +		drm_err(&xe->drm,
> > +			"CRITICAL: Xe has declared device %s as busted.\n"
> > +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> > +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > +			dev_name(xe->drm.dev));
> I know we set needs_flr_on_fini when GT reset fails and i can see in xe_driver_flr that FLR can fail, in such a case
> do we need to do a bigger reset like warm reset(SBR)

yeap, I was always considering to add instructions for the real pci device FLR
in the middle. But I was afraid of this to become to verbose and decided to give
a chance for our driver-initiated FLR.

Perhaps we start with this and if we start seeing more cases of pci reset needed
then we add to the instructions here?

> 
> 
> Thanks,
> Aravind.
> > +}
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 9785eef2e5a4..2633fdfc1a38 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -455,6 +455,9 @@ struct xe_device {
> >  	/** @needs_flr_on_fini: requests function-reset on fini */
> >  	bool needs_flr_on_fini;
> >  
> > +	/** @busted: Xe device faced a critical error and is now blocked. */
> > +	atomic_t busted;
> > +
> >  	/* private: */
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 85408e7a932b..2f29f7fa682b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
> >  {
> >  	int err;
> >  
> > +	if (xe_device_busted(gt_to_xe(gt)))
> > +		return -ECANCELED;
> > +
> >  	/* We only support GT resets with GuC submission */
> >  	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> >  		return -ENODEV;
> > @@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
> >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> >  
> >  	gt_to_xe(gt)->needs_flr_on_fini = true;
> > +	xe_device_declare_busted(gt_to_xe(gt));
> >  
> >  	return err;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index ee1bb938c493..d7eb409e8415 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> >  		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> >  	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> >  
> > +	if (xe_device_busted(xe))
> > +		return ERR_PTR(-ECANCELED);
> > +
> >  	/* Copying CCS between two different BOs is not supported yet. */
> >  	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> >  		return ERR_PTR(-EINVAL);
> > @@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >  	int err;
> >  	int pass = 0;
> >  
> > +	if (xe_device_busted(xe))
> > +		return ERR_PTR(-ECANCELED);
> > +
> >  	if (!clear_vram)
> >  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> >  	else
