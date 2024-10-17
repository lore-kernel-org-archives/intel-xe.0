Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53559D3C533
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 23:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F80D10E10E;
	Thu, 17 Oct 2024 23:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byGZSsYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C97A10E10E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 23:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729209589; x=1760745589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9y6eF6SRlva04L14d0fbI9TqUdvxaUv8sNKwIKplUaw=;
 b=byGZSsYqx1cjyNr02iQ15PsHTz0ybksbeS+9kEoSJGr+/s1ytcPZox33
 WDZtSUXTitCr6/3OJbsRA+MzJxiFln0vp7Vhyb5eE/XKZp2bl70I2zk5a
 vV7B6dTuo/LCPl9xzWLiwvvWn0HtVXdq74XBZmHGPlgNNdnrcB9z2Pth4
 TXfS+7NS1V4piAsxS46Cj14E4DVLT7mUUG7iz0COiExRSmJvfz8L8Wc2A
 PlV+m+CKghc7jystRUhwjLKr0+BIhNAeC79gh0sSVN2OU7+uybb/cenaE
 nv1aYqkpbetgVqJAgyI8xdRGv6KAKJPZ3od3TEbTdCUKkiwrQOCSuU5m6 Q==;
X-CSE-ConnectionGUID: 4iAwEGUCQdCzrtaXUE91wQ==
X-CSE-MsgGUID: XRPjNDlsTnOWuVqjBfkMyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="39314559"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="39314559"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 16:59:49 -0700
X-CSE-ConnectionGUID: xoxexGqoRM6dA+asZ5KsSw==
X-CSE-MsgGUID: nMF4jTxkSq291g5krmfIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="109446645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 16:59:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 16:59:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 16:59:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 16:59:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 16:59:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPjAbCk1JBexfxnqvUb5+XrE8+dCzcuwwzYIwnP+koNkWZKzRCfOu0KPweFp4UUa9A1SjJXx+sOMn6NKa5/btru+zkHCuBVWsKRGQfCocgxNIZ2whQlL2wT3jY5IaWRRq5gVyW2WG83H1Buco/MCbYVRa0O2mwLCtZwl+mKjYyzEZ0oihjmfdR0ObbNewmrxWBgWF3JgQRnKr0hv4YodXv2TFrAPZIzZMIZXhRPk70e+HojQXUEE/R8C7W+NoJboLAWkD1nNw2MSDMmvdfQFU6pfL/rHH89rulu2IiKBli5Y9NqGVBZWSPxg5ALssajceS1TBHg0nfI0DrE7DfHhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6hHGdqEA5YXVKO0KFSqziSSiheZiGi90yJ61RSLuko=;
 b=zU8cQBJPCRw/OzIbgR/tGQZ2uI8AffnprQaPZzRrDScM1UhYY/KedOx/hp+dg/5vUAZ42w8ZsU28oIKaQe6cVj9OF4eGutt1MSMIm5napMeHkGFtHkgwxXlVtp2/+HdIGUAXvgGFnetTmU37zF46Pgqjepqqme1X6uXLtnOYRxXh+VjtC/maj2bXWZI0fHo+21UqsK+HxWJhWNaNcEkmUOslOz33bCkrgUx3ALsVgcUCWmNP1V2QEFgb+nCd4D2bKEtd1tsoP7FPzmY327fx1VqC16nnAmu3nOmgeJjwjO9pqa3zSRsFb+P1uZFg3d59xL3AR4R4f3BJFl3BpXhHyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 23:59:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 23:59:45 +0000
Date: Thu, 17 Oct 2024 23:58:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/ufence: Kick ufence immediately when possible
Message-ID: <ZxGkwS80jgq16rYL@DUT025-TGLU.fm.intel.com>
References: <20241017094237.279327-1-nirmoy.das@intel.com>
 <ZxGjg+DwLbDhiNOX@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZxGjg+DwLbDhiNOX@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: ee158c8b-65ee-4249-4e08-08dcef07c6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ueyz7J6Wfe6kXSfCU4qPTOvXJWDKDEnz8XnNxPcw1447uA0krw+4pJxP4dic?=
 =?us-ascii?Q?/eS7dBU/o15kpv/VEXDwzWc0923DvvW6ATx3EVBqOYD7A78os+rThMwckd/H?=
 =?us-ascii?Q?FhkMmtIYUqomXSZ+iaaP6uzUwiPizmdlfomNbozqXDTapIsh8SFRIpDAwjU3?=
 =?us-ascii?Q?zZJXxERp4BruPP4Xm+Sg5sXixHFo3Iwp9NdKwI2xpTGuKvKCOtrBaj/TBdnb?=
 =?us-ascii?Q?ARhuQnFQqVPy4Ua4In9qxPRYmykPCng6fUcfqD/mxJXeSemrwcdFVB/bxxwk?=
 =?us-ascii?Q?ImN+1icg+v3BEe513gWwv49XCDsotM07YvPDE37tViCuZOUI2q7bTYUuYTYk?=
 =?us-ascii?Q?lE8jaX1CO2tkdOD99XH8zviBJLDl92fUo8tzhy8vsMsIfZ+qVbF04vdpPskG?=
 =?us-ascii?Q?EZob0//LAaGxshylJ83BNPPqsmAVuuhHXZ10vAgsxZYsNoiF9di8dgRTgA7I?=
 =?us-ascii?Q?mVr0khtrEoczSFyAgBCIxgCEHoCrv80fB7LVVfZKIR63IxBmr2pBMzbVjf/b?=
 =?us-ascii?Q?6CSS1b72sSrUENsBhnc/YSNAR+qWjHkUHu0HDpFtlPWRxQjQeegKAygV2Tvs?=
 =?us-ascii?Q?qEJu6fbmOlg/Ee/Fhrs9Cw7aH+qC56Ky91gDLmh4xf7cz+uUc4fIzxmU1AXB?=
 =?us-ascii?Q?xFtdyfRDDBoHPGXErddqIGH2N6luIyp8qRdIQWe+urxSNXjOuU5//MY0wdhB?=
 =?us-ascii?Q?Yji9VEDz3oR9aOk9IBGfr3KtXzZyDxZoxVCozD3//K+RAP9wU4b5KEdnJhvt?=
 =?us-ascii?Q?S2xpqk6bXJG/PoJAcEJ/hSbNHbiNDeqXrsXGz/AZdNkLSaA2tevmUhTa++lz?=
 =?us-ascii?Q?tm++LZczR6iJKyzxPfKx7CwzJ9uqi59ofpVsKibSF/jQtuykPZXVXwB1+VtH?=
 =?us-ascii?Q?cGG0VUsKT0yuNlMy7p5dHNBFQue4AmDUme6qaREJYY2ctzZEeD4z73vWpYP2?=
 =?us-ascii?Q?g+/js4xg78tL6FGWYcceHBp4RjE+RLfapcB9KtuyoiswAgHx4QagV2CYU+Au?=
 =?us-ascii?Q?jqBZ0HmT3fgzIvdoOZ5F8IfrIcELECWjHy9QTFfx/yJcrf3hti29Is94Zy5a?=
 =?us-ascii?Q?8MVB+2dll19quHiac6kHm04oczYNmP/IAZ2yQ5wZcFgLcx+LIMoWe8vF0hxO?=
 =?us-ascii?Q?hNfZhGHbVHZwp9pSiaD424uxXPve4JatiUA3jTC6lTEMz++DmeFSpCTri/rl?=
 =?us-ascii?Q?oZkxaWDn5CkH1Ghiu51w9+5CCXYtrDBo7a7N21CUMw2OS5NW1CLlneZECsU7?=
 =?us-ascii?Q?jL++M4A9Ls1cD1hB2HaQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sgsD2CLLKDN8UFWNDAOesIT979TDLLyAlfWeNwpZzQpjTOYTDQkORIpx866h?=
 =?us-ascii?Q?4ls6rmYjTe7+SjxUaVdqsRbjFLKJp7MAfc+ljuj+hux29BHEu5paJ1ZZmzxq?=
 =?us-ascii?Q?apnW8lrhRvFeyfkvWkOYVJNVF/w+IqXofTiwbyetTFBoq/DTorPQVQxkHr/9?=
 =?us-ascii?Q?AJ+qc1gRib9BqudJdM9ddaFFU1B2eKSxYslecr9TzwsqmAvWkAawx7Y/DlLr?=
 =?us-ascii?Q?RhhAHbbm0mk6/cROFyDubo2fddnu0+AHK4hH0J4igTa7mzcBaJ0gXVnNZcEJ?=
 =?us-ascii?Q?ax57AqQ9/v5CJm2KaDabNpojKm0I24Yjor4hCmer/5zFo5H0m2kt1iRPPSDs?=
 =?us-ascii?Q?1QapvUhrK6awnsaXuuctrolfFDv1rn0St3IOTE4ocsRjPlkoUmQiZXG1mHVB?=
 =?us-ascii?Q?XQYTojrDSEX5jAcFCsZMTMC4jxJSzlCRW+6z7vj/9fuAyj4T/LKsBARz9awL?=
 =?us-ascii?Q?Is0R+b6awMI4rs2wi2h1WW3SvYEn6GEqPo+QlkChkP6Fn3mpxgbMTXZftLgn?=
 =?us-ascii?Q?9jZ87OU7ymbqbq1bCFWX1SQ0wcx/P8wBD6BW2RmAGOkoxrjxHfxh6fyWrKMJ?=
 =?us-ascii?Q?8Y0MTZ+XqzYYEdOXlUhN3zpN1H01xP8KhD0J5fjtWqvH4mK45uKfQxGHBjFf?=
 =?us-ascii?Q?WOJjSOd4/LK7+geqETozrj9yhgu0JB+grXybaX0jqCo63N6okzz0vhfCz7+t?=
 =?us-ascii?Q?2kwuXNRBBrYdqMPf9+d9FLjBOB67LvePJJB6MD/D7QJDoPaauvHqKolBA4Ge?=
 =?us-ascii?Q?QpOU5c0JGKccTVQmkqG0OQoFSCDwAzQ0KmbgVHcpGCs1qdfnjkL6m62EmBg1?=
 =?us-ascii?Q?kjJON1c9x1BIC3KuTokLj1qUMgjQAlnacWDHtBxvC3SSYlno7DkVkCAhuRqy?=
 =?us-ascii?Q?rNVoSHiQ/siRsnC22c7aGy36PQPmcHDCUyJ5swucB+rFBKGbiqWDlbLHkr1H?=
 =?us-ascii?Q?13aWRfMwqbhDFUUgej0c22kbsWGzudlx/ljK/Jhn0OR0NfcJUft0+TAAWe1v?=
 =?us-ascii?Q?QRQDclICsyz72+gFkE+4FLBMzCmPWKspW1Vhfh1TiRsP2nh8iN1LPhEswqxH?=
 =?us-ascii?Q?eR4ca83x2mvj6vLlsLi8csv05AT/J/A3hxGre/EyjTvsAiFvTWa7f7TSt+dB?=
 =?us-ascii?Q?kv/ADHfL8IXofnKnL5Sqyg/Nf6VqfItsKN21TyP7vdKYeDdnqw/Etsn+48LR?=
 =?us-ascii?Q?NC4nskOHVJOP/NLmC6mv1kj8Np5UMc9sCJc6+gskociquTrRrwc3dt5EGTwB?=
 =?us-ascii?Q?wZiQDVo6Fp6sZACLnNm7r4VhsPnVa9lcVP4SRKdbPcjsS1lO6Aoul2BVZczE?=
 =?us-ascii?Q?lPjAxgojfOim2UfLd2M3hatVS58/0UgOhLuKRRm1Lrp7K8eUYWLblO+4/oXr?=
 =?us-ascii?Q?dTFeYVDqAUfOYvMClIKiz2uaBYS7o1YuR9nf7q00LyuQHTp7y965bA1996h1?=
 =?us-ascii?Q?9sewJgpmH+v7oec9W6LpkfYdgI4hm5hF24ZDQGbXJMgv4EQgDyo8thQsRsJo?=
 =?us-ascii?Q?1xNsNHbks78v/47DxmghGm6VC9bAKjzpYCWfo+3AS8kDHyNcoosvuBtF8Eh3?=
 =?us-ascii?Q?ayD/dTaGuREoy3WpwIVxAEn15M7aM7yL+bnI4V2T9Mz1MoeFn1mIuS4kJb+I?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee158c8b-65ee-4249-4e08-08dcef07c6a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:59:45.7498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yptF4jOWSaJdEW200KRA4//1XdAq78HToXb/J95yuOU9xWlN6KXOfgdMNUgL9BTATUff/wpojTfYONebjMXRug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
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

On Thu, Oct 17, 2024 at 11:53:39PM +0000, Matthew Brost wrote:
> On Thu, Oct 17, 2024 at 11:42:37AM +0200, Nirmoy Das wrote:
> > If the backing fence is signaled then signal ufence soon with
> > system_wq. This should reduce load from the xe ordered_wq and also
> > won't block signaling a ufence which doesn't require any serialization.
> > 
> > v2: fix system_wq typo
> > 
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > gc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index c6cf227ead40..1a7907293088 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -89,10 +89,14 @@ static void user_fence_worker(struct work_struct *w)
> >  	user_fence_put(ufence);
> >  }
> >  
> > -static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
> > +static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
> > +			bool signaled)
> 
> Predantic but maybe replace 'bool signaled' which a flag. We really want
> to avoid bools if possible.
> 
> e.g.
> 
> #define UFENCE_FLAG_SIGNALED	BIT(0)
> 

Sorry double reply, 'signaled' not actually relavent here as in both
calling cases the fence is signaled. Rather we want to pick between a
worker (needed if in a IRQ context) and doing it directly. Maybe
rename this to something more relavent indicating that.

Matt

> static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
> 			unsigned int flags)
> {
> 	...
> 	if (flags & UFENCE_FLAG_SIGNALED)
> 		...
> 	else
> 		...
> 	...	
> }
> 
> >  {
> >  	INIT_WORK(&ufence->worker, user_fence_worker);
> > -	queue_work(ufence->xe->ordered_wq, &ufence->worker);
> > +	if (signaled)
> > +		queue_work(system_wq, &ufence->worker);
> 
> I don't think you need the work queue here, just call the work func directly.
> 
> s/queue_work(system_wq, &ufence->worker)/user_fence_worker(&ufence->worker)
> 
> Matt
> 
> > +	else
> > +		queue_work(ufence->xe->ordered_wq, &ufence->worker);
> >  	dma_fence_put(fence);
> >  }
> >  
> > @@ -100,7 +104,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> >  {
> >  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
> >  
> > -	kick_ufence(ufence, fence);
> > +	kick_ufence(ufence, fence, false);
> >  }
> >  
> >  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> > @@ -236,7 +240,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
> >  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
> >  					     user_fence_cb);
> >  		if (err == -ENOENT) {
> > -			kick_ufence(sync->ufence, fence);
> > +			kick_ufence(sync->ufence, fence, true);
> >  		} else if (err) {
> >  			XE_WARN_ON("failed to add user fence");
> >  			user_fence_put(sync->ufence);
> > -- 
> > 2.46.0
> > 
