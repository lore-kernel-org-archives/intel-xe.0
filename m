Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B0BC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 16:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6357110E799;
	Thu,  8 Aug 2024 16:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FirF/m2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF58710E39C
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723135879; x=1754671879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TdG9ohU+GxxXDweHsnYo3v4xa8DiWoXHvN0dPIAr8g4=;
 b=FirF/m2KY5TKgbDpqeVkOXOYErNgiTrILkhlj+pXCflbvbNl5y2NgwN+
 ojECu8HSzOVa7HCUa+F89Qb+z1tePsV0c20H6kwgK/PrN6OqEmNjy55ZO
 ME3Curl9IPSRNV5spQhPdOew8zdaAH3og8MIfHV7x+6GiuQaM+FZP9IXr
 Q0R2GwUWc5Byja2IL2taCgoByhqQa+gAYMOCbpgz7Ic6rsKQNtLTNAzNi
 w4uEMjYwWO/eCw3zTDPJMnoUYIVO4n8NTq2Uy6hPx2R5HAHDJMQ8UvHRC
 2PgvQyM+ccei37rZy2az46kgvBFKCUStAd1OgILtZ3a/Q1xoVgh3alDmC g==;
X-CSE-ConnectionGUID: YXbfipjSR2etFpnctc0WlA==
X-CSE-MsgGUID: 6VJaX+39SfefxIN9QIlMQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43794552"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="43794552"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:51:18 -0700
X-CSE-ConnectionGUID: f6pTsL97QG2g67Kqiun1ZA==
X-CSE-MsgGUID: hJlUqYD7QdeV/5jKcKYKoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="94823239"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 09:51:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 09:51:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 09:51:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 09:51:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 09:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dw8e+nJndTuH1j7rcy602Z8qe11vYA+MkvAmYD4p/qgZMz1GvRq2BEGOSMM8XlujdQpoBnVIeZEPy2/W8sJ7qj6PJguxhXLIoTBXJ1l/E5kSSq0P3du079E0A/cR/EGw5q/zy9zTfuId7Dmc1TXLaCHwRRDr66lwrsslYgmxGONDUHoMD6Dyppvl7YIgr1PBGxC7GK1Hrcrnk5unpXIK9IGIzXCMk59JuuSG3/5P/XdyyewaodTX70cWohWaBuPp5nFo4ebA7eyrHoNbJfohNifmniHY0kDK4BlaBow/7RV40iV5LIh2MWF66D7hxcAkFiZbsEKGjMjtBTzdWcDEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbvopzdaMXdcwJOG5hPaoe1UW702STVGs4oOQpcE58M=;
 b=X8Xnnro2yVBpQJUcQG0QIRJNCkyGB+/yazxwu36bQIsYbearMXcfEKBNIBgdG/FKasA0Z1P/CK4h6gveUueOxRI/ACiJ4MhfQKHvxXJhwP3x4RYAJT1qHSgMqinQZh4EBs9vb4KxpPoNqPK0jku1J9Zhcw/oB7wkGa/gfN3p3h11LrV4CJYVCDOlg2QXlJuwJV+EPVpzXvyq/umyBGoNZq1alH6CsRNca745A+pKO4C0V+ifccxsy+L1WCN/Rh6SQqhYYhuNVhoVz7mGr8FBdfVrlJ5SwHA2zssoMZOZtSP5c2EL9HYrjS9/JPJVWsYlfsm8ZVvhtBW4UBxOsSUAbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Thu, 8 Aug 2024 16:51:13 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 16:51:13 +0000
Date: Thu, 8 Aug 2024 18:51:04 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 07/13] drm/xe/hw_engine_group: Add helper to wait for
 dma fence jobs
Message-ID: <ZrT3eEzISmlL2ScQ@fdugast-desk>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-8-francois.dugast@intel.com>
 <ZrQ2Dsv5wx/7ryFI@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrQ2Dsv5wx/7ryFI@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS7PR11MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b3dc29-03da-4a96-5e44-08dcb7ca4fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nCqVr4xp6gICH94rkqnl/PJ6/wLc4uSZGs3VjktZXDQb7hNDLh1imdQtnS+Z?=
 =?us-ascii?Q?4GGU1TjGWf5xM27O43gF+MB+wvITlex1JximOAuh9cLCqo6EsqviAOtCb0Mt?=
 =?us-ascii?Q?m8cyMSzQszWDCvRnLFOlnSMqlI2UgMroVww4icDmpz5P45j+88S47jRim5RY?=
 =?us-ascii?Q?e8rHfvjUgsSBrKjkKTkeF3XwYJkbSapGgCGJ2qWw+zyd4g0hzQkdRAyeIaEe?=
 =?us-ascii?Q?e+K/1VGAJH9TvHnLcwvXjcceoJuQkBXtOk/4arrzGEr5sKsv99Wuvn1Uhtcc?=
 =?us-ascii?Q?nGmmCTJ3+fw01MpE0HaspEeoG98UisFSor926TZR76A1FrR4a3YVIViU5ow4?=
 =?us-ascii?Q?iFXOVOVAN/NihCxN7YNRaDtnwrM5qbFT1/KfdDw3AVgMKsey5f+wVQfqVaMB?=
 =?us-ascii?Q?LGW1Gyk6maxuChSrlsf6lsA3TVYCtZmpoa08ez1Fm4pct4TswkfdiozR2GcQ?=
 =?us-ascii?Q?t2+E2RSimbvlBPke7g32xA82HiUgxQ8O4cknuwFKtBKdN52YIshhE2XRPCLQ?=
 =?us-ascii?Q?npOXRnHDn0sqBadXqK9yqvzm6bsTMo+sH3zLQopzlYqnqfEpE8G2G7X+SbG7?=
 =?us-ascii?Q?12JaLCab9vtklQ4eqVoimOGEirfIOjrWAxAA2vROdIy2t6Q77aSJUZCEqj2x?=
 =?us-ascii?Q?0PCRg9Rycq34gVngz7/Z0UdkrVPC0uWQOBM91DGcqnofOULMeYkb3pyhddiX?=
 =?us-ascii?Q?YwOBsehyn+T/Ue3V5XlP8plvR8KWpeljGSYaHILabLBk7xMA3EgyFUmpDhj3?=
 =?us-ascii?Q?MmLMmK7yXliMaMANf2lv+2OOZIm5++mnQAF2I42x222nVcW2s8lturFviJcc?=
 =?us-ascii?Q?pCKEmOc5maLzIGOVqzKv/oPUCDH6OuJKR7Jx1nEgB7+sPcbB0FzjIxQ7iLXA?=
 =?us-ascii?Q?FZspJIzvNxlDY9iB7PZZ/Kydf1Qm3JPPFv4XMPVWZjRMjgUULs6GRigwRW6u?=
 =?us-ascii?Q?JWp2MzfYKm7gaohOKdXHRj3/z7AdlMFaWGs/TvzUACn7NNJgsZX/VpZmWMVb?=
 =?us-ascii?Q?ryCC6nt88tb65KrQBCSQlj0gZU7Pnmg1tAUJff1FNPghECYoTDb10fPHhM2u?=
 =?us-ascii?Q?JjSREvl4ywkVhovG1g8/bMk71r4Yi37uIWZY6inHzDdxVbk8vM8zM6G2VLg/?=
 =?us-ascii?Q?vTXmYHZ3NS76ibe5de5w2XflrTWBZOUMSguPUuxCCPTayuQ2uSxZ50IdArgW?=
 =?us-ascii?Q?ugYpY+s7KMTg1pjstuHQXaL+Mffh0U8EXWnfJlJjCtBN4rPCFRfDlUZaOSgo?=
 =?us-ascii?Q?7K94tmvKOmUv3fxYfyDOr2ifPOuQxeJM2qEXcww5M+7EiLnFppLk7Qh7QicA?=
 =?us-ascii?Q?N7I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zH7TH+Y5bmN4MbxCCui3TGfngt63vNDDQPwmgyej6KRhVWTcDkioHuPxGjk8?=
 =?us-ascii?Q?VJ4ra+9hy0xoi34OAOxZNlujdcn+iIaZGPCIzcdiL/6eyOTPeas1f/d/PzKq?=
 =?us-ascii?Q?BIcF2B3YLTjBCG+79yDlcAMQ92ofBGLiupwDPzJ57BIGEnymJvwCS67sD3at?=
 =?us-ascii?Q?OODxDsTEP5X98/8R23TGiE52XByzCuFVoP9hM+stGOWRtfC8JL7vFSDQESV9?=
 =?us-ascii?Q?D1bcTBg3sbCTxoyAWQs4kb/EAyfBEP4qqvkFqQ/1pjsc1OPbkgImYiXUyOpI?=
 =?us-ascii?Q?RdPI+FYe46tCP0Z2YGnJWnGXSraB3iL0HC7q3BI14kOI7r7NIjT+CfJ95kcn?=
 =?us-ascii?Q?qHO8q0mTnsjfiPfdcU14Yywr6Brcpg86UFWeqAxWyUj6vqCMXcYvIBtnnh1l?=
 =?us-ascii?Q?kt1LGqXPh5ob2BgnnVBo5+K1m9c2/Lasx50J1QJ1AZA75A4bgW6fAv3GfxnF?=
 =?us-ascii?Q?kht0ZVn063Ek5dFTVQBWLN/5pNAFuGAqLgGWf9OhTaYUgbkrQBi/HkfeeSOQ?=
 =?us-ascii?Q?TRZqw5QpZucyimA+OqpI2igsD7GT44qcgsdxqFMZBN4CKL+1eeb8sLG0AXKj?=
 =?us-ascii?Q?VmFwFz9R9AkXo2y/MVvosE9kXOfxKX4m/m8ejTdVBcdqN08xN++IRyqUaeMA?=
 =?us-ascii?Q?YP5qWrA48+g1LJQK4OJx1OomZ+0Rnm1vkaBMJsE5USFy1m1kx089DflRigym?=
 =?us-ascii?Q?rk406lYcT/syopEE8RRZSvKJGsaMVozWBY4rfvQSumbIDBycQoJK1lcwkceJ?=
 =?us-ascii?Q?r4Uv68y4iPqKYn19uJZnahCzdzJiyM43yqtwgS+fi6vpPLDON+NlCYsjJIU/?=
 =?us-ascii?Q?NPIDfK54cU/EFmjHN6MaIUX1yFi3Iaz01st6Wp3znu+jKstu5KZbWG5N4jVV?=
 =?us-ascii?Q?jDeFLmBRnGlpuRG0Og/swCsfSjlQtzaLMURLasHo3fxoF77AQcoJteLWoG9I?=
 =?us-ascii?Q?c4yFkOQQ9gsImOoT1DZtXpGBvMHV4dcXq2ih12FnSuccDmuX0BkFQavG4qBr?=
 =?us-ascii?Q?XHKNSxi7HTVCkAZbeR+OAaMDCDNySXn61+rOMr2ZfuLuYKmZuo5Pjpe91bLk?=
 =?us-ascii?Q?QssCy6XHAKs9EYSwtRGPMkGribG5Im48dQioja9huh5kWr5ubvuobGZgUdAc?=
 =?us-ascii?Q?IWLR2zyp4GZ/cELaMMbHXstHwX8pCJum0Z5fnRzAzpVdAp9MsvCHOTq1Zvxy?=
 =?us-ascii?Q?zW9Jlo/6a85qTo+LiycgH8iOApsjO61n+/ryAdlxYjqEDdicjpY/oHgrtT1m?=
 =?us-ascii?Q?mtGLlYi/n7UI7ZVex3kFzLJ2q2NjnNkxqSTW9k0qaS3wClR8FgPfV0+ToyTE?=
 =?us-ascii?Q?x6yJFq6RLnsdwuA/JliUFOmSU9MLdoJFoSiI4H3LFvLA05rNB2sMb78Mnnhh?=
 =?us-ascii?Q?FOlZS6K53YUalAcdwF+G20xMZBsnmFr5Qf8z7gyq5B7Pm1wOuIw9uK1J8WrU?=
 =?us-ascii?Q?/jqsLUskN6PqRR+3H/1vp5iwzpu5RtGcTQZ1qQviCdkiNyI6EjVDsO4+pcKC?=
 =?us-ascii?Q?MkanvJf2ZtQCKcdsx0U1U1AV31rMxnkQrmWtlevijSA6qL7i/fmDmbkf6lvi?=
 =?us-ascii?Q?1R5Xz69y0GxUKG4xG86fKEg6GHX26OGWU0/C4VHRA12qBRIrnZwzRxddSyfs?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b3dc29-03da-4a96-5e44-08dcb7ca4fdc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:51:13.4962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2h2fJIDaWoaPdFwxitQrSfz/U1E+92EAfwA5zOPLsFWPCfxNcctKXfe85NE85a49A8jMl6YPAzs8Xt23jPVQqHeoY3exPj7URhWBcWdI/t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
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

On Thu, Aug 08, 2024 at 03:05:50AM +0000, Matthew Brost wrote:
> On Wed, Aug 07, 2024 at 06:23:36PM +0200, Francois Dugast wrote:
> > This is a required feature for faulting long running jobs not to be
> > submitted while dma fence jobs are running on the hw engine group.
> > 
> > v2: Switch to lockdep_assert_held_write in worker, get a proper reference
> >     for the last fence (Matt Brost)
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c | 33 +++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > index 3f74ff577a4c..955451960a3d 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > @@ -180,3 +180,36 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
> >  		q->ops->suspend_wait(q);
> >  	}
> >  }
> > +
> > +/**
> > + * xe_hw_engine_group_wait_for_dma_fence_jobs() - Wait for dma fence jobs to complete
> > + * @group: The hw engine group
> > + *
> > + * This function is not meant to be called directly from a user IOCTL as dma_fence_wait()
> > + * is not interruptible.
> > + *
> > + * Return: 0 on success,
> > + *	   -ETIME if waiting for one job failed
> > + */
> > +static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group *group)
> > +{
> > +	long timeout;
> > +	struct xe_exec_queue *q;
> > +	struct dma_fence *fence;
> > +
> > +	lockdep_assert_held_write(&group->mode_sem);
> > +
> > +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> > +		if (xe_vm_in_lr_mode(q->vm))
> > +			continue;
> > +
> > +		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
> > +		timeout = dma_fence_wait(fence, false);
> > +		xe_exec_queue_last_fence_put_for_resume(q, q->vm);
> 
> Missed this eariler.
> 
> s/xe_exec_queue_last_fence_put_for_resume/dma_fence_put

Thanks for catching this, will do

> 
> xe_exec_queue_last_fence_get_for_resume gets ref to a fence which can be
> dropped via dma_fence_put. I think this might be the source of CI
> failures [1] [2] too. But neither DG2 or ADL should be triggering this
> code path unless something else is going wrong. Can you look into these
> CI failures too?
> 
> Matt
> 
> [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v7/shard-dg2-433/igt@xe_module_load@reload.html
> [2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v7/shard-adlp-1/igt@xe_module_load@unload.html

It seems there is currently an issue causing xe_module_load to fail
independant from this series, see for example [3] #rev2 and #rev3.

Francois

[3] https://patchwork.freedesktop.org/series/136891/

> 
> > +
> > +		if (timeout < 0)
> > +			return -ETIME;
> > +	}
> > +
> > +	return 0;
> > +}
> > -- 
> > 2.43.0
> > 
