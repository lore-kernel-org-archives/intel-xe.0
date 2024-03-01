Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3444AC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 07:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BD610EBED;
	Fri,  1 Mar 2024 07:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAZIJjKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669E410EBED
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709279940; x=1740815940;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=li8DqO+uqCOyM1ZzR581YaYbacULh/Io6dZXeC2gwvY=;
 b=gAZIJjKtBVsKVdglgB2/Uu19JNYBIBd+pqyJy8vJuSRIS20kcB8HmIFz
 QkDtMnxkMB1ZxNgkbqmmlyiXhWHqAjSDy+TIf72BEgFTdS/MqLyOIeT7L
 IKIA42S1ObcvpXLejJA083+x07nNrJBqTPCPaYlL0BD/KTdXnI7xXIUUJ
 CWd9RCrJm3l2bXgweE2S0fbmHGxtElO0uABFfvozj6dH/O/PvpRKDlhYM
 WBE+6XAmsw5QpOl62g6YhZ/WnzNnAleDQuH5NKFu1m8pWe0kC30ETOgya
 xCA8vVM1UQkU192NzKdeGOS/gCWOnoL8VnpVopsDwTSA3zzi10o7ZjAPA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3922048"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3922048"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 23:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8014774"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 23:58:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 23:58:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 23:58:58 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 23:58:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETCFnH0EsE6rF274+Erbrty/ebsjA5k8s6z7e8fe/mFRwPaAZbH904NY90IRQyWZ9o5cR+x++8rSaviKA7m4jba7MGlVudVp3Cvax1MZ6hHVjIUAVmyaNSMZgbvYB/F2y0F+PzS+jsLB4aAuBRiaJTOJ+Q0Arw3KWX3/r4gc1SVTXmC3NgT8Gu9xWeCNQsBc50qMRBUCy4t0fCktTtT9QuI/XVv2hr0kYvPcy/KvJHVkkEdcycR0I+SiNEcY2U7IFPEFxNMFjOxI3zfKswjsfNDJG8ksuJK89cgr2XcgeS6Rz9Ma4XYrdM6NOrlzZOda3oL3A19wX7PuDVzkN/yHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZsMeScmWO3Pe1EoWoVRi4cjcR9jgBqk5MRIN1R+bqg=;
 b=AHjkqaaRaHGGbR+42UMvdNefPVjdAXAP25NjkgN8swa3IHobv1CEizmJfgaZdO3hhQJpTIU1/OhkEGyQ2nY0I/9RiJTCIZZxfDSm1dNSUbOFl6AGGD7qd1dBx+LUeBG9iKLCjqq9w7GOk64OZulA2ciFlTiS7VRHUvYRUulVRypLeC0l2iNJdnng4wi6D/o53KaJi7hUrDo3uD/AX+hhRakm9hv9FTTMWT4HfMmPRQSE7dRVPsDbK0YEzRHxbHl+3okeBTxGhfnFcoBnSeYXVKE5bjl1K7grjmJxJfM+/ts90LpnQx74v73N2Z2nZsEsXzj0zcouySe530vcBLzTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.15; Fri, 1 Mar
 2024 07:58:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.031; Fri, 1 Mar 2024
 07:58:55 +0000
Date: Fri, 1 Mar 2024 07:58:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/xe: Validate user fence during creation
Message-ID: <ZeGKrlrFLfDp/Q+Z@DUT025-TGLU.fm.intel.com>
References: <20240301035522.238307-1-matthew.brost@intel.com>
 <20240301035522.238307-3-matthew.brost@intel.com>
 <6f8409697d39299e3672fd42f7057e421cb54f19.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f8409697d39299e3672fd42f7057e421cb54f19.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: d4532b07-efe4-495e-6e08-08dc39c5710f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2pNL9LE5EEZ1Blq98dU6hoBwre3wYxfUBd47dc1U6E8uj2/fRxQUR34lpCeFDnBc6hbpgKso/ALs9m/EJbqThgxpJBMYQLg+0yHwtE/Pb9ykv5MJK9nYemf39QXw0HpuikJJ72CHw8MpdkSorwmMmfjojY7rqftnaU37Ane4cuP2rUKgayVTP/VT8vqea72bnebUDz6lb9S7hmLn9aBIh/WvC8jhKTbP5E/d0T/Zjy8e5FXdk/Ori6zHRtRHUZhrlTqfu4KUZMJ5qzmt7wmd0hrAalZDlLDeAx5APFzHw0jeM62l0/dS7jJXhwAyVQfYz5An5jrGc7fXlimhQa2/j1PrIEXrK3vLZLY3yXM2PT7wnjzcgjQswP3T44ArA9xuiIKUPd3Uc9gfgVgNOT0h1L7pxTb/3LeLY3m7MVqV0AG+NmUPoEaanjTmmW5UELseLqTcvgNGyfOQg5narmZuNOIO4MlhjwidW6dRQo2y37S4y9lLpjrOFUAC3uD5giHVj37Ahw9PohjWQ4VdnO2Cgoh59NGSpr5/iQhstboMFf2ljBH2YR9O/CHuHsrVzOSUG9QHQ5MZ87bLe3eGx+ojw9SYeXVpVhmVnRzeNc70vKLo8g3+3brhB5wdCdyQxS364X8xbfm5LhfjFVQvRiM3lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w8q1tqHH9F7kznJmeHpMsPTZLCJ7SSZ/Ux4ssXhdWanZQiq0agdNoTGlqY?=
 =?iso-8859-1?Q?/Cks7Ww5W/pZMUx0mj20UJNmFwiYNtVO3+kYBr9CVN501/aUvMWwJI2Hxd?=
 =?iso-8859-1?Q?+o4u176hzAM1ve5gRhccwb5jZ6UhtumvCCWC8c4IrbnDyzS+/leW/91WBT?=
 =?iso-8859-1?Q?OI55VPdRhGqR6pvPcZfXl2FQoldQ/2HrbX7MC86TdiStDSMGBmmb0fWIOC?=
 =?iso-8859-1?Q?wAaSKrJ3XqcZfq+Vxi7eV6wwUUCdBzh3jxO5rlGUG/hc300+NwvJlIGJsP?=
 =?iso-8859-1?Q?ymsWKG8r7z3SjBr1e+/PjupeJ9hKDuQAeyRgHeP/IBi9ne/xRybtBEpgNq?=
 =?iso-8859-1?Q?SXKocWpoYpGiTdzZMDbAsgZJwmVRDVBp7QgWaZzc6PMFWKBlt0KSxvduX7?=
 =?iso-8859-1?Q?DcJjW29WsTtm1GwNzdJJxqNRydKYiyE2J4xZo0f8/+5lWoEyTc5AjcRziQ?=
 =?iso-8859-1?Q?yGzMlcm8zfQC8tEnFmaj8A2e0HFf6bpQUy7dHh0YONUC+UbHK90L5D7zxh?=
 =?iso-8859-1?Q?eu++YivkJYu/BMrIAgSIK4D/s7ev3xwoMQgFAbeaocIMpRpDdj+JgYiL5T?=
 =?iso-8859-1?Q?Qs6frVjfyN70WiJvx7oyUFcvvMFWrzKwHUNqXId8Z5lEh23PT/c6up2fvm?=
 =?iso-8859-1?Q?wowDkzjDSTOIeAvZZ7wIBCKEPFzF3h03/YmAw/CzeEf/jDnWTrrGIKbvYe?=
 =?iso-8859-1?Q?TYAlxWMr1EehnWkGM37JuNfuRbrpfpQNSqn6m4fBiT3BhCLykWZrqHXdg3?=
 =?iso-8859-1?Q?XmbgCMucBAPCOsoHmK4tvlFGp3Z8VNNdI2jqiQGNslQRi/7MUio7YvLi9v?=
 =?iso-8859-1?Q?nareyGlTPHr5bPtrp+xxTTUO/+K1WFwRUfdLwBOz0LZ6olBPRfKT2+9M+v?=
 =?iso-8859-1?Q?v/ZCB02o2VhntRXxWn1PzWX0JTd8OWV2kSSLVkZ0mj734W7K87qGd9QWwo?=
 =?iso-8859-1?Q?z+inPR5/lXDHUQvWBFexm2Ft/294daEeUhiQMy1r7M6vdXiGuvKYD1V+4+?=
 =?iso-8859-1?Q?cMRViuxvPGdb5U8QJ4LXhMiBuVabq3TIl9s6N7Y3GYxhBHFPTBlddKu8lQ?=
 =?iso-8859-1?Q?hjPMl0NwRCaYU7L3rAsf05UNk/Hz2MIErODbg/IvCyu5IdtghYKR51HWC+?=
 =?iso-8859-1?Q?cZGbSnBdMtXGk+vDPKzjzez0DEZee+XEDbtarUGnPXzf7WmLYcPdN5c1bj?=
 =?iso-8859-1?Q?UcwMO6fCrH1gD5HFrxBuAP+xJ+STTquGAJKwodMMMHLdPoRrIbCn17wZNk?=
 =?iso-8859-1?Q?dNoWcqL8gvS54x/T8hEqjYyhPnnweapcWoWm0HQQZRoh7zhXuWsU280ZRh?=
 =?iso-8859-1?Q?Sc8YixQGNnsoblUtIi40wULvhBAqmZcxUZ/14Us00wHAhp9soXfn6BEcG8?=
 =?iso-8859-1?Q?5GIhLVTDjJ5JLBCeeD+3WmowcL/9dCc0rI/jQE3Ptt7DIMIrmEcl4qRlxt?=
 =?iso-8859-1?Q?GCQsNf1uqlKnpYLs35cYXDPHYDpIbtjLp8q7HZTa+4n9tsrCW4CaKS6hGO?=
 =?iso-8859-1?Q?iquoks7pYnVbkRvvK+Gx7oA9UOYLMGukT1ksejgWxxBqsMBdF3sIjbrbyS?=
 =?iso-8859-1?Q?78HxcIab4oM2nqwUh0Ki5eCKFyzYX3KchpYU9fLJCfhRLnK+vCyDxeM/kI?=
 =?iso-8859-1?Q?iW8z6uF6KBO77lKNvrauCJ81vUOLMvIncDvk6Tj8rY90DyaYNTzmH6oQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4532b07-efe4-495e-6e08-08dc39c5710f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 07:58:54.9296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePo/5siGlMfy0AVo3X12ahg7X4nnIrvez4MmOwG0EEhyR15VaPOTq1y/nhxEIdFIdqOVESnZ5atPjRAQWNbALA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
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

On Fri, Mar 01, 2024 at 07:55:40AM +0100, Thomas Hellström wrote:
> On Thu, 2024-02-29 at 19:55 -0800, Matthew Brost wrote:
> > Fail invalidate addresses during user fence creation.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index c836a5f3a1ea..c20e1f9ad267 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -53,14 +53,18 @@ static struct xe_user_fence
> > *user_fence_create(struct xe_device *xe, u64 addr,
> >  					       u64 value)
> >  {
> >  	struct xe_user_fence *ufence;
> > +	u64 __user *ptr = u64_to_user_ptr(addr);
> > +
> > +	if (!access_ok(ptr, sizeof(ptr)))
> > +		return ERR_PTR(-EFAULT);
> 
> I think we also need to enforce u64 alignment. Otherwise, particularly
> on 32-bit user-space the user fence memory could cross a page-border? 
> 

We already do this in xe_sync_entry_parse:

221                 if (XE_IOCTL_DBG(xe, sync_in.addr & 0x7))
222                         return -EINVAL;

Matt

> >  
> >  	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
> >  	if (!ufence)
> > -		return NULL;
> > +		return ERR_PTR(-ENOMEM);
> >  
> >  	ufence->xe = xe;
> >  	kref_init(&ufence->refcount);
> > -	ufence->addr = u64_to_user_ptr(addr);
> > +	ufence->addr = ptr;
> >  	ufence->value = value;
> >  	ufence->mm = current->mm;
> >  	mmgrab(ufence->mm);
> > @@ -183,8 +187,8 @@ int xe_sync_entry_parse(struct xe_device *xe,
> > struct xe_file *xef,
> >  		} else {
> >  			sync->ufence = user_fence_create(xe,
> > sync_in.addr,
> >  							
> > sync_in.timeline_value);
> > -			if (XE_IOCTL_DBG(xe, !sync->ufence))
> > -				return -ENOMEM;
> > +			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> > +				return PTR_ERR(sync->ufence);
> >  		}
> >  
> >  		break;
> 
