Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9217C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 21:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1D112238;
	Mon, 18 Mar 2024 21:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvH0RSev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37FC112238
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 21:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710796695; x=1742332695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bLZ+8yRsdE9dC1mMqbwoMRJWeYLN9jLxz9NJ9bt71nE=;
 b=VvH0RSevl4Q3eU6SBkpV634bvlm5d7V0mOgva+Fk9KhDqwWtw9txH+jX
 QINGOl75nx5CP6Nr9ZSrPAuIzjReJOJvINKQm71wya7TB0QY8FRtcbQP/
 HQ6+LPtvBuDhVQiMYPBsiPema+N5SLdiOxX40/wBvZZJFB//YxKsakua0
 VJqOkLXNmIrAP1z/Xk2nAH/FOBOWRCHpcxDhlG39nX2kHIfirvE+BI0lu
 fUyvC5s+Q41Ps1t3EndTH9aogA3uRk16psfNNPF6BBitQkNbjfokASFSs
 euKUu+HTzaGd4O1Vp+wsCVhrh3BtST3Zj0zo8CbZSa1YEMdd4IflOPWfG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17035635"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="17035635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 14:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="13676537"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 14:18:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 14:18:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 14:18:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 14:18:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 14:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HppLgITLhRdef9QqQ/hquw7xhbei1U0rgYUw2YPvPu3Yh6ZqqZqAC/+S0EcWkHZjd4sxDr/tov4mUL6IBj1O5jnQVdQzl7uRr3BNG9S46zQMOLeInoUy0lJdL72fazZ3WPR05PgagSJF2gHiCtZC1spuZ3TR5X2eqSOfeOQ9eAj+uUtaGo8SemnZazMYlkBiejdnoOr6owHhyKS235pAmHqf4B8zhniVAyXa7EtznFsxLcZ3EfG119/U24Ts9DLobuSm1ifNlLFRCiegEadP3LJXrw4S+YXOq+0eN/WQkN4S8flJPpbRwLTYEcywPK26olMSdDjpdLVOlouA1R7gCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqgb3ytGhVRkwl5VQhqLmeTec02BQPml/oRS7lceh0U=;
 b=PWha1IUpZ7yU0lIfAnbosJDsIea3MCeLUHwVIvufPahQW5LdLFURCYuq7PFi1HjqARMROqTL6DY8GeMg/R/MtHMsWVYUpz1rsPLOBneum0ZL/xDDRAOdHZ4eePleK6/64r/w98iVbKHVZbTyjc8xBaXrd8jR8mziUFaZDTRBvfwuWbfNlLM0SLevsqWF+UR8ZzTYY/a8t9dmXH0/kpzlKKdZA3eC883Phnf/VbP7jMrhl8aDvLhdLBqJwXu+cGREaeYFCFtjqfMLeuJKx3OqifrsgAMjCn2ahCE0YdFlFNXdwna1aPuD/qumffr+X87a122nRZUnij93LGIdcKhizw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 21:18:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 21:18:12 +0000
Date: Mon, 18 Mar 2024 17:18:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Himanshu Somaiya <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 4/6] drm/xe: Force busted state and block GT reset upon
 any GPU hang
Message-ID: <Zfivjz1TgvsQX2BA@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-4-rodrigo.vivi@intel.com>
 <ojdiuuzxk26bkj3bb6tss5nruqtuqwjjs2qgkqnvp76nolsiuq@726rslks5jsy>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ojdiuuzxk26bkj3bb6tss5nruqtuqwjjs2qgkqnvp76nolsiuq@726rslks5jsy>
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4738:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWFZMEFWvnkonn1timfUv5/pDWBr6ZiM8psqKCR0UK06eNlW0/zHTWQ1fG8/BXin2r6p2wEnOkdai+Jb4y7KrkxS5vDSuYEyOx4kmO0UFBMWy36MIwksKHlil1Xmj2veGtHwNbdQ01xrIQlhIqSiydFQ6jTNLfVnB2vtSiQpvn+oNLinSMc8yCI+dFikuXIaKab1sC9YeCpsVVIXu3b4TP93JH0rIYldDNnIw5J4ZSysk4vdNQfFmkIEazjzNaTg6sre+9IZLJHH3Nug4haGGE6lho3bdLrhjJSgkKDs9fITAgw/ixJzLfVfuWGrHNeNz2EnEQihxXoZ3T+Af/K9F6RkVH19M7dwEWRabCBIuceOk887mVYsAfZmpl6MyYPvnXIt8R+NMdgyhI4t/Kc8uT3VWl3+BjWr24cu/jFi2s0patOx2zzPexKj/8r4PwiV1mwTz80NtqQ78414wLui6HVyyMd6Vxmy/DcAFYZtJK8wyFrKGU7EF/IdGG7MC/oQ+QJgnPS1FpWy6EdYuYtsI0dmRw1kHotGfjrNMW952V4lX6mLAJxzfKiO0Ik2QRe9jHlEqKfXs+yd6HAnqL+ulgGtyX+rTXL+bz4AnF8vTvA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jbv8WxG9a6VPp7/a+OT51NE/topmC8I0Iyadji1hP3WMMSyI+VglRUL94Gx?=
 =?us-ascii?Q?bkV6XT3O87zGD+Amyn3zEIj8X7auCtE3Z4W+fDz8UzU9i6Y3UdkiTLNTU3eQ?=
 =?us-ascii?Q?VkiHFbaSY3/MNl48JGLUv02Iu/Kjjs+8mTQXuHlAUxr2TlhEib008DXmSndL?=
 =?us-ascii?Q?c1EWebnC21/g7CUkcdTvo+r62vkeeiOcmQxE+TqrT7zluCmYcssDsZ3IZR3g?=
 =?us-ascii?Q?Vp2HuCSeWHfptWpecjmyqj2GzagmK51lJvoedfP3EnTPfLr/olscKaJzBakI?=
 =?us-ascii?Q?U/LhnJO+dWtXTWARiMdiRfSnU3aV933Ue6HTyCCpwl6sI8qb25YMX2JEKbVW?=
 =?us-ascii?Q?n2vYjFPJIwg2iZosDJfM0GDdE0B0nUWXlNvtehEf4SRTJVHou6NkuPEScB58?=
 =?us-ascii?Q?Am2CrYAnWpzjJ1J4cJarTq22heu5IWyB4NiETo4qh91qDk6mv122DdVdaM9J?=
 =?us-ascii?Q?lWqmGIviwhJDTs94gBffasksWjTwauMbBNOztFsu0BGHnox92olrdhXUO8yf?=
 =?us-ascii?Q?gWFpG8TpplNpKlMB5+kGJZy8EzLcMd5WlQzD92ypx09CoN9KX8+IUdys8ozB?=
 =?us-ascii?Q?/tK6iQbdYycqZXFxASuuypUvTZ66RLftEBfm4guUgwqpI1hT2xqUhTiAY+xT?=
 =?us-ascii?Q?dQ2FGVojBp4QYBqoqWMhKSV/UIf8tkoy+Z5YXbq0A5aa02ZQqhqVKmTzuP+0?=
 =?us-ascii?Q?8o/M1iJcqSy1nRy05Y7KYgTGMM/S6hUwY1R2ny3CIch6uSFyI2Q7n7eJKpF9?=
 =?us-ascii?Q?HtOSp7EYRP+u2tG4p30xKjetLtLs9ss4mN22MmYvsOhB8DCsXZPN9vjpHGL7?=
 =?us-ascii?Q?LJxeLyywTi/eZJvFuahN+DsedO8bgiBVsnAeS457ToM2HhLXgAvnkx3PVucH?=
 =?us-ascii?Q?vxXU/9nBQQccoF9hM6QppAML4wxfnFO2RPTKZt984qZT1Jl2vf6Hf4rgi18y?=
 =?us-ascii?Q?2fyaKC+B2Rl6Uo0XS0vwcUOmrTXJc11xraYvc7bPvHdGYbtAl4nrtfPU7oZ9?=
 =?us-ascii?Q?/uS52P2QMaKCOrcDG65R8AQe7jTZkjw0CfqIsd1Xf0d4lAGzNHfqgfzzsshs?=
 =?us-ascii?Q?4apDatfDDDSBC/hBwmU64QijQL9vusNH/j67mOqJN6HfO5Kq7dNhgTU8i+3C?=
 =?us-ascii?Q?SNC4JVSDtZ/uLV1lfSAezwaFVKPPzat8/3kTkPy7Oifk1uRm+bxcX3HULkOj?=
 =?us-ascii?Q?3J/BchUeMzbszIYHnhtS1fHpyBxU5tnOri8mkYOfw0dg1P+W7gWFIdGksAb1?=
 =?us-ascii?Q?qA2k+ilRcKJI/rZM+ba6Z7H3fdPlErF6Iudaj2H4qohhfcFySilflJU3Zb3r?=
 =?us-ascii?Q?xUitcqO2E+Lbo86Uop/zfqlkIK1j+ZH2TLqSCvZaYi20FglXlfFoveCPbFZN?=
 =?us-ascii?Q?OKX354SVPQkm/szsw7u9a2ITtw7EF5L99zbE59Uqtv2pee7XHKBOwwI17Gtx?=
 =?us-ascii?Q?EPxEV3fvPWOyCyVMwJP0gbTbNffpGjyUrgoFezXXlAMg6FPnLXQJz4y8Bah9?=
 =?us-ascii?Q?l4BzxwCUhRb8pdI2lhNGSkixNwTseg6w0sPcz1wUFlbf9WuHZMlIrHfDaRdl?=
 =?us-ascii?Q?j/osGSlB6o77elSssU/VacP6OnEDJ0LfGxe4/v2k56QoK1mSUq9CgAki4llt?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdcdc6f-ca4e-4b86-cf85-08dc4790eaa7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 21:18:11.9337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TVfOwj/Q1TlyfW37QfeRx4e6VZZRbhY/t2FaFVhkB7YUZSDBciIX8II5O2w8P8QxqDZY3gUF242PSjRSg5Pdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
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

On Mon, Mar 18, 2024 at 11:08:43PM +0200, Dafna Hirschfeld wrote:
> On 15.03.2024 10:01, Rodrigo Vivi wrote:
> > In many validation situations when debugging GPU Hangs,
> > it is useful to preserve the GT situation from the moment
> > that the timeout occurred.
> > 
> > This patch introduces a module parameter that could be used
> > on situations like this.
> > 
> > If xe.busted module parameter is set to 2, Xe will be declared
> > busted on every single execution timeout (a.k.a. GPU hang) right
> > after devcoredump snapshot capture and without attempting any
> > kind of GT reset and blocking entirely any kind of execution.
> > 
> > v2: Really block gt_reset from guc side. (Lucas)
> >    s/wedged/busted (Lucas)
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.c     | 30 ++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_device.h     | 13 +------------
> > drivers/gpu/drm/xe/xe_guc_ads.c    |  7 +++++++
> > drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
> > drivers/gpu/drm/xe/xe_module.c     |  5 +++++
> > drivers/gpu/drm/xe/xe_module.h     |  1 +
> > 6 files changed, 48 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index d02e59fb49eb..e28e3628744f 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -774,3 +774,33 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> > {
> > 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> > }
> > +
> > +/**
> > + * xe_device_declare_busted - Declare device busted
> > + * @xe: xe device instance
> > + *
> > + * This is a final state that can only be cleared with a module
> > + * re-probe (unbind + bind).
> > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > + * In general it will be called upon any critical error such as gt reset
> > + * failure or guc loading failure.
> > + * If xe.busted module parameter is set to 2, this function will be called
> > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > + * the issue is preserved for further debugging.
> > + */
> > +void xe_device_declare_busted(struct xe_device *xe)
> > +{
> > +	if (xe_modparam.busted_mode == 0)
> > +		return;
> > +
> > +	if (!atomic_xchg(&xe->busted, 1))
> > +		drm_err(&xe->drm,
> > +			"CRITICAL: Xe has declared device %s as busted.\n"
> > +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> > +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> > +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > +			dev_name(xe->drm.dev));
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 2c6d9b77821a..e6edf2d3ee4a 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -181,17 +181,6 @@ static inline bool xe_device_busted(struct xe_device *xe)
> > 	return atomic_read(&xe->busted);
> > }
> > 
> > -static inline void xe_device_declare_busted(struct xe_device *xe)
> > -{
> > -	if (!atomic_xchg(&xe->busted, 1))
> > -		drm_err(&xe->drm,
> > -			"CRITICAL: Xe has declared device %s as busted.\n"
> > -			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > -			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> > -			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> > -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> > -			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> > -			dev_name(xe->drm.dev));
> > -}
> > +void xe_device_declare_busted(struct xe_device *xe);
> > 
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 6ad4c1a90a78..ecf45289b187 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -18,6 +18,7 @@
> > #include "xe_lrc.h"
> > #include "xe_map.h"
> > #include "xe_mmio.h"
> > +#include "xe_module.h"
> > #include "xe_platform_types.h"
> > 
> > /* Slack of a few additional entries per engine */
> > @@ -312,10 +313,16 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
> > 
> > static void guc_policies_init(struct xe_guc_ads *ads)
> > {
> > +	u32 global_flags = 0;
> > +
> > 	ads_blob_write(ads, policies.dpc_promote_time,
> > 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
> > 	ads_blob_write(ads, policies.max_num_work_items,
> > 		       GLOBAL_POLICY_MAX_NUM_WI);
> > +
> > +	if (xe_modparam.busted_mode == 2)
> > +		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> 
> hi,
> you don't use the local global_flags, I think you meant: 'policies.global_flags |= ..'

doh! thanks for catching that.
I did mention 'global_flags =' above.

but I meant to change the following line as well

-	ads_blob_write(ads, policies.global_flags, 0);
+	ads_blob_write(ads, policies.global_flags, global_flags);

> 
> > +
> > 	ads_blob_write(ads, policies.global_flags, 0);
> > 	ads_blob_write(ads, policies.is_valid, 1);
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index ee663683e9eb..3f3160373631 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -34,6 +34,7 @@
> > #include "xe_macros.h"
> > #include "xe_map.h"
> > #include "xe_mocs.h"
> > +#include "xe_module.h"
> > #include "xe_ring_ops_types.h"
> > #include "xe_sched_job.h"
> > #include "xe_trace.h"
> > @@ -950,6 +951,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	simple_error_capture(q);
> > 	xe_devcoredump(job);
> > 
> > +	if (xe_modparam.busted_mode == 2)
> > +		xe_device_declare_busted(xe);
> > +
> > 	trace_xe_sched_job_timedout(job);
> > 
> > 	/* Kill the run_job entry point */
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 110b69864656..f81970e8d713 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> > 	.enable_display = true,
> > 	.guc_log_level = 5,
> > 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > +	.busted_mode = 1,
> > 	/* the rest are 0 by default */
> > };
> > 
> > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > MODULE_PARM_DESC(force_probe,
> > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > 
> > +module_param_named_unsafe(busted_mode, xe_modparam.busted_mode, int, 0600);
> > +MODULE_PARM_DESC(busted_mode,
> > +		 "Module's default policy for the busted mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> > +
> > struct init_funcs {
> > 	int (*init)(void);
> > 	void (*exit)(void);
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 88ef0e8b2bfd..bbf88c34e4f4 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -18,6 +18,7 @@ struct xe_modparam {
> > 	char *huc_firmware_path;
> > 	char *gsc_firmware_path;
> > 	char *force_probe;
> > +	int busted_mode;
> > };
> > 
> > extern struct xe_modparam xe_modparam;
> > -- 
> > 2.44.0
> > 
